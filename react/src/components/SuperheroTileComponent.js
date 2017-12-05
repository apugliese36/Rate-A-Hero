import React from 'react';
import { browserHistory, Link } from 'react-router';

const SuperheroTileComponent = props =>{

  return(
    <div>
      <Link to={`/superheroes/${props.id}`}><h1>{props.name}</h1></Link>

      <img src={props.imageUrl}/>
    </div>
  );

};

export default SuperheroTileComponent;
