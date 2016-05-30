From: trini@konsulko.com (Tom Rini)
Date: Mon, 30 May 2016 13:57:15 -0400
Subject: [U-Boot,v7,1/4] arm: implement generic PSCI reset call for armv8
In-Reply-To: <1462689017-3160-2-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-2-git-send-email-b.galvani@gmail.com>
Message-ID: <20160530175715.GS7419@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 08, 2016 at 08:30:14AM +0200, Beniamino Galvani wrote:

> Add a psci_system_reset() which calls the SYSTEM_RESET function of
> PSCI 0.2 and can be used by boards that support it to implement
> reset_cpu().
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160530/0aaa3a64/attachment.sig>
