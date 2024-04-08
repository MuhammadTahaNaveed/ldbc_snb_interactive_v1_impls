#!/bin/bash

# Check if an argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <sf1 or sf10>"
    exit 1
fi

# Check if the argument is either sf1 or sf10
if [ "$1" != "sf1" ] && [ "$1" != "sf10" ]; then
    echo "Argument must be sf1 or sf10"
    exit 1
fi

# Convert argument to uppercase
SF_VERSION="${1^^}"

# Construct the URL based on the argument
URL="https://repository.surfsara.nl/datasets/cwi/ldbc-snb-interactive-v1-datagen-v100/files/social_network-${1}-CsvComposite-LongDateFormatter.tar.zst"

# Destination filename
FILENAME=$(basename $URL)

# Download the file using curl with --insecure option
curl --insecure -O $URL

# Check if download was successful
if [ $? -ne 0 ]; then
    echo "Download failed."
    exit 1
fi

# Extract the downloaded file using tar
tar -xf $FILENAME

# Check if extraction was successful
if [ $? -ne 0 ]; then
    echo "Extraction failed."
    exit 1
fi

# Extracted directory name
EXTRACTED_DIR="${FILENAME%.tar.zst}"

# Create the destination directories if they don't exist
DEST_DIR="$(pwd)/test-data/$SF_VERSION"

# Copy static and dynamic folders to the destination directory
cp -r "$EXTRACTED_DIR/static" "$DEST_DIR/vanilla"
cp -r "$EXTRACTED_DIR/dynamic" "$DEST_DIR/vanilla"

# Copy additional files to the update_streams directory
cp "$EXTRACTED_DIR/updateStream.properties" "$DEST_DIR/update_streams"
cp "$EXTRACTED_DIR/updateStream_0_0_forum.csv" "$DEST_DIR/update_streams"
cp "$EXTRACTED_DIR/updateStream_0_0_person.csv" "$DEST_DIR/update_streams"

# Remove the extracted directory and the downloaded file
rm -rf "$EXTRACTED_DIR"
rm -f $FILENAME

echo "Extraction and copying completed successfully."
