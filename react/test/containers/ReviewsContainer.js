import ReviewsContainer from '../../src/containers/ReviewsContainer';

describe('ReviewsContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<ReviewsContainer />);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({ reviews: [] });
  });

  it('should render the ReviewsContainer Component with specific props', () => {
    wrapper.setState({ reviews: [{
      id: 1,
      rating: 3,
      comment: 'my mom',
      user_id: 1
      }]
    });
  });
  it('should render a ReviewForm Component', () => {
    expect(wrapper.find('ReviewForm')).toBePresent();
  })
});
