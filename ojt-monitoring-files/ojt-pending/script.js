
$(document).ready(function() {
  $('.status-update').on('click', function() {
    var studentId = $(this).closest('.table-data').data('student-id');
    var status = $(this).attr('alt'); 

    var actionText = status === 'ACCEPTED' ? 'accept' : 'reject';
    var confirmation = window.confirm(`Are you sure you want to ${actionText} the student's company?`);

    if (confirmation) {
      $.ajax({
        type: 'POST',
        url: '/update-status',
        data: { studentId: studentId, newStatus: status },
        success: function(response) {
          console.log(response);
        },
        error: function(error) {
          console.error(error);
        }
      });
    } else {
      console.log('Operation canceled by user.');
    }
  });
});

// opens the popup container and populates the student details
function openPopup(studentName) {
    document.getElementById('studentName').innerHTML = studentName;
    document.getElementById('popupContainer').style.display = 'block';
    document.getElementById('overlay').style.display = 'block';
}

// closes the popup container
function closePopup() {
    document.getElementById('popupContainer').style.display = 'none';
    document.getElementById('overlay').style.display = 'none';
}

// adds click event listeners to the first <td> element within each row and calls the openPopup function
var rows = document.querySelectorAll('.table-data');
rows.forEach(function(row) {
    var firstTd = row.querySelector('td:first-child');
    if (firstTd) {
        firstTd.addEventListener('click', function() {
            var studentName = firstTd.textContent;
            openPopup(studentName);
        });
    }
});

document.addEventListener('DOMContentLoaded', function () {
var editableCells = document.querySelectorAll('.editable');

  editableCells.forEach(function (cell) {
      cell.addEventListener('focus', function () {
          cell.dataset.originalContent = cell.textContent;
      });

      cell.addEventListener('blur', function () {
          if (cell.dataset.originalContent !== cell.textContent) {
              console.log('Content changed:', cell.textContent);
          }
      });
  });
});

document.getElementById('dropdown').addEventListener('change', function () {
  const selectedOption = this.value;

  // Send an AJAX request to the server with the selected sorting option
  // Update the table with the sorted data

  // For demonstration purposes, let's assume you have an API endpoint for sorting data
  fetch(`/ojt-pending/sort?sortBy=${selectedOption}`)
      .then(response => response.json())
      .then(data => {
          // Assuming data is an array of sorted students
          updateTable(data);
      })
      .catch(error => console.error('Error:', error));
});

function updateTable(data) {
  const tbody = document.querySelector('.students-table tbody');

  // Iterate over the existing rows and update their content
  document.querySelectorAll('.table-data').forEach((existingRow, index) => {
      const student = data[index];

      // Update the content of each cell
      existingRow.querySelector('td:nth-child(1)').textContent = student.studentName;
      existingRow.querySelector('td:nth-child(2)').textContent = student.companyname;
      existingRow.querySelector('td:nth-child(3)').textContent = student.companyaddress;
  });
}