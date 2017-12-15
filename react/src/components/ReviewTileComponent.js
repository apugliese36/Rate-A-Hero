import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewTileComponent = props => {
  let deleteReview = () => {
    props.deleteReview(props.id)
  }

  let deleteButton;
  if (props.currentUser.id === props.userId || props.currentUser.role === "admin") {
    deleteButton = <button id="add" onClick={deleteReview}>Delete Review</button>
  } else {
    deleteButton = null
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
        {deleteButton}
        <button id="add" onClick={props.upVote}>Like</button>
        <button id="add" onClick={props.downVote}>Dislike</button>
        <hr/>
      </div>
    </div>
  );
};

export default ReviewTileComponent;
