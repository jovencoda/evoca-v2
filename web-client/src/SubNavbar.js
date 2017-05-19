import React from 'react'

import {
  NavItem,
  Toolbar
} from 'rebass'


const SubNavbar = ({
  config,
  configurations,
  dropdownOpen,
  switchConfig,
  toggle
}) => (
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
)

export default SubNavbar
