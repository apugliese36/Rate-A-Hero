import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
    this.deleteReview = this.deleteReview.bind(this);
  }

  componentDidMount () {
  fetch(`/api/v1/superheroes/${this.props.id}`)
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

  deleteReview() {
    fetch(`/api/v1/superheroes/${this.props.params.id}/${review.id}`, {
      credentials: 'same-origin',
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' }
    }).then(
      browserHistory.push('/superheroes')
    );
  }

  render () {
    let reviews = this.state.reviews.map(review => {
      return (
        <div>
          <button onClick={this.deleteReview}>Delete Review</button>
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
