From: sjg@chromium.org (Simon Glass)
Date: Mon, 11 Dec 2017 07:57:41 -0700
Subject: [PATCH 4/4] meson: use the clock driver
In-Reply-To: <20171203091713.22029-5-b.galvani@gmail.com>
References: <20171203091713.22029-1-b.galvani@gmail.com>
 <20171203091713.22029-5-b.galvani@gmail.com>
Message-ID: <CAPnjgZ0uODiA_dje7SSJF3qZhYH=LW1tkCqodPMyxFCukyaxJQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 3 December 2017 at 02:17, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Use the clk framework to initialize clocks from drivers that need them
> instead of having hardcoded frequencies and initializations from board
> code.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/include/asm/arch-meson/gxbb.h | 10 ----------
>  arch/arm/include/asm/arch-meson/i2c.h  | 11 -----------
>  board/amlogic/odroid-c2/odroid-c2.c    |  4 +---
>  board/amlogic/p212/p212.c              |  3 +--
>  drivers/i2c/meson_i2c.c                | 20 +++++++++++++++++---
>  5 files changed, 19 insertions(+), 29 deletions(-)
>  delete mode 100644 arch/arm/include/asm/arch-meson/i2c.h

Reviewed-by: Simon Glass <sjg@chromium.org>
