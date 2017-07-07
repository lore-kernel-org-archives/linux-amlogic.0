From: sjg@chromium.org (Simon Glass)
Date: Thu, 6 Jul 2017 21:57:40 -0600
Subject: [PATCH 1/3] arm: dts: meson: import dts files from Linux 4.12-rc6
In-Reply-To: <20170625155511.28447-2-b.galvani@gmail.com>
References: <20170625155511.28447-1-b.galvani@gmail.com>
 <20170625155511.28447-2-b.galvani@gmail.com>
Message-ID: <CAPnjgZ0OQ6837+BLigd6pFo_bpiSWdK4qBxrfgJ35irmhb05Qw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 25 June 2017 at 09:55, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Import Amlogic Meson DTS files from Linux kernel version 4.12-rc6.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/dts/meson-gx.dtsi            |  97 ++++++++++++++++--
>  arch/arm/dts/meson-gxbb-odroidc2.dts  |  82 ++++++++++++++-
>  arch/arm/dts/meson-gxbb.dtsi          | 187 ++++++++++++++++++++++++++++------
>  include/dt-bindings/clock/gxbb-clkc.h |  14 ++-
>  4 files changed, 335 insertions(+), 45 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
