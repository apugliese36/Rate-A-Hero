// describe('example test', () => {
//   it('should pass', () => {
//     expect(true).toBe(true);
//   });
// });
//
// import Elephant from '../../src/components/Elephant';
//
// describe('Elephant', () => {
//   let image,
//       onClick,
//       text,
//       wrapper;
//
//   beforeEach(() => {
//     onClick = jasmine.createSpy('onClick spy');
//     wrapper = mount(
//       <Elephant
//         image="http://fakeurl.com/elephant"
//         onClick={onClick}
//         text="I am an Elephant!"
//       />
//     );
//   });
//
//
//   it('should render an h1 tag', () => {
//     expect(wrapper.find('h1')).toBePresent();
//   });
//
//   it('should render an h1 tag with the text property value', () => {
//     expect(wrapper.find('h1').text()).toBe('I am an Elephant!');
//   });
//
//   it('should render an img tag with the specific props', () => {
//     expect(wrapper.find('img').props()).toEqual({
//       src: 'http://fakeurl.com/elephant',
//       height: '400',
//       width: '600'
//     });
//   });
//
//   it('should invoke the onClick function from props when clicked', () => {
//     wrapper.simulate('click');
//     expect(onClick).toHaveBeenCalled();
//   });
// });
