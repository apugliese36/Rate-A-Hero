import SuperheroesIndexContainer from '../../src/containers/SuperheroesIndexContainer';
import SuperheroTileComponent from '../../src/components/SuperheroTileComponent'

describe('SuperheroesIndexContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<SuperheroesIndexContainer />);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({ superheroes: [] });
  });

  it('should render an Superhero Tile Component', () => {
    wrapper.setState({ superheroes: [{
      id: 1,
      name: 'my mom',
      image_url: 'https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg'
    }]})
    expect(wrapper.find(SuperheroTileComponent)).toBePresent();
  });

  it('should render the SuperheroTileComponent Component with specific props', () => {
    wrapper.setState({ superheroes: [{
      id: 1,
      name: 'my mom',
      image_url: 'https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg'
    }]})
    expect(wrapper.find(SuperheroTileComponent).props()).toEqual({
      id: 1,
      name:'my mom',
      imageUrl: 'https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg'
    });
  });
});
