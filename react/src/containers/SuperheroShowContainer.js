import React, { Component } from 'react';
import SuperheroTileComponent from "../components/SuperheroTileComponent";
import ReviewsContainer from "./ReviewsContainer";
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

class SuperheroShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      superhero: [],
      currentUser: {},
      creator: ''
    };
    this.deleteSuperhero = this.deleteSuperhero.bind(this);
  }

  componentDidMount () {
  fetch(`/api/v1/superheroes/${this.props.params.id}`, {
    credentials: 'same-origin'
  })
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
      superhero: body.superhero,
      currentUser: body.superhero.current_user,
      creator: body.superhero.user.username
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  deleteSuperhero(event) {
    event.preventDefault();
    fetch(`/api/v1/superheroes/${this.props.params.id}`, {
      credentials: 'same-origin',
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' }
    })
    .then(response => {
      if (response.ok) {
        alert("Bye-bye!"),
        browserHistory.push('/superheroes')
      } else {
        alert("You may not delete what you did not create")
      }
    })
  }


  render () {
    return(
      <div>
        <h1 id="showtitle">{this.state.superhero.name}</h1>
        <img id="heroshow" src={`${this.state.superhero.image_url}`} width='200' height='200'/>
        <div id="info">{`Backstory: ${this.state.superhero.backstory}`}</div>
        <div id="info">{`Superpower: ${this.state.superhero.superpower}`}</div>
        <div id="info">{`Posted by: ${this.state.creator}`}</div>
        <button id="add" onClick={this.deleteSuperhero}>Delete Superhero</button>
        <ReviewsContainer
          key={this.props.id}
          id={this.props.params.id}
          currentUser={this.state.currentUser}
        />
      </div>
    );
  }

}

export default SuperheroShowContainer;
