import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

if (document.getElementById('reviews')) {

flatpickr(".datepicker", {
  disable: gon.dates,
  dateFormat: "Y-m-d"
})
}


