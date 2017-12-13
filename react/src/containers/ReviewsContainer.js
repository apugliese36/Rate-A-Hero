import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReviewForm from '../components/ReviewForm'

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
    this.newReview = this.newReview.bind(this);
    this.deleteReview = this.deleteReview.bind(this);
  }

  newReview(formPayload) {
    this.setState({
      reviews: this.state.reviews.concat(formPayload)
    })
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
          <p>Rating: {review.rating}<br/>
          Comment: {review.comment}<br/>
          Review created by: {review.creator_username}</p>
          <button onClick={this.deleteReview}>Delete Review</button>
        </div>
      );
    });

    return(
      <div>
        {reviews}
        <ReviewForm
          newReview = {this.newReview}
          superheroId = {this.props.id}
          currentUser = {this.props.currentUser}
        />
      </div>
    );
  }

}

export default ReviewsContainer;
