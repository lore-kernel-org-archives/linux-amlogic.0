From: sjg@chromium.org (Simon Glass)
Date: Mon, 11 Dec 2017 07:57:38 -0700
Subject: [PATCH 3/4] clk: add Amlogic meson clock driver
In-Reply-To: <20171203091713.22029-4-b.galvani@gmail.com>
References: <20171203091713.22029-1-b.galvani@gmail.com>
 <20171203091713.22029-4-b.galvani@gmail.com>
Message-ID: <CAPnjgZ0rsi8kY2mSZtjRy4CTbDRj6fpx=8Y9G-x3pKXdbMsrLQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Benjamin,

On 3 December 2017 at 02:17, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Introduce a basic clock driver for Amlogic Meson SoCs which supports
> enabling/disabling clock gates and getting their frequency.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/mach-meson/Kconfig |   2 +
>  drivers/clk/Makefile        |   1 +
>  drivers/clk/clk_meson.c     | 196 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 199 insertions(+)
>  create mode 100644 drivers/clk/clk_meson.c

Reviewed-by: Simon Glass <sjg@chromium.org>
