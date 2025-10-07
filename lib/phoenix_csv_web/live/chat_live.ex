defmodule PhoenixCsvWeb.ChatLive do
  use PhoenixCsvWeb, :live_view
  alias PhoenixCsv.Chat

  @topic "chat:lobby"

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(PhoenixCsv.PubSub, @topic)
    end

    username = Chat.generate_username()
    messages = Chat.list_recent_messages()
    online_users = get_online_users()

    socket =
      socket
      |> assign(:page_title, "Live Chat - Fernando Correia")
      |> assign(:username, username)
      |> assign(:messages, messages)
      |> assign(:online_users, online_users)
      |> assign(:message_input, "")
      |> Phoenix.Component.assign_new(:inner_content, fn -> nil end)

    {:ok, socket, layout: {PhoenixCsvWeb.Layouts, :app}}
  end

  def handle_event("send_message", %{"message" => content}, socket) do
    content = String.trim(content)

    if content != "" do
      case Chat.create_message(%{
             username: socket.assigns.username,
             content: content
           }) do
        {:ok, message} ->
          # Broadcast to all connected clients
          Phoenix.PubSub.broadcast(
            PhoenixCsv.PubSub,
            @topic,
            {:new_message, message}
          )

          {:noreply, assign(socket, :message_input, "")}

        {:error, _changeset} ->
          {:noreply, put_flash(socket, :error, "Message too long (max 500 characters)")}
      end
    else
      {:noreply, socket}
    end
  end

  def handle_event("update_message", %{"message" => content}, socket) do
    {:noreply, assign(socket, :message_input, content)}
  end

  def handle_info({:new_message, message}, socket) do
    {:noreply, assign(socket, :messages, socket.assigns.messages ++ [message])}
  end

  defp get_online_users do
    # This is a simplified version - in production you'd track this properly
    :rand.uniform(5) + 1
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <div class="container mx-auto px-4 py-8 max-w-5xl">
        <!-- Header -->
        <div class="card bg-base-200 shadow-xl mb-6">
          <div class="card-body">
            <div class="flex items-center justify-between">
              <div>
                <h1 class="text-3xl font-bold">Live Chat</h1>
                <p class="opacity-70">Chat with other visitors in real-time</p>
              </div>
              <div class="stats shadow">
                <div class="stat place-items-center py-3 px-6">
                  <div class="stat-value text-primary"><%= @online_users %></div>
                  <div class="stat-desc">Online now</div>
                </div>
              </div>
            </div>
            <div class="alert alert-info mt-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                class="stroke-current shrink-0 w-6 h-6"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                />
              </svg>
              <span>You're chatting as <strong><%= @username %></strong></span>
            </div>
          </div>
        </div>
        <!-- Chat Container -->
        <div class="card bg-base-200 shadow-xl">
          <div class="card-body p-0">
            <!-- Messages Area -->
            <div
              id="messages"
              class="overflow-y-auto h-[500px] p-6 space-y-4"
              phx-hook="ScrollToBottom"
            >
              <%= if length(@messages) == 0 do %>
                <div class="text-center py-20 opacity-50">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-16 w-16 mx-auto mb-4"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"
                    />
                  </svg>
                  <p class="text-lg">No messages yet. Be the first to say hi!</p>
                </div>
              <% else %>
                <%= for message <- @messages do %>
                  <div class={[
                    "chat",
                    if(message.username == @username, do: "chat-end", else: "chat-start")
                  ]}>
                    <div class="chat-header opacity-70">
                      <%= message.username %>
                      <time class="text-xs opacity-50 ml-1">
                        <%= Calendar.strftime(message.inserted_at, "%H:%M") %>
                      </time>
                    </div>
                    <div class={[
                      "chat-bubble",
                      if(message.username == @username,
                        do: "chat-bubble-primary",
                        else: "chat-bubble-secondary"
                      )
                    ]}>
                      <%= message.content %>
                    </div>
                  </div>
                <% end %>
              <% end %>
            </div>
            <!-- Input Area -->
            <div class="border-t border-base-300 p-4 bg-base-100">
              <form phx-submit="send_message" class="flex gap-2">
                <input
                  type="text"
                  name="message"
                  value={@message_input}
                  phx-change="update_message"
                  placeholder="Type your message..."
                  class="input input-bordered flex-1"
                  maxlength="500"
                  autocomplete="off"
                />
                <button type="submit" class="btn btn-primary">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"
                    />
                  </svg>
                  Send
                </button>
              </form>
            </div>
          </div>
        </div>
        <!-- Chat Rules -->
        <div class="alert alert-warning mt-6">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="stroke-current shrink-0 h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"
            />
          </svg>
          <span>
            <strong>Chat Rules:</strong>
            Be respectful. No spam, hate speech, or personal information. Messages are public and logged.
          </span>
        </div>
      </div>
    </div>
    """
  end
end
