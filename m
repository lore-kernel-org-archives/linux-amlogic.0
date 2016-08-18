From: sjg@chromium.org (Simon Glass)
Date: Wed, 17 Aug 2016 21:44:39 -0600
Subject: [PATCH 3/4] pinctrl: add driver for meson-gxbb pin controller
In-Reply-To: <1471340990-16247-4-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
 <1471340990-16247-4-git-send-email-b.galvani@gmail.com>
Message-ID: <CAPnjgZ1xodtCYyaR7O5KgKqzTbRkMg+76S3jnmRoTQGp26Zm=A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 16 August 2016 at 03:49, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Add a pin controller driver for Meson GXBB adapted from Linux kernel.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  drivers/pinctrl/Kconfig                    |   1 +
>  drivers/pinctrl/Makefile                   |   1 +
>  drivers/pinctrl/meson/Kconfig              |  11 +
>  drivers/pinctrl/meson/Makefile             |   6 +
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 432 +++++++++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.c      | 179 ++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.h      |  74 +++++
>  7 files changed, 704 insertions(+)
>  create mode 100644 drivers/pinctrl/meson/Kconfig
>  create mode 100644 drivers/pinctrl/meson/Makefile
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gxbb.c
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson.c
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson.h

Reviewed-by: Simon Glass <sjg@chromium.org>
