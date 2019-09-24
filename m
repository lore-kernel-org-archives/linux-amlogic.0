Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7102C432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 16:50:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0B8222C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 16:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hPpFrXS8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CR554ori"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0B8222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmkgGxpqgbBWI4nIzqaEaawvgppsQTX5rlNDwvQGW2o=; b=hPpFrXS8NS5WBA
	dYpo77bVOoZCiOjZ0ai5Ui+cEwJCJCbGvm+Y2YKN0Vo8KNXquKA+w31Oe+sB099wIdgkj/8Vcnryh
	nA7loEd1RlGoX2tq+sivSk6eETXlo/Y/xoRmH9IEVel5PuOF9sEG/n/gjSZCERRU5q1nSF2p0gugi
	sPZ1sv0sOw36Lk3N1LIFph3zvJjnrOAT/ObwklFQcMQ+x8VtA/N2/EI1k4UM6F7+dxsMye4ERmCpr
	yHEUsQtvcrF37RIiTA+kGSvu6wuQLrbMIQTB82j2I3WuyacSsgAG4y0+D4zHt89x9WdqLpzU0hS3p
	bxISQjDYyH+xJT5krSJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCo1H-0000GD-5Y; Tue, 24 Sep 2019 16:50:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCo11-00007Z-Mn
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 16:50:17 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BDE221D82;
 Tue, 24 Sep 2019 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343814;
 bh=X83HWbTqofVal5zxoKrVPyIEsOibVmg3PU1ULh3YdLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CR554ori/7xMiBb/O0K56qbvd+kK/9sBwok56zG9ks4DqB4PFSE0aALIFz2YceDkB
 6xDWuFe6yiVin9ql+I019v9nBwGPDJoNMJZNj7qUB2YOz8/nXaAUrIPNpFnNTc7FZ1
 3iqTmuCXhWTWrHgwPNP4U7REmfsVLiyDXie2AFDo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 42/50] pinctrl: meson-gxbb: Fix wrong pinning
 definition for uart_c
Date: Tue, 24 Sep 2019 12:48:39 -0400
Message-Id: <20190924164847.27780-42-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_095016_082958_0820E524 
X-CRM114-Status: UNSURE (   9.26  )
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
index 4edeb4cae72aa..c4c70dc57dbee 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -198,8 +198,8 @@ static const unsigned int uart_rts_b_pins[]	= { GPIODV_27 };
 
 static const unsigned int uart_tx_c_pins[]	= { GPIOY_13 };
 static const unsigned int uart_rx_c_pins[]	= { GPIOY_14 };
-static const unsigned int uart_cts_c_pins[]	= { GPIOX_11 };
-static const unsigned int uart_rts_c_pins[]	= { GPIOX_12 };
+static const unsigned int uart_cts_c_pins[]	= { GPIOY_11 };
+static const unsigned int uart_rts_c_pins[]	= { GPIOY_12 };
 
 static const unsigned int i2c_sck_a_pins[]	= { GPIODV_25 };
 static const unsigned int i2c_sda_a_pins[]	= { GPIODV_24 };
@@ -445,10 +445,10 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
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
