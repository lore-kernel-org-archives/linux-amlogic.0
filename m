From: sjg@chromium.org (Simon Glass)
Date: Thu, 6 Jul 2017 21:57:44 -0600
Subject: [PATCH 2/3] pinctrl: meson: add GPIO support
In-Reply-To: <20170625155511.28447-3-b.galvani@gmail.com>
References: <20170625155511.28447-1-b.galvani@gmail.com>
 <20170625155511.28447-3-b.galvani@gmail.com>
Message-ID: <CAPnjgZ0FD_Yoyo1ASuSw=73=B3t=Sge3Od1qbK62K9fvFaoPpw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 25 June 2017 at 09:55, Beniamino Galvani <b.galvani@gmail.com> wrote:
> This commit adds GPIO support to the Amlogic Meson pin controller
> driver, based on code from Linux kernel.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  21 ++++
>  drivers/pinctrl/meson/pinctrl-meson.c      | 167 ++++++++++++++++++++++++++++-
>  drivers/pinctrl/meson/pinctrl-meson.h      |  63 +++++++++++
>  3 files changed, 249 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

You might want to consider supporting livetree with new drivers.
