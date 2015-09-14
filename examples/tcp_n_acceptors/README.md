Ranch TCP echo example
======================

To try this example, you need GNU `make` and `git` in your PATH.

To build the example, run the following command:

``` bash
$ make
```

To start the release in the foreground:

``` bash
$ ./_rel/tcp_echo_example/bin/tcp_echo_example console
```

This starts 2 servers, at ports 5555 and 5556. The first one has 1 acceptor process, the second one has 100 acceptor processes.

Try to open 100 connections to each of these servers and see the difference:

``` bash
> tcp_echo_app:test_connections(5555).
...
> tcp_echo_app:test_connections(5556).
...
```
