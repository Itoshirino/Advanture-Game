const TodoInput = document.querySelector("#taskInput");
const AddBtn = document.querySelector("#addBtn");
const ClearBtn = document.querySelector("#clearBtn");
const TaskList = document.querySelector("#taskList");
const elchoose = document.querySelector("#elHard");
const error = document.querySelector(".error");
const editBtn = document.querySelector(".edit__btn");

const length = 30;

AddBtn.addEventListener("click", function (e) {
  e.preventDefault();
  addTask();
});

TodoInput.addEventListener("keypress", (e) => {
  if (e.key === "Enter") {
    e.preventDefault();
    addTask();
  }
});

function addTask() {
  const taskText = TodoInput.value.trim();
  const level = elchoose.value;

  if (taskText === "") {
    elError("Please enter a task");
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
  li.innerHTML = `
    ${taskText} ㅤㅤㅤ ${level} 
    <button class="edit__btn">Edit</button> 
    <button class="delete__btn">Delete</button>
  `;
  li.querySelector(".delete__btn").addEventListener("click", () => {
    li.remove();

  });
  TaskList.appendChild(li);
  TodoInput.value = "";
  hideError();
  saveData();
}

ClearBtn.addEventListener("click", () => {
  TaskList.innerHTML = "";
  TodoInput.value = "";
  elchoose.value = "none";
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
