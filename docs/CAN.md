# Setting up can devices

CAN devices are created during boot by running the following commands in the `/etc/rc.local` file.

```shell
$ sudo modprob can can_raw mttcan
$ sudo ip link set can0 type can bitrate 100000
$ sudo ip link set can1 type can bitrate 100000
$ sudo ip link set can0 up
$ sudo ip link set can1 up
```

