import React from 'react';
import { browserHistory, Link } from 'react-router';

const SuperheroTileComponent = props =>{
  return(
    <div>
      <Link to={`/superheroes/${props.id}`}><h1>{props.name}</h1>
      <img src={`${props.imageUrl}`} width='100' height='100'/></Link>
    </div>
  );
};

export default SuperheroTileComponent;
