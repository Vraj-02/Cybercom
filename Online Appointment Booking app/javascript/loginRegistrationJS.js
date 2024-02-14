const LocalStorageModule = (function () {
    function saveToLocalStorage(key, data) {
      localStorage.setItem(key, JSON.stringify(data));
    }
  
    function getFromLocalStorage(key) {
      const data = localStorage.getItem(key);
      return data ? JSON.parse(data) : null;
    }
 
    return {
      saveToLocalStorage,
      getFromLocalStorage,
    };
  })();
  
  // Auth module for user registration and login
  const AuthModule = (function () {
    function registerUser(username, password, role) {
      const users = LocalStorageModule.getFromLocalStorage('users') || [];
  
      if (users.some(user => user.username === username)) {
        alert('Username is already taken. Please choose another one.');
        return;
      }
  
      const user = { username, password, role };
      users.push(user);
      LocalStorageModule.saveToLocalStorage('users', users);
  
      alert('Registration successful! Please login.');
      navigateTo('login.html');
    }
  
    function loginUser(username, password) {
      const users = LocalStorageModule.getFromLocalStorage('users') || [];
      const user = users.find(u => u.username === username && u.password === password);
      return user || null;
    }
  
    return {
      registerUser,
      loginUser,
    };
  })();
  

  function navigateTo(page) {
    window.location.href = page;
  }
  
  document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
  
    if (loginForm) {
      loginForm.addEventListener('submit', function (e) {
        e.preventDefault();
        const username = loginForm.querySelector('#username').value;
        const password = loginForm.querySelector('#password').value;
  
        const user = AuthModule.loginUser(username, password);
  
        if (user) {
          // alert('Login successful!');
          if(user.role === "doctor"){
            sessionStorage.setItem('Authentication',true);
            let users = JSON.parse(localStorage.getItem('currentUser')) || [];
            sessionStorage.setItem("currentUser",user.username.toString());
            navigateTo('doctorDashboard.html');
            // DashboardModule.loadDashboardDoctor(user);
          }
          else{ 
            sessionStorage.setItem('Authentication',true);
            let users = JSON.parse(localStorage.getItem('currentUser')) || [];
            sessionStorage.setItem("currentUser",user.username.toString());
            navigateTo('patientDashboard.html');
          }
        } else {
          // alert('Invalid username or password.');
          let loginError = document.getElementById('loginError');
          loginError.textContent="Invalid Username Or Password";
        }
      });
    }
  
    if (registerForm) {
      registerForm.addEventListener('submit', function (e) {
        e.preventDefault(e);
        const newUsername = registerForm.querySelector('#newUsername').value;
        const newPassword = registerForm.querySelector('#newPassword').value;
        const role = registerForm.querySelector('#role').value;
  
        AuthModule.registerUser(newUsername, newPassword, role);
      });
    }
  });

  // const DashboardModule = (function () {
  //       function loadDashboardDoctor(user) {
  //           console.log(user);
            
  //           let users = JSON.parse(localStorage.getItem('currentUser')) || [];
  //            sessionStorage.setItem("currentUser",user.username.toString())
  //           navigateTo('doctorDashboard.html');
  //           // console.log("hello");
  //           // alert("done");
  //           // let name=document.getElementById('doctorName');
  //           // name.innerHTML='hello';
  //           // // console.log("name",name);

  //           // const doctors= LocalStorageModule.getFromLocalStorage(`doctors`) || [];

  //           // const avilabilityForm= document.getElementById("availability-form");
  //           // availabilityForm.addEventListener('submit',function(e){
  //           //     e.preventDefault();
  //           //     const docName = `${user.username}`;
  //           //     const date = avilabilityForm.querySelector('#availability-date').value;
  //           //     const startTime = avilabilityForm.querySelector('#start-time').value;
  //           //     const endtime = avilabilityForm.querySelector('#end-time').value;

  //           //     const doctor = { docName, date, startTime, endTime };
  //           //     doctors.push(doctor);
  //           //     LocalStorageModule.saveToLocalStorage('doctors',doctors);
  //           // })

  //       }
  //       function loadDashboardPatient(user){
  //           let users = JSON.parse(localStorage.getItem('currentUser')) || [];
  //           sessionStorage.setItem("currentUser",user.username.toString())
  //           navigateTo('patientDashboard.html');

  //       }
    
  //       return {
  //         loadDashboardDoctor,
  //         loadDashboardPatient
  //       };
  //     })();
  