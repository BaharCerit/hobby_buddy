import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="distance-slider"
export default class extends Controller {
  connect() {
    this.updateSelectedDistance()
  }


  updateSelectedDistance() {
    const selectedDistance = this.rangeInputTarget.value
    this.selectedDistanceTarget.textContent = `${selectedDistance} km`
  }
}
