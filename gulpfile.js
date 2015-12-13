var gulp = require('gulp');
var jasmine = require('gulp-jasmine');
 
gulp.task('default', function () {
  return gulp.src('indexSpec.js')
    .pipe(jasmine({verbose: true}));
});
