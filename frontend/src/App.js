import React from 'react';
import './App.css';
import SimpleStorage from './components/SimpleStorage';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>My Decentralized Application</h1>
        <SimpleStorage />
      </header>
    </div>
  );
}

export default App;
