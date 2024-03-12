import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="distance-slider"
export default class extends Controller {
  static targets = ["distance"]
  connect() {

    console.log('hello')

  }

  display(event) {
    this.distanceTarget.value = `${event.target.value} km `;
    // this.updateSelectedDistance(event.target.value);
    // this.sendDistanceToServer(event.target.value);
  }

//   updateSelectedDistance(value) {
//     this.distanceTarget.innerHTML = value;
//     console.log(value)
//   }

//   sendDistanceToServer(distance) {
//     fetch(`/find-buddies?distance=${distance}`, { method: 'GET' })
//       .then(response => response.text())

//       .then(html => {
//         // Assuming you have a target to update with the new content
//         const targetElement = document.querySelector('[data-distance-slider-target="result"]');
//         console.log(typeof html)

//         targetElement.innerHTML = html;
//       })
//       .catch(error => console.error('Error:', error));
//   }
 }
