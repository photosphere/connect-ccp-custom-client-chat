#!/bin/bash
BUCKET_NAME="thirdpartyapplicationdemo0529"
FOLDER_PATH="ChatDemo/url"

npm run build
aws s3 sync . s3://$BUCKET_NAME/$FOLDER_PATH/ --exclude "*" --include "index.html" --include "amazon-connect-chat-interface.js"
aws cloudfront create-invalidation --distribution-id E2UE1UWZONLK4Y --paths "/$FOLDER_PATH/*"