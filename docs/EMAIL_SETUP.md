# Email Configuration Guide

## Development

In development, emails are sent to the Swoosh mailbox preview. You can view them at:
http://localhost:4000/dev/mailbox

No additional configuration needed!

## Production - Option 1: Resend (Recommended)

**Why Resend?**
- Free tier: 100 emails/day, 3,000/month
- Simple API
- Good deliverability
- No credit card required for free tier

### Setup Steps:

1. **Sign up for Resend**
   - Go to https://resend.com
   - Create a free account

2. **Get API Key**
   - Go to "API Keys" in dashboard
   - Create a new API key
   - Copy the key (starts with `re_`)

3. **Add Domain (Optional but recommended)**
   - Go to "Domains" in dashboard
   - Add your domain (e.g., `phoenix-cv.fly.dev`)
   - Add the DNS records shown
   - Verify domain

4. **Set Secret in Fly.io**
   ```bash
   flyctl secrets set RESEND_API_KEY=re_your_api_key_here --app phoenix-cv
   ```

5. **Set Contact Email (Optional)**
   ```bash
   flyctl secrets set CONTACT_EMAIL=fernandocorreia316@gmail.com --app phoenix-cv
   ```

6. **Deploy**
   ```bash
   make deploy
   ```

That's it! Contact form emails will now be sent to `fernandocorreia316@gmail.com`.

## Production - Option 2: Gmail SMTP

If you prefer using Gmail:

### Setup Steps:

1. **Enable 2-Factor Authentication**
   - Go to your Google Account settings
   - Enable 2FA

2. **Create App Password**
   - Go to https://myaccount.google.com/apppasswords
   - Create a new app password for "Mail"
   - Copy the 16-character password

3. **Update Configuration**

   Edit `config/runtime.exs` and uncomment the SMTP section:
   ```elixir
   config :phoenix_csv, PhoenixCsv.Mailer,
     adapter: Swoosh.Adapters.SMTP,
     relay: "smtp.gmail.com",
     username: System.get_env("SMTP_USERNAME"),
     password: System.get_env("SMTP_PASSWORD"),
     ssl: true,
     tls: :always,
     auth: :always,
     port: 465
   ```

   Comment out the Resend section.

4. **Set Secrets**
   ```bash
   flyctl secrets set SMTP_USERNAME=fernandocorreia316@gmail.com --app phoenix-cv
   flyctl secrets set SMTP_PASSWORD=your_app_password_here --app phoenix-cv
   flyctl secrets set CONTACT_EMAIL=fernandocorreia316@gmail.com --app phoenix-cv
   ```

5. **Deploy**
   ```bash
   make deploy
   ```

## Testing

### Test in Development:

1. Start server: `mix phx.server`
2. Go to http://localhost:4000/about
3. Click "Send Me a Message"
4. Fill out the form and submit
5. Check mailbox at http://localhost:4000/dev/mailbox

### Test in Production:

1. Deploy the app
2. Visit your live site
3. Submit a contact form
4. Check your email at `fernandocorreia316@gmail.com`

## Troubleshooting

### Emails not arriving (Resend):
- Check Resend dashboard for delivery status
- Verify API key is correct
- Check spam folder
- Verify domain is added (for better deliverability)

### Emails not arriving (Gmail SMTP):
- Verify 2FA is enabled
- Check app password is correct
- Try generating a new app password
- Check "Less secure apps" isn't blocking (shouldn't be needed with app password)

### Getting error in logs:
```bash
# Check app logs
flyctl logs --app phoenix-cv

# Check secrets are set
flyctl secrets list --app phoenix-cv
```

## Email Format

Emails sent from the contact form will include:

**Subject:** New Contact Form Message from [Name]

**Body:**
- From: [Name] ([Email])
- Message: [Message content]
- Reply-to header set to visitor's email

You can reply directly to these emails, and your reply will go to the visitor!

## Costs

**Resend Free Tier:**
- 100 emails/day
- 3,000 emails/month
- Perfect for portfolio contact forms

**Gmail:**
- Free
- But subject to Gmail's sending limits (500/day)

## Security Notes

- Never commit API keys or passwords to git
- Always use environment variables
- Resend keys start with `re_`
- Gmail app passwords are 16 characters
- Both are set as Fly.io secrets

## Next Steps

Once configured, you might want to:
1. Add email validation to prevent spam
2. Implement rate limiting (1 email per IP per hour)
3. Add a simple CAPTCHA
4. Set up email templates with your branding
