function showNewBookingForm() {
  const newBookingFormDiv = document.querySelector("#new-booking-form");
  const newBookingBtn = document.querySelector("#show-new-booking-form");
  newBookingFormDiv.toggleAttribute('hidden');
  newBookingBtn.toggleAttribute('hidden');
  console.log("Button clicked");
};

export function addToggleButton() {
  const newBookingFormBtn = document.querySelector(".js-open-button");
  newBookingFormBtn.addEventListener('click', showNewBookingForm);
};

export function cancelButton() {
  const newBookingBtn = document.querySelector("#cancel-button");
  newBookingBtn.addEventListener('click', showNewBookingForm);
};
