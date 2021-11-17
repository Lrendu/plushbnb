import flatpickr from "flatpickr"

const initFlatpickr = () => {
  const rentalForm = document.getElementById('new_rental');
  const rentalDates = document.getElementById('rental_dates');
  if (rentalForm) {
    const rentals = JSON.parse(rentalDates.dataset.rentals);
    console.log(rentals)
    flatpickr("#date", {
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
      "disable": rentals,
    })
  }
};

export { initFlatpickr };
