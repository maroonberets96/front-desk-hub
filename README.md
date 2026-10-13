<p align="center">
  <img src="docs/images/banner.svg" alt="Front Desk Hub: laundry tokens, rent, cash drawer, petty cash, keys, post and visitors" width="100%">
</p>

<p align="center">
  <img alt="Windows 10/11" src="https://img.shields.io/badge/Windows-10%20%7C%2011-0078D4?logo=windows&logoColor=white">
  <img alt="Python 3" src="https://img.shields.io/badge/Python-3.10%2B-3776AB?logo=python&logoColor=white">
  <img alt="Tkinter" src="https://img.shields.io/badge/UI-Tkinter-00adb5">
  <img alt="Single exe" src="https://img.shields.io/badge/ships%20as-one%20.exe-22a45d">
  <img alt="No server" src="https://img.shields.io/badge/server-none-8b6cf0">
</p>

**Front Desk Hub** runs every job at a small office's front desk from one touch-screen PC at the counter. Staff use it to sell laundry tokens, take rent and print receipts, and run the cash drawer and petty cash. It also lends out keys, logs recorded post and keeps the visitor book.

It replaces the paper receipt book, the token tin, the petty cash tin, the key book, the post book and the visitor book. Every action needs a staff PIN, and each record is kept in a log that flags any edit made outside the app.

It needs no server, database or install: one `.exe` and a `data` folder next to it.

## What's in it

| | Tab | What it does |
|---|---|---|
| 🔵 | **Home** | Today at a glance: takings, receipts waiting to be checked, cash not yet banked, overdue keys, post waiting to be handed over, and visitors still signed in. When nobody is using it, the screen shows a clock and counts only, with no money on show |
| 🟢 | **Laundry** | Point of sale for washing and dryer tokens, by flat, which opens the cash drawer through a USB trigger. Includes each flat's purchase history, token stock (deliveries and counts), voids, and reports by day or by flat |
| 🟩 | **Rent** | Rent, arrears and deposits taken at the desk, each with a numbered receipt that prints straight away. A second person checks the money into the safe, then it's banked with a printed banking sheet. Receipts can be previewed, reprinted or cancelled, and each tenant's payment statement printed |
| 🟠 | **Drawer** | Cash in the drawer now, no sale and change, counts, voids and emptying the drawer for banking. **Petty cash**: money taken out against a reason, settled later with the receipt total and a photo of each receipt from the webcam |
| 🔶 | **Keys** | Keys lent to contractors, with a printed slip to sign. Shows what's still out and what's overdue, and records returns, part-returns and lost keys |
| 🟣 | **Post** | Recorded post in (handed over to whom, and when) and out (method, tracking number, cost) |
| 🩷 | **Visitors** | The visitor book, filled in by staff, with sign-in and sign-out times |
| ⚙️ | **Settings** | Staff and PINs, tenants, flats, properties, contractors, token prices, receipt numbering, the cash drawer, touch-screen mode, and a check of every log |

## Paperwork it prints

Every document is a PDF made by the app, and your organisation's name and address go on it from **Settings**. The samples below use made-up data.

<table>
  <tr>
    <td width="50%" valign="top"><b>Rent receipt</b><br><img src="docs/images/receipt.png" alt="Sample rent receipt"></td>
    <td width="50%" valign="top"><b>Key issue slip</b><br><img src="docs/images/key-slip.png" alt="Sample key issue slip"></td>
  </tr>
  <tr>
    <td width="50%" valign="top"><b>Banking sheet</b><br><img src="docs/images/banking-sheet.png" alt="Sample banking sheet"></td>
    <td width="50%" valign="top">
      <b>Also printed or exported</b>
      <ul>
        <li>Laundry token banking sheets</li>
        <li>Tenant payment statements</li>
        <li>Excel and CSV exports of every log</li>
      </ul>
    </td>
  </tr>
</table>

## Made for a touch screen

Turn on **Settings → General → Touch screen** and tapping a box brings up an on-screen keyboard, or a number pad for money, dates and phone numbers. Both open beside the form, not over it. The working lists are tall cards that you tap to select and drag to scroll.

## Built to be trusted with cash

- **A PIN on every action.** Each sale, receipt, check, key loan and sign-out records who did it. PINs are stored as salted hashes.
- **Logs are only ever added to.** Nothing is edited or deleted. A void or cancellation is a new row that points back to the original.
- **Hand edits are flagged.** Each row carries a hash of itself plus the row before it. If a log is changed in Excel or Notepad, the app shows exactly where.
- **Two people handle rent money.** One takes the payment, and a checker confirms it before it goes in the safe. Receipt numbers are never reused.
- **Daily backups.** A copy of each log is saved every day, and the last 60 days are kept.
- **Safe updates.** To update, replace the `.exe`. New features create their own files on first run, so no data ever needs converting.

## Running from source

```
pip install pyserial pillow reportlab openpyxl opencv-python-headless
python source/front_office.py
```

The first run creates `data/`, `receipts/`, `banking/`, `keys/` and `backups/` next to `source/`. The default admin PIN is **1234**, and the app keeps warning you until it's changed.

## Building the .exe

```
pip install pyinstaller
source\build_exe.bat
```

This builds `Front Desk Hub.exe` as a single file in the repository root. To brand it, put a `logo.png` (and optionally an `app.ico`) in `source/` before you build. To have rent receipts print straight to the default printer, also put `SumatraPDF.exe` there; without it, each receipt opens as a PDF to print by hand.

## Updating a live install

1. Press **Exit** in the app.
2. Rename the old `Front Desk Hub.exe` to `Front Desk Hub.exe.old`, as a way back.
3. Copy in the new `.exe` and start it.

Never copy `data/`, `receipts/`, `banking/`, `keys/` or `backups/` from a test copy. They hold the live records.

## Requirements

Windows 10 or 11, a PDF viewer (Edge is fine) and a default printer. The cash drawer is optional and needs a USB trigger box (virtual COM port). The app finds it automatically, or you can set it in **Settings → Cash drawer**.
