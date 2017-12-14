import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewTileComponent = props => {

  let deleteReview = () => {
    props.deleteReview(props.id)
}
  return(
    <div id="info">
      <p>
      Rating: {props.rating}<br/>
      Comment: {props.comment}<br/>
      Review created by: {props.creator_username}</p>
      <button id="add" onClick={deleteReview}>Delete Review</button>
    </div>
  );
};

export default ReviewTileComponent;
