import { ethers } from 'ethers';

// This function detects if MetaMask is installed
export const detectEthereum = () => {
  return window.ethereum;
};

// This function creates an ethers provider
export const getProvider = () => {
  if (!detectEthereum()) {
    throw new Error('Please install MetaMask!');
  }
  return new ethers.BrowserProvider(window.ethereum);
};

// This function gets the signer
export const getSigner = async () => {
  const provider = getProvider();
  return await provider.getSigner();
};

// This function connects to a contract
export const connectToContract = async (contractAddress, contractABI) => {
  const signer = await getSigner();
  return new ethers.Contract(contractAddress, contractABI, signer);
};
