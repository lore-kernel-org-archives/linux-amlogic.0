Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0895FC4321A
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC202087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4+lG+eM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEC202087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uqDElhZEE1PJXCpNS8MTYlWdUXyS0ZCMyugVU/QXJ+c=; b=s4+lG+eMhP9Gbx3tTdC/xfdSdD
	AYJgQmXZ3eb6p5/mCdD1cBeRZi05mm7g5BEq4Zg0OnLfBsQKf2vZtQZnBM8XlX6C5cC89h4M8zLNK
	WbjywI+b6BdTORocl4f/gdph0F6ug2/hnFdSXJRXDpqM3PuGhPewG7AHZ1k8t67zgeMyjMY9ir2yr
	lX1aiz5eskKg5hR+NOeWCJAQErvbFNG4GnMXYrqazWS9tq2c7Bs3K6OlVKxnpkCd8N4op5mRazAbR
	ZIKU75jqNAtjSUfWd5lrILReC+omlwk2HvWB3hi/DJDECUaZF69/MKY4ZgCY7jk4xuqK4ptizNkL8
	twWeJOLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMq8-0001z3-Lu; Sat, 27 Apr 2019 12:54:00 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpO-0000s4-8F
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:22 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVNF1-1hBGYO2EDP-00SLNE; Sat, 27 Apr 2019 14:52:59 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 30/41] drivers: tty: serial: ioc4_serial: use dev_warn()
 instead of printk()
Date: Sat, 27 Apr 2019 14:52:11 +0200
Message-Id: <1556369542-13247-31-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:feZjQEPGewpWSo2bykBkAQkXP9Lb/ZtVsJ70Hc9aX4own7v09FA
 e65s7fBpQb+RWeo/XsvBCLQDRKkUOdSWYbg6QCmXdWbNheYrxgq5Ys1L3nrokeJAVzT8JZ+
 6QZ7hrXczsjiQ2m1ogHA/r87Uy8zuLwqRpXTsIxH63Kg2ZR+GURXbvN2XWzuqCWUQaBZhlg
 o8S6PJbm8wTsqW6D1wobQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8TG/EySvt9A=:VKahn7CYd/R5vatknv4CIz
 CuHG0PZc2i5j9rVD60N2maMJL4Ee3r65/zW8DaiDk+zAPuKZD49EeMp7iaffcOumkyFaqiM8t
 +luCUaXSLZIf7RHuNFPwRYcBWNJ43cJi7sjf0EHHDGmub/EKExgGhgCrjEfa0v+n+448YXMgE
 lGF3w6/V6Mgt1QZ5pNXeWF0kTQsNJjAb7Y4RqIw7ZbAc+O3V+I9zXf7nSK2JbDaCL8Him2L7f
 l8QQc+xgVlpNQR0jiD9vdU52hQtY39fI4sqfbvjUsfJnu4SqVjwhNe4jH1PXOZTv5gTw84KBZ
 NkibSYlQFV3awhW8T9jAFhE9jtPnkYU0Vs7Ac1Oe4MMGZFJvBTZRRyNkitSl8XQbZ1WJfAlbB
 QS1OAIo9avolslFua/Nuq/y/iOLsNuT9C2ZFuqk4vJzoHfqjcS7qf3z/aagtWWj2Cq7D07Jvt
 HRLmuFLEuheS+vbBf2jp8nw1xQnRmOgDpcdn5L0cxoJx5Y57gx7DwS6uPN2nKaFxix4vbFLNZ
 AfH6XBWoj2lDLI2NKOg+owgscan6/eCmalRceowjyuyrdih0blP0ytyJ94NiELQlWc6HPoOGw
 OFryiG/2U3f/JVqdBhE2/2V0LKzJG1PwuuFYf5G3HVrAhwcwAJIDkFusy40yS4hP/fLgStVPA
 +nzeqpksFBXQvdpgCQwJ1DcGyWuv+kODQ2uT2nLMPRKYF2bVBXURnsDyBNucI4/XBJ4wnPMl7
 6d+ueE0QRBCjWMFi9IaYeMV9hXPhSTm8QIcgHQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055315_253183_ED4E1B45 
X-CRM114-Status: UNSURE (   9.90  )
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

Using dev_warn() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/ioc4_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ioc4_serial.c b/drivers/tty/serial/ioc4_serial.c
index db5b979..21c1b8f 100644
--- a/drivers/tty/serial/ioc4_serial.c
+++ b/drivers/tty/serial/ioc4_serial.c
@@ -2752,7 +2752,7 @@ static int ioc4_serial_remove_one(struct ioc4_driver_data *idd)
 		the_port->dev = &pdev->dev;
 		spin_lock_init(&the_port->lock);
 		if (uart_add_one_port(u_driver, the_port) < 0) {
-			printk(KERN_WARNING
+			dev_warn(&pdev->dev,
 		           "%s: unable to add port %d bus %d\n",
 			       __func__, the_port->line, pdev->bus->number);
 		} else {
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
