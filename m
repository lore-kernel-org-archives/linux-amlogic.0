Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5CAC61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsfVQm8hEBPHcxPCGnhj89+1vsPnSBFdR3harCmVYio=; b=Xan0CN5F1Dj+cw
	iX3wg9wCvbSP8jn0BpT8gH5gPomGzbQ+VtjTfORRjrMcz0s7kqEJfIR0uTIRxTspbbUEXEMNI0Z3c
	G7ddqd7M0jLTMTta7uc0ZdqwexsPDUfJtK0v2Kofq/0GRU1jyS/cdVoCaZTpX9N25RuMElVugtFcV
	ME7ylDJlguhcMyYN/Qcny/bMUgKuCSd6S+VyeSJsUd2ZVPQJB8dDbsF05qeDBXzwmspszWkR6PIyo
	3ejEI+OOtY/xvtawx2e3vnG4OYKR3c0AbsrmUAR+kXWKnTbFjb8KzuP/UU23TBBKucEdvYaOZL3/a
	yftalZAHtKVMnriGwhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6boe-007wT3-0U;
	Fri, 24 Nov 2023 19:26:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bob-007wSW-2I;
	Fri, 24 Nov 2023 19:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02149623D8;
	Fri, 24 Nov 2023 19:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAFDC433C8;
	Fri, 24 Nov 2023 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700853972;
	bh=5HUemzTQGbVWrGf98L/LO4HohLBkfwLmSmfjFpaSAUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gwQ4RUPbtzye0EtHJh+IPLp+kIcpvJIfY+G1ticRJkeLA2/3nJiWcWumOK5Nfhtgz
	 dXqevbJ/LxndynzS6UNlMiPlg/U/pTlo7rFCOe7BE9zchz09Gn6hV/YoEiMmCDA1Ij
	 peDf7BikHyxAJHFR8dJ0cI65ZjSny0PeXb+JQb14=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Dmitry Safonov <dima@arista.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.4 105/159] tty/serial: Migrate meson_uart to use has_sysrq
Date: Fri, 24 Nov 2023 17:55:22 +0000
Message-ID: <20231124171946.255482138@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124171941.909624388@linuxfoundation.org>
References: <20231124171941.909624388@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_112613_791701_D25BD194 
X-CRM114-Status: GOOD (  11.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

5.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dmitry Safonov <dima@arista.com>

[ Upstream commit dca3ac8d3bc9436eb5fd35b80cdcad762fbfa518 ]

The SUPPORT_SYSRQ ifdeffery is not nice as:
- May create misunderstanding about sizeof(struct uart_port) between
  different objects
- Prevents moving functions from serial_core.h
- Reduces readability (well, it's ifdeffery - it's hard to follow)

In order to remove SUPPORT_SYSRQ, has_sysrq variable has been added.
Initialise it in driver's probe and remove ifdeffery.

Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
Link: https://lore.kernel.org/r/20191213000657.931618-22-dima@arista.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Stable-dep-of: 2a1d728f20ed ("tty: serial: meson: fix hard LOCKUP on crtscts mode")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/meson_uart.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 849ce8c1ef392..4c3616cc00833 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -5,10 +5,6 @@
  * Copyright (C) 2014 Carlo Caione <carlo@caione.org>
  */
 
-#if defined(CONFIG_SERIAL_MESON_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
-#define SUPPORT_SYSRQ
-#endif
-
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/delay.h>
@@ -716,6 +712,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->mapsize = resource_size(res_mem);
 	port->irq = res_irq->start;
 	port->flags = UPF_BOOT_AUTOCONF | UPF_LOW_LATENCY;
+	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MESON_CONSOLE);
 	port->dev = &pdev->dev;
 	port->line = pdev->id;
 	port->type = PORT_MESON;
-- 
2.42.0




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
