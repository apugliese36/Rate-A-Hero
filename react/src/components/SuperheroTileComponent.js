import React from 'react';
import { browserHistory, Link } from 'react-router';

const SuperheroTileComponent = props =>{

  let path

  if(props.role === 'admin') {
    path = `admin/superheroes/${props.id}`;
  } else {
    path = `/superheroes/${props.id}`;
    }

  return(
    <div>
      <Link to={path}><h1>{props.name}</h1>

      <img src={`${props.imageUrl}`} width='100' height='100'/></Link>

    </div>
  );

};

export default SuperheroTileComponent;
