#!/bin/bash
echo "----- Begin setup.py -----"
cd blockchain && npm install
npx hardhat node 2>&1 > /tmp/hardhat_node.log &
cd ..
echo "-----   End setup.py -----"