function pullDown (){
  const signUp = document.getElementById("signup-btn");
  const logIn = document.getElementById("login-btn")
  const sPullDown = document.getElementById("signup-pulldown")
  const lPullDown = document.getElementById("login-pulldown")
  
  signUp.addEventListener('click', function() {
    if (sPullDown.getAttribute("style") == "display:block;") {
      sPullDown.removeAttribute("style", "display:block;")
    } else {
      sPullDown.setAttribute("style", "display:block;")
    }
  })

  logIn.addEventListener('click', function() {
    if (lPullDown.getAttribute("style") == "display:block;") {
      lPullDown.removeAttribute("style", "display:block;")
    } else {
      lPullDown.setAttribute("style", "display:block;")
    }
  })
};



window.addEventListener('load', pullDown);