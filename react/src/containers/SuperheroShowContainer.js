import React, { Component } from 'react';
import SuperheroTileComponent from "../components/SuperheroTileComponent";
import ReviewsContainer from "./ReviewsContainer";
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

class SuperheroShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      superhero: []
    };
    this.deleteSuperhero = this.deleteSuperhero.bind(this);
  }

  componentDidMount () {
  fetch(`/api/v1/superheroes/${this.props.params.id}`)
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
      superhero: body.superhero
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  deleteSuperhero() {
    fetch(`/api/v1/superheroes/${this.props.params.id}`, {
      credentials: 'same-origin',
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' }
    }).then(
      browserHistory.push('/superheroes')
    );
  }


  render () {
    return(
      <div>
        <h1>{this.state.superhero.name}</h1>
        <img src={`${this.state.superhero.image_url}`} width='200' height='200'/>
        <div>{`Backstory: ${this.state.superhero.backstory}`}</div>
        <div>{`Superpower: ${this.state.superhero.superpower}`}</div>
        <button onClick={this.deleteSuperhero}>Delete Superhero</button>
        <ReviewsContainer
          key={this.props.id}
          id={this.props.params.id}
        />
      </div>
    );
  }

}

export default SuperheroShowContainer;
