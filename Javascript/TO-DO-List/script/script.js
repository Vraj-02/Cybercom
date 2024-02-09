function addTask() {
    let  taskName = document.getElementById('taskName').value;
    let  category = document.getElementById('category').value;
    let  priority = document.getElementById('priority').value;
    let  dueDate = document.getElementById('dueDate').value;
    let  description = document.getElementById('description').value;
    
    if (!taskName.trim() || !category || !priority || !dueDate || !description) {
        alert("Please fill out all required fields.");
        return;
      }
    else{
    let  task = {
      id: Date.now(),
      name: taskName,
      category: category,
      priority: priority,
      dueDate: dueDate,
      description: description,
      completed: false
    };
    let  tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    tasks.push(task);
    localStorage.setItem('tasks', JSON.stringify(tasks));
    document.getElementById('taskForm').reset();   
    
    window.location.replace('display.html')
}
}

function displayTasks() {

    let  tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    let  taskList = document.getElementById('taskList');
    taskList.innerHTML = '';
    tasks.sort((a, b) => new Date(a.dueDate) - new Date(b.dueDate));
   
    tasks.forEach(function (task, index) {
      console.log(`${task.priority}`);
      let  listItem = document.createElement('li');
      listItem.className = 'list-group-item';
      if (task.completed) {
        listItem.classList.add('completed-task');
      }
      listItem.innerHTML = `
       <details>
       <summary>
       <strong class="${task.completed ? 'completedTask' : ''} ${task.priority=="high" ? 'red' : task.priority=="medium" ? 'orange' : ''}"> ${task.name} </strong>      
       <button type="button" class="btn btn-danger innerButton" onclick="deleteTask(${task.id})">Delete</button>
       <button type="button" class="btn btn-warning innerButton" onclick="editTask(${task.id})">Edit</button>
       <input type="checkbox" ${task.completed ? 'checked' : ''} class="checkbox innerButton" onchange="toggleCompletion(${task.id})">
       
       <p>Due Date: ${task.dueDate}</p>
       </summary> 
        <p>Task no.: ${index + 1}</p>
        <p>Category: ${task.category}</p>
        <p>Priority: ${task.priority}</p>     
        <p>Description: ${task.description}</p>
        </details>
        
       `;
       taskList.appendChild(listItem);
    });     
    
}

function toggleCompletion(taskId) {
  let tasks = JSON.parse(localStorage.getItem('tasks')) || [];
  let task = tasks.find((t) => t.id === taskId);

  if (task) {
    task.completed = !task.completed;
    localStorage.setItem('tasks', JSON.stringify(tasks));
    displayTasks();
  }
}

const editTask = (taskId) =>{
   console.log(taskId);
   let tasks=JSON.parse(localStorage.getItem('tasks')) || [];
   sessionStorage.setItem("idToUpdate",taskId.toString())
   if(tasks && tasks.length > 0){
    const taskDetails = tasks.find((task) => task.id === taskId);
    console.log(taskDetails);
    // document.getElementById("taskNameEdit").value = taskDetails.name;
    // document.getElementById("categoryEdit").value = taskDetails.category;
    // document.getElementById("priorityEdit").value = taskDetails.priority;
    // document.getElementById("dueDateEdit").value = taskDetails.dueDate;
    // document.getElementById("descriptionEdit").value = taskDetails.description;
   }
   window.location.replace("edit.html");
}

function updateTask(){

    let editedTaskName = document.getElementById("taskNameEdit").value;
    let editedCategory = document.getElementById("categoryEdit").value;
    let editedPriority = document.getElementById("priorityEdit").value;
    let editedDueDate = document.getElementById("dueDateEdit").value;
    let editedDescription = document.getElementById("descriptionEdit").value;

    let tasks=JSON.parse(localStorage.getItem('tasks')) || [];
    let sessionId = sessionStorage.getItem('idToUpdate') || [];
    let taskId = sessionId ? parseInt(sessionId) : -1;

    if(tasks && tasks.length>0 && taskId){
        const indexOfTask = tasks.findIndex((task) => task.id === taskId);
        if (indexOfTask >= 0) {
            tasks[indexOfTask] = {
              ...tasks[indexOfTask],
              name: editedTaskName,
              category: editedCategory,
              priority: editedPriority,
              dueDate: editedDueDate,
              description: editedDescription
            };
            localStorage.setItem('tasks', JSON.stringify(tasks));
          }

          displayTasks();       
    }
    
}

function deleteTask(taskId) {
  let confirmIt = confirm("Are you sure you want to delete the task?");
  if (confirmIt) {
    let tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    let indexOfTask = tasks.findIndex((task) => task.id === taskId);
    if (indexOfTask !== -1) {
      tasks.splice(indexOfTask, 1);
      localStorage.setItem('tasks', JSON.stringify(tasks));
      displayTasks();
    }
  }
}

displayTasks();

// function editTask(index) {
  
//     let  tasks = JSON.parse(localStorage.getItem('tasks')) || [];
//     let  editedTaskName = prompt('Edit Task Name:', tasks[index].name);
//     if(editedTaskName!=null){
//         tasks[index].name = editedTaskName;
//     }
//     let  editedCategory = prompt('Edit Category:', tasks[index].category);
//     if(editedTaskName!=null){
//         tasks[index].category = editedCategory;
//     }
//     let  editedPriority = prompt('Edit Priority:', tasks[index].priority);
//     if(editedTaskName!=null){
//         tasks[index].priority = editedPriority;
//     }  
//     let  editedDueDate = prompt('Edit Due Date:', tasks[index].dueDate);
//     if(editedTaskName!=null){
//         tasks[index].dueDate = editedDueDate;
//     }
//     let  editedDescription = prompt('Edit Description:', tasks[index].description);
//     if(editedTaskName!=null){
//         tasks[index].description = editedDescription;
//     }
   
//     tasks[index].category = editedCategory;
//     tasks[index].priority = editedPriority;
//     tasks[index].dueDate = editedDueDate;
//     tasks[index].description = editedDescription;

//     localStorage.setItem('tasks', JSON.stringify(tasks));

//     displayTasks();
// }
// function editTask(index){
   
//     let tasks = JSON.parse(localStorage.getItem('tasks')) || [];
//     sessionStorage.setItem("indexToUpdate", index.toString());
//     console.log(tasks[index].name);
//     // document.getElementById("taskNameEdit").value = tasks[index].name;
//     // alert("here2")
//     // document.getElementById("category_edit").value = tasks[index].category;
//     // document.getElementById("priority_edit").value = tasks[index].priority;
//     // document.getElementById("dueDate_edit").value = tasks[index].priority;
//     // document.getElementById("description_edit").value = tasks[index].description;
    
//     window.location.replace('edit.html');
// }

// function updateTask(){
//     let editedTaskName = document.getElementById("taskName_edit");
//     let editedCategory = document.getElementById("category_edit");
//     let editedPriority = document.getElementById("priority_edit");
//     let editedDueDate = document.getElementById("dueDate_edit");
//     let editedDescription = document.getElementById("description_edit");

//     let tasks = JSON.parse(localStorage.getItem('tasks')) || [];
//     let indexArray = JSON.parse(sessionStorage.getItem('indexToUpdate')) || [];
//     // let index = parseInt(indexArray);
//     let index = indexArray ? parseInt(indexArray) : -1;
//     console.log(index)
   

//     tasks[index].name = editedTaskName;
//     alert("hi");
//     tasks[index].category = editedCategory;
//     tasks[index].priority = editedPriority;
//     tasks[index].dueDate = editedDueDate;
//     tasks[index].description = editedDescription;
    
//     displayTasks();


// }