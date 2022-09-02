## AMD Radeon Stable Diffusion container

Clone a repository including its submodule.
```
git clone --recursive git@github.com:Gedweb/Stable-diffusion-radeon.git
```

Download a [model](https://huggingface.co/CompVis) and put into `model` directory with name `model.ckpt` or you cant define path to file by command option.

Run `docker-compose run -it rocm` and wait for building done, after try generate image by the prompt
```
python scripts/txt2img.py --plms --ddim_steps 200 --seed 1 --prompt "a photograph of an astronaut riding a horse" 
```
The following describes an example where a rough sketch made in [Pinta](https://www.pinta-project.com/) is converted into a detailed artwork.
```
python scripts/img2img.py --prompt --ddim_steps 200 --seed 1 --prompt "A fantasy landscape, trending on artstation" --init-img inputs/<file-name-img.jpg> --strength 0.8
```
Here, strength is a value between 0.0 and 1.0, that controls the amount of noise that is added to the input image. 

By default, this uses a guidance scale of `--scale 7.5`, [Katherine Crowson's implementation](https://github.com/CompVis/latent-diffusion/pull/51) of the [PLMS](https://arxiv.org/abs/2202.09778) sampler, 
and renders images of size 512x512 (which it was trained on) in 50 steps. All supported arguments are listed below (type `python scripts/txt2img.py --help`).

Directory structure
- `inputs` just segregation for img2img
- `model` contains diffusion model
- `outputs` results
- `cache` mounted to avoid download on next run
