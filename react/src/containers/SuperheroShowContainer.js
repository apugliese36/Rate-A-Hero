import React, { Component } from 'react';
import SuperheroTileComponent from "../components/SuperheroTileComponent"
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

class SuperheroShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      superhero: []
    }
  }

  componentDidMount () {
  fetch(`http://localhost:3000/api/v1/superheroes/${this.props.params.id}`)
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
      error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.json())
  .then(body => {
    this.setState({
      superhero: body
    })
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  render () {
    return(
      <div>
        <h1>{this.state.superhero.name}</h1>
        <img src={`${this.state.superhero.image_url}`} width='200' height='200'/>
        <div>{`Backstory: ${this.state.superhero.backstory}`}</div>
        <div>{`Superpower: ${this.state.superhero.superpower}`}</div>

      </div>
    )
  }

}

export default SuperheroShowContainer;
