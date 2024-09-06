import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["startInput", "endInput"];

  connect() {
    console.log("Connected to datepicker controller");
    flatpickr(this.startInputTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      minDate: "today",
      enableTime: false,
      inline: false,
      onChange: this.handleDateChange.bind(this),
      onReady: this.setInitialDates.bind(this),
    });
  }
  handleDateChange(selectedDates) {
    if (selectedDates.length === 2) {
      this.startInputTarget.value = selectedDates[0].toISOString().split('T')[0];
      this.endInputTarget.value = selectedDates[1].toISOString().split('T')[0] ;
    }
  }
  setInitialDates(selectedDates) {
    if (selectedDates.length === 2) {
      this.startInputTarget.value = selectedDates[0].toISOString().split('T')[0];
      this.endInputTarget.value = selectedDates[1].toISOString().split('T')[0];
    }
  }
}
