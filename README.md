# docker-jenkins

Sets up a complete container with jenkins and all the jenkins template php dependencies installed listening on port 8080.

## Usage

To run the container, do the following:

    docker run -d -P cyberkurumin/jenkins-php
    
    docker ps
    CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                     NAMES
    1131d37c38b1        cyberkurumin/jenkins-php:latest    java -jar /opt/jenki   12 seconds ago      Up 12 seconds       0.0.0.0:49153->8080/tcp   drunk_fermi

Your jenkins instance is now available by going to http://localhost:49153 .

## Building

To build the image, simply invoke

    docker build github.com/cyberkurumin/docker-jenkins

A prebuilt container is also available in the docker index

    docker pull cyberkurumin/jenkins-php


## Author

  * Jorge GOMES <jorge@blondeel-gomes.net>

## LICENSE

Copyright 2014 Jorge GOMES

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
