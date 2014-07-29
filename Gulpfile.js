var gulp  = require('gulp');
var docco = require('gulp-docco');
var rename = require('gulp-rename');
var clean = require('gulp-clean');

var path = {
  build: 'docs',
  src: ['README.md', 'home/zsh_aliases.sh', 'home/zsh_colors.sh']
};

gulp.task('clean', function(){
  gulp.src(path.build, {read: false})
    .pipe(clean());
});

gulp.task('docs', function () {
  gulp.src(path.src)
    .pipe(docco())
    .pipe(gulp.dest(path.build));
});

gulp.task('build', function () {
  gulp.src('docs/README.html')
    .pipe(rename('index.html'))
    .pipe(gulp.dest(path.build));

  gulp.src('docs/README.html')
    .pipe(clean());
});
