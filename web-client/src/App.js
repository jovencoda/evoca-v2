import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

// Import Rebass Components
import { Button, Badge } from 'rebass'
// Customized components
import Topbar from './Topbar'
import ViewControl from './View'

class App extends Component {
  constructor () {
    super()
    this.state = {
        title:"EVOCA",
        dropdownChannelOpen: false,
        activeChannel: "Proyecto Pance",
        activeView: "Timeline",
        channels: ["Proyecto X", "Proyecto Y", "Proyecto Z"],
        views: ["Timeline", "Map", "Categories"]
    }
    this.toggle = this.toggle.bind(this)
    this.updateState = this.updateState.bind(this)
  }
  // Generic toggle class
  toggle (key) {
    return (e) => {
      const val = !this.state[key]
      this.setState({ [key]: val })
    }
  }
  // Generic State update class
  updateState (key, state) {
    return (e) => {
      this.setState({ [state]: key })
    }
  }
  render() {
    return (
      <div className="App">
		    <Topbar {...this.state} toggle={this.toggle} updateState={this.updateState}/>
        <ViewControl {...this.state} toggle={this.toggle}/>
      </div>
    );
  }
}

export default App;
