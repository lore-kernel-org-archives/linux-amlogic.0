From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 21 Jul 2018 22:17:25 +0200
Subject: [PATCH 0/3] clk: meson: clk-pll driver update
In-Reply-To: <20180717095617.12240-1-jbrunet@baylibre.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
Message-ID: <CAFBinCC4CO_C_f9LLTnLmzVJ6-C-w8J0JQ0e6F9Jh_h61bGEKQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Tue, Jul 17, 2018 at 11:56 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> This patchset is yet another round of update to the amlogic pll driver.
>
>  1) Enable bit is added so we don't rely on the bootloader or the init
>     value to enable to pll device.
>  2) OD post dividers are removed from the pll driver. This simplify the
>     driver and let us provide the clocks which exist between those
>     dividera. Some device are actually using these clocks.
>  3) The rates hard coded in parameter tables are remove. Instead, we
>     only rely on the parent rate and the parameters to calculate the
>     output rate, which is a lot better.
>
> This series has been tested on the gxl libretech cc and axg s400.
> I did not test it on meson8b yet.
I had some comments on patch #2
once that is fixed I can help testing on Meson8b (if you give me a few days...)


Regards
Martin
