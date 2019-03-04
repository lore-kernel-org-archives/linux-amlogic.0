Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0C0C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F6820663
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qsfTc8qO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kiJMJGxn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2F6820663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0SCBgp7Y7t9hv5JGvHsV5Awielk8Lv3DlFc3DANXgA=; b=qsfTc8qO0aS/hx
	mqlrNRZcSTiXyV2WcxhvlOPz5/kPv1Nvg4TdPEbR/gANmE12kcvzQjLLjuIVO/tYkQhr3sJB2x7py
	br16hvNGPvF99YvMkrQ0lHRzdKcrua8wIXf9vBxo88+k19K7tWRsb+mgMkcWVAP6bGVVPioFnOJGB
	rhx1KFyVerUrKa246c0dfTCgq7Ct0QTZMTog38a5ucSE/MPHzn7A2E+ZROC3I/E8GrH7++K7cu3im
	+Dra8E8jJFKcBXYrgQA2NnuQ/6nTy9l+Ua7ax463re0K77f/KB3f2c8ONFxa5yskY6mbs8Oi5a0iw
	D1UBFMTOtzBcGuBRDmjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0l1X-0005QX-Eb; Mon, 04 Mar 2019 10:40:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kzr-00020s-A0
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:39:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id f3so1653381wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=kiJMJGxn+O1rgglhFjxDpHzLiD6t0lxdtM+QbSFWRXex6U6ZCjDiJuixhpi8cqacdj
 yy5reYe9GyHYRM3tt2vjZMYWNsGeHlKeP3f/3CG4/jWLbBNgTQAgW8uwVSslfncuxkFq
 wX+3kuXvIvN5fFBFyOF+0s67RXuyh8UWHNuc1xK2WxNRJtDSHIv1M8qMWfRaMNL9IwWB
 f1pfZJZnazBIFnneJC2BRwofD1JRBCjzyNWjwGDoTQpVI5v1JNnocKeLFi3LAra4GDC6
 6PTsgspe9O67F3BjEvJv1U6i4mtU7nj/by59KqHwBCz+ojy5zSFlPHuRt90wexPPXho2
 FXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=W/Eg0Ew4BY94kqNvlZSJxB00aH4hJdsVie66RYzNTRluckO14/V6iju04pDBbC9Ecy
 AylE2a9SZ14U1T3KXp20W/HSEx9rCsZWmkldmGSI5eTteKDBxrK/jIWNerRYG1UTJf28
 GS9/TuCCFJw7aR3mI++KMITRafgPgOIoyKwyCKX7DVkMmLWUItpcX0kPhkZ+m1CPeYdU
 45ITUmruOmR+qbhRArou2CkKk1G6s9Fpn6yqm32lLsXnf9+eQGv8zU6GwNEPqvJhkbRv
 D+l6R5iZHUsEFr8kHbe9etSesBmnhHDrxavBddUUq5/2c8mRezWBDXeUb8OWB+crFl1z
 JAGQ==
X-Gm-Message-State: APjAAAXP2rXAD+stGOKPeJZMD+BiJj4dAyotELiNTzYM97MKVXmflaFy
 S4bp/3aU85QqkP1slVAkZhc1Cw==
X-Google-Smtp-Source: APXvYqwCUU1Jrg5AzhTra9qP0/c+iULEuHGaC/nSSlbzT84OBH/i/BFlPTH8M4TvVZV/a5VVbYTM2A==
X-Received: by 2002:a1c:9ed5:: with SMTP id
 h204mr10124385wme.140.1551695937814; 
 Mon, 04 Mar 2019 02:38:57 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g24sm5505676wmh.45.2019.03.04.02.38.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:38:56 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v2 7/8] usb: dwc2: Add Amlogic G12A DWC2 Params
Date: Mon,  4 Mar 2019 11:38:45 +0100
Message-Id: <20190304103846.2060-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304103846.2060-1-narmstrong@baylibre.com>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_023900_011790_F0FE6BCE 
X-CRM114-Status: GOOD (  10.98  )
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
