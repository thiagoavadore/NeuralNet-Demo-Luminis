# Intro to Deep Learning with Keras for Luminis

I gave a talk followed by a hands-on session on Keras at [Luminis](https://www.luminis.eu/) headquarters on 22/May/2018.
<br>This repo has three basic implementations of Neural Nets (nothing deep) on Keras running on top of TensorFlow - scaling on difficulty.

## KERAS on TF on Jupyter on Docker

> This was tested on Docker running on a macbook with 16GB of RAM. The Docker Engine has up to 6GB of RAM allocated, just in case you start to have performance issues...

Build the `dockerfile` on the main directory of this repo:

```bash
cd {PATH_TO_INTRODL}
docker build -t {TAG_IMAGE} .
```

After succesfully built, run the following to start a Jupyter notebook (note that jupyter image has a user `jovyan` to not run on root). _The ports that you are mapping are concerning the JupyterNotebook and the tensorboard._

```bash
docker run -v [PATH_TO_INTRODL}:/home/jovyan/work --rm -p 8888:8888 -p 6006:6006 {TAG_IMAGE}
...
[09:13:04.296 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 09:13:04.296 NotebookApp]
Copy/paste this URL into your browser when you connect for the first time,to login with a token:
http://localhost:8888/?token=bd6acc1e00f084f16f9b1253a679871eb0e8da15065ecd80
```

### TensorBoard

If you want to visualise the loss and accuracy metrics, just execute TensorBoard pointing to your logs directory and make sure that you add the `callback` to the `model.fit` statement. Also, make sure that you have the folder where you specify to be saved - the 3 notebooks here will save to `notebooks/logs` by default.

```
docker exec -it {CONTAINER_ID} bash

tensorboard --logdir=[PATH_TO_LOGS]
````

> Remember that all changes made on the Docker container will be replicated to your local volume (including the `logs` folder). So when you build a new image again it will be there! :-)

