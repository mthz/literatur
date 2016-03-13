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
    git clone --quiet --branch=$BRANCH https://DoFzDXPhzGKaSgrXD1+C/H0p70r1k60ZRhy5RgplLt1CDMh1oRDnClJ+RFSWAbuq8XfrRgcBpd7nWyN3OXn/NXsJ07l7Xa27mttcPc/wnGqlmiymdRFpxslhTSNf5dS+g1KWZFPN5eam5YmMrBYlTE3ecKnqzdhGW8GKyKt0TMLuJLlbOoR3RIORUiPjJ9r9OACXaSf5f5YYmLyAlw6iDJ7QjIMoC9aU8XzFrjKfKjEb6paqEansZDaVCvE5mndhGnRQ7rSrfGC01SWoz9wV6skxtBPlyN7OIQY9XrsJlypur52Ppedj46+BJvf9/G5hHjQEfXa32k4nDnp8L522FZAZkbN9PYbrNYKwZp2kcdarqQDDgcy+9zEYKPfX82YB0C4d3zkKK2qMa+RTHzEj4EBIvYCvUgPdc9PzfcBJUHMc0v19dM34Orc5BGMHTPwwOUUEuHVm71wUVHNCYx98ax1Y7sgwpMHRU3+2rmVgrMRIQmr/Zq0+Dfp3ny+n9wNj/gcBH5vG9+640NX4rE3IIJisQOPy8fQ8Y1F0ChNIRUBHdMA62ARN0pwYTmnBz7lm9OdyWvUd1Qk6QBM7W/BV22eEJ+g3UcD1/k+tVdkvEdYQIdZzbCmB7M5JL1LpFk2uHoc7l9f8PkPhq5GdDUh29XJ78Hb5OzNdi5VFmCh+10U=@github.com/$TARGET_REPO build > /dev/null
    # go into directory and copy data we're interested in to that directory
    cp ros/ros-basics/arra-ros-basics.pdf .
    cp ros/ros-build-system/arra-ros-build-system.pdf .

    # add, commit and push files
    git add -f .
    git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to Github Pages"
    git push -fq origin $BRANCH > /dev/null
    echo -e "Deploy completed\n"


fi