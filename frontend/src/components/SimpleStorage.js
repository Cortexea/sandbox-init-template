import React, { useState, useEffect } from 'react';
import { connectToContract, getProvider } from '../utils/ethereum';

// Import your contract ABI (will be available after compilation)
// import SimpleStorageABI from '../contracts/SimpleStorage.json';

const SimpleStorage = () => {
  const [value, setValue] = useState('');
  const [storedValue, setStoredValue] = useState('');
  const [contract, setContract] = useState(null);
  const [account, setAccount] = useState('');
  const [isConnected, setIsConnected] = useState(false);

  // In a real app, you would import the real contract address after deployment
  const contractAddress = '0x0000000000000000000000000000000000000000'; 
  
  // Connect to MetaMask
  const connectWallet = async () => {
    try {
      const provider = getProvider();
      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
      setAccount(accounts[0]);
      setIsConnected(true);
      
      // Once we have the ABI, we can initialize the contract
      // setContract(await connectToContract(contractAddress, SimpleStorageABI.abi));
    } catch (error) {
      console.error("Error connecting to wallet:", error);
    }
  };

  // Store a new value
  const handleStore = async () => {
    if (!contract) return;
    try {
      const tx = await contract.store(value);
      await tx.wait();
      fetchStoredValue();
    } catch (error) {
      console.error("Error storing value:", error);
    }
  };

  // Fetch the current stored value
  const fetchStoredValue = async () => {
    if (!contract) return;
    try {
      const currentValue = await contract.retrieve();
      setStoredValue(currentValue.toString());
    } catch (error) {
      console.error("Error fetching value:", error);
    }
  };

  return (
    <div className="simple-storage">
      <h2>Simple Storage DApp</h2>
      
      {!isConnected ? (
        <button onClick={connectWallet}>Connect Wallet</button>
      ) : (
        <div>
          <p>Connected Account: {account}</p>
          <div>
            <input 
              type="number" 
              value={value} 
              onChange={(e) => setValue(e.target.value)} 
              placeholder="Enter a value" 
            />
            <button onClick={handleStore}>Store Value</button>
          </div>
          <div>
            <button onClick={fetchStoredValue}>Get Stored Value</button>
            {storedValue && <p>Stored Value: {storedValue}</p>}
          </div>
        </div>
      )}
    </div>
  );
};

export default SimpleStorage;
