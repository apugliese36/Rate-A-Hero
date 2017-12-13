import React from 'react';
import { browserHistory, Link } from 'react-router';

const SuperheroTileComponent = props =>{
  return(
    <div className="rows">
      <div id="post-module" className="small-12 medium-4 columns">
        <Link to={`/superheroes/${props.id}`}><h1 id="superherotile">{props.name}</h1>
        <img id="herophoto" src={`${props.imageUrl}`}/></Link>
      </div>
    </div>
  );
};

export default SuperheroTileComponent;
