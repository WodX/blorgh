import consumer from "../consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("Connected to room_channel")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const elem = document.getElementById("payload")
    elem.innerHTML += data.message
  }
});
