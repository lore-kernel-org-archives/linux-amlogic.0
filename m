From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 25 Feb 2018 12:43:08 +0100
Subject: [PATCH] Meson8b GPIO fix - WiP
In-Reply-To: <20180225113854.20731-2-martin.blumenstingl@googlemail.com>
References: <20180225113854.20731-1-martin.blumenstingl@googlemail.com>
 <20180225113854.20731-2-martin.blumenstingl@googlemail.com>
Message-ID: <CAFBinCAFfoCi=_VQ0kPK5eeGnyOJ5br9bu-pkSoA-MEj+FBawg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Feb 25, 2018 at 12:38 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8b.dtsi          |   2 +-
>  drivers/pinctrl/meson/pinctrl-meson8b.c |  20 +++---
>  include/dt-bindings/gpio/meson8b-gpio.h | 121 ++++++++++++++++++++++++++++----
>  3 files changed, 121 insertions(+), 22 deletions(-)
please ignore this patch, I accidentally sent this
the actual result of this patch is split into two patches and each of
them contains a proper patch description: [0]

sorry for the noise


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-February/006546.html
