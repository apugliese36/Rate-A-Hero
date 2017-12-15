import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReviewForm from '../components/ReviewForm';
import ReviewTileComponent from "../components/ReviewTileComponent";

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
    this.newReview = this.newReview.bind(this);
    this.deleteReview = this.deleteReview.bind(this);
    this.vote = this.vote.bind(this);
    this.upVote = this.upVote.bind(this);
    this.downVote = this.downVote.bind(this);
  }

  deleteReview(id) {
    event.preventDefault();
    fetch(`/api/v1/reviews/${id}`, {
      credentials: 'same-origin',
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' }
    }).then(response => {
      if (response.ok) {
        alert("Comment Deleted"),
        browserHistory.push('/superheroes')
      } else {
        alert("You may not delete this comment")
      }
    })
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

  upVote(reviewId) {
    let newVote = {
      value: 1,
      review_id: reviewId,
      user_id: this.props.currentUser.id
    }
    this.vote(newVote)
  }

  downVote(reviewId) {
    let newVote = {
      value: -1,
      review_id: reviewId,
      user_id: this.props.currentUser.id
    }
    this.vote(newVote)
  }

  vote(payload){
   fetch(`/api/v1/votes`, {
     credentials: 'same-origin',
     method: "POST",
     body: JSON.stringify(payload),
     headers: {'Content-Type': 'application/json'}
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
       reviews: body.reviews
     });
   })
   .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render () {
    let reviews = this.state.reviews.map(review => {
      let upVote = () => { this.upVote(review.id) }
      let downVote = () => { this.downVote(review.id) }
      return (
        <ReviewTileComponent
          deleteReview = {this.deleteReview}
          key = {review.id}
          id = {review.id}
          rating = {review.rating}
          comment = {review.comment}
          username = {review.creator_username}
          likes = {review.likes}
          dislikes = {review.dislikes}
          upVote = {upVote}
          downVote = {downVote}
        />
      );
    });

    return(
      <div>
        <div className="text-center">
          {reviews}
        </div>
        <h3 id="showtitle">Add a Review:</h3>
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
