defmodule PhoenixCsvWeb.TestimonialsLive do
  use PhoenixCsvWeb, :live_view
  alias PhoenixCsv.Testimonials

  def mount(_params, _session, socket) do
    testimonials = Testimonials.list_approved_testimonials()
    changeset = Testimonials.change_testimonial(%PhoenixCsv.Testimonials.Testimonial{}, %{})

    socket =
      socket
      |> assign(:page_title, "Testimonials - Fernando Correia")
      |> assign(:testimonials, testimonials)
      |> assign(:show_form, false)
      |> assign(:form, to_form(changeset))
      |> Phoenix.Component.assign_new(:inner_content, fn -> nil end)

    {:ok, socket, layout: {PhoenixCsvWeb.Layouts, :app}}
  end

  def handle_event("toggle_form", _params, socket) do
    {:noreply, assign(socket, :show_form, !socket.assigns.show_form)}
  end

  def handle_event("validate", %{"testimonial" => testimonial_params}, socket) do
    changeset =
      %PhoenixCsv.Testimonials.Testimonial{}
      |> Testimonials.change_testimonial(testimonial_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def handle_event("submit", %{"testimonial" => testimonial_params}, socket) do
    case Testimonials.create_testimonial(testimonial_params) do
      {:ok, _testimonial} ->
        changeset = Testimonials.change_testimonial(%PhoenixCsv.Testimonials.Testimonial{}, %{})

        {:noreply,
         socket
         |> put_flash(:info, "Thank you! Your testimonial has been submitted and is pending approval.")
         |> assign(:show_form, false)
         |> assign(:form, to_form(changeset))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <div class="container mx-auto px-4 py-8 max-w-6xl">
        <!-- Header Section -->
        <div class="hero bg-base-200 rounded-box mb-8">
          <div class="hero-content text-center py-12">
            <div class="max-w-3xl">
              <h1 class="text-4xl md:text-5xl font-bold mb-4">Testimonials & Recommendations</h1>
              <p class="text-xl md:text-2xl opacity-80">
                What colleagues and collaborators have to say
              </p>
            </div>
          </div>
        </div>
        <!-- Submit Testimonial Button -->
        <div class="mb-8 flex justify-center">
          <button class="btn btn-primary btn-lg" phx-click="toggle_form">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"
              />
            </svg>
            <%= if @show_form, do: "Cancel", else: "Leave a Testimonial" %>
          </button>
        </div>
        <!-- Testimonial Submission Form -->
        <%= if @show_form do %>
          <div class="card bg-base-200 shadow-xl mb-8">
            <div class="card-body">
              <h2 class="card-title text-2xl mb-4">Share Your Experience</h2>
              <.form
                for={@form}
                phx-change="validate"
                phx-submit="submit"
                class="space-y-4"
              >
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div class="form-control">
                    <label class="label">
                      <span class="label-text">Your Name *</span>
                    </label>
                    <.input
                      field={@form[:name]}
                      type="text"
                      placeholder="John Doe"
                      class="input input-bordered"
                      required
                    />
                  </div>

                  <div class="form-control">
                    <label class="label">
                      <span class="label-text">Email *</span>
                    </label>
                    <.input
                      field={@form[:email]}
                      type="email"
                      placeholder="john@example.com"
                      class="input input-bordered"
                      required
                    />
                  </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div class="form-control">
                    <label class="label">
                      <span class="label-text">Your Role</span>
                    </label>
                    <.input
                      field={@form[:role]}
                      type="text"
                      placeholder="Senior Developer"
                      class="input input-bordered"
                    />
                  </div>

                  <div class="form-control">
                    <label class="label">
                      <span class="label-text">Company</span>
                    </label>
                    <.input
                      field={@form[:company]}
                      type="text"
                      placeholder="Tech Corp"
                      class="input input-bordered"
                    />
                  </div>
                </div>

                <div class="form-control">
                  <label class="label">
                    <span class="label-text">Relationship</span>
                  </label>
                  <.input
                    field={@form[:relationship]}
                    type="select"
                    options={[
                      {"Select a relationship", ""},
                      {"Worked together", "worked_together"},
                      {"I managed Fernando", "managed"},
                      {"Fernando managed me", "was_managed_by"},
                      {"Client/Customer", "client"},
                      {"Colleague", "colleague"},
                      {"Other", "other"}
                    ]}
                    class="select select-bordered"
                  />
                </div>

                <div class="form-control">
                  <label class="label">
                    <span class="label-text">LinkedIn Profile (Optional)</span>
                  </label>
                  <.input
                    field={@form[:linkedin_url]}
                    type="url"
                    placeholder="https://linkedin.com/in/yourprofile"
                    class="input input-bordered"
                  />
                </div>

                <div class="form-control">
                  <label class="label">
                    <span class="label-text">Your Testimonial * (10-1000 characters)</span>
                  </label>
                  <.input
                    field={@form[:content]}
                    type="textarea"
                    placeholder="Share your experience working with Fernando..."
                    class="textarea textarea-bordered h-32"
                    required
                  />
                </div>

                <div class="alert alert-info">
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
                  <span>
                    Your testimonial will be reviewed before being published. We'll only use your email to contact you if needed.
                  </span>
                </div>

                <div class="card-actions justify-end">
                  <button type="button" class="btn btn-ghost" phx-click="toggle_form">
                    Cancel
                  </button>
                  <button type="submit" class="btn btn-primary">
                    Submit Testimonial
                  </button>
                </div>
              </.form>
            </div>
          </div>
        <% end %>
        <!-- Testimonials List -->
        <%= if length(@testimonials) > 0 do %>
          <div class="grid grid-cols-1 gap-6">
            <%= for testimonial <- @testimonials do %>
              <div class="card bg-base-200 shadow-xl">
                <div class="card-body">
                  <div class="flex items-start gap-4">
                    <div class="avatar placeholder">
                      <div class="bg-primary text-primary-content rounded-full w-16">
                        <span class="text-2xl"><%= String.first(testimonial.name) %></span>
                      </div>
                    </div>

                    <div class="flex-1">
                      <div class="flex items-center gap-2 mb-2">
                        <h3 class="card-title text-lg"><%= testimonial.name %></h3>
                        <%= if testimonial.linkedin_url do %>
                          <a
                            href={testimonial.linkedin_url}
                            target="_blank"
                            class="btn btn-ghost btn-xs btn-circle"
                            title="View LinkedIn Profile"
                          >
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              class="h-4 w-4"
                              fill="currentColor"
                              viewBox="0 0 24 24"
                            >
                              <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z" />
                            </svg>
                          </a>
                        <% end %>
                      </div>

                      <%= if testimonial.role || testimonial.company do %>
                        <p class="text-sm opacity-70 mb-1">
                          <%= testimonial.role %><%= if testimonial.role && testimonial.company,
                            do: " at " %><%= testimonial.company %>
                        </p>
                      <% end %>

                      <%= if testimonial.relationship do %>
                        <div class="badge badge-outline badge-sm mb-3">
                          <%= format_relationship(testimonial.relationship) %>
                        </div>
                      <% end %>

                      <p class="leading-relaxed mt-3">
                        "<%= testimonial.content %>"
                      </p>

                      <p class="text-xs opacity-50 mt-3">
                        <%= Calendar.strftime(testimonial.submitted_at, "%B %Y") %>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            <% end %>
          </div>
        <% else %>
          <div class="card bg-base-200 shadow-xl">
            <div class="card-body text-center py-12">
              <h3 class="text-2xl font-bold mb-4">Be the First!</h3>
              <p class="opacity-70 mb-6">
                No testimonials yet. If you've worked with Fernando, please consider leaving a recommendation.
              </p>
              <button class="btn btn-primary mx-auto" phx-click="toggle_form">
                Leave a Testimonial
              </button>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp format_relationship("worked_together"), do: "Worked together"
  defp format_relationship("managed"), do: "Managed Fernando"
  defp format_relationship("was_managed_by"), do: "Managed by Fernando"
  defp format_relationship("client"), do: "Client/Customer"
  defp format_relationship("colleague"), do: "Colleague"
  defp format_relationship("other"), do: "Professional connection"
  defp format_relationship(_), do: ""
end
