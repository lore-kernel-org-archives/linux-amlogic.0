From: trini@konsulko.com (Tom Rini)
Date: Mon, 30 May 2016 13:57:20 -0400
Subject: [U-Boot, v7, 2/4] net: designware: fix descriptor layout and
 warnings on 64-bit archs
In-Reply-To: <1462689017-3160-3-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-3-git-send-email-b.galvani@gmail.com>
Message-ID: <20160530175720.GT7419@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 08, 2016 at 08:30:15AM +0200, Beniamino Galvani wrote:

> All members of the DMA descriptor must be 32-bit, even on 64-bit
> architectures: change the type to u32 to ensure this. Also, fix
> other warnings.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Acked-by: Joe Hershberger <joe.hershberger@ni.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160530/e62f03bf/attachment.sig>
