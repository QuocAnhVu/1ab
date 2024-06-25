# Lab Environment

## Build

1. Download the [latest version of Anaconda.](https://repo.anaconda.com/archive/) Replace the version and platform below.

```sh
curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
```

2. Run `build.sh`.

```sh
./build.sh
```

## Run

1. Create `ws/`.

```sh
mkdir ws
```

2. Change `init.sh` so that the newly created `ws/` folder is linked to the container.

3. Run `init.sh`.

```sh
./init.sh
```

4. Open Jupyter Lab using the link displayed in the terminal.
