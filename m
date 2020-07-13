Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E115C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 16:06:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F53A2076D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 16:06:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bmUFGMfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F53A2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlrobertson.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Subject:
	Message-ID:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y49jJ1meuC6Bp9huv3P6cQo5xxRhfYtdOfTJBYkWj4g=; b=bmUFGMfXzA1fSbzzGhb/9A7uA
	Jj3xjmi77VeDpJmJqYr9tH069JNv+d0WnkV5hu/oYJDFXMFXAQXP107flYCgnHPlRavqKWfO/MorH
	OdCvGMIDcKlgKwhwUYzJDzmZPNT5mAUs6ThXvCmZ6ysxNgPZZzVK2l90UXBJITAgMIq52KYeqYvHb
	C1+n7+ZgLWwfme0+0oQ3OpTIJwx939GxDwrHzfiyxTK5j+F6EH4VbDTV3qpRcqJUlK84YrBsqjmww
	g+XGCZ18Ss2pZfGSTlH+j51zi7v3Cb1ozgEa8Sx90BPPcoY1AUHzKYpPL3VJxzei964Giabw+EF4t
	6crcQLUTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv0yK-0004x3-3b; Mon, 13 Jul 2020 16:06:28 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv0yH-0004vT-10; Mon, 13 Jul 2020 16:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1594656375; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=anHNvDYLVviZgCgUDUF6dCZdJfUNO2U+Z2EHMp6EDEMHzYVRUXb5aS1J3oMxSa46Dh0AWnRsafmT6ujyKL/F2EZsKdtSw9tWjpfvNEcm7WOldQNRXQvLw8ZzdoKaau2owgf6U9mQvbr+1guajb+qFcPBrNU5DmGqCFSoyeZg29A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1594656375;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=F8q5Lt6dWY922aSaNvVVgURPZJwVNB1Tw4FOG4FL+JA=; 
 b=MhLuRg7qi+wUizJCQcN9boU1rtGGucp9m4AnUkWqvWdShEAV3mwCPAtZnm7mRniyrJPqX6wPATtybVc/j6Sj7hE5mQX3BWAEpQQVp5JZ1ZY3POWx5uVYsnsOO0f99cY1L2ZDW1wCDWb6OYZJ3IWuQcmnEPEg+W/G6iFheau0wQ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-108-28-30-30.washdc.fios.verizon.net
 [108.28.30.30]) by mx.zohomail.com
 with SMTPS id 1594656373280412.43216096061997;
 Mon, 13 Jul 2020 09:06:13 -0700 (PDT)
From: Dan Robertson <dan@dlrobertson.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Message-ID: <20200713160522.19345-2-dan@dlrobertson.com>
Subject: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
Date: Mon, 13 Jul 2020 12:05:22 -0400
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713160522.19345-1-dan@dlrobertson.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_120625_236535_2102951E 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 Dan Robertson <dan@dlrobertson.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The reset is a shared reset line, but reset_control_reset is still used
and reset_control_deassert is not guaranteed to have been called before
the first reset_control_assert call. When suspending the following
warning may be seen:

WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
Hardware name: Hardkernel ODROID-N2 (DT)
[..]
pc : reset_control_assert+0x184/0x19c
lr : dwc3_meson_g12a_suspend+0x68/0x7c
[..]
Call trace:
 reset_control_assert+0x184/0x19c
 dwc3_meson_g12a_suspend+0x68/0x7c
 platform_pm_suspend+0x28/0x54
 __device_suspend+0x590/0xabc
 dpm_suspend+0x104/0x404
 dpm_suspend_start+0x84/0x1bc
 suspend_devices_and_enter+0xc4/0x4fc
 pm_suspend+0x198/0x2d4

Fixes: 6d9fa35a347a87 ("usb: dwc3: meson-g12a: get the reset as shared")
Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 1f7f4d88ed9d..88b75b5a039c 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 		goto err_disable_clks;
 	}
 
-	ret = reset_control_reset(priv->reset);
+	ret = reset_control_deassert(priv->reset);
 	if (ret)
-		goto err_disable_clks;
+		goto err_assert_reset;
 
 	ret = dwc3_meson_g12a_get_phys(priv);
 	if (ret)
-		goto err_disable_clks;
+		goto err_assert_reset;
 
 	ret = priv->drvdata->setup_regmaps(priv, base);
 	if (ret)
@@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-			goto err_disable_clks;
+			goto err_assert_reset;
 	}
 
 	/* Get dr_mode */
@@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-		goto err_disable_clks;
+		goto err_assert_reset;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		ret = phy_init(priv->phys[i]);
 		if (ret)
-			goto err_disable_clks;
+			goto err_assert_reset;
 	}
 
 	/* Set PHY Power */
@@ -809,6 +809,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	for (i = 0 ; i < PHY_COUNT ; ++i)
 		phy_exit(priv->phys[i]);
 
+err_assert_reset:
+	reset_control_assert(priv->reset);
+
 err_disable_clks:
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
