#!/usr/bin/env node

with (require('karabinerge')) {
  const config = Config.new().load()
    .backup()
    .clearRules()
    .save();
}
