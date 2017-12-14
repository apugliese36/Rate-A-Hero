import SuperheroTileComponent from '../../src/components/SuperheroTileComponent';

describe('SuperheroTileComponent', () =>{
  let wrapper,
      imageUrl;

  beforeEach(()=>{
    wrapper = mount(
      <SuperheroTileComponent
        name="batman"
        imageUrl='http://fakeurl.com/elephant'
      />
    );
  });

  it('should render an h1 tag with the text property value', () => {
    expect(wrapper.find('h1').text()).toBe('batman');
  });

  it('should render an img tag with the specific props', () => {
    console.log(wrapper.find('img').props())
    expect(wrapper.find('img').props()).toEqual({
      id: 'herophoto',
      src: 'http://fakeurl.com/elephant'
    });
  });

});
