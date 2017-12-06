import React from 'react';
import { browserHistory, Link } from 'react-router';

const SuperheroTileComponent = props =>{

  return(
    <div>
      <Link to={`/superheroes/${props.id}`}><h1>{props.name}</h1></Link>

      <img src={`${props.imageUrl}`} width='100' height='100'/>

    </div>
  );

};

export default SuperheroTileComponent;
