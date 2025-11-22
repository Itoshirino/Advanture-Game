document.addEventListener("DOMContentLoaded", () => {
  const taskInput = document.querySelector("#taskInput");
  const addBtn = document.querySelector("#addBtn");
  const clearBtn = document.querySelector("#clearBtn");
  const taskList = document.querySelector("#taskList");

  addBtn.textContent = "Add copy";

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
      li.style.display = "none";
      li.innerHTML = "";
    });

    editBtn.addEventListener("click", () => {
      const newVal = prompt("Edit task", span.textContent);
      if (newVal && newVal.trim() !== "") span.textContent = newVal.trim();
    });

    taskInput.value = "";
  });

  clearBtn.addEventListener("click", () => (taskList.innerHTML = ""));
  taskInput.addEventListener(
    "keydown",
    (e) => e.key === "Enter" && addBtn.click()
  );
});
