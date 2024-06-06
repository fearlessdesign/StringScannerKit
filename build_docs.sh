#!/bin/bash

swift package --allow-writing-to-directory docs generate-documentation --target ScannerExtensions --disable-indexing --transform-for-static-hosting --hosting-base-path StringScannerKit --output-path docs
swift package --disable-sandbox preview-documentation --target ScannerExtensions
