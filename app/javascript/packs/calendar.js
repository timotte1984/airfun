import flatpickr from "flatpickr";
import "flatpickr/dist/themes/confetti.css" // Note this is important!

flatpickr(".flatpickr-index", {
 mode: "range",
 minDate: "today",
 dateFormat: "Y-m-d"
})

const data = document.getElementById('myData');
let availabilities = JSON.parse(data.dataset.markers)

// const options = {
//   dateFormat: "Y-m-d",
//   disable : [
//         {
//             from: "2018-08-22",
//             to: "2018-08-24"
//         }
//     ],
// }

// flatpickr(document.getElementById('myCalendar'), {options});

flatpickr(".flatpickr", {
 mode: "range",
 minDate: "today",
 dateFormat: "Y-m-d",
 inline: true,
 "disable": availabilities
})


const color_availabilities_in_green = () => {
  document.querySelectorAll(".dayContainer span").forEach ( (el) => {
    if (el.classList.contains("disabled") === false) {
        el.style.color = 'green'
      }
  });
}

document.querySelector(".flatpickr-calendar").addEventListener('click', (el) => {
  color_availabilities_in_green();
  });

color_availabilities_in_green();
