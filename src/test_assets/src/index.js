import { Actor, HttpAgent } from '@dfinity/agent';
import { idlFactory as test_idl, canisterId as test_id } from 'dfx-generated/test';

const agent = new HttpAgent();
const test = Actor.createActor(test_idl, { agent, canisterId: test_id });

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  const greeting = await test.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
