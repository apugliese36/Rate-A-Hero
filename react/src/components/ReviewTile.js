import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewTileComponent = props =>{
  return(
    <div>
        <Link to={`/superheroes/${props.id}`}><h1 id="superherotile">{props.name}</h1>
        <img id="herophoto" src={`${props.imageUrl}`}/></Link>
    </div>
  );
};

export default ReviewTileComponent;
