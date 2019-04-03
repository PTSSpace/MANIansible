# Setting up can devices

Can devices are currently not managed by ansible. To get them up and running use the following commands:

```shell
$ sudo modprob can can_raw mttcan
$ sudo ip link set can0 type can bitrate 100000
$ sudo ip link set can1 type can bitrate 100000
$ sudo ip link set can0 up
$ sudo ip link set can1 up
```

