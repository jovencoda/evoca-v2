import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route } from 'react-router-dom';
import App from './App';
import MainLayout from './View';
import TimelineView from './TimelineView';
import MapView from './MapView';
import TagsView from './TagsView';
import './index.css';

ReactDOM.render(
  <App />,
  document.getElementById('root')
);

ReactDOM.render(
    <BrowserRouter>
        <Route path="/" component={ App }/>
    </BrowserRouter>, document.getElementById('root')
);
