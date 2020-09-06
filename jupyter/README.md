After installing Jupyter Notebook, install the following:

```sh
conda install -c conda-forge jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
pip install jupyterthemes
```

Install the vim plugin
```sh
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding
```

Install the theme
```sh
jt -t onedork -f roboto -fs 11 -kl -vim
```
