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

import SubNavbar from './SubNavbar'

const Navbar = ({
  config,
  configurations,
  dropdownOpen,
  switchConfig,
  toggle
}) => (
  <Fixed top left right zIndex={1}>
    <Toolbar>
	  <NavItem is="a">
		EVOCA
	  </NavItem>
	<Dropdown>
	  <NavItem>
		<FaAngleRight /> Proyecto Pance <Arrow />
	  </NavItem>
	  <DropdownMenu onDismiss={function noRefCheck() {}}>
		  <NavItem is="a">Poject R</NavItem>
		  <NavItem is="a">Project Z</NavItem>
	  </DropdownMenu>
	</Dropdown>
	  <Space
		auto
		x={1}
	  />
	<Dropdown>
	  <NavItem>
		captain <Arrow />
	  </NavItem>
      <DropdownMenu onDismiss={function noRefCheck() {}}>
		  <NavItem is="a">account</NavItem>
		  <NavItem is="a">Logout</NavItem>
      </DropdownMenu>
	</Dropdown>

	</Toolbar>
	<SubNavbar />
  </Fixed>
)

export default Navbar
