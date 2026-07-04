(function () {
  var key = "dfinke-theme";
  var button = null;

  function currentTheme() {
    return document.documentElement.getAttribute("data-theme") || "light";
  }

  function setTheme(theme, persist) {
    document.documentElement.setAttribute("data-theme", theme);

    if (persist) {
      try {
        localStorage.setItem(key, theme);
      } catch (error) {}
    }

    updateButton(theme);
  }

  function updateButton(theme) {
    if (!button) {
      return;
    }

    var isDark = theme === "dark";
    var text = button.querySelector(".theme-toggle__text");
    button.setAttribute("aria-pressed", String(isDark));
    button.setAttribute("aria-label", isDark ? "Switch to light mode" : "Switch to dark mode");

    if (text) {
      text.textContent = isDark ? "Dark" : "Light";
    }
  }

  document.addEventListener("DOMContentLoaded", function () {
    button = document.querySelector(".theme-toggle");
    updateButton(currentTheme());

    if (!button) {
      return;
    }

    button.addEventListener("click", function () {
      setTheme(currentTheme() === "dark" ? "light" : "dark", true);
    });
  });
})();
