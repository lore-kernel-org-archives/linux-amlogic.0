From: sjg@chromium.org (Simon Glass)
Date: Wed, 17 Aug 2016 21:44:42 -0600
Subject: [PATCH 4/4] meson: odroid-c2: enable Ethernet support through the
 device tree
In-Reply-To: <1471340990-16247-5-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
 <1471340990-16247-5-git-send-email-b.galvani@gmail.com>
Message-ID: <CAPnjgZ2tiuvJKd2dE6nuitSNFosX36x2KD4ZN4V7+S=StwgnBw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 16 August 2016 at 03:49, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Remove the device definition from board file, update the driver with
> the new compatible property and update config with necessary options.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/include/asm/arch-meson/gxbb.h |  3 ---
>  board/amlogic/odroid-c2/odroid-c2.c    | 13 -------------
>  configs/odroid-c2_defconfig            |  3 +++
>  drivers/net/designware.c               |  1 +
>  4 files changed, 4 insertions(+), 16 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
