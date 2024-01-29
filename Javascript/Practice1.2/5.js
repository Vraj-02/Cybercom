function combineObjects(obj1, obj2) {

    let combinedObject = {};
  
    for (let prop in obj1) {
      if (obj1.hasOwnProperty(prop)) {
        combinedObject[prop] = obj1[prop];
      }
    }

    for (let prop in obj2) {
      if (obj2.hasOwnProperty(prop)) {
        combinedObject[prop] = obj2[prop];
      }
    }

    return combinedObject;
  }
 
let person = {
    name: 'Vraj',
    age: 25
  };
 
let extraInfo = {
    country: 'India'
  };

let combinedPerson = combineObjects(person, extraInfo);
 
console.log(combinedPerson);