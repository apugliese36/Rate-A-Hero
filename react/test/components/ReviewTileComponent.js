import ReviewTileComponent from '../../src/components/ReviewTileComponent';

describe('ReviewTileComponent', () =>{
  let wrapper,
      imageUrl;

  beforeEach(()=>{
    wrapper = mount(
      <ReviewTileComponent
        rating = '1'
        comment = 'comment'
        username = 'username'
      />
    );
  });

  // it('should have a comment, rating, and username', () => {
  //   expect(wrapper.find('p').text()).toBe('Rating: 1Comment: commentReview created by: username');
  // });
  });
