From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 18 Feb 2018 21:59:07 +0100
Subject: [PATCH v2 17/19] clk: meson: rework meson8b cpu clock
In-Reply-To: <20180212145846.19380-18-jbrunet@baylibre.com>
References: <20180212145846.19380-1-jbrunet@baylibre.com>
 <20180212145846.19380-18-jbrunet@baylibre.com>
Message-ID: <CAFBinCBrSKi=mmLuZuwqXJdfZu+RQsCDgDABPHOWAbvm7piS=w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Feb 12, 2018 at 3:58 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Instead of migrating meson cpu_clk to clk_regmap, like the other meson
> clock drivers, we take advantage of the massive rework to get rid of it
> completely, and solve (the first part) of the related FIXME notice.
>
> As pointed out in the code comments, the cpu_clk should be modeled with
> dividers and muxes it is made of, instead of one big composite clock.
>
> The cpu_clk was not working correctly to enable dvfs on meson8b. It hangs
> quite often when changing the cpu clock rate. This new implementation,
> based on simple elements improves the situation but the platform will
> still hang from time to time. This is not acceptable so, until we can
> make the mechanism around the cpu clock stable, the cpu clock subtree
> has been put in read-only mode, preventing any change of the cpu clock
>
> The notifier and read-write operation will be added back when we have a
> solution to the problem.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you Jerome!
