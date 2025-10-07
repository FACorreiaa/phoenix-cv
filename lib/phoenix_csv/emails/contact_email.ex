defmodule PhoenixCsv.Emails.ContactEmail do
  import Swoosh.Email

  def contact_message(name, email, message) do
    to_email = System.get_env("CONTACT_EMAIL") || "fernandocorreia316@gmail.com"

    new()
    |> to(to_email)
    |> from({"Portfolio Contact Form", "noreply@send.phoenix-cv.fly.dev"})
    |> reply_to(email)
    |> subject("New Contact Form Message from #{name}")
    |> html_body("""
    <h2>New Contact Form Submission</h2>
    <p><strong>From:</strong> #{name} (#{email})</p>
    <p><strong>Message:</strong></p>
    <p>#{String.replace(message, "\n", "<br>")}</p>
    <hr>
    <p><small>This email was sent from your portfolio contact form.</small></p>
    """)
    |> text_body("""
    New Contact Form Submission

    From: #{name} (#{email})

    Message:
    #{message}

    ---
    This email was sent from your portfolio contact form.
    """)
  end
end
