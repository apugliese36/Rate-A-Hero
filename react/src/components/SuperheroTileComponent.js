import React from 'react';
import { browserHistory, Link } from 'react-router';

const SuperheroTileComponent = props =>{

  return(
    <div>
      <Link to={`/superheroes/${props.id}`}><h1>{props.name}</h1></Link>

      <img src={props.imageUrl}/>
      <SuperheroShowContainer
        key={props.superhero.id}
        id={props.superhero.id}
        name={props.superhero.name}
        imageUrl={props.superhero.image_url}
        backstory={props.superhero.backstory}
        superpower={props.superhero.superpower}
      />
    </div>
  );

};

export default SuperheroTileComponent;
