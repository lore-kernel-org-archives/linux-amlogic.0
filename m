From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 7 Nov 2016 18:37:52 +0100
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <3c21b0a4-43c9-0257-f8f2-c8e02cf94fbf@st.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
 <CAFBinCC0HiEXx5mELztH6jYfUq2f1u0Tb+pSzAvwQSu9vYydGQ@mail.gmail.com>
 <20161031112524.4c4ee8f8@gmail.com> <1478192276.6632.34.camel@baylibre.com>
 <3c21b0a4-43c9-0257-f8f2-c8e02cf94fbf@st.com>
Message-ID: <CAFBinCDq0neyidQBO13F4Yz-GZPorGyRQ2t5Vb-PL0Ls582+4Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Peppe,

On Mon, Nov 7, 2016 at 11:59 AM, Giuseppe CAVALLARO
<peppe.cavallaro@st.com> wrote:
> In the meantime, I will read again the thread just to see if
> there is something I am missing.
if you are re-reading this thread: please note that there are two
devices in discussion here!
Both are using the Amlogic S905 (GXBB) SoC and both are experiencing
the same issue (Gbit TX issues, RX with Gbit speeds and RX/TX with
100Mbit speed are NOT affected):
- Odroid-C2 (used by Jerome and Andr? Roth)
- Tronsmart Vega S95 Meta (my device)

The (Gbit TX) problem seems to be gone on the Odroid-C2 with Jerome's
patch which disables EEE in drivers/net/phy/realtek.c (at least in his
tests, I don't have that device so I can't verify).
The same problem still appears on my Tronsmart Vega S95 Meta even with
the patched PHY driver.

Unfortunately I don't have a second device to rule out that my
Tronsmart Vega S95 Meta could be broken (not unlikely, I get DDR
errors from time to time in u-boot). Maybe Andreas Faerber can test
ethernet with and without Jerome's patch on one of his Tronsmart
devices.


Regards,
Martin
