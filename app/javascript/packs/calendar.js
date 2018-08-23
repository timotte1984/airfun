import flatpickr from "flatpickr";
import "flatpickr/dist/themes/confetti.css" // Note this is important!

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

document.querySelectorAll(".dayContainer span").forEach ( (el) => {
  // el.classList.add("text-green");
  if (el.classList.contains("disabled") === false) {
    el.style.color = 'green'
  }
});
