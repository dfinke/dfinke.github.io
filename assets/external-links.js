(function () {
  function isExternalWebLink(link) {
    var href = link.getAttribute("href");

    if (!href) {
      return false;
    }

    try {
      var url = new URL(href, window.location.href);
      var isWebLink = url.protocol === "http:" || url.protocol === "https:";
      return isWebLink && url.hostname !== window.location.hostname;
    } catch (error) {
      return false;
    }
  }

  document.addEventListener("DOMContentLoaded", function () {
    var links = document.querySelectorAll("a[href]");

    links.forEach(function (link) {
      if (!isExternalWebLink(link)) {
        return;
      }

      link.setAttribute("target", "_blank");
      link.setAttribute("rel", "noopener noreferrer");
    });
  });
})();
