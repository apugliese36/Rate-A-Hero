import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

class SuperheroFormComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      backstory: '',
      superpower: '',
      imageUrl: '',
      userId: '',
      creator_username: ''
    };

    this.onNameChange = this.onNameChange.bind(this);
    this.onBackstoryChange = this.onBackstoryChange.bind(this);
    this.onSuperpowerChange = this.onSuperpowerChange.bind(this);
    this.onImageUrlChange = this.onImageUrlChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleClearForm = this.handleClearForm.bind(this);
  }

  componentDidMount () {
  fetch(`/api/v1/superheroes/`, {
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
      userId: body.superheroes[0].current_user.id,
      creator_username: body.superheroes[0].current_user.username
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  onNameChange(event) {
    this.setState({ name: event.target.value });
  }
  onBackstoryChange(event) {
    this.setState({ backstory: event.target.value });
  }
  onSuperpowerChange(event) {
    this.setState({ superpower: event.target.value });
  }
  onImageUrlChange(event) {
    this.setState({ imageUrl: event.target.value });
  }

  handleClearForm(event){
    this.setState({
      name: '',
      backstory: '',
      superpower: '',
      imageUrl: ''
    });
  }

  newSuperhero(payload) {
    fetch('/api/v1/superheroes', {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(payload),
      headers: { 'Content-Type': 'application/json' }
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
      this.handleClearForm();
      browserHistory.push(`/superheroes/${body.superhero.id}`);
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleSubmit(event) {
    event.preventDefault();
    let formPayload = {
      name: this.state.name,
      superpower: this.state.superpower,
      backstory: this.state.backstory,
      image_url: this.state.imageUrl,
      user_id: this.state.userId
    };

    this.newSuperhero(formPayload);
  }

  render() {
    return(
      <form className="new-article-form callout" onSubmit={this.handleSubmit}>
        <label>Name
          <input
              name='name'
              type='text'
              value={this.state.name}
              onChange={this.onNameChange}
            />
        </label>

        <label>Backstory
          <textarea
              name='backstory'
              type='text'
              value={this.state.backstory}
              onChange={this.onBackstoryChange}
            />
        </label>

        <label>Superpower
          <input
              name='superpower'
              type='text'
              value={this.state.superpower}
              onChange={this.onSuperpowerChange}
            />
        </label>

        <label>Image Url
          <input
              name='imageUrl'
              type='text'
              value={this.state.imageUrl}
              onChange={this.onImageUrlChange}
            />
        </label>

        <div className="button-group">
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    );
  }
}
export default SuperheroFormComponent;
