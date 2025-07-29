<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="tripModal${t.id}" tabindex="-1" aria-labelledby="tripModalLabel${t.id}" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" action="bookTrip">
        <div class="modal-header">
          <h5 class="modal-title" id="tripModalLabel${t.id}">${t.title}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p><strong>Destination:</strong> ${t.destination}</p>
          <p><strong>Price:</strong> £${t.price}</p>
          <p><strong>Duration:</strong> ${t.duration}</p>
          <p><strong>Activity:</strong> ${t.activityType}</p>
          <p><strong>Dates:</strong> ${t.dates}</p>

          <input type="hidden" name="tripId" value="${t.id}">
          <div class="mb-3">
            <label for="participants${t.id}" class="form-label">Participants</label>
            <input type="number" class="form-control" id="participants${t.id}" name="participants" min="1" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Book Now</button>
        </div>
      </form>
    </div>
  </div>
</div>
