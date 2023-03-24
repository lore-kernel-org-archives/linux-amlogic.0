Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592DAC74A5B
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 02:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=y7vud/5RnhIsKswvjjfyYPK9w04CyXLKrG2zhywkml8=; b=V6l
	0FtE64Jk+on3+DBjW0DG2O27zCv5n2z9E3redaHhIJv1ysaNARa2Um8vPfq4O9BH0y7g9NIsZlKHj
	lNeOa8zQEI7kgByVjcvS5vBhAvhFsK4bVS1gJ+aoreXZY3UWUvxClN2wWB/dHEKMO9+MocX1DEoJs
	cx64zRBGyXTI7TrKNI9/qqQhtXqJGxPErT+Lz0XdEOL5hZmduYBr+72sjPKrDkAkObuDDbNFSQxnk
	98JLMdhIoWyAMxo/PTOLbCjsp1hCU7v+aEUP58mdW6DMX1x3MwB239x2N2fdf1uT3V8NTFpEDqDHG
	k9rZQHYm9rsb9s11w4/yzGTZwc9pDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWzE-003Mrd-1W;
	Fri, 24 Mar 2023 02:17:00 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWzB-003Mqe-2p;
	Fri, 24 Mar 2023 02:16:59 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PjQnY1q1bz6FK2f;
	Fri, 24 Mar 2023 10:16:49 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 32O2GPNH097835;
	Fri, 24 Mar 2023 10:16:25 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 24 Mar 2023 10:16:26 +0800 (CST)
Date: Fri, 24 Mar 2023 10:16:26 +0800 (CST)
X-Zmail-TransId: 2afa641d07faffffffffde9-a08c6
X-Mailer: Zmail v1.0
Message-ID: <202303241016261854322@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <neil.armstrong@linaro.org>
Cc: <khilman@baylibre.com>, <jbrunet@baylibre.com>,
        <martin.blumenstingl@googlemail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBzb2M6IGFtbG9naWM6IG1lc29uLXB3cmM6IFVzZSBkZXZfZXJyX3Byb2JlKCk=?=
X-MAIL: mse-fl2.zte.com.cn 32O2GPNH097835
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641D0811.000/4PjQnY1q1bz6FK2f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_191658_071893_DF104E58 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 312fd9afccb0..5d4f12800d93 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -308,11 +308,9 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 	}

 	rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
-	if (IS_ERR(rstc)) {
-		if (PTR_ERR(rstc) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get reset lines\n");
-		return PTR_ERR(rstc);
-	}
+	if (IS_ERR(rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
+				     "failed to get reset lines\n");

 	vpu_clk = devm_clk_get(&pdev->dev, "vpu");
 	if (IS_ERR(vpu_clk)) {
-- 
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
