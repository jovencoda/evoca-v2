
import React from 'react'
import FaAngleRight from 'react-icons/lib/fa/angle-right'
import { Flex, Box } from 'reflexbox'

import Switch, {Case, Default} from 'react-switch-case';
import TimelineView from './TimelineView'
import MapView from './MapView'
import TagsView from './TagsView'

var MainLayout = React.createClass({
  render: function() {
    return (
      <div className="main-container">
          {this.props.children}
      </div>
    );
  }
});


export default MainLayout;
