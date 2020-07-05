Return-Path: <SRS0=0hhE=AQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96E9C433DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 09:28:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B547E2075B
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 09:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eJpCsDUe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvSZGSBt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B547E2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0x9QcRJmu6y8NxXRW+gFi41+Q6kksC2sKdCzLx5zHAM=; b=eJpCsDUeoR7GPewjzo/XFrQWmY
	oRCPbmdynAzFRW4BsTQ34oWGmV3i9030molYhlnm/KmbGyOmTkpubSERRB4d8VEyIXLdHorPuQJTW
	+o/yWDbF/HJjhcebdO0AfxNM9TOQIP/9H0XoDUIIHUjEB1DWJbpl/K0ZUvPyz8klHwwu659CIhx/Y
	EqNCitFg5jQxs8986W7tyGulh8YLvqnG9XJTGv7zQQxjJ6GVZMVXSBbtoMqq/I9WB71jJEtQJxShf
	2rKelA4MdcUhDAsPSMvodvR0gggPBHpVfXrXweP2iR/irxkdC/4dbFTmXut2N99KE6a7iB0fLl/Ku
	oNE4e/rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js0wH-0004Y7-Vd; Sun, 05 Jul 2020 09:27:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js0wF-0004Xl-9G
 for linux-amlogic@lists.infradead.org; Sun, 05 Jul 2020 09:27:56 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4055B2075B;
 Sun,  5 Jul 2020 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593941274;
 bh=cwT/z4X9FKhRShGYr7Xo1xaeCkNEqrqHebtQK3v592g=;
 h=From:To:Cc:Subject:Date:From;
 b=UvSZGSBtbceq5CP+GEMr6b3VXwaWm6XG5Nouf8q5iFEcisyaEgjfwgNjfLO3tt+rB
 PLl/F1qFrEsEaHM1Kc8ns6pRS3IfQEphXEVuhRit8vpCNfU7cKgQrkWOFY5IgnnwUg
 HpKRQa5TayPt1iDyzVY71YAclQd/EHai1FeQobFo=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=hot-poop.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1js0wC-0099WP-Dx; Sun, 05 Jul 2020 10:27:52 +0100
From: Marc Zyngier <maz@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH] tty: serial: meson_uart: Init port lock early
Date: Sun,  5 Jul 2020 10:27:36 +0100
Message-Id: <20200705092736.1030598-1-maz@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: gregkh@linuxfoundation.org, khilman@baylibre.com,
 linux-serial@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 andriy.shevchenko@linux.intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_052755_715721_6FF3CD6C 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The meson UART driver triggers a lockdep splat at boot time, due
to the new expectation that the driver has to initialize the
per-port spinlock itself.

It remains unclear why a double initialization of the port
spinlock is a desirable outcome, but in the meantime let's
fix the splat.

Fixes: a3cb39d258ef ("serial: core: Allow detach and attach serial device for console")
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/tty/serial/meson_uart.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index d2c08b760f83..386e39c90628 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -759,6 +759,9 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Init the spinlock early in case this is the console */
+	spin_lock_init(&port->lock);
+
 	port->iotype = UPIO_MEM;
 	port->mapbase = res_mem->start;
 	port->mapsize = resource_size(res_mem);
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
