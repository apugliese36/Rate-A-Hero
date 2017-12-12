import React from 'react';
import { browserHistory, Link } from 'react-router';

const SuperheroTileComponent = props =>{

  let path;

  if(props.role === 'admin') {
    path = `admin/superheroes/${props.id}`;
  } else {
    path = `/superheroes/${props.id}`;
    }

  return(
    <div className="rows">
      <div id="post-module" className="small-12 medium-4 columns">
        <Link to={path}><h1 id="superherotile">{props.name}</h1></Link><br/>
        <img id="herophoto" src={`${props.imageUrl}`}/>
      </div>
    </div>
  );
};

export default SuperheroTileComponent;
