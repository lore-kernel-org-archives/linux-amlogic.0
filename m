From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 8 Nov 2018 15:16:51 +0100
Subject: [PATCH 0/2] Meson8b: fixes for the cpu_scale_div clock
In-Reply-To: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
References: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
Message-ID: <a8798132-4544-ce91-7321-1489948c4429@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 27/09/2018 10:59, Martin Blumenstingl wrote:
> While trying to add support for the TWD timer I found that our CPU clock
> calculation (when running off the "cpu_scale_div clock) is incorrect.
> 
> The main problem was the cpu_scale_div clock:
> it's divider table has an off-by-one error. the old formula was:
>   parent_rate / 2 * register_value
> however, testing shows that the correct formula is:
>   parent_rate / 2 * (register value + 1)
> See the commit message of patch #1 for a complete description of the
> problem and it's history.
> 
> While looking at the "cpu_scale_div" clock I also found that it's
> register width was also off-by-one, so this is fixed in a separate patch
> as well.
> 
> Both patches are not critical because I haven't seen a case where u-boot
> uses cpu_scale_div for the CPU clock. It's only a problem when playing
> with the CPU clock in u-boot (by writing registers manually) or as soon
> as we support CPU frequency scaling.
> 
> 
> Martin Blumenstingl (2):
>   clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
>   clk: meson: meson8b: fix the width of the cpu_scale_div clock
> 
>  drivers/clk/meson/meson8b.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 

Pushed to fixes/drivers for 4.20

Neil
