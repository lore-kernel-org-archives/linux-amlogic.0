Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10495C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7411208C2
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmaudQlZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7411208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d1b8WDYuLDWbyrENMTIR1wnc4azYmACU9rFgkhU0RGM=; b=hmaudQlZe4VgmDCdupnu5YxllU
	GhUnq0hkgYw+a+DKkj+FshXIsviNfdIJ7aiW5OMY25upnewjIlCTBdlnZK8ah7YLFDIeW/F7X0MU4
	AjI3SH7DW9rVcQucRhmlaCDsQYz4nrMcZCeQLfdfJl58SYGI9jUqXstWyKjE9yP5MqdRXnHg0Rjww
	q+GrpyTBRwkMLwGUjD2hekAMqmrkDX8/Tlv/4CE8FfkIGRierR5beoiYht1JS+58yLqBcRDUg0jtU
	dTfyjMzY/7X862GmIR5UHCn1aOOfiHIFr6sapAmGcYT3PXDpDIXDxE4jCRGVygksZdv35eK3J8VN2
	wcAz6b3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpQ-0000yA-Uu; Sat, 27 Apr 2019 12:53:16 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpC-0000cf-05
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:05 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N8XHV-1gh8Cp1oHJ-014PTe; Sat, 27 Apr 2019 14:52:34 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
Date: Sat, 27 Apr 2019 14:51:42 +0200
Message-Id: <1556369542-13247-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:ZsvBvAt/rLDu1xNT1sLalxIcX9jz7QA0qevymQS/WxRCH2zr6Wl
 xgtlPQz+G8tT6HFrUdOePnL/g6Nz/IIjRENpXyf+TYdtSi3HrsJGdjKV+IdrLIpqWKUpGIr
 dGZH3/KAvVSKXLhp+eDtJ5SZp4iM/k7bWZWc3G+D3RpE/VH31kx+tVU+u8Iwg2ZCwcrt7Md
 VmQRsAPpOo0raWOEg8/zQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j2N/FCIfxd4=:bTewDVrnVLOaptDPWAeuYB
 qRyMUvP7ZPhCmHnVLyv7ju+39CHpoR56I6eeSo+QPHPGCZx3Dqb1I60yuGCld7+3VbN8mYQwM
 2ZbCjusuSxTA2+bf+ln2gKOriFRvIYv03fZTu+YI/5yLbx6CSI9l+bTwHEvU0H3ta1wkb3w1G
 M+LRWzsJhzU1D+iabrBiJqQulwdI3SOWT2P39DSrBTgj2TeG0p6nM0OK9s4d0AagkEnaTtFDS
 GvIWfSoCbR2/5PkucHigRUl586888kNEamyG3pD+K1ZnRZUvnQt/2bPJMzgLfbBVnFR2n0rOH
 DsIz1uuQuxZ7xJAdCE1i2GlN5DwfyIfqrtAA5c9XnIO0mqFGZSvMUtg1KOyuRQsHPdH2C4Nkh
 8yh/9sHWREWoAj6h1c/8kcQJwWpF/j89Q7lN01agcyFr3XDqClCzOiVbL/cuH2l5+wBbKl4nd
 gSsSwspQkSoDZm31+uFKkJY6eYFb8qq5u5vRxi5/XyLnlD6Y22WLY90exJLjhzbZ1RBv3msRT
 j5X6PznC/2y4lrGdO5AgaDwAv8zPI5drxxuPiWfijNEnfgb8HX+g/xkSO/S8J4vLbq4psstD7
 q9QxcVenJmTkCoZUZ8DCf0pUWm4fjCG/QmMLXdJHruAEAQLXD/UUAuMqcTlPi/svDYKKsH8aC
 NgqmkYONc/sKFoFcNypfgkXrsyaRmZhIleuG7ABCNJPmKzGwbidMFStX+km4vIUZ/Cnup6GQS
 oGpzEdn60+VNwCX/u7Jnm8SJFhRmTuBbIh4ULA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055302_338848_7908CCD4 
X-CRM114-Status: UNSURE (   9.06  )
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

Using dev_err() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/dz.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index 7b57e84..96e35af 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -416,7 +416,7 @@ static int dz_startup(struct uart_port *uport)
 			  IRQF_SHARED, "dz", mux);
 	if (ret) {
 		atomic_add(-1, &mux->irq_guard);
-		printk(KERN_ERR "dz: Cannot get IRQ %d!\n", dport->port.irq);
+		dev_err(uport->dev, "Cannot get IRQ %d!\n", dport->port.irq);
 		return ret;
 	}
 
@@ -680,7 +680,7 @@ static int dz_map_port(struct uart_port *uport)
 		uport->membase = ioremap_nocache(uport->mapbase,
 						 dec_kn_slot_size);
 	if (!uport->membase) {
-		printk(KERN_ERR "dz: Cannot map MMIO\n");
+		dev_err(uport->dev, "Cannot map MMIO\n");
 		return -ENOMEM;
 	}
 	return 0;
@@ -697,8 +697,8 @@ static int dz_request_port(struct uart_port *uport)
 		if (!request_mem_region(uport->mapbase, dec_kn_slot_size,
 					"dz")) {
 			atomic_add(-1, &mux->map_guard);
-			printk(KERN_ERR
-			       "dz: Unable to reserve MMIO resource\n");
+			dev_err(uport->dev,
+				"Unable to reserve MMIO resource\n");
 			return -EBUSY;
 		}
 	}
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
