import SuperheroesIndexContainer from "./SuperheroesIndexContainer"
import React, { Component } from 'react';

class SuperheroShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }

  render () {
    return (
    <h1>{props.name}</h1>
  )
}
}

export default SuperheroShowContainer
