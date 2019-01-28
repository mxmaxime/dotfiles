# Handy Docker aliases
**Optimize your docker command line workflow.**

## Logs
Simply see logs.
- `docker logs` -> `dkl`
- `docker logs x6a8` -> `dkl x6a8`

Follow logs.
- `docker logs -f x6a8` -> `dklf x6a8`

Follow docker logs by name.
- `dkln redis`

For example, `docker ps | grep redis` returning:
```
<hash>  redis:<tag> "<running-script>"
```

How to get the hash from the container name? Using `awk` it's pretty simple.

```
docker ps | grep redis | awk '{print $1}'
# -> <hash>
```

This trick allows us to view the log for any container by name.

Naturally, you'll need to **make sure you don't have multiple containers which match a name**.
If you do, then resort to the dkl command with a container ID.

## Status
- `docker ps` -> `dkps`.
- `dkstats redis` which applies a grep filter if a parameter is supplied.

## htop like
- `dktop` very basic informations. [https://www.techietown.info/2017/03/docker-container-monitoring-using-docker-stats/](Can customize it easily).
