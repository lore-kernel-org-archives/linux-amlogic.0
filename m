From: webczat_200@poczta.onet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Wed, 28 Dec 2016 16:19:18 +0100
Subject: emmc problems with linux 4.10-rc1
Message-ID: <1c70f4ea-f310-ec70-4a42-ca59da42cc54@poczta.onet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello, it seems there are the following problems with mmc on linux
4.10.0-rc1 or actually the latest master near rc1:
First, attempt to unload the module causes a kernel warning, so the
module is not properly unloadable
Second, I once loaded mmc module first then mmc_block and the kernel
panicked because of a fatal exception in interrupt. I was currently
unable to reproduce the second problem.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 525 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161228/14e83747/attachment.sig>
