# part07 readme

When running the file `demo_idempotence1.yml` file it constantly is making a
change to the router. Why is this? It isn't changing? Well, this lies in the
fact that Ansible is doing a comparison of the lines.

In the configuration for the Loopback interface there is:

```
interface Loopback7
 ip address 10.20.30.7 255.255.255.255
```

Compared to:

```
interface Loopback7
 ip add 10.20.30.7 255.255.255.255
```

Taking a look at `demo_idempotent2.yml` file, it has been updated to be the
proper fully spelled out command. Now when running the configuration multiple
times there is only a single configuration applied.

