#! /bin/sh

# get latest tag from github
TAGS="$(git ls-remote --tags https://github.com/betaflight/betaflight-configurator.git | sed 's;.*/;;')"
REMOTE="$(echo "$TAGS"| sort -n | grep -vi RC | tail -1)"

# get latest local tag
LOCAL="$(grep source-tag snap/snapcraft.yaml | sed 's/^.*: //')"

if [ "$LOCAL" != "$REMOTE" ]; then
	echo "new release $REMOTE is there, please update source-tag in snapcraft.yaml !"
	echo "you might also check the node version in package.json and bump the one in"
	echo "snapcraft.yaml's build-snaps entry"
else
	echo "up to date..."
fi
