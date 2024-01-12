# CMakeTemplate

This repository is designed to be run from within a custom docker image, which makes setting up easier:

1. Clone this repo to your local:

   ```
   git clone git@github.com:hnorth99/Yot.git && cd cmaketemplate
   ```
2. Execute the docker build and enter the container via bash shell:

   ```
   docker compose run cmaketemplate bash
   ```
   Note #1:
   If the created container ever gets stopped/exited, do not run the command above as it will just bring you inside a newly built container. Instead, run:

   ```
   docker start -ai <container-id>
   ```
   Note #2:
   To maintain compatibility for developer's working within the docker container, the build uses a git configuration existing in `~/.gitconfig` and ssh keys existing in `~/.ssh`. Developer's with these files in non-typical paths will experience loss of git functionality from within the running container.

   Note #3:
   I recommend installing the Docker Dev Containers VS Code extension to work within the running container started above (via the attach to running container option).
3. You can then use the runner script to build the project:

   ```
   # Build in release mode (enforce linter)
   bash runner rel
   # Build in debug mode
   bash runner deb (enforce tests/coverage)
   ```
