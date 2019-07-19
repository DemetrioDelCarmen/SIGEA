// sidebar toggle

let onReady =()=>{

  const btnToggle = document.querySelector('#sidebarCollapse');


  btnToggle.addEventListener('click', function () {

    document.getElementById('sidebar').classList.toggle('active');

    document.getElementById('content').classList.toggle('active');
  });

}


document.addEventListener("DOMContentLoaded",onReady);