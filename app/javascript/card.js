const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("purchase-btn");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("dl-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("dl[number]"), 
      exp_month: formData.get("dl[exp_month]"),
      exp_year: `20${formData.get("dl[exp_year]")}`,
      cvc: formData.get("dl[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("dl-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");

    document.getElementById("dl-form").submit();
    });
  });
};

window.addEventListener("load", pay);