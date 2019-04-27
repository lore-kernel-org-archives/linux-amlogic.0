Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675F9C4321A
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D7521530
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EC0AO4i6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D7521530
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jzzqsXa+76Pp3uohVhg/jdX/SlE/VAx1Xmz5Fie+IfY=; b=EC0AO4i6xZdyzBeopUkLcu7CbO
	GRrvGOno7SQSf+8yPgij99HbC//ngVjNvi/dWTEQsoseTODRenD9mL2uQD9H5nnAzonOEnieHoGg5
	om0EmxJAhmHc4NqQG16qdDMmKJszBSjPZ5BuNfc+QbO5tLIX+ugGLOUWyrh23z5DVft/1eg1XRVjL
	bzCVhdPOrmcp65+AZuaNOy/b2iYpAwoOxy6cZQBquNlmO+GXrVPLKaNGIn5SnV305MRLMzlCi//gg
	nXDm96VY1i9Fy1FLfzN+qqSvL+0xuzXnpaAmhlczzA3LxYoMxqrkhiwhbVX7EzLmc8DWC64zLMqLf
	WUjyqtxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpn-0001Rl-Bb; Sat, 27 Apr 2019 12:53:39 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpE-0000fS-Mt
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:10 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mdvyo-1gklM610Mw-00b6vt; Sat, 27 Apr 2019 14:52:48 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/41] drivers: tty: serial: apbuart: fix logging calls
Date: Sat, 27 Apr 2019 14:51:58 +0200
Message-Id: <1556369542-13247-18-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:74q7QZbgRgRsAUkPp9HoIcby/AiA8t4Mu2TUa7cvirQmdem+3Am
 8EQGnLshuK8zT/JT/rXJ1jMsYvUFcIBhmVWtNocXE1OdQlrcN6zxnc0lOKUkbKlCtWRyBOs
 SfDclKxIBbTDIEFobqRgxh4RYW3wCVdlAW+GkkAV2vRB5P9CXtzp+iTfXlW2e2cAPKtq+p3
 x9rgoBVikwGuHrHXLrrgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eYy4U1g0WLc=:NNFGO3HSiL3iJ9KcFjVqxr
 L5C8Q9zl9SvmSbmk/WXj0EtqOWebYE+T7FuU8NbONX8KrKJZIyetKuuIZvT8JMDBFYYByMJZS
 ZsFYAvVpW3OFJvRwTYlig7Z7pR26iD35iZ9qIWBGrEIbU0eFvBZQ71UaNgyABlpQP25ws5FXx
 zrLsNqdWLdTYHD+VbjQ2gcBFD+6RdC1lVS7GjBn6O6RXVwO/iyuYzHrqd5SEOWYe1mDV/xpcT
 firFlNyM/Y3UYi3z9yFwOZm/mLwOjrKLozqyAUIs5Ee1Dmld6FQR8HBR0gglIETNeESeoBwlk
 j+oqvl9LqtcoRzBeZIaDULJqLJ4PYBQl+ouSd6ruS0W1erDls6LCPPf+9fmou3wGiubPjT5zT
 ZbgpAa+a1FPjCO83yXjVKgwftQDqhNYdtBRkumaxJv167CNq/8HacT+etLB6xjbv0OqTHED+j
 UvHg77KbgPh+lW5z+3aUS+YSda3oF0cX02uC6pzmIguLQ6peLHzvjrLLNo+veCHi5xqdsuTc3
 1tIcr/FtqrUmGyJUAz09ZrsHVYJ13qXd7jVIIkZlpH+9sVbqBaFk0ImoQJTKOflNY7Mfb14LT
 WYOkAkc2qSUAf3D4KAVdI2JRi0lez/a/5/g0MNrh/HEtZiDvSBJaDosnHksn31H+JuOZRTpBV
 XhT4gdKHIwiv+Itmb2O00YCnnIBT4FoF90IGJGwKRMu7AvSI5rBVKeCNSHQbXqFGnfcMvGqVG
 qH3e6Ibc4dkf9y2PyMnfIib4diOFSWqdZxE4aQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055305_286716_6E236CA5 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix checkpatch warnings:

    WARNING: Prefer using '"%s...", __func__' to using 'apbuart_console_setup', this function's name, in a string
    #491: FILE: drivers/tty/serial/apbuart.c:491:
    +	pr_debug("apbuart_console_setup co=%p, co->index=%i, options=%s\n",

    WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
    #661: FILE: drivers/tty/serial/apbuart.c:661:
    +	printk(KERN_INFO "Serial: GRLIB APBUART driver\n");

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #666: FILE: drivers/tty/serial/apbuart.c:666:
    +		printk(KERN_ERR "%s: uart_register_driver failed (%i)\n",

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #673: FILE: drivers/tty/serial/apbuart.c:673:
    +		printk(KERN_ERR

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/apbuart.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/apbuart.c b/drivers/tty/serial/apbuart.c
index 60cd133..d2b86f7 100644
--- a/drivers/tty/serial/apbuart.c
+++ b/drivers/tty/serial/apbuart.c
@@ -482,8 +482,8 @@ static int __init apbuart_console_setup(struct console *co, char *options)
 	int parity = 'n';
 	int flow = 'n';
 
-	pr_debug("apbuart_console_setup co=%p, co->index=%i, options=%s\n",
-		 co, co->index, options);
+	pr_debug("%s() co=%p, co->index=%i, options=%s\n",
+		 __func__, co, co->index, options);
 
 	/*
 	 * Check whether an invalid uart number has been specified, and
@@ -650,21 +650,20 @@ static int __init grlib_apbuart_init(void)
 	if (ret)
 		return ret;
 
-	printk(KERN_INFO "Serial: GRLIB APBUART driver\n");
+	pr_info("Serial: GRLIB APBUART driver\n");
 
 	ret = uart_register_driver(&grlib_apbuart_driver);
 
 	if (ret) {
-		printk(KERN_ERR "%s: uart_register_driver failed (%i)\n",
-		       __FILE__, ret);
+		pr_err("%s: uart_register_driver failed (%i)\n",
+		       __func__, ret);
 		return ret;
 	}
 
 	ret = platform_driver_register(&grlib_apbuart_of_driver);
 	if (ret) {
-		printk(KERN_ERR
-		       "%s: platform_driver_register failed (%i)\n",
-		       __FILE__, ret);
+		pr_err("%s: platform_driver_register failed (%i)\n",
+		       __func__, ret);
 		uart_unregister_driver(&grlib_apbuart_driver);
 		return ret;
 	}
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
