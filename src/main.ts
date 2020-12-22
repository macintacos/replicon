import { Plugin } from "obsidian";

export default class MyPlugin extends Plugin {
  onload() {
    console.log("Hey, I'm loaded!");
    return;
  }
}
