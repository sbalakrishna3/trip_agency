<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Trip,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Trips</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container my-4">
  <h3>Manage Trips</h3>

  <!-- Add Trip Form -->
  <form class="row g-3 mb-4" action="adminTrip" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" value="add">

    <div class="col-sm"><input name="title" placeholder="Title" class="form-control" required></div>
    <div class="col-sm"><input name="destination" placeholder="Destination" class="form-control" required></div>
    <div class="col-sm"><input name="price" type="number" placeholder="Price" class="form-control" required></div>
    <div class="col-sm"><input name="duration" placeholder="Duration" class="form-control" required></div>
    <div class="col-sm"><input name="dates" placeholder="Dates" class="form-control" required></div>
    <div class="col-sm"><input name="activityType" placeholder="Activity" class="form-control" required></div>
    <div class="col-sm-12"><textarea name="description" placeholder="Description" class="form-control" required></textarea></div>
    <div class="col-sm"><input type="file" name="image" class="form-control" accept="image/*" required></div>
    <div class="col-sm"><button class="btn btn-success w-100">Add Trip</button></div>
  </form>

  <!-- Trip Table -->
  <table class="table table-bordered table-hover">
    <thead class="table-light">
      <tr>
        <th>Image</th>
        <th>Title</th>
        <th>Destination</th>
        <th>Price</th>
        <th>Duration</th>
        <th>Dates</th>
        <th>Activity</th>
        <th>Description</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="t" items="${tripList}">
        <tr>
          <td><img src="${pageContext.request.contextPath}/${t.imagePath}" width="100" height="60" style="object-fit:cover;"></td>
          <td>${t.title}</td>
          <td>${t.destination}</td>
          <td>£${t.price}</td>
          <td>${t.duration}</td>
          <td>${t.dates}</td>
          <td>${t.activityType}</td>
          <td>${t.description}</td>
          <td>
            <!-- Delete -->
            <form action="adminTrip" method="post" class="d-inline">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="id" value="${t.id}">
              <button class="btn btn-danger btn-sm mb-1">Delete</button>
            </form>

            <!-- Edit -->
            <button class="btn btn-warning btn-sm mb-1"
              onclick="openEditModal(
                ${t.id},
                '${t.title}', 
                '${t.destination}', 
                '${t.price}', 
                '${t.duration}', 
                '${t.dates}', 
                '${t.activityType}', 
                `${t.description.replace("`", "\\`")}`, 
                '${t.imagePath}'
              )">
              Edit
            </button>

            <!-- View Bookings -->
            <button class="btn btn-info btn-sm"
              onclick="window.open('adminBookingView?tripId=${t.id}', '_blank', 'width=600,height=500')">
              View Bookings
            </button>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<!-- Edit Trip Modal -->
<div class="modal fade" id="editTripModal" tabindex="-1" aria-labelledby="editTripLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="adminTrip" method="post" enctype="multipart/form-data">
        <div class="modal-header">
          <h5 class="modal-title" id="editTripLabel">Edit Trip</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="action" value="edit">
          <input type="hidden" name="id" id="edit-id">

          <div class="row g-3">
            <div class="col-sm"><input name="title" id="edit-title" class="form-control" required></div>
            <div class="col-sm"><input name="destination" id="edit-destination" class="form-control" required></div>
            <div class="col-sm"><input name="price" type="number" id="edit-price" class="form-control" required></div>
            <div class="col-sm"><input name="duration" id="edit-duration" class="form-control" required></div>
            <div class="col-sm"><input name="dates" id="edit-dates" class="form-control" required></div>
            <div class="col-sm"><input name="activityType" id="edit-activity" class="form-control" required></div>
            <div class="col-12"><textarea name="description" id="edit-description" class="form-control" required></textarea></div>
            <div class="col-12">
              <label>Replace Image (optional):</label>
              <input type="file" name="image" class="form-control" accept="image/*">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Update Trip</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Modal Script -->
<script>
function openEditModal(id, title, dest, price, duration, dates, activity, desc, imagePath) {
  document.getElementById('edit-id').value = id;
  document.getElementById('edit-title').value = title;
  document.getElementById('edit-destination').value = dest;
  document.getElementById('edit-price').value = price;
  document.getElementById('edit-duration').value = duration;
  document.getElementById('edit-dates').value = dates;
  document.getElementById('edit-activity').value = activity;
  document.getElementById('edit-description').value = desc;

  const modal = new bootstrap.Modal(document.getElementById('editTripModal'));
  modal.show();
}
</script>

</body>
</html>
