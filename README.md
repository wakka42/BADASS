# BADASS : BGP At Doors of Autonomous Systems is Simple

This repository contains the documentation on how we completed this 42 subject on networks

## Part 1

The fisrt things to do was to set up a VM with a GUI to install and use GNS3 and Docker

What is GNS3 (Graphical Network Simulator 3)?

> GNS3 is used by hundreds of thousands of network engineers worldwide to emulate, configure, test and troubleshoot virtual and real networks. GNS3 allows you to run a small topology consisting of only a few devices on your laptop, to those that have many devices hosted on multiple servers or even hosted in the cloud.

What is Docker ?

> Docker is a software platform that allows you to build, test, and deploy applications quickly using images and containers. We are using docker to build images that will be used by GNS3

- To begin, we used ansible to install the necessary repositories, packages, and modify our local user (see the P1/setupVM folder)
- Then we created the 2 images needed to build a host and a router in order to import them in GNS3 (se the P1/host and P1/router folders)
