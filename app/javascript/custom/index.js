document.addEventListener("click", (e) => {
  if (e.target.getAttribute("class") === "clickable-invoice") {
    window.open(e.target.getAttribute("data-href"), "_self");
  }

  if (e.target.id === "new-invoice") {
    window.open(e.target.getAttribute("data-href"), "_self");
  }

  if (e.target.id === "edit-customer") {
    window.open(e.target.getAttribute("data-href"), "_self");
  }
});
