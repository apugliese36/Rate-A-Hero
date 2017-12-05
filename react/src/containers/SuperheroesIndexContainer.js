import React, { Component } from 'react';
import SuperheroTileComponent from "../components/SuperheroTileComponent"

class SuperheroesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      superheroes: []
    }
  }

  componentDidMount () {
  fetch('http://localhost:3000/api/v1/superheroes')
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
      superheroes: body
    })
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}


  render () {
    let superheroes = this.state.superheroes.map(superhero => {
      return (
        <SuperheroTileComponent
          name={superhero.name}
          imageUrl={superhero.image_url}
        />
      )
    })
    return (
      <div>
        <h1>I am sUPERHEROS INDEX CONTINAER</h1>
          {superheroes}
      </div>
    )
  }

}

export default SuperheroesIndexContainer;