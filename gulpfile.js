const { series, src, dest } = require('gulp')
const clean = require('gulp-clean')
const zip = require('gulp-zip')
const exec = require('util').promisify(require('child_process').exec)
const cfg = require('./gulpfile.json')

/**
 * cleanup old build folder / archive
 * @return stream
 */
function doDistClean() {
  return src([cfg.archiveBuildPath, `${cfg.archiveFileName}-latest.zip`], { read: false, base: '.', allowEmpty: true })
    .pipe(clean({ force: true }))
}

/**
 * Copy all files/folders to build folder
 * @return stream
 */
function doCopyFiles() {
  return src(cfg.filesForArchive, { base: '.' })
    .pipe(dest(cfg.archiveBuildPath))
}

/**
 * Clean up files
 * @return stream
 */
function doFullClean() {
  return src(cfg.filesForCleanup, { read: false, base: '.', allowEmpty: true })
    .pipe(clean({ force: true }))
}

/**
 * build latest zip archive
 * @return stream
 */
function doGitZip() {
  return src(`./${cfg.archiveBuildPath}/**`)
    .pipe(zip(`${cfg.archiveFileName}-latest.zip`))
    .pipe(dest('.'))
}

/**
 * build zip archive
 * @return stream
 */
function doZip() {
  return src(`./${cfg.archiveBuildPath}/**`)
    .pipe(zip(`${cfg.archiveFileName}.zip`))
    .pipe(dest('./pkg'))
}

exports.copy = series(
  doDistClean,
  doCopyFiles
)

exports.archives = series(
  doGitZip,
  doZip
)

exports.release = series(
  exports.copy,
  exports.archives,
  doFullClean
)
