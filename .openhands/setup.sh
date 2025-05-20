#!/bin/bash
echo "----- Begin setup.py -----"
cd blockchain && npm install
mv .env.example .env
npx hardhat node 2>&1 > /tmp/hardhat_node.log &
cd ../frontend && npm install
cd ..
echo "-----   End setup.py -----"