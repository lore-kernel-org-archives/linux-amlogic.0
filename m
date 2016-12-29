From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Dec 2016 10:04:30 +0100
Subject: emmc problems with linux 4.10-rc1
In-Reply-To: <1c70f4ea-f310-ec70-4a42-ca59da42cc54@poczta.onet.pl>
References: <1c70f4ea-f310-ec70-4a42-ca59da42cc54@poczta.onet.pl>
Message-ID: <c36847da-2f19-f18b-1569-e44e0873d15c@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 12/28/2016 04:19 PM, Micha? Zegan wrote:
> Hello, it seems there are the following problems with mmc on linux
> 4.10.0-rc1 or actually the latest master near rc1:
> First, attempt to unload the module causes a kernel warning, so the
> module is not properly unloadable
> Second, I once loaded mmc module first then mmc_block and the kernel
> panicked because of a fatal exception in interrupt. I was currently
> unable to reproduce the second problem.
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

Hi,

could you provide some console logs ?
Those statements won't help us until we have some proper kernel messages,
current kernel config, kernel exact version and way for use to reproduce the issue.

Thanks,
Meil

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161229/89f8b5e9/attachment.sig>
