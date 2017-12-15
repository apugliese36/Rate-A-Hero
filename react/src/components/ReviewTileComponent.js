import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewTileComponent = props => {
  let deleteReview = () => {
    props.deleteReview(props.id)
  }

  return(
    <div className="text-center">
      <div id="info">
        <p>
          Rating: {props.rating}<br/>
          Comment: {props.comment}<br/>
          Review created by: {props.username}<br/>
          {`Likes: ${props.likes}   Dislikes: ${props.dislikes}`}
        </p>
        <button id="add" onClick={deleteReview}>Delete Review</button>
        <button id="add" onClick={props.upVote}>Like</button>
        <button id="add" onClick={props.downVote}>Dislike</button>
        <hr/>
      </div>
    </div>
  );
};

export default ReviewTileComponent;
