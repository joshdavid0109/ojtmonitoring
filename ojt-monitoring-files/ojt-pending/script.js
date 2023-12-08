
// updates the table once the a status button is clicked
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
          // TO-DO: something that would update the table AUTOMATICALLY
        },
        error: function(error) {
          console.error(error);
        }
      });
    } else {
      console.log('Operation canceled by user.');
    }
  });

  // listens to the keys on the search-input and filters the table based on it
  $('#search-input').on('input', function() {
    const searchText = $(this).val().toLowerCase();
    $('.table-data').hide();

    $('.table-data').filter(function() {
      const studentName = $(this).find('td:nth-child(1)').text().toLowerCase();
      const companyName = $(this).find('td:nth-child(2)').text().toLowerCase();
      const companyAddress = $(this).find('td:nth-child(3)').text().toLowerCase();
      
      return studentName.includes(searchText) || companyName.includes(searchText) || companyAddress.includes(searchText);
    }).show();
  });
});

// calls the updateTable once a view option is changed
document.getElementById('dropdown').addEventListener('change', function () {
  const selectedOption = this.value;
  fetch(`/ojt-pending/sort?sortBy=${selectedOption}`)
      .then(response => response.json())
      .then(data => {
          updateTable(data);
      })
      .catch(error => console.error('Error:', error));
});

// updates the pending-students-table 
function updateTable(data) {
  const existingRows = document.querySelectorAll('.table-data');
  data.forEach((student, index) => {
    const studentID = student.studentID;
    const existingRow = existingRows[index];
    if (existingRow) {
      existingRow.querySelector('td:nth-child(1)').textContent = student.studentName || '';
      existingRow.querySelector('td:nth-child(2)').textContent = student.companyname || '';
      existingRow.querySelector('td:nth-child(3)').textContent = student.companyaddress || '';
    }
  });
}


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

// allows the remarks to be editable
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






