
import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter, Route } from 'react-router-dom'
import { Switch, Route } from 'react-router-dom'

import App from './App'
import MainLayout from './View'
import './index.css'

/*ReactDOM.render(
  <App />,
  document.getElementById('root')
);*/

ReactDOM.render(
    <BrowserRouter>
        <Switch>
            <Route path="/" component={ App }/>
            {/*<Route path="/app" component={ MainLayout }/>*/}
        </Switch>
    </BrowserRouter>, document.getElementById('root')
);
