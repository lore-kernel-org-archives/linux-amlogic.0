Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AAFC43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2307C20C01
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J1AgzpGs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2307C20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5w3r2Ub5Z4l4WOcVKoy8mr2TRBwmoCfzfOuE8PHLHhg=; b=J1AgzpGsN5QhDyRWkXMTVhTvYq
	YyVVFidPJRdxpBarwMxjC+volYt7RZR+jAxpCcSJtchl2tkZjGMM6O580xRsRPcp9x6UiROr3zMjy
	XgdNamIHzgebHIOlDcGkM8JsIPB75pRyQ507J1x0sVTtO62kdR6hlkRL8i188UxGqIkTP7J43cnDu
	oe/f36qxL3dhuvskjUI30SXpDRV/omiA9RWEFNSADUiTdbeznafcTcQDeVkpTlnq0Rlbjvdk2zib1
	+Ym9aT/iu2RWdUVgQ9tXP57JrPYph8fLHR+i5a+KBHP5C5owoQtwJuJZvwpFRmSntpe+pcmH9jFPA
	bB/WDBwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpb-0001Ef-Kq; Sat, 27 Apr 2019 12:53:27 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpC-0000dA-Gu
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:08 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MdeSn-1glaAQ1CHx-00ZjUI; Sat, 27 Apr 2019 14:52:47 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/41] drivers: tty: serial: uartlite: fix overlong lines
Date: Sat, 27 Apr 2019 14:51:57 +0200
Message-Id: <1556369542-13247-17-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Ck93dTfp9+M+xebhyVSLDIJuo4MjSGOjDhbkWBRUIflN7U9qSCe
 pUde8jE0w5A43JR5NuYza+AsYcjHeRQdVwFH5DfzOGQOqRZzgRch+fJcKukuNGfeEOytvZR
 5/10Xwz0fpHNGToPKDV3mQbY+HwaGvDTud8ym7VEBca8ousV2I6zja+sNCKPIsmKUiAW4+V
 hJqAZT0gvkBV1/kztVb2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lFLVA5ANqXA=:+nwoqH7LETA5l4ZD6Cy0by
 9QQxF9w7JwL9dfUQLkTSklNQAm9TDaWBKAb/AK8KrfiMTcGzLt9Ee5RiujQGuJAuFYCa25OaW
 PsRCxkE462T85gSy8Pd/1exhcYQsoX46KyLQ4ZKSeHvVV8tbKS/OwkFfGrRHmBQ8UlBeXLZK5
 ebF4s0a/Z8QgHeSqLp8Mld3p8Su8UoV9Y8qvT6GUpcFbwp930569alSTM8wqnyrp9aFJ3bviY
 wC6Tzx19GZ9/leyIqE3JEmv02FWM4Ec4A6QWgiqsopsuDAzIuR2eWi4DxrYaPHzxccOjVXhW2
 RfH12CPwxeEkAGqjze7Djw/S5IYL86ng+BscK9UV3x0uudrqH2DvL3151YkbTo13FkHwqeNnW
 DIe1MAVVKDPOOe4QN7noYVLhRj71YKuN4gMT/LJ+u880TUoLEHCWMILbm5ZFZyvlzBG6K47hU
 9N57YDdSPilc+UdCPlSqXcQ4hJByXjZkI6wRREnTfmyit5sfL61G8Cy9lTvJngnoKEflZ/q/D
 +VkFl7qZhum7WEPeks7u2yKFDTGflXCZYn2mA1tQq+cnqN0OJ85RJZpWS9w6/wqjPbVQmeHnX
 K1uOze3TXyWYC56Tqwpenyo+uVz9fCc59R4P6VjWRvoYFvUN2alVsNGhQFk7qhdBWZ+GW9efn
 J+EJarUbpowxoppGXDdCKd50A08hfJxVUT6cLO8NZbGm/sKEm6hc8cXIke/czqdZS6Z34iUaH
 iiO7jtF61oWxoOCw5a6wqJbKewrFO8VHKUZg/A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055302_897706_1F19B84E 
X-CRM114-Status: UNSURE (   9.92  )
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

    WARNING: line over 80 characters
    #283: FILE: drivers/tty/serial/uartlite.c:283:
    +	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,

    WARNING: Missing a blank line after declarations
    #577: FILE: drivers/tty/serial/uartlite.c:577:
    +	struct earlycon_device *device = console->data;
    +	uart_console_write(&device->port, s, n, early_uartlite_putc);

    WARNING: line over 80 characters
    #590: FILE: drivers/tty/serial/uartlite.c:590:
    +OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b", early_uartlite_setup);

    WARNING: line over 80 characters
    #591: FILE: drivers/tty/serial/uartlite.c:591:
    +OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a", early_uartlite_setup);

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/uartlite.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 6f79353..0140cec 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -280,7 +280,8 @@ static int ulite_startup(struct uart_port *port)
 		return ret;
 	}
 
-	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,
+	ret = request_irq(port->irq, ulite_isr,
+			  IRQF_SHARED | IRQF_TRIGGER_RISING,
 			  "uartlite", port);
 	if (ret)
 		return ret;
@@ -574,6 +575,7 @@ static void early_uartlite_write(struct console *console,
 				 const char *s, unsigned int n)
 {
 	struct earlycon_device *device = console->data;
+
 	uart_console_write(&device->port, s, n, early_uartlite_putc);
 }
 
@@ -587,8 +589,10 @@ static int __init early_uartlite_setup(struct earlycon_device *device,
 	return 0;
 }
 EARLYCON_DECLARE(uartlite, early_uartlite_setup);
-OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b", early_uartlite_setup);
-OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a", early_uartlite_setup);
+OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b",
+		    early_uartlite_setup);
+OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a",
+		    early_uartlite_setup);
 
 #endif /* CONFIG_SERIAL_UARTLITE_CONSOLE */
 
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
