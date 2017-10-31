From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 31 Oct 2017 11:20:30 +0100
Subject: [PATCH 0/2] add Meson8/Meson8b serial core clock handling
In-Reply-To: <20171028123430.7796-1-martin.blumenstingl@googlemail.com>
References: <20171028123430.7796-1-martin.blumenstingl@googlemail.com>
Message-ID: <1509445230.13838.26.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-10-28 at 14:34 +0200, Martin Blumenstingl wrote:
> This patchset adds the tty/serial core clock handling to the UARTs
> on Meson8 and Meson8b.
> 
> Basically this is the Meson8 and Meson8b version of a patchset from
> Helmut Klein and Neil Armstrong, who implemented this for Meson GX
> (see [0]). Back then I asked Neil to drop Meson8b from his patchset
> because I was working on the Meson8 clock controller at that time.
> 
> This also removes the last users that rely on the "amlogic,meson-uart"
> binding. Removing that binding from the meson_uart driver is not part
> of this series though.
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-June/004173.html
> 

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> Martin Blumenstingl (2):
>   ARM: dts: meson8: use stable UART bindings with correct gate clock
>   ARM: dts: meson8b: use stable UART bindings with correct gate clock
> 
>  arch/arm/boot/dts/meson8.dtsi  | 16 ++++++++++++----
>  arch/arm/boot/dts/meson8b.dtsi | 16 ++++++++++++----
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
