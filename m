From: sjg@chromium.org (Simon Glass)
Date: Mon, 20 Nov 2017 21:09:03 -0700
Subject: [PATCH u-boot 2/2] arm: Add Khadas VIM support based on Meson GXL
 family
In-Reply-To: <1511190285-4281-3-git-send-email-narmstrong@baylibre.com>
References: <1511190285-4281-1-git-send-email-narmstrong@baylibre.com>
 <1511190285-4281-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ1vzkGoYSTDw+H=Puy=nXADHXdYxrPatMMtRE-gUT3_RQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 20 November 2017 at 08:04, Neil Armstrong <narmstrong@baylibre.com> wrote:
> This adds platform code for the Khadas VIM board based on a
> Meson GXL (S905X) SoC with the Meson GXL configuration.
>
> This initial submission supports UART, MMC/SDCard and Ethernet with the
> Internal RMII PHY.
>
> The meson-gxl-s905x-khadas-vim.dts is synchronised from the linux 4.13
> stable tree as of 4.13.8.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/dts/Makefile                       |   3 +-
>  arch/arm/dts/meson-gxl-s905x-khadas-vim.dts | 137 ++++++++++++++++++++++++++++
>  arch/arm/mach-meson/Kconfig                 |   9 ++
>  board/amlogic/khadas-vim/Kconfig            |  12 +++
>  board/amlogic/khadas-vim/MAINTAINERS        |   6 ++
>  board/amlogic/khadas-vim/Makefile           |   8 ++
>  board/amlogic/khadas-vim/README             |  96 +++++++++++++++++++
>  board/amlogic/khadas-vim/khadas-vim.c       |  58 ++++++++++++
>  configs/khadas-vim_defconfig                |  35 +++++++
>  include/configs/khadas-vim.h                |  24 +++++
>  10 files changed, 387 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
>  create mode 100644 board/amlogic/khadas-vim/Kconfig
>  create mode 100644 board/amlogic/khadas-vim/MAINTAINERS
>  create mode 100644 board/amlogic/khadas-vim/Makefile
>  create mode 100644 board/amlogic/khadas-vim/README
>  create mode 100644 board/amlogic/khadas-vim/khadas-vim.c
>  create mode 100644 configs/khadas-vim_defconfig
>  create mode 100644 include/configs/khadas-vim.h

Sees like quite a bit of duplication with the previous patch,
including the README. Can you fix this please?

- Simon
