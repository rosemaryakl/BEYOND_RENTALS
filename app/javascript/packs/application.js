// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
// import { changeBookingStatusButton } from '../owner-accept-planet-booking'
import { addToggleButton, cancelButton } from "../toggle_new_booking_form";
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

document.addEventListener('turbolinks:load', () => {
  // changeBookingStatusButton();
  // addToggleButton();
  cancelButton();
  flatpickr(".datepicker", {
    altInput: true
  });
});
