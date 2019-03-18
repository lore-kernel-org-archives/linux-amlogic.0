Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43596C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 079392075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SghOpGVv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qHjosz7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 079392075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0SCBgp7Y7t9hv5JGvHsV5Awielk8Lv3DlFc3DANXgA=; b=SghOpGVvDteswb
	ClGIXW1ZeJwf02zzGhW5w452yc7D3AFP9AM3aGpYhVXQ4ibajt108taelWKGuDDN7oUaee+IBnCGl
	LmIHdgimZgATUOpSuv/QM4eZrn2/AEm5Xe9fMrRbJt8Fudz7txFWsljLwXRsme8MWdpCoH278qcOQ
	bhHnGIv+tkJwHsSBZD3dmOcMIEn4YttM8spZzvcJmKXiJRNzUAecGMp4yW3d73mNjEO7TXOMpxzV8
	a65X6Nxb2SGT3u3RqKrevmFRLcVg0VOw8camumUwW/hTtAqzbKcL/cKLviJ7DShgRAyVatZ3WeifJ
	RqbYIrTCu98xP3zxdHdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pH0-0000wd-OB; Mon, 18 Mar 2019 10:13:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5pFV-0007Si-Be
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:12:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id n9so12224747wrr.9
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=qHjosz7nh2j+dMBu80K1XPaRgqm0A5/M+a5n9uihayXEXKc/QNfTjov7Sz+9koNvTS
 tET6ztF83yOXyj2DIR8LzbedHeLIyk0wz1+/rMGu0uZDI7FhKV3sKe9UQu9LONom/x2h
 DC2KVEFnOUBVLAWzOdDxPXZRGwXOuy2b7/Uh3vaa3pCaLw25kYlEETxClAIy0gEtRXIE
 +YMGgi/ypXqUTw8y/cgecXEipylY2tXvdlPxOziroAOxymRqPikwz0WcZ08sNZNVrrH7
 cSFbI9DcU2gw+GC9cGhCvg5rC/L2SaDRYnY959pxrfyUAoIvbPbRozKv/Z7waUdEbDTA
 PcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=BNUDnW19NWz4IkIfvkNaNFnMrMaRyGDaYb9iwoUNHzlLQ720G/IS1eX7L0QhpMYWhv
 M3T8aU6k+lYCD3rKmI1FNA2UNLc+xVVloJX/mm75MP9r7ArkQpK6eS1LH7JinqybrloX
 gLjmZ49dIR3R+WuQWJObbVlRY88B0ZKwvZZ43oEPNYXgRgKdvmpc+UzJRtnSI4SeWaTl
 Rr0F3uDaRvdl7q7XA2k9eQnda52UhdCGkZ+gbhERK3h9Fnj+wgeFAsA+7xMLrqBTiRkM
 J/HjEKSd1E+wYPJkTmK1NnzjA4STYqBasm34pCOuy/1TULm42SQSKijMVHU7emH5qaM9
 DC5g==
X-Gm-Message-State: APjAAAWjUzJxPFcCER9PD/8BX5e8Amw/UWo00CvB/eWqn9zvP9ZgALLW
 jjeN8inpYSzUYSv2vQgEwG6AWQ==
X-Google-Smtp-Source: APXvYqzXqrUa0MrlgNlwt2Yb3Fmya+DOxwcORC4NOV0VdzK8HERfTf6+aiyj6X42OwzfFNoCHdmV+g==
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr6285715wrv.282.1552903923978; 
 Mon, 18 Mar 2019 03:12:03 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z8sm6697855wrl.59.2019.03.18.03.12.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:12:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v3 7/8] usb: dwc2: Add Amlogic G12A DWC2 Params
Date: Mon, 18 Mar 2019 11:11:52 +0100
Message-Id: <20190318101153.7531-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318101153.7531-1-narmstrong@baylibre.com>
References: <20190318101153.7531-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_031205_936325_FD299ECC 
X-CRM114-Status: GOOD (  10.71  )
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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
