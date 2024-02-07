function addTask() {
    var taskName = document.getElementById('taskName').value;
    var category = document.getElementById('category').value;
    var priority = document.getElementById('priority').value;
    var dueDate = document.getElementById('dueDate').value;
    var description = document.getElementById('description').value;
    
    if (!taskName || !category || !priority || !dueDate || !description) {
        alert("Please fill out all required fields.");
        return;
      }
    else{
    var task = {
      id: Date.now(),
      name: taskName,
      category: category,
      priority: priority,
      dueDate: dueDate,
      description: description
    };
    var tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    tasks.push(task);
    localStorage.setItem('tasks', JSON.stringify(tasks));
    document.getElementById('taskForm').reset();   
    window.location.replace('display.html')
}
}

function displayTasks() {

    var tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    var taskList = document.getElementById('taskList');
    taskList.innerHTML = '';

    tasks.forEach(function (task, index) {
      var listItem = document.createElement('li');
      listItem.className = 'list-group-item';
      listItem.innerHTML = `
        <strong>${task.name}</strong>
        <p>Task no.: ${index + 1}</p>
        <p>Category: ${task.category}</p>
        <p>Priority: ${task.priority}</p>
        <p>Due Date: ${task.dueDate}</p>
        <p>Description: ${task.description}</p>
        <button type="button" class="btn btn-warning" onclick="editTask(${index})">Edit</button>
        <button type="button" class="btn btn-danger" onclick="deleteTask(${index})">Delete</button>
       `;
      taskList.appendChild(listItem);
    });
}

function editTask(index) {
  
    var tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    var editedTaskName = prompt('Edit Task Name:', tasks[index].name);
    if(editedTaskName!=null){
        tasks[index].name = editedTaskName;
    }
    var editedCategory = prompt('Edit Category:', tasks[index].category);
    if(editedTaskName!=null){
        tasks[index].category = editedCategory;
    }
    var editedPriority = prompt('Edit Priority:', tasks[index].priority);
    if(editedTaskName!=null){
        tasks[index].priority = editedPriority;
    }  
    var editedDueDate = prompt('Edit Due Date:', tasks[index].dueDate);
    if(editedTaskName!=null){
        tasks[index].dueDate = editedDueDate;
    }
    var editedDescription = prompt('Edit Description:', tasks[index].description);
    if(editedTaskName!=null){
        tasks[index].description = editedDescription;
    }
   
    tasks[index].category = editedCategory;
    tasks[index].priority = editedPriority;
    tasks[index].dueDate = editedDueDate;
    tasks[index].description = editedDescription;

    localStorage.setItem('tasks', JSON.stringify(tasks));

    displayTasks();
}
 
function deleteTask(index) {
  
    var confirmIt=confirm("are You sure you want to delete task")
    if(confirmIt){
    var tasks = JSON.parse(localStorage.getItem('tasks')) || []; 
    tasks.splice(index, 1); 
    localStorage.setItem('tasks', JSON.stringify(tasks)); 
    displayTasks();
    }
}
  
displayTasks();
 