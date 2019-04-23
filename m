Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91478C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 08:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAEE20685
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 08:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sc3TNXpx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ihj+o2Zm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EAEE20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avfRI5tAWfyQYIBN5K3+jtyTsSPDQXDvZV+qFC7L9Bc=; b=sc3TNXpx2oxPgg
	SbfE2FR09jbhR5qvEkUbtsRA8iAA/cmQAy4Sm8h3LDA5rklnjudoO/fP77Yx35HKPuc1ugltjAQo6
	AsHpxTxDQpYCASKwrlkr6ekjnehUi6/+d0aOyuQQkVwI5gs9AdwT3fywJGaRvr66L2dl3Mv6ba8/j
	qCtlgB6hrnNJ/nxlLta80SJj4OBO1mo/v74KD88O2SES1Yx/mQXjM/cJHyeldPsTUGbaISJmvJ+tD
	mKhE6g4M4rsiFQSl8ObmloXF2t5dRZbF8dD56PezmIGex3dI3IPXDfLlMObNk8W04H4c7nq+bnJSR
	T9y6gSpRtVG2FbOeTztQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIr9v-0001kN-TR; Tue, 23 Apr 2019 08:52:11 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIr9L-00010I-Q2
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 08:51:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id a9so1532041wrp.6
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=coKjxKEGXPOOgyUNg/X4oYYa6DNUzfkR3oMZh6thI8k=;
 b=ihj+o2ZmtmjS3IXh+DTe7xY3Q/wvndiKyf4IBEXxM3dQd4o8dwgq+d7GAfShEyu+Nz
 4pL6CcLuTMiwugg8guG56xbbYfpzBnbkxmv3+P9ILJXDf8fTJsNVSi/iAbJq5+PM5N1w
 Czj8BYpaIRv4O8+ATXw4kpI5ZUo5LfINnbscU2vZPI8WR3a33JmktoTZ6rXbAaGP1AeX
 cyynp7snEhs9mvji0QMwPFC3uq9ynKKaI5zXJnI6NH7HlnB9bEeugWkpP5bW1EsbEbIz
 XDyy2nqQZRgGCqjpCAEfty51r+0zICh5QjSIP2KyIrTzL6a2yzdZKJOXjiG2rbIdFaDO
 VQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=coKjxKEGXPOOgyUNg/X4oYYa6DNUzfkR3oMZh6thI8k=;
 b=fb13K4+Gk0Lzknw66qfB2B0B+t+gvkdo9J0RgQpZsJ2tGrWi90RAkksmt8iwu13Ost
 Kb1xKJV9or7aehQ183Iwf5ugC5HCIifpp8ioHXIRMw3/cPHdEy3vy+OtrThr4RKtZaaL
 8ps+AQ+5oVCwSuYLmekekRe4+Votw3IuhcYaZFckHGHUjUjO4TsK0xM9UMIVXT060run
 QQ2zgYSBpWslJkK62mBVSIBBf29eILX5Oi5orDABRh3mSzHzAUXw/rrfcQQq9veCIrWH
 lsKuhbXCxwB2ElQnkT8XXAVO7vbh/W48Cee5OMiL84T12uRb75WTP/dwb51a9ejKJ0Mm
 jLrA==
X-Gm-Message-State: APjAAAU54d092SPci23kZ3SuntbCUEvepkGof185ALbcXfMoyauTSEUL
 U3nfP+XrtJF9tSyNI6qyE+LHpw==
X-Google-Smtp-Source: APXvYqyW/gIU7AhNE1eDBER3np45Wvdh3xrRnMDM4D6q4COqDjzzUTJIN8//q+XpGVfl8Whe2SDRzQ==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr9862063wrv.45.1556009494215; 
 Tue, 23 Apr 2019 01:51:34 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b8sm12515566wrr.64.2019.04.23.01.51.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 01:51:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, chunfeng.yun@mediatek.com
Subject: [PATCH v6 3/4] usb: dwc2: Add Amlogic G12A DWC2 Params
Date: Tue, 23 Apr 2019 10:51:26 +0200
Message-Id: <20190423085127.3863-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423085127.3863-1-narmstrong@baylibre.com>
References: <20190423085127.3863-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_015135_898354_C5F5DF93 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchs sets the params for the DWC2 Controller found in the
Amlogic G12A SoC family.

It mainly sets the settings reported incorrect by the driver,
leaving the remaining detected automatically by the driver and
provided by the DT node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
---
 drivers/usb/dwc2/params.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 24ff5f21cb25..442113246cba 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -121,6 +121,16 @@ static void dwc2_set_amlogic_params(struct dwc2_hsotg *hsotg)
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
+static void dwc2_set_amlogic_g12a_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->lpm = false;
+	p->lpm_clock_gating = false;
+	p->besl = false;
+	p->hird_threshold_en = false;
+}
+
 static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -167,6 +177,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_params },
 	{ .compatible = "amlogic,meson-gxbb-usb",
 	  .data = dwc2_set_amlogic_params },
+	{ .compatible = "amlogic,meson-g12a-usb",
+	  .data = dwc2_set_amlogic_g12a_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
