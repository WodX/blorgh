import consumer from "./consumer"

consumer.subscriptions.create("BlorghChannel", {
  connected() {
    console.log("Connected to blorgh channel")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
  }
});

