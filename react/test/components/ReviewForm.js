import ReviewForm from '../../src/components/ReviewForm'

describe('ReviewForm', () =>{
  let wrapper;

  beforeEach(()=>{
    wrapper = mount(
      <ReviewForm />
    );
  });

  it('should render a label tags with the appropriate attributes', () => {
    expect(wrapper.find('label').at(0).text()).toBe('Rating:-★★★★★★★★★★★★★★★');
    expect(wrapper.find('label').at(1).text()).toBe('Comment:');
  });

  it('should render inputs with the appropriate attributes', () => {
    expect(wrapper.find('input').at(0)).toBePresent();
    expect(wrapper.find('input').at(0).props()).toEqual({
      type: 'text',
      value: '',
      onChange: jasmine.any(Function)
    });
  })

  it('should render select with the appropriate attributes', () => {
    expect(wrapper.find('select').at(0)).toBePresent();
    expect(wrapper.find('option').at(0)).toBePresent();
    expect(wrapper.find('option').at(0).text()).toBe('-')

    expect(wrapper.find('option').at(1)).toBePresent();
    expect(wrapper.find('option').at(1).text()).toBe('★')

    expect(wrapper.find('option').at(2)).toBePresent();
    expect(wrapper.find('option').at(2).text()).toBe('★★')

    expect(wrapper.find('option').at(3)).toBePresent();
    expect(wrapper.find('option').at(3).text()).toBe('★★★')

    expect(wrapper.find('option').at(4)).toBePresent();
    expect(wrapper.find('option').at(4).text()).toBe('★★★★')

    expect(wrapper.find('option').at(5)).toBePresent();
    expect(wrapper.find('option').at(5).text()).toBe('★★★★★')
  })

  it('should have an input submit button', () => {
    expect(wrapper.find('input').at(1)).toBePresent();
    expect(wrapper.find('input').at(1).props()).toEqual({
      className: 'button',
      type: 'submit',
      value: 'Submit'
    });
  });
});
