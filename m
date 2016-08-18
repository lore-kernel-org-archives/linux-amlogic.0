From: sjg@chromium.org (Simon Glass)
Date: Wed, 17 Aug 2016 21:44:32 -0600
Subject: [PATCH 2/4] arm: dts: update DTS files for meson-gxbb and
 odroid-c2
In-Reply-To: <1471340990-16247-3-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
 <1471340990-16247-3-git-send-email-b.galvani@gmail.com>
Message-ID: <CAPnjgZ0E6i+rCaq-_aGJCFn1KTHfwwpK=kQaD=nAj3-O_o+4Ug@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 16 August 2016 at 03:49, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Import DTS files and dt-bindings includes from Linux 4.8-rc1.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/dts/meson-gxbb-odroidc2.dts               |  19 ++
>  arch/arm/dts/meson-gxbb.dtsi                       | 170 ++++++++++++++++-
>  include/dt-bindings/gpio/meson-gxbb-gpio.h         | 154 +++++++++++++++
>  .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 210 +++++++++++++++++++++
>  4 files changed, 552 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/gpio/meson-gxbb-gpio.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-gxbb-reset.h

Reviewed-by: Simon Glass <sjg@chromium.org>
