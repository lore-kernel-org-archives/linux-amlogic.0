Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8520C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE742067C
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YnysED5j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tsCjd686"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE742067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QHmS/JUJEAMj9PtCjNjePL8a+tVl+mZ+Ew+NAZlEKUg=; b=YnysED5jGR4kLUc4LXM03edbH
	GN7Zx0uSrZuaRfUDb7+qxirgYrtzWQVTG44i+r7oGrV3iY7+kBwSuJrb0eOhCwLPBhGDYf0CUxJfz
	121rgD/4u5rLMP1+hHLxgdZoty5tqMMrtL/hplF/1OceV2IthwqS8xwJTfPcKg/1YZQV0KIJhYPGz
	JvHTZV9xnNrcvm37w0XdCzYx39dWwr2AMr+yM67oi4BYUp5579ZIQqMWzBbr5Fjr3wKBD23H9gcoX
	y+WLedFSIWT766HBjpcZWImwIXZJ2WRp2n8RXc5pXLtN2owx+QQKVgWa83jTLx7064iS5ltjQUkSP
	YqQw4/r/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG2aJ-0001vx-6C; Wed, 09 Sep 2020 16:04:35 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG2a5-0001qT-U4
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 16:04:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id c18so3546790wrm.9
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=525kvdCFfP6vs4euxtRyN/bmEj6gYMQQf93QffJLH3A=;
 b=tsCjd686H2XcxuZwg50wJa8jxHM60y6x5v+SKzXYwU47orkfCv3NDMlaRM+myScK/D
 XDFtgC4ypLQvlLNbXTeT8OarPbAWxN/0euZR3PpyKHd0xywLRn6tz0j5Rh3ZX57sKbGF
 HgzMW9gUbEZ86wzctxI4pBcFAVz6xqFd4gUDiLB4TPTF/kKYPZtIxCad5cXmlaWQA/Yq
 V8H+hzERhOsIWtH6FXNmv21X5Ish/Y65rmFIbGsWh236ij4dg32oMfp4CgwHJnolWA4r
 sBW4ogBZI6i94fnIRdnpn5Mxt6AoUyk+HAJTpINivcLjM5vPtI4F/Vpin0jNNR0qcZ/D
 kOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=525kvdCFfP6vs4euxtRyN/bmEj6gYMQQf93QffJLH3A=;
 b=hGyWTf3O32MDOY4KO2YZdirI6xC9dI1j8vaKCvzTl7RFnNEglPKQIy9dSMUexiEJ7W
 //UU2VJS5/u0NqQyxk2wxLt/Ze9LktnQ5jsl2C2/U3mDxcLT8F3e0KG5APc/ICwiWjYD
 kmF2wi4mTwaeYpTtWCF9mOCYQsFguO/DvQFiaaltc7oYaKfu7+14SF7SUUygqrPWBOB8
 2FYUxhnukCtb0Ty0geHsKs9PWQAIBiFVz1xNfW9PJ1rq5e2jYXKpKI0DUrzBDAIfR4rC
 vJ+Nmj9+Jw7sheP3Eh2mV471OQT8NIGL111PB1KsOTnAKxwZejbXUh0d6v3KfVonfCnI
 kmEw==
X-Gm-Message-State: AOAM533aKclwZK1gWUkHVhUG5K651JlbGfKmzmQ03Mjex4qaAh/ZniJy
 JRbvSploSXKZsqIU6OmqQ1kaQg==
X-Google-Smtp-Source: ABdhPJxlZaMGy1wnS6RuAf/ra7q+ROMfSMgTlio9QHnRZDZEnBprM5gFMtIESCe2xil5ZgJ01A61eg==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr5019825wru.180.1599667460271; 
 Wed, 09 Sep 2020 09:04:20 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:04:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, balbi@kernel.org, martin.blumenstingl@googlemail.com
Subject: [PATCH 3/5] usb: dwc-meson-g12a: Add support for USB on AXG SoCs
Date: Wed,  9 Sep 2020 18:04:07 +0200
Message-Id: <20200909160409.8678-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_120422_048724_0DE6A073 
X-CRM114-Status: GOOD (  12.31  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.

It needs the same init sequence as GXL & GXM, but it seems it doesn't need
the host disconnect bit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 1f7f4d88ed9d..90275c13c224 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -215,6 +215,19 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
+static struct dwc3_meson_g12a_drvdata axg_drvdata = {
+	.otg_switch_supported = true,
+	.clks = meson_gxl_clocks,
+	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
+	.phy_names = meson_a1_phy_names,
+	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
+	.setup_regmaps = dwc3_meson_gxl_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_gxl_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_gxl_set_phy_mode,
+	.usb_init = dwc3_meson_g12a_usb_init,
+	.usb_post_init = dwc3_meson_gxl_usb_post_init,
+};
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -930,6 +943,10 @@ static const struct of_device_id dwc3_meson_g12a_match[] = {
 		.compatible = "amlogic,meson-gxm-usb-ctrl",
 		.data = &gxm_drvdata,
 	},
+	{
+		.compatible = "amlogic,meson-axg-usb-ctrl",
+		.data = &axg_drvdata,
+	},
 	{
 		.compatible = "amlogic,meson-g12a-usb-ctrl",
 		.data = &g12a_drvdata,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
