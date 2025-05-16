#!/bin/bash
echo "----- Begin setup.py -----"
cd blockchain && npm install
npx hardhat node 2>&1 > /tmp/hardhat_node.log &
echo "shishan debugging here too"
whoami
npm install -g http-server
cd ..
echo "-----   End setup.py -----"