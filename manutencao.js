var sys = require('sys')
var exec = require('child_process').exec;

module.exports = {
  atualizar: function () {
    
  	console.log(Date());
  	exec("git status --porcelain", pull);

    return true;
  }
};
function puts(error, stdout, stderr) {
	sys.puts(stdout);
}
function pull(error, stdout, stderr) {
	var out = stdout.toString()
	out = out.replace(/(\r\n|\n|\r)/gm,"");
	lout = trim(out).length;
	sys.puts(stdout);
	if (lout>0) {
		//exec("git pull https://giovaneh@bitbucket.org/giovaneh/isptools.git", puts);

		exec('git reset --hard FETCH_HEAD',puts);
		exec('git pull origin master',puts);
	}
	// teste
}



/**
 *    Functions
 */

// TRIM
var trim = function (s) {
  var m = s.length;

  for (var i = 0; i < m && s.charCodeAt(i) < 33; i++) {
  }
  for (var j = m - 1; j > i && s.charCodeAt(j) < 33; j--){
  }

  return s.substring(i, j + 1);
};