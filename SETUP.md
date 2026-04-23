# Setup Guide — Zachary Routsong Photography Site

Follow these steps in order. Takes about 20–30 minutes total.

---

## Step 1 — Create a Supabase account (free)

1. Go to **supabase.com** and click "Start your project"
2. Sign up with GitHub or email
3. Click "New project"
   - Name it: `zachary-photos`
   - Set a database password (save this somewhere)
   - Pick the region closest to you (US East is fine)
4. Wait about 2 minutes for it to set up

---

## Step 2 — Set up your database tables

1. In your Supabase project, click **SQL Editor** in the left sidebar
2. Click **New query**
3. Open the file `supabase_setup.sql` in Notepad
4. Copy everything and paste it into the SQL editor
5. Click **Run**
6. You should see "Success. No rows returned."

---

## Step 3 — Create a photo storage bucket

1. In Supabase, click **Storage** in the left sidebar
2. Click **New bucket**
3. Name it exactly: `photos`
4. Check the box for **Public bucket** → Click Create
5. Click on the `photos` bucket → click **Policies** tab
6. Click **New policy** → choose "For full customization"
7. Policy name: `Public read`
8. Allowed operation: SELECT
9. Target roles: Leave blank (public)
10. USING expression: `true`
11. Click Save

---

## Step 4 — Get your API keys

1. In Supabase, click **Settings** (gear icon) → **API**
2. Copy the **Project URL** — it looks like `https://abcxyz.supabase.co`
3. Copy the **anon / public** key (the long string under "Project API keys")

---

## Step 5 — Fill in config.js

1. Open the file `config.js` in Notepad
2. Replace `https://YOUR_PROJECT.supabase.co` with your Project URL
3. Replace `YOUR_ANON_KEY_HERE` with your anon key
4. Save the file

---

## Step 6 — Create your admin login

1. In Supabase, click **Authentication** → **Users**
2. Click **Add user** → **Create new user**
3. Enter YOUR email and a strong password
4. Click Create user
5. That's the login Zachary uses at `/login.html`

---

## Step 7 — Deploy to Cloudflare Pages (free, permanent)

1. Go to **cloudflare.com** and create a free account
2. In the dashboard, click **Pages** → **Create a project**
3. Choose **Direct upload**
4. Name your project (e.g. `zachary-photos`)
5. Drag the entire `zachary-photo-site` folder onto the upload area
6. Click Deploy

Cloudflare will give you a URL like `zachary-photos.pages.dev`

---

## Step 8 — Connect your domain

1. In Cloudflare Pages, go to your project → **Custom domains**
2. Click **Set up a custom domain**
3. Enter your domain (e.g. `zacharyroutsongphotos.com`)
4. Follow the DNS instructions (if your domain is registered on Cloudflare it's automatic, otherwise you update nameservers at your registrar)

---

## How Zachary uses the site

- **Admin dashboard**: go to `yourdomain.com/login.html`
- **Upload photos**: Login → Upload photos tab → drag files in
- **Create client gallery**: Login → Client galleries tab → enter client name → Create
- **Send gallery to client**: Copy the gallery link → text or email it to the client
- **View bookings**: Login → Bookings tab

---

## Files in this folder

| File | What it is |
|---|---|
| `index.html` | Public homepage |
| `book.html` | Booking page |
| `gallery.html` | Client gallery (private link) |
| `admin.html` | Zachary's admin dashboard |
| `login.html` | Admin login |
| `config.js` | Your Supabase keys (fill this in) |
| `supabase_setup.sql` | Database setup script |
| `SETUP.md` | This guide |
