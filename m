From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 7 Jan 2018 21:11:53 +0100
Subject: [PATCH 0/3] Meson8/Meson8b reset improvements
In-Reply-To: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
References: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
Message-ID: <CAFBinCAMwNFAKRVgUnwWbCxXC1g8Xjg_5SHAtoqOigo=7xXD8A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Kevin,

On Tue, Dec 26, 2017 at 12:43 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Recently Neil landed reset level support (.assert/.deassert) for the
> reset-meson driver.
> While the driver does not support level resets on Meson8b yet we can
> already prepare the .dts to do so (I actually found out that level
> resets are implemented identical on Meson8/Meson8b/GX - a patch for
> the reset-meson driver will follow in a separate series).
even though there's no hard dependency on that:
the patch which enables level resets for Meson8b (see [0]) is now
queued for v4.16

> I also noticed that Meson8 does not have the reset controller in it's
> .dtsi yet, so this series adds that as well.
> It also adds the USB reset lines on Meson8 afterwards to stay
> consistent with Meson8b.
will you take this series for v4.16 or should I re-send it (with
Neil's "Reviewed-by") after v4.16-rc1 is out?

>
> Martin Blumenstingl (3):
>   ARM: dts: meson8b: grow the reset controller memory zone
>   ARM: dts: meson8: add the reset controller
>   ARM: dts: meson8: add the USB reset line
>
>  arch/arm/boot/dts/meson8.dtsi  | 9 +++++++++
>  arch/arm/boot/dts/meson8b.dtsi | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> --
> 2.15.1
>

Regards
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005869.html
