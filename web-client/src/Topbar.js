
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
  dropdownOpen,
  toggle,
  title = "EVOCA",
  activeChannel = "Proyecto Pance",
  channels = ["Proyecto X", "Proyecto Y", "Proyecto Z"]
}) => (
  <Fixed top left right zIndex={1}>
    <Toolbar>
    <NavItem is="a">{title} {dropdownOpen}</NavItem>

    <Dropdown>
      <NavItem onClick={toggle('dropdownOpen')}>
      <FaAngleRight /> {activeChannel}<Arrow />
      </NavItem>
      <DropdownMenu onDismiss={toggle('dropdownOpen')} open={dropdownOpen} right>
          {
          channels.map(function(channel) {
            return <NavItem key={channel} is="a">{ channel }</NavItem>
          })
         }
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
)






export default Topbar
