Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BACC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1Y+G6Qt83OPB6cUwPqvEc0koOuSCLOAAyOcXdBhOL4=; b=4Ln/8hi1ZrbfpZ
	GqQ+hHgyBywMNUiNgHUGBAZ6WhV+8hqjkI+TldU/L1EGakT4fb6+3N/6abFYyHBpyew6q/C5oEdfE
	RovbuzaSkySdi0zdv9fuvQFvwrCs0xxLoMIpE9fHcwLu+REO/tdWJrbVoIhDkMNsTk4f0FMLB1ZXk
	gp6WWFiE4ZOzrvLpqlcw8552XuiNAbs8Ncn3u0Ywz2kD+CqkKKoIEG0q3kISniQ1T3g7SPPr7cJhm
	Ml7mtBHfZNmOki7SavJ49jDFb2/aMZe8cXVrJzOKhGjVKo96yCObG2V4t/fdoo8SLJj9saCNa7yWu
	Ob7Cgove05HSD0uoU2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fBW-00219i-VV; Fri, 07 Jan 2022 02:40:54 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fB2-0020oo-0l; Fri, 07 Jan 2022 02:40:25 +0000
Received: from droid10-sz.amlogic.com (10.28.8.20) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 7 Jan 2022
 10:40:20 +0800
From: Zelong Dong <zelong.dong@amlogic.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <khilman@baylibre.com>,
 <narmstrong@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jbrunet@baylibre.com>,
 <devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 3/3] reset: reset-meson: add support for the Meson-S4 SoC
 Reset Controller
Date: Fri, 7 Jan 2022 10:39:31 +0800
Message-ID: <20220107023931.13251-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107023931.13251-1-zelong.dong@amlogic.com>
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.20]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_184024_103647_ADAF704A 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

Compared to the A1 SoCs the number of RESET registers is different
and the offset for the level registers is the same. Add a new
compatible string and struct meson_reset_param to add support for the
reset controller on the S4 SoC.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/reset/reset-meson.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index c9bc325ad65a..26dc54778615 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -98,11 +98,17 @@ static const struct meson_reset_param meson_a1_param = {
 	.level_offset	= 0x40,
 };
 
+static const struct meson_reset_param meson_s4_param = {
+	.reg_count	= 6,
+	.level_offset	= 0x40,
+};
+
 static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
+	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
