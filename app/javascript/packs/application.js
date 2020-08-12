require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
// import { changeBookingStatusButton } from '../owner-accept-planet-booking'
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import "flatpickr/dist/themes/dark.css";
import "../drawer";

document.addEventListener('turbolinks:load', () => {
  // changeBookingStatusButton();
  // addToggleButton();
  // cancelButton();


  flatpickr(".datepicker", {
    altInput: true
  });
});
