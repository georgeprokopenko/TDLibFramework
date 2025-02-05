#!/bin/sh
set -e

PLATFORM="$1"


if [[ $PLATFORM = "iOS-simulator" ]]; then
    SDK="iphonesimulator"
    SCHEME="iOSApp"
    DESTINATION='platform=iOS Simulator,name=iPhone 8'
elif [[ $PLATFORM = "macOS" ]]; then
    SDK="macosx"
    SCHEME="macOSApp"
    DESTINATION='platform=OS X'
elif [[ $PLATFORM = "watchOS-simulator" ]]; then
    SCHEME="watchOSApp"
    DESTINATION='platform=watchOS Simulator,name=Apple Watch Series 5 - 40mm,OS=8.5'
elif [[ $PLATFORM = "tvOS-simulator" ]]; then
    SDK="appletvsimulator"
    SCHEME="tvOSApp"
    DESTINATION='platform=tvOS Simulator,name=Apple TV' 
else
    echo "Unknown SDK for platform \"$PLATFORM\""
    exit 1
fi

cd Tests/Apps

if [[ $PLATFORM = "watchOS-simulator" ]]; then
    xcodebuild -scheme ${SCHEME} -destination "${DESTINATION}" clean test
else
    xcodebuild -scheme ${SCHEME} -sdk ${SDK} -destination "${DESTINATION}" clean test
fi