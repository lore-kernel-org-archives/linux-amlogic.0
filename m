Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571EAC432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 16:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C39121906
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 16:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="edC64NYP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cv0XICaL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C39121906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWNgosEkHHlpdS5KLANMpEOLYHd9X1XZx8D/PrehYCk=; b=edC64NYPNbd758
	Y6zWDJ1/QtJwF5+vCvUQeYzvipmtwgFqVMlr4nq7k96qaUHFRfLPQZbhkIrJ31jJMA7dRosuYJhw6
	vZaV7yeOrDuZyvQc2hKjsPnurMyTpihDCqTwWZy+1G4gOGBMXqx8eqcmuLGQTp2bg8ceY1dv4BH2m
	ON1xhPEtQBkiFlsifGN4E4kRLZbypi3pWEVI4Je5NzWKrDP+6s7BcqpnMseA/9Jm4/DYa2ERoLwZG
	0ekdvDBHy5y3aqpS1Cq628shCwygURZYOn1uzt2AE0cUmK+Ty48xwfgGk8WFMUxx3s0Hco2bQO17H
	/P5iOT3/U6CvIJIBcfSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCnz0-0006w5-Bi; Tue, 24 Sep 2019 16:48:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCnyx-0006vh-5g
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 16:48:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2125A21906;
 Tue, 24 Sep 2019 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343686;
 bh=PWhTwKba2ZSNQzRTJqTmC99Bkw2ToZ0yxWIRCb0nwZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cv0XICaLbpisycWJLyMf55Vm7a3Knhj3pXgwYL3I+CIOAUqvXQDo6RjGVff/Ez1Wb
 RTwaQJbr9Ow2VcIwpID68gs02oUj+54Nl3zggGJ+9eoddhtyUxRh+fJ2X96p0bQ6mh
 TZYKjzQBmUTBWYdN7w3V7F2eBtnd7iwyBHjOGZnQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 56/70] pinctrl: meson-gxbb: Fix wrong pinning
 definition for uart_c
Date: Tue, 24 Sep 2019 12:45:35 -0400
Message-Id: <20190924164549.27058-56-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_094807_236178_EB01F6C6 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-amlogic@lists.infradead.org,
 Otto Meier <gf435@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Otto Meier <gf435@gmx.net>

[ Upstream commit cb0438e4436085d89706b5ccfce4d5da531253de ]

Hi i tried to use the uart_C of the the odroid-c2.

I enabled it in the dts file. During boot it crashed when the
the sdcard slot is addressed.

After long search in the net i found this:

https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856

After changing the pin definitions accordingly erverything works.
Uart_c is functioning and sdcard ist working.

Fixes: 6db0f3a8a04e46 ("pinctrl: amlogic: gxbb: add more UART pins")
Signed-off-by: Otto Meier <gf435@gmx.net>
Link: https://lore.kernel.org/r/1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 6c640837073ef..5bfa56f3847ef 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -192,8 +192,8 @@ static const unsigned int uart_rts_b_pins[]	= { GPIODV_27 };
 
 static const unsigned int uart_tx_c_pins[]	= { GPIOY_13 };
 static const unsigned int uart_rx_c_pins[]	= { GPIOY_14 };
-static const unsigned int uart_cts_c_pins[]	= { GPIOX_11 };
-static const unsigned int uart_rts_c_pins[]	= { GPIOX_12 };
+static const unsigned int uart_cts_c_pins[]	= { GPIOY_11 };
+static const unsigned int uart_rts_c_pins[]	= { GPIOY_12 };
 
 static const unsigned int i2c_sck_a_pins[]	= { GPIODV_25 };
 static const unsigned int i2c_sda_a_pins[]	= { GPIODV_24 };
@@ -439,10 +439,10 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GROUP(pwm_f_x,		3,	18),
 
 	/* Bank Y */
-	GROUP(uart_cts_c,	1,	19),
-	GROUP(uart_rts_c,	1,	18),
-	GROUP(uart_tx_c,	1,	17),
-	GROUP(uart_rx_c,	1,	16),
+	GROUP(uart_cts_c,	1,	17),
+	GROUP(uart_rts_c,	1,	16),
+	GROUP(uart_tx_c,	1,	19),
+	GROUP(uart_rx_c,	1,	18),
 	GROUP(pwm_a_y,		1,	21),
 	GROUP(pwm_f_y,		1,	20),
 	GROUP(i2s_out_ch23_y,	1,	5),
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
