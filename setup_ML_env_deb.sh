# Check dependencies
# ------------------

# Check curl
if [ "$(which curl)" == "" ]; then
	apt-get download curl
	dpkg -i curl*.deb --force-not-root --root=$HOME 
fi

# Check git
if [ "$(which git)" == "" ]; then
	apt-get download git
	dpkg -i git*.deb --force-not-root --root=$HOME
fi

# Set up your python environment
# ------------------------------

# Download the Anaconda installer
curl -o Anaconda2-4.3.1-Linux-x86_64.sh https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh

# Make the installer executable
chmod u+x ./Anaconda2-4.3.1-Linux-x86_64.sh

# Run the installer, accepting the defaults.
./Anaconda2-4.3.1-Linux-x86_64.sh

# Source the .bash_profile to add anaconda2/bin to your path
# if [ -f ~/.bash_profile ]; then
# 	source ~/.bash_profile
# else
# 	source ~/.bashrc
# fi

# Or you can manually update your path
export PATH=~/anaconda2/bin:$PATH

# Install an additonal module not shipped with Anaconda
conda install -c glemaitre imbalanced-learn
conda install -c conda-forge tensorflow
pip install git+git://github.com/Theano/Theano.git
pip install git+git://github.com/fchollet/keras.git

# Download the source files for the tutorial
git clone https://github.com/brettin/ml_tutorials

# Run the first tutorial example
cd ml_tutorials/Topics/1_first_example/
python linear_regression.py 