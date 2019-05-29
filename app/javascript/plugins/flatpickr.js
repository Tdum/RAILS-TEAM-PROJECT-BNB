import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

flatpickr(".datepicker", {
  disable: gon.dates,
  dateFormat: "Y-m-d"
})


