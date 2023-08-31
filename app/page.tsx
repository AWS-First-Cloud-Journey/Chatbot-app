"use client";

import { useChat } from "ai/react";
import { User, Bot } from "lucide-react";
import { SendIcon, GithubIcon, VercelIcon } from "./icons";
import clsx from "clsx"; 

export default function Chat() {
  const { messages, input, handleInputChange, handleSubmit } = useChat();

  return (
    <div className="">
      {/* Header */}
      <header className="bg-blue-500 text-white py-4 text-center">
        <h1 className="text-2xl font-semibold">AWS First Cloud Journey 2023</h1>
      </header>

      {/* Rest of your component */}
      <div className="fixed top-0 hidden sm:flex justify-between items-center w-full py-2 px-10 bg-slate-200">
        <a
          href="#"
          target="_blank"
          className="rounded-lg p-2 transition-colors duration-200 hover:bg-stone-200 sm:bottom-auto"
        >
          <VercelIcon></VercelIcon>
        </a>
        <a
          href="#"
          target="_blank"
          className="rounded-lg p-2 transition-colors duration-200 hover:bg-stone-200 sm:bottom-auto"
        >
          <GithubIcon></GithubIcon>
        </a>
      </div>

      <div className="mx-auto max-w-4xl mt-10 px-5 pt-5 pb-20 bg-white">
        {/* Rest of your component */}
      </div>

      <div className="fixed bottom-0 w-full py-4">
        {/* Rest of your component */}
      </div>
    </div>
  );
}
