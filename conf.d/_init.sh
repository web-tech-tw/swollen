#!/bin/sh
# Swollen - The unified databases deployment.
# (c) 2024 Taiwan Web Technology Promotion Organization (https://web-tech.tw)

# random
RANDOM_PASSWORD() {
    openssl rand -hex 24
}

# mongo.env
cat "samples/mongo.env" >"mongo.env"

# chroma.env
cat "samples/chroma.env" >"chroma.env"

# express.env
SWOLLEN_EXPRESS_PASSWORD="$(RANDOM_PASSWORD)"
sed "s/__SWOLLEN_EXPRESS_PASSWORD__/$SWOLLEN_EXPRESS_PASSWORD/g" "samples/express.env" >"express.env"

# print
set | grep -e "^SWOLLEN\_"
