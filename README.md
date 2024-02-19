# Platform Engineer Technical Test

Welcome to Castor Platform Engineer technical test. 
This test is designed to assess your technical skills and knowledge with containerization.

## Assignment

Your task is to build a container image that runs the Go web application in this repository.

As part of this task you will need to:

- Build a container image that runs the Go web application.
  - Allow the environment variable `PORT` to be configurable, but with a default value.
  - No constraints on the base image or the container runtime.
- Provide instructions on how to build and run the container image in a README file.
- Create a CI pipeline that builds the container image and pushes it to a registry.
  - The container must be able to run on Linux x86_64 and ARM processors both.
  - You can use any CI tool you like, but the pipeline needs to be defined in code.

## Submission

1. Fork this repository.
1. Complete the task and commit it to your fork.
1. Send us a link to your fork. If you would like to keep it private, please add `@MattiasAng`, `@zoni` and `@ja-sg` as collaborators.


## Testing the setup locally 

- Build the Docker image locally
  - Open a terminal, navigate to the project directory and run the following command to build a Docker image:
    
    `docker build -t platform-engineer .`

- Run the container locally with the following commands to map port 8080 from the container to port 8080 on your host machine:
    
    `docker run -p 8080:8080 platform-engineer`

- Access the app on http://localhost:8080. You should see the "Hello Platform Engineer candidate!" message.

## Deploying the image to Docker Hub

A push to this repository will trigger a GitHub Action. To set it up, add your username and Docker Hub token to your repository's secrets.

The pipeline builds a multi-architecture image under emulation with QEMU and also buildx, by using the platform flag to create Linux images for AMD 64-bit and Arm 64-bit. Then, during the docker pull command, Docker will automatically select the appropriate platform-specific image based on the architecture of the host system.



