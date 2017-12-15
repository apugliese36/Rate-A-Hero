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
    let deleteButton = null
    if (this.state.currentUser) {
      if (this.state.currentUser.id === this.state.superhero.user_id || this.state.currentUser.role === "admin") {
        deleteButton = <button id="add" onClick={this.deleteSuperhero}>Delete Superhero</button>
      } else {
        deleteButton = null
      }
    }

    return(
      <div>
        <h1 id="showtitle">{this.state.superhero.name}</h1>
        <div className="row">
          <div className="column medium-6">
            <button id="add" onClick={browserHistory.goBack}>Back</button>
            {deleteButton}
            <div id="info2">{`Backstory: ${this.state.superhero.backstory}`}</div>
            <div id="info2">{`Superpower: ${this.state.superhero.superpower}`}</div>
            <div id="info2">{`Posted by: ${this.state.creator}`}</div>
          </div>
          <div className="column medium-6">
            <div className="text-center">
              <img id="heroshow" src={`${this.state.superhero.image_url}`} width='200' height='200'/>
            </div>
          </div>
        </div>
        <h2 id="showtitle">Reviews:</h2>
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
