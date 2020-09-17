Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A270C43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2AF32065C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/K7A/1o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GVoDkghg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2AF32065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ACB4nCoXZRc4nPZVN79Dw4msaTv6nbUpvWvArypbp4=; b=s/K7A/1oWmlZor8xJXBnEDVST
	r8lC/DeMNj6tZNHv1QN9w7Ttpvo0WAv1JkDZeXUcPsxPmpmi8yCnFdjLT/pkJbKYSLRsNc/cQ8arY
	w/DEcv+kQAzo9ZdOKaS8+EE68KQiYkac3yZrvoHTts7t7Wbm7UrSW2O5ZssjuvdZ4zuyeBqwNmqyX
	3SqXURtW2FoytjHWbBPuwM1n2fja1YGVUcWJWJiDu5M8TnggNPIN/DUGlSh6pCoBtuUi+Lp3WSVjt
	1/zde8Wgw6mdln3WBjtJ6vlCgzl/2X5ffYk1V1EsJ9tG6zKgW7qAtJCm4Xx/eItZPWh3zxgBMhDYu
	+TL0SqkxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInuJ-0000Xn-8v; Thu, 17 Sep 2020 07:00:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIntk-0000L1-GN
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 07:00:10 +0000
Received: by mail-wr1-x441.google.com with SMTP id o5so761668wrn.13
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 00:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZG6N/rhNc2zEd0OmlssDRFgV4b5KjiPy9hIEmRV9zOc=;
 b=GVoDkghgcAlUKt8WnZ0zuyGHxFOF6iJbX0CkdJ7VSuHnfyB0eSkmYBJmJvknoWmN16
 W67hTuQ48S68jHaxzPwVVIfNmpEwkoQSUT+VWRyQEX4g+RDNfoS+wJ7nHegZ838E6JKO
 RO4T9m2u9wQybkMXV0I+cZUqNZ/lCmsSgyWOSiF45JI8c6fQffCao9QuIdIhrRoGTOkP
 7PiyoG3oz1C7hBbcp4POtOnEWC44Ptmtzb4RXImlH2Jov0oKcidiEN+TOIU9FV+AaiCk
 4BmiXKy7ZPY5P8V2hDihIKzLqvG0Sp2INBAqC72OYYVBlZ7oduR9EMFdVsgzA2rUGSsF
 fHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZG6N/rhNc2zEd0OmlssDRFgV4b5KjiPy9hIEmRV9zOc=;
 b=BR5Kgp6u0jidfyU0lAPY18E6USR9vhLDafPeWz0A/NU8VOMXHxng3Gtn2V2Pxmk3/6
 b2cZ9hCFBHjxDFE2TbqH0jL1I85oNZDCDyLC2c5jEPByGfvgFqf49vLp6k0pCKfCsB4q
 Y802OedArkRKULLM5kASXU+W1weZiWwHj+qrd/EBx9HDDTg04d6WOYu3BmgwbymoBtk9
 QeBCQ6kVAj+z10CGydowQsFRA1yrLG+fhFHmRCRExzREaObIVkpS30mw+djVDN+Zfvl2
 10gWkazuSzWI5nxZ8vTcvJ+RUW+0tdgl2VxyO9fOfORyjfsTUEzTXDyagHRxZVuibwcu
 vFcQ==
X-Gm-Message-State: AOAM531m2qDiXusMj2UrSoNhLmpo6gz1kUx0XIQ/i3nBzFRnbnyea4gp
 p4ud6anLpimQzRlWtxPW8IbbBw==
X-Google-Smtp-Source: ABdhPJyKfXYnIS4ErZB/cswC92sAGdSNdhniNnIBWbPAMUoVrHd/CFYke/iib87+7iJgpTBeQrIDnA==
X-Received: by 2002:adf:e989:: with SMTP id h9mr32555878wrm.38.1600326003291; 
 Thu, 17 Sep 2020 00:00:03 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.17.00.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 00:00:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, balbi@kernel.org, martin.blumenstingl@googlemail.com
Subject: [PATCH v2 3/5] usb: dwc-meson-g12a: Add support for USB on AXG SoCs
Date: Thu, 17 Sep 2020 08:59:47 +0200
Message-Id: <20200917065949.3476-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917065949.3476-1-narmstrong@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_030004_620706_F8F22D35 
X-CRM114-Status: GOOD (  14.50  )
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

The Amlogic AXG is close to the GXL Glue but with a single OTG PHY.

It needs the same init sequence as GXL & GXM, but it seems it doesn't need
the host disconnect bit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 1f7f4d88ed9d..784e7eafc9ce 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -127,6 +127,7 @@ static const char *meson_g12a_phy_names[] = {
 /*
  * Amlogic A1 has a single physical PHY, in slot 1, but still has the
  * two U2 PHY controls register blocks like G12A.
+ * AXG has the similar scheme, thus needs the same tweak.
  * Handling the first PHY on slot 1 would need a large amount of code
  * changes, and the current management is generic enough to handle it
  * correctly when only the "usb2-phy1" phy is specified on-par with the
@@ -215,6 +216,19 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
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
@@ -930,6 +944,10 @@ static const struct of_device_id dwc3_meson_g12a_match[] = {
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
