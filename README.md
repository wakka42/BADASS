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
- Then we created the 2 images needed to build a host and a router in order to import them in GNS3 (see the P1/host and P1/router folders)

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

The first step is to make the routers communicate each other through the network. For this we need to setup the interfaces connected to the switch, we'll give them ip addresses on the same network.

`ip a add 10.0.0.1/24 dev eth0` and `ip a add 10.0.0.2/24 dev eth0`

They can now ping each other.

The routers are connected to the host by the eth1 inteface and to the switch by the eth0 interface.
The ip addresses of the hosts will be 30.0.0.1 and 30.0.0.2 as shown in the subject
Even though the host have ip adresses on the same network, they can't communicate.
For what reason ? When a device want to communicate with an ip on the same subnet, it will broadcast a ARP request in order to know the mac address of this ip. A router will no forward such a packet.
The solution here is to simulate that the routers don't exist and make them behave like we are on the same physical network.
For this we have a solution, a VXLAN, a "tunnel" that will encapsulate the ARP request and forward it through the VXLAN as we are on the same physical network.

For this mission, the subjetc want us to create a bridge br0 and a vxlan attached on the bridge to the eth1 interface.

Here are the commands to create the bridge interface and turn it on if not.

`ip link add br0 type bridge` and `ip link set br0 up`

Then we can create the vxlan, there is many fields to create it.

```
ip link add vxlan10 type vxlan \
id 10 \
dstport 4789 \
local 10.0.0.1 \
remote 10.0.0.2 \
dev eth0
```

- id is the VNI (VXLAN Network Identifier)
- dstport is the port used, default 4789 which is the UDP port
- local is the ip address of the router interface at the beginning of the "tunnel"
- remote is the ip address of the router interface at the other side of the "tunnel"
- dev is the interface choosen to send the data

All we need know is to attach the vxlan and et1 interface to the bridge

`ip link set vxlan10 master br0` and `ip link set eth1 master br0`

We successfully made a unicast VXLAN, we now need to set up a multicast one for BUM (Broadcast, Unknow unicast, ARP) traffic.
For this we only hav eto set up a group when creating the vxlan.

Here are the command updated

```
ip link add vxlan10 type vxlan \
id 10 \
dstport 4789 \
local 10.0.0.1 \
remote 10.0.0.2 \
dev eth0 \
group 239.1.1.1
```
