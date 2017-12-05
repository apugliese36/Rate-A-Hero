import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import Layout from "./components/Layout";
import SuperheroTileComponent from "./components/SuperheroTileComponent"
import SuperheroesIndexContainer from "./containers/SuperheroesIndexContainer"


const App = props => {
  return(
    <div>
      <h1>Here are some Superheroes</h1>
      <Router history={browserHistory}>
        <Route path='/' component={Layout}>
          <Route path='/superheroes/:id' component={SuperheroTileComponent}/>
          <Route path='/superheroes' component={SuperheroesIndexContainer}/>
        </Route>
      </Router>
    </div>
  );
};

export default App;
