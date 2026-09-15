document.addEventListener("click", async function (event) {
  const button = event.target.closest("[data-copy-target]");
  if (!button) return;
  const target = document.getElementById(button.dataset.copyTarget);
  if (!target) return;
  const text = target.innerText;
  try {
    await navigator.clipboard.writeText(text);
    const original = button.textContent;
    button.textContent = "Copied";
    window.setTimeout(() => { button.textContent = original; }, 1400);
  } catch (error) {
    button.textContent = "Select manually";
    window.setTimeout(() => { button.textContent = "Copy"; }, 1800);
  }
});
