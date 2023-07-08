var csrfToken = document.querySelector('meta[name="csrf-token"]').content;
function updateDatabase(recipeId, isChecked) {
  fetch(`/recipes/${recipeId}/toggle_public`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken
    },
    body: JSON.stringify({ public: isChecked }),
  })
    .then(response => {
      if (response.ok) {
        console.log('Database updated successfully.');
      } else {
        console.log('Failed to update the database.');
      }
    })
    .catch(error => {
      console.error('An error occurred:', error);
    });
}


