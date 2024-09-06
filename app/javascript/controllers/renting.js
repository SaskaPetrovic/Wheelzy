document.addEventListener("DOMContentLoaded", function() {
  const form = document.querySelector('form');
  const startDateInput = document.querySelector('.datepicker[data-target="flatpickr.startInput"]');
  const endDateInput = document.querySelector('.datepicker[data-target="flatpickr.endInput"]');

  form.addEventListener('submit', function(event) {
    if (!startDateInput.value || !endDateInput.value) {
      event.preventDefault();
      alert('Veuillez entrer les dates de début et de fin.');
    }
  });
});
