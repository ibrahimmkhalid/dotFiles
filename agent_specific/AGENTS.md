Hello. My name is Ibrahim Khalid. You are my coding agent. We are together in this partnership as equals. Let me tell you a little bit about me. I am a pragmatist. I do not like to write overly complicated code for something that can be expressed simply in just a couple of lines.

# General Guidelines

Always load the unslop skill.

Do not add long multi line comments to source code, especially if it is describing *why* that code exists. Do not reference chat history in code comments. Comments should be used sparingly and should be kept as small as possible, simply describing what the next block of code is doing. If a block of code cannot be understood without comments, it is likely too convoluted and should be simplified.

Again, if a block of code cannot be understood without comments, it is likely too convoluted and should be simplified.

Keep the blast radius of changes made small and localized to what I ask for.

When working on many fixes in a single pass, each fix must be self contained in its own commit. Once again, do not reference chat history in commit messages.

Unless I state it, do not start dev servers on your own. I am the one responsible for starting them. If you need to run an experimental build for a quick fix, use it then (in a way that does not hinder any live dev server), but kill it as soon as you verify it.

If you do however, start a dev server and find that something is already running on that port, use another port. Do not perform a hostile takeover of a port.

Do not scope beyond what I ask for unless it is either necessary or something that is inferred. Necessary would be something like me asking to create a new page with, and the necessary scope addition would be creating the API that must go along with that. Inferred would be me asking you to change the flow of one feature only in a large page and forgetting to mention also updating the documentation for that page, in this case you should update the documentation yourself.

Do not add unnecessary inline copy or boilerplate text explaining what the action/UI is about to do in long detail. UIs should be clean and copy should be added only if I ask for it or if the flow is genuinely confusing without it. If you must add copy, add it either as a hover text or some other hidden mechanism or in a how to use page if such a page exists.

I prefer clean and simple UIs over gaudy gradients and animations. Minimalism is better.

This system employs multiple agents from time to time, all with this common rule set. The agents installed on my system are claude, codex, cursor, and opencode. If for whatever reason I mention a skill that you do not have, it might be installed in one of the other agent directories. Check there for it.

I use a custom script to launch a tmux session for the selected project I am working on, this triggers my zshrc script to source a globally git-ignored ".project_env" file. If for whatever reason you need to make changes that apply to my local env only, put them in the .project_env file for that project.


Never install any packages onto my system python install, always prefer using 'uv' as the package manager and project management software solution. The only exception to this is if we are working on a very simple script that uses the dependencies already installed on my system, then no need to create a full uv project.

Never use the 'any' keyword unless absolutely necessary. Try to always have a clear and well defined type for what you are working on.

Avoid "useEffect" at all costs. Or more abstractly, avoid dependency arrays.

Keep it stupid simple. Do not over complicate the code in any scenario.
