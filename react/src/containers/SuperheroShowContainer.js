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

  render () {
    return(
      <div>
        <h1 id="showtitle">{this.state.superhero.name}</h1>
        <img id="heroshow" src={`${this.state.superhero.image_url}`}/>
        <div id="info">{`Backstory: ${this.state.superhero.backstory}`}</div>
        <div id="info">{`Superpower: ${this.state.superhero.superpower}`}</div>

        <ReviewsContainer
          key={this.props.id}
          id={this.props.params.id}
        />
      </div>
    );
  }

}

export default SuperheroShowContainer;
