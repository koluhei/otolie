function message (){
  const send = document.getElementById("chat-send-btn");
  send.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("chat-form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest
    XHR.open("POST", "/chats", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const item = XHR.response.message;
      const html = ``
    };
  });
};

window.addEventListener('load', post);