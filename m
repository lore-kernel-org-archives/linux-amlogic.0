Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EF3C3815B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2848421D91
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RNrb2XcO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WQyDyR5m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2848421D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Om1k6UjaK6Zq3OydLGiaKfTY6RZKf9M/ECnH15G2l3c=; b=RNrb2XcOVs7RYC
	fiW1C1wh1GyqS4U8NYA/VTVdfe45/uSvoW95bCQ1qWzFQwfPgvdNJalWEiunfVFn2AtqYqko5d05k
	Ng1g1RNvLKrC1dHM/RF9OuB+4jGEBJJmx3oSYLxSsTFX478jQ61qY1clGl/Es27vmkAOKuoSTBZ1J
	UsdbbcXioVbYRVi8/IKlGMe38sYb63wX/04alAh2SExgCtkUZYOa2ms68ipxQObO+PP03FH3B8Oxn
	3Wc4Gt7mRSdM/lI89sQ8145giF+R5EvjBwjVHUd0PAOUnS4m/JmydbGFtmSuCFnphZgGC7vSPBwa4
	fle2E8m6hkh7wRDQV9CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP3WZ-0002YB-HC; Thu, 16 Apr 2020 12:21:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3UP-0006HZ-FY
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 12:19:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id d27so4613144wra.1
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HXXf6CzGWvqGfJ+pWD/XxsKx7m/sfAMCErpAVa4yyHE=;
 b=WQyDyR5mxzNp5S9/EFFpNUBzyCTrTp2awkJyanbeEFwI7GQHQF6wbpwEwd+J9y+Upf
 qEzKbb5p8JSw6giqyoQ8c3kElv/qoYGvCe1/xCr4lg6pTaVtbW6ErRiHU88hL3t9VNbB
 hhiYTyMz3U2/c8QGkhk8GwYOR1CYm1Kc7ZHlN/E7INk4aXqte01N1CSiyAp2tveR1B2I
 hb7cQ9CsHMHsxaI2V7jJmoW2KDav/NTUM93UD8Vif1i9eqqJ7NQ1fzC0WTcRwn2aiWl/
 zA0XNuRTHj4BeQ6HxqOBh8YmKwiNvREECaZahCrX4PcwvIhE6M82DGq7hR9Agv1jpOn6
 0YkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HXXf6CzGWvqGfJ+pWD/XxsKx7m/sfAMCErpAVa4yyHE=;
 b=IA6j7qOqwKXUsUo65xX1ATCXuwQrEbP8302wB7D+Ym1R9efAa8lxxrDLd0YJMpwtzg
 H2CSgkiekklniE2jzi/tqG7dVPrIpF18Xzdh+sTX05tiVvKbqOvzmQyDDqQ6ET7pzPh7
 gCzSMT7IY/OBlVihuX3oRbmYKHP6jLWxIDToRKMWOMDtAJbgK0NBJwInQk5cY4oQS//T
 Qb+hZH1pMzKkdCYCcqaP+fovb9HMQ3F/f4HjT6Lh5w+iaMK0156KvQFhY/fwof9Wuh3y
 m9IND7xZbgXKQyhy3RkSZv8L2ZVWlVd989wyKjsa5O0oy+aJQKoHB6LTjG+aauBK6lnv
 0NVQ==
X-Gm-Message-State: AGi0PuZi9joCwebHxw5x9syu4BIjkF34moxvZMP5waRNMyr9s8V6ftmT
 F41EMBScDxBZr4IQJlCuOMaqoA==
X-Google-Smtp-Source: APiQypKqIj6sEk0xjD5CGDimPOpkhr5FgQcDq+KtN3ZtPclHdg8q5OF+FP+2ZyDS9S0qDaRuPbSqCQ==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr35779556wrx.185.1587039568034; 
 Thu, 16 Apr 2020 05:19:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i13sm22035602wro.50.2020.04.16.05.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 05:19:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Subject: [PATCH v3 8/8] dt-bindings: usb: dwc3: remove old DWC3 wrapper
Date: Thu, 16 Apr 2020 14:19:10 +0200
Message-Id: <20200416121910.12723-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_051929_559881_298FF690 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

There is now an updated bindings for these SoCs making the old
compatible obsolete.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt  | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
deleted file mode 100644
index 9a8b631904fd..000000000000
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Amlogic Meson GX DWC3 USB SoC controller
-
-Required properties:
-- compatible:	depending on the SoC this should contain one of:
-			* amlogic,meson-axg-dwc3
-			* amlogic,meson-gxl-dwc3
-- clocks:	a handle for the "USB general" clock
-- clock-names:	must be "usb_general"
-- resets:	a handle for the shared "USB OTG" reset line
-- reset-names:	must be "usb_otg"
-
-Required child node:
-A child node must exist to represent the core DWC3 IP block. The name of
-the node is not important. The content of the node is defined in dwc3.txt.
-
-PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
-
-Example device nodes:
-		usb0: usb@ff500000 {
-			compatible = "amlogic,meson-axg-dwc3";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			clocks = <&clkc CLKID_USB>;
-			clock-names = "usb_general";
-			resets = <&reset RESET_USB_OTG>;
-			reset-names = "usb_otg";
-
-			dwc3: dwc3@ff500000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0xff500000 0x0 0x100000>;
-				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-				dr_mode = "host";
-				maximum-speed = "high-speed";
-				snps,dis_u2_susphy_quirk;
-				phys = <&usb3_phy>, <&usb2_phy0>;
-				phy-names = "usb2-phy", "usb3-phy";
-			};
-		};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
