# Vimfiles

## Installation

1. Clone the repo in ~/.vim:

~~~
git clone https://github.com/mfgea/vimfiles.git ~/.vim
~~~

2. Create symlinks:

~~~
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/tern-config ~/.tern-config
~~~

3. Finish YouCompleteMe installation:

~~~
sudo apt-get install build-essential cmake
sudo apt-get install python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer
~~~

4. DONE!
