import React, { Component } from 'react';

import { BrowserRouter, Route } from 'react-router-dom';

import logo from './logo.svg';
import './App.css';

// Import Rebass Components
import { Button, Badge } from 'rebass'
// Customized components
import Topbar from './Topbar'
import ViewControl from './View'

const api_url_root = "http://192.168.33.10:8000/api/v1";

class App extends Component {
  constructor () {
    super()
    this.state = {
        title:"EVOCA",
        admin_url: "http://192.168.33.10:8000/admin/",
        dropdownChannelOpen: false,
        activeChannel: "Proyecto Pance",
        activeView: "Timeline",
        channels: ["Proyecto X", "Proyecto Y", "Proyecto Z"],
        views: ["Timeline", "Map", "Categories"]
    }
    this.toggle = this.toggle.bind(this)
    this.updateState = this.updateState.bind(this)
  }
  componentWillMount() {
    fetch(api_url_root + "/channel/")
      .then((response) => {
        return response.json()
      })
      .then((response) => {
        var channels_names = []
        response.map((channel_name) => {
          channels_names.push(channel_name['name'])
        })
        //console.log(channels_names)
        this.setState({ channels: channels_names })
      })
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
        <BrowserRouter>
            <MainLayout {...this.state} toggle={this.toggle}/>
        </BrowserRouter>
        {/*<MainLayout {...this.state} toggle={this.toggle}/>*/}
      </div>
    );
  }
}

export default App;
