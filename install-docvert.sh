#!/usr/bin/env bash
sudo apt-get install libreoffice python-uno python-lxml python-imaging pdf2svg librsvg2-2 git
cd ~
rm docvert-agov -rf
git clone git@github.com:actgov/docvert-agov.git

