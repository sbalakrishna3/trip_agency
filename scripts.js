function showTripModal(tripId) {
  const el = document.getElementById("tripModal-" + tripId);
  if (el) new bootstrap.Modal(el).show();
}

function closeModal(tripId) {
  const el = document.getElementById("tripModal-" + tripId);
  const modal = bootstrap.Modal.getInstance(el);
  if (modal) modal.hide();
}
