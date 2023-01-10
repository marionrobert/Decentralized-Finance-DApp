import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async function(){
    // console.log("Finished loading!");
    update();
})

document.querySelector("form").addEventListener("submit", async function(event){
    event.preventDefault();
    // console.log("Submitted");

    const button = event.target.querySelector("#submit-btn");
    const inputAmount = document.getElementById("input-amount").value;
    const outputAmount = document.getElementById("withdrawal-amount").value;

    button.setAttribute("disabled", true);

    if (inputAmount.length != 0) {
        await dbank.topUp(parseFloat(inputAmount));
    }

    if (outputAmount.length != 0) {
        await dbank.withdraw(parseFloat(outputAmount));
    }

    await dbank.compound();

    update();

    // some animations to show that everything worked
    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";
    button.removeAttribute("disabled");



});

async function update() {
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerHTML = Math.round(currentAmount * 100) / 100;
}