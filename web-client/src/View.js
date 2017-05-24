
import React from 'react'
import FaAngleRight from 'react-icons/lib/fa/angle-right'
import { Flex, Box } from 'reflexbox'

import Switch, {Case, Default} from 'react-switch-case';

const ViewControl = ({
  toggle,
  activeView,
  activeChannel,
  views
}) => (
  <div>
    <Switch condition={activeView} addClass={'viewContainer'}>
      <Case value='Map'>
        <h2>Map</h2>
      </Case>
      <Case value='Categories'>
        <h2>Categories</h2>
      </Case>
      <Default>
        <h2>Timeline</h2>
      </Default>
    </Switch>
  </div>
)






export default ViewControl
