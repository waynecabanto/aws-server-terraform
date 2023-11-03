# WJDC Server terraform configs

A personal project by Wayne Cabanto.

Each AWS service is configured with a remote backend with no state-locking since I'm the only one working on the project.

## Copy sample_env.sh and make a new file named env.sh.

```bash
cp ./sample_env.sh ./env.sh
```

## Fill in the necesary credentials.

```bash
touch ./env.sh
```

## Run this command for every service.

```bash
. ./env.sh
#or
source ./env.sh
```
