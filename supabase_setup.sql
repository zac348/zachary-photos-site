-- Run this entire file in your Supabase SQL editor
-- Go to: supabase.com → your project → SQL Editor → New query → paste this → Run

-- Portfolio photos table
create table portfolio_photos (
  id uuid default gen_random_uuid() primary key,
  file_name text not null,
  storage_path text not null,
  url text not null,
  sport text,
  gallery_id uuid,
  show_on_homepage boolean default false,
  created_at timestamp with time zone default now()
);

-- Client galleries table
create table client_galleries (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  slug text not null unique,
  created_at timestamp with time zone default now()
);

-- Bookings table
create table bookings (
  id uuid default gen_random_uuid() primary key,
  first_name text,
  last_name text,
  email text,
  phone text,
  event_date text,
  event_time text,
  sport_type text,
  event_location text,
  package_selected text,
  addons text,
  total text,
  deposit text,
  referral text,
  notes text,
  created_at timestamp with time zone default now()
);

-- Allow anyone to read portfolio photos and galleries (public)
alter table portfolio_photos enable row level security;
alter table client_galleries enable row level security;
alter table bookings enable row level security;

create policy "Public read portfolio" on portfolio_photos for select using (true);
create policy "Public read galleries" on client_galleries for select using (true);
create policy "Public insert bookings" on bookings for insert with check (true);

-- Only logged-in admin can do everything else
create policy "Admin all portfolio" on portfolio_photos for all using (auth.role() = 'authenticated');
create policy "Admin all galleries" on client_galleries for all using (auth.role() = 'authenticated');
create policy "Admin read bookings" on bookings for select using (auth.role() = 'authenticated');
