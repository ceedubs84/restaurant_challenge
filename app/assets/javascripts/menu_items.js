function getData() {
  var divMenuItems = document.getElementById("menuItems");
  divMenuItems.innerHTML = "Loading...";

  $.get('/menu_items', function(menuItems) {
    console.log(menuItems);
    // var htmlString = '';
    // for (var i = 0; i < menuItems.length; i++) {
    //   var employee = menuItems[i];
    //   htmlString += '<div onclick="changeEmployee(this)">';
    //   htmlString += '<h2>' + employee["name"] + '</h2>';
    //   htmlString += '<p>Department: ' + employee["department"] + '</p>';
    //   htmlString += '</div>';
    // }
    // divEmployees.innerHTML = htmlString;
  });
}

// function showMenuItems() {
//   var menuItems = document.querySelectorAll('div#menuItems > div');
//   for (var i = 0; i < menuItems.length; i++) {
//     var menuItem = menuItems[i];
//     menuItem.style["display"] = '';
//   }
// }

function setCategorySort() {
  var menuItems = document.querySelectorAll('div#menuItems > div');
  var categoryList = document.getElementById('categorySelect');
  var selCategory = categoryList.options[categoryList.selectedIndex].value;
  // console.log(menuItems[categories])
  for (var i = 0; i < menuItems.length; i++) {
      var menuItem = menuItems[i];
      if (menuItem.categories.valueOf("selCategory") !== -1) {
        menuItem.style["display"] = "";
      } else {
        menuItem.style["display"] = "none";
      }
    }
}

function sortByPrice() {
  var menuItems = document.querySelectorAll('div#priceSelect > div');
  var ascending = menuItems.sort((a, b) => Number(a.price) - Number(b.price));
  var descending = menuItems.sort((a, b) => Number(b.price) - Number(a.price));
  console.log("ascending", ascending);
  console.log("descending", descending);
}