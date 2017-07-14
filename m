From: sjg@chromium.org (Simon Glass)
Date: Fri, 14 Jul 2017 07:50:19 -0600
Subject: [PATCH v2 1/4] arm: dts: meson: import dts files from Linux 4.12
In-Reply-To: <20170709223006.3998-2-b.galvani@gmail.com>
References: <20170709223006.3998-1-b.galvani@gmail.com>
 <20170709223006.3998-2-b.galvani@gmail.com>
Message-ID: <CAPnjgZ01UoELp3HtDhok6kmKWVPHUgQBTrGSW2DxK-wMMkcB-A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 9 July 2017 at 16:30, Beniamino Galvani <b.galvani@gmail.com> wrote:
>
> Import Amlogic Meson DTS files from Linux kernel version 4.12
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/dts/meson-gx.dtsi            |  97 ++++++++++++++++--
>  arch/arm/dts/meson-gxbb-odroidc2.dts  |  82 ++++++++++++++-
>  arch/arm/dts/meson-gxbb.dtsi          | 187 ++++++++++++++++++++++++++++------
>  include/dt-bindings/clock/gxbb-clkc.h |  24 ++++-
>  4 files changed, 344 insertions(+), 46 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
