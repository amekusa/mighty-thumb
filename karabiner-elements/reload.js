#!/usr/bin/env node

const { exec } = require('child_process');

exec(`node '${__dirname}/mighty-thumb.js' > '${__dirname}/mighty-thumb.json'`, (err, stdout, stderr) => {
  if (err || stderr) {
    if (err) console.error(err);
    if (stderr) console.error(stderr);
    process.exit(1);
  }
  let data = require(`${__dirname}/mighty-thumb.json`);
  if (!Array.isArray(data.rules)) {
    console.error(`corrupted data: ${__dirname}/mighty-thumb.json`);
    process.exit(1);
  }
  with (require('karabinerge')) {
    const config = Config.new().load()
    .backup()
    .setRules(data.rules)
    .save();
  }
});
