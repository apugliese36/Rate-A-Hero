import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import Layout from "./components/Layout";
import SuperheroTileComponent from "./components/SuperheroTileComponent"
import SuperheroesIndexContainer from "./containers/SuperheroesIndexContainer"
import SuperheroShowContainer from "./containers/SuperheroShowContainer"

const App = props => {
  return(
    <div>
      <h1>Here are some Superheroes</h1>
      <Router history={browserHistory}>
        <Route path='/' component={Layout}>
        <IndexRoute component={SuperheroesIndexContainer} />
          <Route path='/superheroes/:id' component={SuperheroShowContainer}/>
          <Route path='/superheroes' component={SuperheroesIndexContainer}/>
        </Route>
      </Router>
    </div>
  );
};

export default App;
