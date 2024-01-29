function extractProperties(originalObject) {
  
    const newProperties = ['name', 'age'];
  
    let newObject = {};
    for (let prop of newProperties) {
      if (originalObject.hasOwnProperty(prop)) {
        newObject[prop] = originalObject[prop];
      }
    }
    return newObject;
  }
  let obj = {
    name: 'John Doe',
    age: 25,
    country: 'India'
  };
  console.log(obj)
  
  let selectedProperties = extractProperties(obj);
  
  console.log(selectedProperties);