import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import Layout from "./components/Layout";
import SuperheroTileComponent from "./components/SuperheroTileComponent"
import SuperheroesIndexContainer from "./containers/SuperheroesIndexContainer"
import SuperheroShowContainer from "./containers/SuperheroShowContainer"
import SuperheroFormComponent from "./components/SuperheroFormComponent"

const App = props => {
  return(
    <div>
      <Router history={browserHistory}>
        <Route path='/'>
          <IndexRoute component={SuperheroesIndexContainer}/>
          <Route path='/superheroes' component={SuperheroesIndexContainer}/>
          <Route path='/superheroes/new' component={SuperheroFormComponent}/>
          <Route path='/superheroes/:id' component={SuperheroShowContainer}/>
        </Route>
      </Router>
    </div>
  );
};

export default App;
