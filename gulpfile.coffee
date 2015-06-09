gulp    = require('gulp')
coffee  = require('gulp-coffee')

paths =
  coffee:
    src: ['src/**/*.coffee']
    dst: 'lib/'

gulp.task 'coffee', ->
  gulp.src(paths.coffee.src)
    .pipe(coffee(bare: true))
    .pipe(gulp.dest(paths.coffee.dst))

gulp.task 'watch', ->
  gulp.watch(paths.coffee.src, ['coffee'])

gulp.task('default', ['coffee', 'watch'])
