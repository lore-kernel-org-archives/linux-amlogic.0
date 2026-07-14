Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0160DC44508
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 02:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yln3Dc4OSXVelNNHWsN49PQwpaw/XCN+ZI0pTvNOGZU=; b=SgmV3BrMEQI6sZ
	D4Nh786KbVOnHMlqUn5k2hWChY8gZLSi7tnOHq/BQLUvksgXbaF2SpvD2NgUhHC3sMzkP922kBaTD
	mhLM22wnH3DHY18mmc/+SsQJ5LcPFe4TE0QKZHWS5zyy6lhSpykBKH13Kwiy6IRDw5G4fOjx8FBPU
	ojVdL0Lrnungn5K66KlFgbbUd4TFcGw3kBXoVzoljfzhGUFVWOztXQGm5vtKEHeTeujxG+EcCGI7W
	6BbqTcjhLEfeYE1MYx7oQAnZKA491FxP1zvwX8r4og97nbAaUcOxXQgcM2FrbS3DaOmwKz8DknHUF
	slkotSqqUI4vkapFW97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSy1-0000000AkYm-2RYc;
	Tue, 14 Jul 2026 02:33:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSy0-0000000AkY2-2fAS;
	Tue, 14 Jul 2026 02:33:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 123B3438B2;
	Tue, 14 Jul 2026 02:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFCFAC2BCFA;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783996429;
	bh=Cc2E8akdH+G5Ofl/remAcjKjYApuWhW2x/f3uTajPuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H59li8ok4tiFunnxa4tG9snaRifC+sEGMzcMkH2/4i3gTE7zNXMLNNviQv0PclRJZ
	 /oo+Ssq090YehgYuAH/VvXebRuoJOjXj4WUAS2h7pp28ISMZNw28Mm0xkqpuL6D+M8
	 tartUMHAVBbS6GhfMpkOVL9i67PTSm78L4o8qe6ilgDKyVLeFFFFDp2nNFf78Fnr74
	 IrsJkYFw7Rt+G1uFUpsFRdyvRctHTqLCOdrktMeyuqQb7JFu63NbCiOXjKZ/5/uwI0
	 EuT35MQZBnKD0qWjcbYkSUybKBmpGkg8qztuYkLrW+NZhhLK6d1gV2S+a9TXaxeEj3
	 htrbXlz+745vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87E1C44508;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 14 Jul 2026 02:33:38 +0000
Subject: [PATCH v2 2/3] reset: amlogic: Add A9 AO reset controller support
MIME-Version: 1.0
Message-Id: <20260714-a9-reset-v2-2-8df09b2f437c@amlogic.com>
References: <20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com>
In-Reply-To: <20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783996426; l=1414;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=patSBH/uW6tkb/H97P+dDOJPShFdk5yhMtjXp5whRlQ=;
 b=NzNlMu/pu5V818kQROdNXv7hNpXwIZw76LRmleTeG468QP215WMLszurs+aWDFjqgc4t7Ef0M
 vv9DVuRDPXFAarjD2qF+FRwqFZoG7ShwDMjPQZA90HpOA440gSfPNBr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/reset/amlogic/reset-meson.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index c303e8590dd6..5e8afbceaf23 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -49,6 +49,14 @@ static const struct meson_reset_param t7_param = {
 	.level_low_reset = true,
 };
 
+static const struct meson_reset_param a9_ao_param = {
+	.reset_ops	= &meson_reset_ops,
+	.reset_num      = 32,
+	.reset_offset	= 0x0,
+	.level_offset   = 0x4,
+	.level_low_reset = true,
+};
+
 static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
@@ -57,6 +65,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,t7-reset",   .data = &t7_param},
+	 { .compatible = "amlogic,a9-ao-reset",      .data = &a9_ao_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
