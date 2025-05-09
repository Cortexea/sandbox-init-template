#!/bin/bash
echo "----- Begin setup.py -----"
cd blockchain && npm install
cd ../frontend && npm install 
cd ..
echo "-----   End setup.py -----"