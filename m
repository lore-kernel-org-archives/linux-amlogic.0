Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27CDC432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F0AE20740
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5KyQ2ZO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DjU0C/ID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F0AE20740
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFyhA7+jtYUNS3JzxsWHZKhJj7sMjyDwi4fmdRdkoLA=; b=a5KyQ2ZOnkTYKR
	DvQQZPOjCr4nbVSMTgMB1F3BbiUYBSXgpP3JigZYDLcDCMSnG3PJtgTTXs84RfmmrLsWZaMGoGPbn
	5xb6QmYjP/hyKuxqLKM9FbsShLpYMtbIH8QEmaBSdBjaEAPJR31Jdhue1Nf4pSbMeB2sp2636AirK
	XQ7oL++1I21s+WuT5VA4Gs2abAsAba04ic15ywe+uBbeRU2c0uwkthZ6iDR3Sv3sKIQ5TBdG4iH7k
	zONgeLrmjZ3WVYrVzRhneBgJ4h6oPoiemDHQLkVY4V4jmVaOmCD6qIza3qElrvp+5xxzlq4i8C53T
	3nQpjVC9l24hAekLLnYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWL6A-0002BR-O8; Sun, 17 Nov 2019 14:00:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWL5q-0000mO-5e; Sun, 17 Nov 2019 13:59:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e6so16394455wrw.1;
 Sun, 17 Nov 2019 05:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AI7oneBVr9Sh8KI/EU2QuzQzAJVjV4haI51WvzEvAjc=;
 b=DjU0C/ID1NfUiIWc88ECCm8hYmVDymKmODomd9NlTEsQA8kBmsbs9Yaj+kV6+S3A5Y
 cVEOSM45iyG8La96kCE9baDwHRe7utZmIwOLfBjEvaTeUIvE5zqLB02xRFbOfu2VCHU8
 dSreasOblG5NC6BNBkl60rb8ag1Et8+4ALPBseCMh438x6pL4cnq9B/li7a9Ss5gfygZ
 SgnQxzr7dY1oFI26nE4jTwDuvXdIyYdjNLcMhNr4pTdUXSMwE7IfUzkVgkjtKrLpscEL
 xeru+GS5Jn/GLwnLZdcdvCOH4y70Yvft70eW4Y1ZXWfkp5kmSZrEWNiLBHGLU6CyZMrG
 6OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AI7oneBVr9Sh8KI/EU2QuzQzAJVjV4haI51WvzEvAjc=;
 b=cu8idhNe8mFqoXpt791qPz3kC2ISC1ibfAkjnFIbiJ50u9pFNA+3GtedtzOt3JGxyh
 ApV51YGj4iqs6GFvVlgYeg1jXWodUYdXrB7MyuNjR1OVfLqVa9ip8hjOsQ7ct7nlhF1L
 qqPBeWxbvqmXxs8Py7RWx2ca8EAHCJQl9LywJIe3nyXWvgp4oJ+zR2LcSRQFs8P6euv/
 R+2ztYLl6ZxK68lbas3NeKBrvEOybY+VS2Y4CY+WVI4HKS52iAe4H0//rnsBLu9++qLP
 XzlZGUaTTyr+W1RQpye7jntogZGbLHuM40tGy9UitFdPy+YXIQldDudCl4TlQLMpM7Wn
 WM3w==
X-Gm-Message-State: APjAAAWJqZ+JjGOh/gsjU0Grvx566BSir3sYDDN7IBr2SyODROZVz5gH
 hWcpKEG1DHEKOuP6sJzBB2ODdygw
X-Google-Smtp-Source: APXvYqxuh9+V3F0zaSkPtijZBTMVQwPp1ojlde26tDjEtxtx16d/NlKmKiJeZpZDN+YTugtSvMi/+A==
X-Received: by 2002:a5d:42c8:: with SMTP id t8mr20309817wrr.87.1573999196558; 
 Sun, 17 Nov 2019 05:59:56 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n65sm18004803wmf.28.2019.11.17.05.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 05:59:56 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 1/5] dt-bindings: clock: meson8b: add the clock inputs
Date: Sun, 17 Nov 2019 14:59:23 +0100
Message-Id: <20191117135927.135428-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117135927.135428-1-martin.blumenstingl@googlemail.com>
References: <20191117135927.135428-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_055958_206949_F3C0D428 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clock controller on Meson8/Meson8b/Meson8m2 has three (known)
inputs:
- "xtal": the main 24MHz crystal
- "ddr_pll": some of the audio clocks use the output of the DDR PLL as
  input
- "clk_32k": an optional clock signal which can be connected to GPIOAO_6
  (which then has to be switched to the CLK_32K_IN function)

Add the inputs to the documentation so we can wire up these inputs in a
follow-up patch.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 4d94091c1d2d..cc51e4746b3b 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -11,6 +11,11 @@ Required Properties:
 	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
 - #clock-cells: should be 1.
 - #reset-cells: should be 1.
+- clocks: list of clock phandles, one for each entry in clock-names
+- clock-names: should contain the following:
+  * "xtal": the 24MHz system oscillator
+  * "ddr_pll": the DDR PLL clock
+  * "clk_32k": (if present) the 32kHz clock signal from GPIOAO_6 (CLK_32K_IN)
 
 Parent node should have the following properties :
 - compatible: "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
