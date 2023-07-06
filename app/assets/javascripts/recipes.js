
console.log("Recipe.js loaded.");

document.addEventListener("DOMContentLoaded", function() {
  const toggleButton = document.querySelector(".toggle");
  // Add a listener to the toggle button
  toggleButton.addEventListener("click", function() {
    const recipeId = this.getAttribute("data-recipe-id");
    const isPublic = !this.classList.contains("checked");

    // Send an AJAX request to update the recipe's public attribute
    fetch(`/recipes/${recipeId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        // "X-CSRF-Token": Rails.csrfToken(),
      },
      body: JSON.stringify({ recipe: { public: isPublic } }),
    })
      .then(response => response.json())
      .then(data => {
        // Update the button's checked state based on the response
        if (data.public) {
          this.classList.add("checked");
        } else {
          this.classList.remove("checked");
        }
      })
      .catch(error => console.log(error));
  });
});
