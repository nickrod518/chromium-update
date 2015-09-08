#!/bin/sh

echo "Current Chromium version:"
mdls -name kMDItemVersion /Applications/Chromium.app

# determine working directory
working_dir=`dirname $0`

# download the latest chromium build
curl -L -o $working_dir/chrome-mac.zip https://download-chromium.appspot.com/dl/Mac

# extract the zip we just downloaded
unzip $working_dir/chrome-mac.zip -d $working_dir

# move chromium app to the applications folder
mv $working_dir/chrome-mac/Chromium.app /Applications/

# clean up by deleting zip and extracted contents
rm $working_dir/chrome-mac.zip
rm -r $working_dir/chrome-mac

echo "Chromium has been updated to version:"
mdls -name kMDItemVersion /Applications/Chromium.app

exit 0
