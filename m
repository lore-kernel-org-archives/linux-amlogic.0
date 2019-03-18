Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20108C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7EC720872
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JI6w+MrH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2D8qlI7f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7EC720872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0SCBgp7Y7t9hv5JGvHsV5Awielk8Lv3DlFc3DANXgA=; b=JI6w+MrH6LqNru
	nbhsX9obRnRkos3BMqTmpVYc4LnrSvHPhEy2sM2qtFceNp8o19/lblOXln3v3BY+3rhaWQoT2qbeP
	L7rsenDcHRI8zQ8ltU8seZSzOZU9rXexzy/nePRt/1VwHGHTOs30hkPk+lXIwKW15i6fkJYOMf833
	VQ/5zeKJVwdtQiSbNTcf9D4zz82XXz7mf1cFgpAmoKkcRpIeVC6ykbw3bHwLBXQnHJPbp2BkL9w2Z
	xKRHbAWzvJlRpMjClsFizWvwlYnwjXdLS+X+2+HbvM6ls71Erh/GOJiigmpuBi3X9WoVRhMvrdyCJ
	XTG8AXkcakmauYlA6tVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5sJw-0006hF-4e; Mon, 18 Mar 2019 13:28:52 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5sIF-0004Ug-AW
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 13:27:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id n9so12950874wrr.9
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 06:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=2D8qlI7f79/MVw+hlxaF5mONg2uk9MdinehuNtVFprAGhs+ynKpSDMkU8THSwM/1/v
 NoJCx+nQ05/nqA8m0xGGaSnemepMzqpfYIuaR/Qaxe3akjzhg5JPj0SoStNITQZaMWhx
 1OkZTIIP8ZhX/TeEQUfNNS9EFOtFLTH0Ckg/5oJO0drjEjI0qkv60oBKuW86/LMZfLBh
 o8QCJDXEmUSC7sbjpkhENzMAmxm4XPQ2vU8C3rxv0vKdwUlXr5h4Nsdjs4IVgB2FdjRe
 tjFOaGdoY+cFTbc7iSY9I50xcJptE8AdY7vgzubHfhD6iVDZ8qT4h2Lonqly90j7NWOI
 MCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=pei8Zhy3R8czZPVJsGJ0iDnHwIzemwtGw0Xg1vY0EkSG3Jz0UnRuDDj6Va2Uz2fGmJ
 Jl1IpLZg6XJfwcAErcb229cGyU3mQry8ainzDnLw6arwaABS/AjdVS48FdpG9f0APw+1
 Yqmc4IPokBqpyUaGKGXAYhZQQbXTbFOut6c4rqFy7RockzEO7WDT572oGOWXW/5R08HH
 yPCWArvOjjYFu4f4D7hzHsh34XR/18CGrDZQF4sRklFguGCnIWPxUoAUzLEEfdUFFLJx
 ZeYRVxf4kz/XqlNMf/HIYSBXYSifcIgx2WxDe12oEUC9U/n4x/2iSy6iO3Y8INkac/iB
 xtEA==
X-Gm-Message-State: APjAAAUhSHweuZyt1hUWLksUF10xUivKGm80Q6Mdhf8EAXEXUxkqhYI4
 46xXGr0EyTWdgniWyNLpb6aqPA==
X-Google-Smtp-Source: APXvYqyLtQkuzW97RpQE00rRUzBTzXwi9bR/lCEI7La/HEHYxNxhFFyTQxSEg9aIyCYPqotePmQNMg==
X-Received: by 2002:a5d:4606:: with SMTP id t6mr3596175wrq.43.1552915625855;
 Mon, 18 Mar 2019 06:27:05 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j128sm10421601wmb.43.2019.03.18.06.27.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 06:27:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v4 7/8] usb: dwc2: Add Amlogic G12A DWC2 Params
Date: Mon, 18 Mar 2019 14:26:54 +0100
Message-Id: <20190318132655.30040-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318132655.30040-1-narmstrong@baylibre.com>
References: <20190318132655.30040-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_062707_984837_44206FB8 
X-CRM114-Status: GOOD (  10.51  )
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
