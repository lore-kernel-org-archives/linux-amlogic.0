Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C635C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 11:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D98C22D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 11:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uSnqK5tu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Qf+7k8hC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D98C22D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6U4YRMSNY9V44p+PNPJXA1wsFKBx64ire9R/55QrrY=; b=uSnqK5tulgy6SW
	W9Ngnnr1EZ/jyh3jeWjs6LYkekCPQ9924/VM9z/XJzaBGgRvEhvm/iz/op6JClKjCnXZsfyEovu0Q
	9Yffabw3PScuXcScBVwAbAB/SnkZV9wATUPOJqgAUbWrWf02wdq5rwmXxAT89KLLouYmZjZhQK4bE
	kk7nXuxKkSXoQc2asbimHUGhvCEmuC9F5CeqBQi0sspLYxZlzcowHfCkrUPqCah7rJH6URrxYfIOl
	+1OPAKD57m6LzlNL1u+U7BaZ31IT7tT7b6D94158/jcxuXwudDhure6LlLFoGCvJ5kylaK46RNVmv
	ZSrHKkQYW9j6Fqfu9mZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0P2V-0003WR-Ck; Wed, 21 Aug 2019 11:44:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0OzZ-0001JD-4L
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 11:41:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id 10so1768180wmp.3
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tKHSL2TvLdzeYTHakHcSzedmEttI2anacBGRuNcRBkU=;
 b=Qf+7k8hCbmdx30F6mqFUQm8AMdjK23pNz+MRa8MhFvVDygJXD7EaWUmdHhejqp8wct
 4+pLHdp5iw5KDRMZwuqkVAswEUWxofGDQzuGgpsquF+50kJQ1cGsy52QwHTJrbmPdLgB
 p6J6bIFj/E7cb4atsDOaHFqdfsF+MOBeAdZ1hdD/zl0/zSSvwRSCAgtZolAGbs49PaFV
 ewpZL/DUiR1uYLS6dG93Af1jwyqjqhWH15xmIcm7oTjVNZ5Z+14qsF6DjqQkOFawvPzm
 dwBN03rjf2OfX3Ur5nNvzjj3DcyWYil3SnIIk/2iOenEBrtl7I82aOMwHPr0LX+2AW+J
 J9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tKHSL2TvLdzeYTHakHcSzedmEttI2anacBGRuNcRBkU=;
 b=IxKwb4GHHPMKfgOcPzNgj+jmyJjHy8yF7aTT1z/i0EHZcnJYqVNqDcbpPhQVRm9CHX
 czaCAYQrr/lV6bmhYrYJV6+TrGmN6crebfmk80eQIeq8zbj6h4hIFP912mrWRSfK5REM
 6f1JX8ceg0O7EwEZUhBmHcUzyFmwFyYkUAg5lntdIwSTQYJpHF+zunclRe1b1+tR1/X+
 ScInWR1WsvSkwf4G0x3ZhJRSGB5HGAwmOlz1p8hVxPtfizE0VwNkasa/R4P9pP+BWJS5
 t8WIKgpEvVw1M9xeEldAUJ8hNQGGmfyF7gRULOk6F4/IHXFSMyVIQL4Sqcj+7+JGfkgd
 dlkg==
X-Gm-Message-State: APjAAAWsZDtAhixeKxA1Svyxj5s4yaTMTV8EpLiOIkTcsmR165J4OXFi
 MU90zal6QeEHPR15RlskHOwdBg==
X-Google-Smtp-Source: APXvYqw4lJ4s62v8F8QFkE+24Nhj1T9LxC4dbp+rc3mOe7dCfo5AauJ9VNbYhuGEd5Xg9fgwIPl5Cw==
X-Received: by 2002:a1c:ca09:: with SMTP id a9mr5490244wmg.43.1566387687833;
 Wed, 21 Aug 2019 04:41:27 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g12sm24049686wrv.9.2019.08.21.04.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 04:41:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	ulf.hansson@linaro.org
Subject: [PATCH 5/5] arm64: dts: meson-sm1-sei610: add USB support
Date: Wed, 21 Aug 2019 13:41:21 +0200
Message-Id: <20190821114121.10430-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821114121.10430-1-narmstrong@baylibre.com>
References: <20190821114121.10430-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_044129_170411_BA5B4D3D 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the USB properties for the Amlogic SM1 Based SEI610 Board in order to
support the USB DRD Type-C port and the USB3 Type A port.

The USB DRD Type-C controller uses the ID signal to toggle the USB role
between the DWC3 Host controller and the DWC2 Device controller.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 66bd3bfbaf91..36ac2e4b970d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -321,3 +321,8 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "otg";
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
