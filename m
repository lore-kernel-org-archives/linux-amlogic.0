From: sjg@chromium.org (Simon Glass)
Date: Mon, 27 Nov 2017 10:09:59 -0700
Subject: [PATCH 3/4] i2c: meson: fix return codes on error
In-Reply-To: <20171126164057.27728-4-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
 <20171126164057.27728-4-b.galvani@gmail.com>
Message-ID: <CAPnjgZ3LnseRyKEF2Lh4SDS_S_RbR1H4DTiFN=XPWNfip4aJ3Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 26 November 2017 at 09:40, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Change meson_i2c_xfer_msg() to return -EREMOTEIO in case of NACK, as
> done by other drivers. Also, don't change the return error in
> meson_i2c_xfer().
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  drivers/i2c/meson_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
