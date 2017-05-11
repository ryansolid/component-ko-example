gulp = require 'gulp'
shell = require 'gulp-shell'
path = require 'path'

# note: this should be replaced when bower actually supports shrinkwrap
gulp.task 'client-shrinkwrap', shell.task(['bower -o ls > bower_versions'])

gulp.task 'client-build', shell.task(['webpack'])
gulp.task 'client-watch', shell.task(['webpack -w'])
gulp.task 'client-release', ['client-shrinkwrap'], shell.task(['webpack'], {env: {NODE_CLIENT_ENV: 'production', PATH: "#{path.join(process.cwd(), 'node_modules/.bin')}#{path.delimiter}#{process.env.PATH}"}})

gulp.task 'server-build', shell.task(['coffee --compile --map --output _build/ server/'])
gulp.task 'server-watch', shell.task(['coffee --watch --compile --map --output _build/ server/'])
gulp.task 'server-run', shell.task(['nodemon -w server server/app.coffee'])

gulp.task 'build', ['client-build', 'server-build']
gulp.task 'watch', ['client-watch', 'server-watch']
gulp.task 'run', ['server-run', 'client-watch']