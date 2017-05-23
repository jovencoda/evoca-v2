
import React from 'react'
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


const Topbar = ({
  dropdownChannelOpen,
  toggle,
  title,
  activeChannel,
  channels,
  views
}) => (
  <Fixed top left right zIndex={1}>
    <Toolbar>
      <NavItem is="a">{title}</NavItem>
      <Dropdown>
        <NavItem onClick={toggle('dropdownChannelOpen')}>
          <FaAngleRight /> {activeChannel}<Arrow />
        </NavItem>
        <DropdownMenu onDismiss={toggle('dropdownChannelOpen')} open={dropdownChannelOpen} right>
            {channels.map(function(channel) {return <NavItem key={channel} is="a">{ channel }</NavItem>})}
        </DropdownMenu>
      </Dropdown>

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
      <NavItem is="div">vista:</NavItem>
      {views.map(function(view) {return <NavItem key={view} is="a">{ view }</NavItem>})}
    </Toolbar>

  </Fixed>
)






export default Topbar
