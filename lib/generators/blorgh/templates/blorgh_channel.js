import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer();

const url = `${window.location.origin}/blorgh/redis_data`;
const blorghDiv = document.getElementById("blorgh")

const Icons = {
  error: 'bi bi-exclamation-circle-fill',
  warn: 'bi bi-exclamation-triangle-fill',
  info: 'bi bi-info-circle-fill',
  exception: 'bi bi-x-circle-fill'
}

const htmlData = (data) => {
  const date = new Date(parseInt(data.time));
  return `
    <tr onclick="copyElement(this)" onmouseleave="resetState(this)" class="element bg-${data.type}">
      <td>
        <div class="tooltip ${data.type}">
          <i class="${Icons[data.type]}"></i>
          <span class="tooltiptext">${data.type.charAt(0).toUpperCase() + data.type.slice(1)}</span>
        </div>
      </td>
      <td class="text-${data.type}">${date.toLocaleTimeString('sv')}</td>
      <td class="message">${data.message} <i class="bi bi-clipboard hide"></i></td>
    </tr>
  `
}

consumer.subscriptions.create("BlorghChannel", {
  async connected() {
    const data = await (await fetch(url)).json()

    data.forEach(elem => {
      blorghDiv.insertAdjacentHTML("beforeend", htmlData(elem))
    });
  },
  disconnected() {},
  received(receivedData) {
    const [data] = receivedData;
    blorghDiv.insertAdjacentHTML("afterbegin", htmlData(data))
  }
});
