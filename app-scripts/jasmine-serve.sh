#!/bin/bash

rm public/assets/application-*
JS_SETUP=true SKIP_BROWSER_SETUP=true SKIP_DB_SETUP=true SKIP_APP_SETUP=true rspec spec/features/js_asset_spec.rb
$(
  sleep 3
  firefox http://localhost:8888
) &
npx jasmine-browser-runner serve
