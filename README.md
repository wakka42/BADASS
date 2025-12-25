# BADASS : BGP At Doors of Autonomous Systems is Simple

This repository contains the documentation on how we completed this 42 subject on networks

## Part 1

The fisrt things to do was to set up a VM with a GUI to install and use GNS3 and Docker

What is GNS3 (Graphical Network Simulator 3)?

> GNS3 is used by hundreds of thousands of network engineers worldwide to emulate, configure, test and troubleshoot virtual and real networks. GNS3 allows you to run a small topology consisting of only a few devices on your laptop, to those that have many devices hosted on multiple servers or even hosted in the cloud.

What is Docker ?

> Docker is a software platform that allows you to build, test, and deploy applications quickly using images and containers. We are using docker to build images that will be used by GNS3

**<ins>Summarized walkthrough</ins>**

- To begin, we used ansible to install the necessary repositories, packages, and modify our local user (see the P1/setupVM folder)
- Then we created the 2 images needed to build a host and a router in order to import them in GNS3 (se the P1/host and P1/router folders)

## Part 2

There are many topics to know about before entering this part:

- The OSI model (Layer 2 and 3 at least)
- Ip and Mac address
- Some protocols (TCP, UDP, ARP, ICMP, ...)
- VLAN

The main subject of this part is the VXLAN.

VXLAN stands for Virtual eXtensible Local Area Network. By his name we vcan assume than it is close to a VLAN.
VXLAN comes to overcome some issues we have with basic VLAN like the numbers of VLANs on a network (4096) by relying on the layer 3 instead of the layer 2.

Here is the topology we have for this part

![VXLAN Network topology](https://github.com/wakka42/BADASS/blob/main/Media/VXLAN_network_topology.png)
