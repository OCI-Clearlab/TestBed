#VERSION = v1
#HUB = docker.io/
ROOT = ${PWD}
#TAG = $(VERSION)
#RELEASE_BRANCH = master

GIT_CLONE = git clone

clean.go-app:
    rm -rf $(ROOT)/TestBed

clone.go-app:
    $(GIT_CLONE) --depth=1 https://github.com/OCI-Clearlab/TestBed.git $(ROOT)/TestBed

build.go-app:
    cd $(ROOT)/TestBed/action-b \
        && DRY_RUN=1 ./build-and-push.sh
    