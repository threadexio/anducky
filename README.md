# AnDucky

A simple implementaion of the rubber ducky on Android utilizing USB gadgets and ConfigFS

# How to use

**NOTE:** This required a root permissions to work (`PRoot` won't do)

-   Clone the repo

```
$ git clone https://github.com/threadexio/anducky
$ cd anducky
$ git submodule update --init --recursive
```

-   Obtain an `hid-tester` binary

```
$ cp hid-tester/hid-tester-[your cpu architecture] scripts/hid-tester
```

You can build it yourself if one isn't available for your CPU

```
$ cd hid-tester
$ make FLAGS="-DNDEBUG" build
$ cp hid-tester ../scripts/hid-tester
```

-   Now you can start making scripts, there are some examples under the scripts folder
