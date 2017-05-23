import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

// Import Rebass Components
import { Button, Badge } from 'rebass'
// Customized components
import Topbar from './Topbar'


class App extends Component {
  constructor () {
    super()
    this.state = {
        dropdownChannelOpen: false,
    }
    this.toggle = this.toggle.bind(this)
  }

  // Generic toggle class
  toggle (key) {
    return (e) => {
      const val = !this.state[key]
      this.setState({ [key]: val })
    }
  }

  render() {
    return (

      <div className="App">
		    <Topbar {...this.state} toggle={this.toggle} />
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <div>
          <h2>Rebass Component Test</h2>
          <Button>Click here</Button>
          <Badge>Badge</Badge>
          <p>{this.state.dropdownChannelOpen ? 'ON' : 'OFF'}</p>
        </div>
      </div>
    );
  }
}

export default App;
