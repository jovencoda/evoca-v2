import React, { Component } from 'react';
import FaAngleRight from 'react-icons/lib/fa/angle-right'

// see reference for future development
//https://github.com/jxnblk/rebass/blob/master/demo/components/Navbar.js

import {
  Arrow,
  Dropdown,
  DropdownMenu,
  Fixed,
  NavItem,
  Space,
  Toolbar
} from 'rebass'

class Topbar extends Component {
  constructor(props){
    super(props);
    this.title = "EVOCA";
    this.channels = ["Proyecto X", "Proyecto Y", "Proyecto Z"];
  }
  render(){
    return(
      <Fixed top left right zIndex={1}>
        <Toolbar>
        <NavItem is="a">{this.title}</NavItem>
        <ProtoDropdown isOpen={false} handleActiveChannel="Proyecto Pance" channels={this.channels} />
        <Space auto x={1} />
      <Dropdown>
        <NavItem>
        captain <Arrow />
        </NavItem>
          <DropdownMenu open={false} onDismiss={function noRefCheck() {}}>
          <NavItem is="a">account</NavItem>
          <NavItem is="a">Logout</NavItem>
          </DropdownMenu>
      </Dropdown>

      </Toolbar>

      <Toolbar backgroundColor="secondary">
        <NavItem is="a">
        Dimension X
        </NavItem>
        <NavItem is="a">
        Dimension Y
        </NavItem>
        <NavItem is="a">
        Dimension Z
        </NavItem>
      </Toolbar>

      </Fixed>
    );
  }
}


class ProtoDropdown extends Component {
  constructor(props){
    super(props);
    this.state = {
      isToggleOn: false,
      activeChannel: null,
      listChannels: null,
    };
    this.handleClick = this.handleClick.bind(this);
    this.handleChannelsList = this.handleChannelsList.bind(this);
    this.handleActiveChannel = this.handleActiveChannel.bind(this);
  }

  handleClick() {
    this.setState(prevState => ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  handleActiveChannel(channel) {
    this.setState({activeChannel: channel});
  }

  handleChannelsList(key) {
    const listChannels = key.map((channel) =>
    <NavItem is="a">{ channel }</NavItem>
    );
    this.setState({listChannels: listChannels});
  }

  render(){
    return(
      <Dropdown>
        <NavItem onClick={this.handleClick}>
        <FaAngleRight /> {this.state.activeChannel} <Arrow />
        </NavItem>
        <DropdownMenu open={this.state.isToggleOn}>
          {this.state.listChannels}
        </DropdownMenu>
      </Dropdown>
    );
  }
}

export default Topbar
