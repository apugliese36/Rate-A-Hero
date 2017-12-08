import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
  }

  componentDidMount () {
  fetch(`http://localhost:3000/api/v1/superheroes/${this.props.id}`)
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
      reviews: body.superhero.reviews
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  render () {

    let reviews = this.state.reviews.map(review => {

      return (
        <div>
          <p>Rating: {review.rating}</p>
          <p>Review: {review.comment}</p>
        </div>
      );
    });

    return(
      <div>
        {reviews}
      </div>
    );
  }

}

export default ReviewsContainer;
