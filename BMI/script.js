function calculateBMI() {
    let heightInput = document.getElementById('height');
    let weightInput = document.getElementById('weight');
    let height = parseFloat(heightInput.value);
    let weight = parseFloat(weightInput.value);
  
    if (isNaN(height) || isNaN(weight) || height <= 0 || weight <= 0) {
      alert('Please enter valid numerical values for height and weight.');
      return;
    }

    let bmi = weight / (height * height);
    
    let category;
    if (bmi < 18.5) {
      category = 'Underweight';
    } else if (bmi < 24.9) {
      category = 'Normal weight';
    } else if (bmi < 29.9) {
      category = 'Overweight';
    } else {
      category = 'Obese';
    }
    
    let resultLine = document.getElementById('result');
    resultLine.innerHTML= `BMI: ${bmi.toFixed(2)} (${category})`;
  }
    
  