#!/usr/bin/env bash
BRANCH=pdf
TARGET_REPO=mthz/literatur.git

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo -e "Starting to deploy to Github Pages\n"
    if [ "$TRAVIS" == "true" ]; then
        git config --global user.email "travis@travis-ci.org"
        git config --global user.name "Travis"
    fi
    # using token clone pdf branch
    git clone --quiet --branch=$BRANCH https://${GH_TOKEN}@github.com/$TARGET_REPO build > /dev/null
    # go into directory and copy data we're interested in to that directory
    cp ros/ros-basics/arra-ros-basics.pdf .
    cp ros/ros-build-system/arra-ros-build-system.pdf .

    # add, commit and push files
    git add -f .
    git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to Github Pages"
    git push -fq origin $BRANCH > /dev/null
    echo -e "Deploy completed\n"
fi