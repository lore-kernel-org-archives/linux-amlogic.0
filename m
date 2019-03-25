Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEE9C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF4C20863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pc3hGQOD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GT8Z5s7l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF4C20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jHYsm4owRmsniSO+LKgbgzXNjfqSefeJWI3TD7dlIo=; b=Pc3hGQODehIdrn
	M13sXaIK7Y+zFCvDb4HZiefvgwuzgxQmZiZc0G1kEsXugqqlfsjdVPRUVRNUdeg2POE18+QKhu3lJ
	6Y2YBc5WU0wa4sMAtC5Gk/uYgu2VbRV+CENvaB/p08MKY6ZwfumB+pBHZfCWLaoyeMnYHJqSplsK8
	agbhqPu1dSVh6uklZkjk/yRx+vwPmNr7LAkKKewqIsgAkVQ+6dXyI66ur8WpYpVlbtRs0f0FErtJj
	H0A+UhzioT4d64wHjBv+EqYcm7pG34mx6y52dGgAHnoZT0TCB5gn50Odz0DWguL8FdeA7IdE94r8I
	YSXt4Mr/eF+UD75r/Pfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8M6W-0005bY-EY; Mon, 25 Mar 2019 09:41:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8M5J-0002zu-Er
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:40:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id w10so9265496wrm.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ouVo67fVk3QedxIRwGF/kjxfvmda4Yy6wL8QXTMaaKc=;
 b=GT8Z5s7lYBa1EBeX52auKvVxftdxxS7Kzyd4hkYTjL56/7CQuuuHB2U850cnZeGNZE
 b7+M+5kkVYc0xc3mXM+bxSik2EcJ/fcpX9TQfgX6S29zc4VdN9q1CulG0TlDrYGe2sP0
 y7FQIyL2jHmPwUCH1tlFAU4vezxgiVf00qwDFp1OqU68zaeUYoJbvQmvmPuNUR8M49NG
 8PQ3R+upSJGvOMMGlUuezqnFbC9eSjkg8cC2iBGIR/WodyMAtnPfGqd+d3V/QiXCnkDT
 HehjxUZm/t6u80ytrr8SlLeEdfvPDJf64lsMySr31WRavtfKDy1WlbNLytDeyRRYioNb
 WAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ouVo67fVk3QedxIRwGF/kjxfvmda4Yy6wL8QXTMaaKc=;
 b=dOdSmLHY61llGYVY8/kAiSzDFQZd1BP+nS3y59tOjPpU2s8TgiYfigdz4z8t8B3i1H
 EMpFkD+6j+FvjgP5H1vihVX8YBfdA2U95/zo6yusXpfQbCUjNpFzMriX13jN85/3ECd2
 8k7ZBAWCw467yJlW1G7Td4jrUXUG4I/n9oCh4FNJG4JwyurheIjpDNDwJ5JSmao6SN5s
 SF8WtcGRr2PksVK3QqPZlWLbu44l+3urbJYdIqxYr99i8WDXecaIHpzF9KvIoIGRBWz/
 OHznq/BDaSErSe5VivelOCIRxQIBeL9hnlr1qins8BRjKb5/Ht4oOZf59TrUvlvtCMgO
 +i4A==
X-Gm-Message-State: APjAAAWpw76BHjN2QVsxQcYyfzw27i7kbMwoky+VsIqq0KiAqjaQUiwj
 yu0IGkkFSFJ1azL8k3nMHCGu3w==
X-Google-Smtp-Source: APXvYqywrTLZVJoEHk6DuHBmvgag1GM7Xz/V3FgCfJSGwTvqnInqzLpRSfgIeA870Did+w4iN9vaOw==
X-Received: by 2002:a5d:5287:: with SMTP id c7mr15704405wrv.127.1553506798997; 
 Mon, 25 Mar 2019 02:39:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k14sm13044652wmj.26.2019.03.25.02.39.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 02:39:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v5 7/8] usb: dwc2: Add Amlogic G12A DWC2 Params
Date: Mon, 25 Mar 2019 10:39:42 +0100
Message-Id: <20190325093943.29138-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325093943.29138-1-narmstrong@baylibre.com>
References: <20190325093943.29138-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_024002_668852_DC07A4D3 
X-CRM114-Status: GOOD (  10.88  )
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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
