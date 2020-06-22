document.addEventListener("click", (e) => {
  window.open(`/invoices/${e.target.id}`, "_self");
});
