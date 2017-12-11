import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

class ReviewForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      rating: '',
      comment: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.onCommentChange = this.onCommentChange.bind(this);
    this.onRatingChange = this.onRatingChange.bind(this);
  }

  onRatingChange(event) {
    this.setState({rating: event.target.value});
  }

  onCommentChange(event) {
    this.setState({comment: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    let formPayload = {
      rating: this.state.rating,
      comment: this.state.comment,
      superhero_id: this.props.id,
      user_id: this.props.user_id
    };
    this.newReview(formPayload)
  }

  newReview(formPayload) {
    fetch('/api/v1/reviews', {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(formPayload),
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
      this.props.newRating(formPayload);
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }


  render () {
    return(
      <form className="new-article-form callout" onSubmit={this.handleSubmit}>
        <label>
          Rating:
          <select value={this.state.rating} onChange={this.onRatingChange}>
              <option >-</option>
              <option value='1'>&#9733;</option>
              <option value='2'>&#9733;&#9733;</option>
              <option value='3'>&#9733;&#9733;&#9733;</option>
              <option value='4'>&#9733;&#9733;&#9733;&#9733;</option>
              <option value='5'>&#9733;&#9733;&#9733;&#9733;&#9733;</option>
            </select>
          </label>
          <label>
            Comment:
            <input
              type='text'
              value={this.state.comment}
              onChange={this.onCommentChange}
            />
        </label>
        <input className="button" type="submit" value="Submit" />
      </form>
    );
  }
}
export default ReviewForm;
