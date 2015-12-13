var gulp = require("gulp");
var jasmine = require("gulp-jasmine");
 
gulp.task("test", function () {
  return gulp.src("indexSpec.js")
    .pipe(jasmine({verbose: true}));
});

gulp.task("default", ["test"]);
