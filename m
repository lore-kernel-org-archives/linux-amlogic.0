From: sjg@chromium.org (Simon Glass)
Date: Wed, 18 May 2016 21:59:34 -0600
Subject: [PATCH v7 2/4] net: designware: fix descriptor layout and
 warnings on 64-bit archs
In-Reply-To: <1462689017-3160-3-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <1462689017-3160-3-git-send-email-b.galvani@gmail.com>
Message-ID: <CAPnjgZ1FVKBe_jVBwhpLuXTXzing9ubVi1mEe0HGy7fzczEq0g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 8 May 2016 at 00:30, Beniamino Galvani <b.galvani@gmail.com> wrote:
> All members of the DMA descriptor must be 32-bit, even on 64-bit
> architectures: change the type to u32 to ensure this. Also, fix
> other warnings.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Acked-by: Joe Hershberger <joe.hershberger@ni.com>
> ---
>  drivers/net/designware.c | 59 ++++++++++++++++++++++++++----------------------
>  drivers/net/designware.h |  4 ++--
>  2 files changed, 34 insertions(+), 29 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
