import React, { Component } from 'react';
import SuperheroTileComponent from "../components/SuperheroTileComponent";
import { Route, IndexRoute, Router, browserHistory, Link, Redirect } from 'react-router';


class SuperheroesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      superheroes: [],
      currentPage: 1,
      heroesPerPage: 6
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    this.setState({
      currentPage: Number(event.target.id)
    });
  }

  componentDidMount () {
  fetch('/api/v1/superheroes')
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
      superheroes: body.superheroes
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  render () {
    let indexOfLastHero = this.state.currentPage * this.state.heroesPerPage
    let indexOfFirstHero = indexOfLastHero - this.state.heroesPerPage
    let currentHeroes = this.state.superheroes.slice(indexOfFirstHero, indexOfLastHero)

    let superheroes = currentHeroes.map(superhero => {
      return (
        <SuperheroTileComponent
          key={superhero.id}
          id={superhero.id}
          name={superhero.name}
          imageUrl={superhero.image_url}
        />
      );
    });

    let pageNumbers = [];
    for (let i = 1; i <= Math.ceil(this.state.superheroes.length / this.state.heroesPerPage); i++) {
      if (this.state.currentPage === i) {
        pageNumbers.push(`[${i}]`);
      } else {
        pageNumbers.push(i);
      }
    }

    let renderPageNumbers = pageNumbers.map(number => {
      return(
        <button className="add"
          key={number}
          id={number}
          onClick={this.handleClick}
        >
          {number}
        </button>
      );
    });

    return (
      <div>
        <h1 id="title">The Heroes</h1>
        <Link id="add" to={`/superheroes/new`}>Add a Superhero</Link>
          {superheroes}
          <hr/>
          <div className="text-center">
            <footer>{renderPageNumbers}</footer>
          </div>
      </div>
    );
  }
}

export default SuperheroesIndexContainer;
