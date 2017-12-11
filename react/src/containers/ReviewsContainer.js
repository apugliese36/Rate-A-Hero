import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReviewForm from '../components/ReviewForm'

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: [],
      user_id: this.props.user_id
    };
    this.newRating = this.newRating.bind(this)
  }

  newRating(formPayload) {
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

  render () {
    let reviews = this.state.reviews.map(review => {
      // let profilePic = User.find(review.user_id).profile_photo
      return (
        <div>
          <img />
          <p>Rating: {review.rating}</p>
          <p>Review: {review.comment}</p>
        </div>
      );
    });

    return(
      <div>
        {reviews}
        <ReviewForm
          newRating = {this.newRating}
          id = {this.props.id}
          user_id = {this.props.user_id}
        />
      </div>
    );
  }

}

export default ReviewsContainer;
