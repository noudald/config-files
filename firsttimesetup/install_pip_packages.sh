#!/bin/bash

echo "Install python packages."
pip install --user --upgrade pip
pip install --user \
	setuptools \
	numpy \
	scipy \
	pandas \
	seaborn \
	sklearn \
	scikit-image

