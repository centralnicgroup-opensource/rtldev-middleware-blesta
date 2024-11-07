const { series, src, dest } = require("gulp");
const clean = require("gulp-clean");
const exec = require("util").promisify(require("child_process").exec);
const eosp = require("end-of-stream-promise");
const composer = require("gulp-composer");
const cfg = require("./gulpfile.json");
const rename = require('gulp-rename');

/**
 * Perform composer update
 * @return stream
 */
async function doComposerUpdate() {
  try {
    await exec(`rm -rf ${cfg.vendorFolder}`);
  } catch (e) { }
  await eosp(composer("validate"));
  await eosp(composer("update --no-dev"));
}

/**
 * cleanup old build folder / archive
 * @return stream
 */
function doDistClean() {
  return src([cfg.archiveBuildPath, `${cfg.archiveFileName}-latest.zip`], {
    read: false,
    base: ".",
    allowEmpty: true,
  }).pipe(clean({ force: true }));
}

/**
 * Copy all files/folders to build folder
 * @return stream
 */
function doCopyFiles() {
  return src(cfg.filesForArchive, { base: "." })
    .pipe(dest(cfg.archiveBuildPath))
    .on('end', () => {
      // Copy the blesta-ispapi-registrar-latest.zip file to the pkg folder
      src(`${cfg.archiveHXFileName}-latest.zip`, { base: "." })
      .pipe(rename(`${cfg.archiveHXFileName}.zip`))
        .pipe(dest("./pkg"));
    });
}

/**
 * Clean up files
 * @return stream
 */
function doFullClean() {
  return src(cfg.filesForCleanup, {
    read: false,
    base: ".",
    allowEmpty: true,
  }).pipe(clean({ force: true }));
}

/**
 * build latest zip archive
 * @return stream
 */
function doZip(callback) {
  (async () => {
    try {
      const zip = await import('gulp-zip');
      src(`./${cfg.archiveBuildPath}/**`)
        .pipe(zip.default(`${cfg.archiveFileName}-latest.zip`))
        .pipe(dest('.'))
        .pipe(rename(`${cfg.archiveFileName}.zip`))
        .pipe(dest("./pkg"))
        .on('end', () => {
          console.log('Archive generated successfully');
          callback(null); // Pass null for success, or an error object for failure
        });
    } catch (error) {
      console.error('Error importing module:', error);
      callback(error); // Pass the error to the callback
    }
  })();
}


/**
 * build latest zip archive
 * @return stream
 */
function buildHxZip(callback) {
  (async () => {
    try {
      const zip = await import('gulp-zip');
      src(`./${cfg.archiveHxBuildPath}/**`)
        .pipe(zip.default(`${cfg.archiveHXFileName}-latest.zip`))
        .pipe(dest('.'))
        .on('end', () => {
          console.log('Archive generated successfully');
          callback(null); // Pass null for success, or an error object for failure
        });
    } catch (error) {
      console.error('Error importing module:', error);
      callback(error); // Pass the error to the callback
    }
  })();
}

exports.copy = series(doComposerUpdate, doDistClean, doCopyFiles);
exports.buildHx = buildHxZip;
exports.release = series(exports.copy, doZip, doFullClean);