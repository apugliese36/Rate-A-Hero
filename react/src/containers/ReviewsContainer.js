import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReviewForm from '../components/ReviewForm'

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
<<<<<<< HEAD
    this.newReview = this.newReview.bind(this);
  }

  newReview(formPayload) {
    this.setState({
      reviews: this.state.reviews.concat(formPayload)
    })
=======
    this.deleteReview = this.deleteReview.bind(this);
>>>>>>> 1d9b9f84a42fb58131028f8fe285bb792eae2d85
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
<<<<<<< HEAD
          <p>Rating: {review.rating}<br/>
          Comment: {review.comment}<br/>
          Review created by: {review.creator_username}</p>
=======
          <button onClick={this.deleteReview}>Delete Review</button>
          <p>Rating: {review.rating}</p>
          <p>Review: {review.comment}</p>
>>>>>>> 1d9b9f84a42fb58131028f8fe285bb792eae2d85
        </div>
      );
    });

    return(
      <div id="info">
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
