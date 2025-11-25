document.addEventListener("DOMContentLoaded", () => {
  const taskInput = document.querySelector("#taskInput");
  const addBtn = document.querySelector("#addBtn");
  const clearBtn = document.querySelector("#clearBtn");
  const taskList = document.querySelector("#taskList");
  const elHard = document.querySelector("#elHard"); 

  addBtn.textContent = "Add";
  addBtn.disabled = true; 

  function validateForm() {
    const textFilled = taskInput.value.trim() !== "";
    const hardSelected = elHard.value !== "none";
    addBtn.disabled = !(textFilled && hardSelected);
  }
  taskInput.addEventListener("input", validateForm);
  elHard.addEventListener("change", validateForm);

  addBtn.addEventListener("click", () => {
    const val = taskInput.value.trim();
    if (!val) return;

    const li = document.createElement("li");
    li.className = "todo__item";

    const span = document.createElement("span");
    span.textContent = val;

    const editBtn = document.createElement("button");
    editBtn.textContent = "Edit";
    editBtn.className = "edit__btn";

    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "Delete";
    deleteBtn.className = "delete__btn";

    li.appendChild(span);
    li.appendChild(editBtn);
    li.appendChild(deleteBtn);
    taskList.appendChild(li);

    deleteBtn.addEventListener("click", () => {
      li.remove();
    });

    editBtn.addEventListener("click", () => {
      const newVal = prompt("Edit task", span.textContent);
      if (newVal && newVal.trim() !== "") span.textContent = newVal.trim();
    });

    taskInput.value = "";
    elHard.value = "none"; 
    validateForm(); 
  });

  clearBtn.addEventListener("click", () => {
    taskList.innerHTML = "";
  });

  taskInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter" && !addBtn.disabled) addBtn.click();
  });
});





const TodoInput = document.querySelector('#taskInput');
const AddBtn = document.querySelector('#addBtn');
const ClearBtn = document.querySelector('#clearBtn');
const TaskList = document.querySelector('#taskList');
const elchoose = document.querySelector('#elHard');


addBtn.addEventListener('click', function() {
  addTask();
});


function addTask() {

  if (TodoInput.value === '') {

    error.innerHTML = 'Please enter a task.';
    return;
   
  }

  else {
    let li = document.createElement('li');
    li.innerHTML = `${TodoInput.value} ${elchoose.value}  <button class = "edit__btn">Edit</button>  <button class="delete__btn">Delete</button>`;
    TaskList.appendChild(li);
    TodoInput.value = '';
    error.innerHTML = '';
  }

  const taskItem = document.createElement('li');
  taskItem.className = 'todo__item';
  taskItem.innerHTML = `
    <span>${TodoInput.value}</span>
    <button class="delete__btn">Delete</button>
  `;
}

 deleteBtn.addEventListener("click", () => {
      li.remove();
    });













    const TodoInput = document.querySelector("#taskInput");
const AddBtn = document.querySelector("#addBtn");
const ClearBtn = document.querySelector("#clearBtn");
const TaskList = document.querySelector("#taskList");
const elchoose = document.querySelector("#elHard");
const error = document.querySelector(".error");

const length = 30;

AddBtn.addEventListener("click", function (e) {
  e.preventDefault();
  addTask();
});

function addTask() {
  const taskText = TodoInput.value.trim();
  const level = elchoose.value;

  if (taskText === "") {
    elError(" Please enter a task ");
    return;
  }

  if (taskText.length > length) {
    elError(`Max length is ${length}`);
    return;
  }

  if (level === "" || level === "none") {
    elError("Select a level.");
    return;
  }

  let li = document.createElement("li");
  li.className = "todo__item";

  const textSpan = document.createElement("span");
  textSpan.className = "task-text";
  textSpan.textContent = taskText;

  const levelSpan = document.createElement("span");
  levelSpan.className = "task-level";
  levelSpan.textContent = ` - ${level}`;

  const editBtn = document.createElement("button");
  editBtn.textContent = "Edit";
  editBtn.className = "edit__btn";

  const deleteBtn = document.createElement("button");
  deleteBtn.textContent = "Delete";
  deleteBtn.className = "delete__btn";

  li.appendChild(textSpan);
  li.appendChild(levelSpan);
  li.appendChild(editBtn);
  li.appendChild(deleteBtn);
  TaskList.appendChild(li);

  TodoInput.value = "";
  elchoose.value = "";
  hideError();
  saveData();

  deleteBtn.addEventListener("click", () => {
    li.remove();
    saveData();
  });

  editBtn.addEventListener("click", () => {
    const input = document.createElement("input");
    input.type = "text";
    input.value = textSpan.textContent;
    li.insertBefore(input, textSpan);
    li.removeChild(textSpan);
    input.focus();
    editBtn.textContent = "Save";

    editBtn.onclick = () => {
      if (input.value.trim() === "") {
        elError("Task cannot be empty.");
        return;
      }
      textSpan.textContent = input.value.trim();
      li.insertBefore(textSpan, input);
      li.removeChild(input);
      editBtn.textContent = "Edit";
      hideError();
      saveData();
    };
  });
}

ClearBtn.addEventListener("click", () => {
  TaskList.innerHTML = "";
  saveData();
});

function elError(e) {
  error.style.color = "red";
  error.style.display = "block";
  error.textContent = e;
}

function hideError() {
  error.style.display = "none";
}

function saveData() {
  localStorage.setItem("data", TaskList.innerHTML);
}

function showData() {
  const data = localStorage.getItem("data");
  if (data) TaskList.innerHTML = data;
}

showData();
