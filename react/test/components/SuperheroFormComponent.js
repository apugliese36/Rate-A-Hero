import SuperheroFormComponent from '../../src/components/SuperheroFormComponent';

describe('SuperheroFormComponent', () =>{
  let wrapper;

  beforeEach(()=>{
    wrapper = mount(
      <SuperheroFormComponent />
    );
  });

  it('should render a label tags with the appropriate attributes', () => {
    expect(wrapper.find('label').at(0).text()).toBe('Name');
    expect(wrapper.find('label').at(1).text()).toBe('Backstory');
    expect(wrapper.find('label').at(2).text()).toBe('Superpower');
    expect(wrapper.find('label').at(3).text()).toBe('Image Url');
  });

  it('should render inputs with the appropriate attributes', () => {
    expect(wrapper.find('input').at(0)).toBePresent();
    expect(wrapper.find('input').at(0).props()).toEqual({
      name: 'name',
      type: 'text',
      value: '',
      onChange: jasmine.any(Function)
    });

    expect(wrapper.find('input').at(1)).toBePresent();
    expect(wrapper.find('input').at(1).props()).toEqual({
      name: 'superpower',
      type: 'text',
      value: '',
      onChange: jasmine.any(Function)
    });

    expect(wrapper.find('input').at(2)).toBePresent();
    expect(wrapper.find('input').at(2).props()).toEqual({
      name: 'imageUrl',
      type: 'text',
      value: '',
      onChange: jasmine.any(Function)
    });
  });

  it('should render textarea with the appropriate attributes',() => {
    expect(wrapper.find('textarea')).toBePresent();
    expect(wrapper.find('textarea').props()).toEqual({
      name: 'backstory',
      type: 'text',
      value: '',
      onChange: jasmine.any(Function)
    });
  });

  it('should have an input submit button', () => {
    expect(wrapper.find('input').at(3)).toBePresent();
    expect(wrapper.find('input').at(3).props()).toEqual({
      className: 'button',
      type: 'submit',
      value: 'Submit'
    });
  });
});
