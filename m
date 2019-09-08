Return-Path: <SRS0=w9Vw=XD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2765CC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Sep 2019 13:43:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB332082C
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Sep 2019 13:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OctSosPL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lbql9c8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB332082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tZcEFQG26y97Rm8n991H0XzoDvpK9ns2iVUtVilHOt4=; b=OctSosPLum3hZ2dED4iEnZREE/
	HnGgyUGeFWjXbgBbEOmHRsvBn3EDVbRFCP0y2AuNvWQUw6YQfvW84QNnlnV+Lw4SiJuJmAh5gNjDC
	619d20u3OerZ16Tlo6KvI2ndQsuomeptKQAWVRkF2Mmqbzwavxzm8T/pIuomCGYbvyGZAxEqSEDKC
	cbFbO5BR8ZWokaltg84FUJkvB0l7DeB0oZnXqWGlYCFRlhvlmcDVgUlSCjIOShmV9Scpob/VwJO8b
	Y4v4MDxhG+/u8AjqsibkXOMdYuivu8FMm9zD0G+do22KU924iKsoLpqRYovZcQs6Du0T2A1Rdu6A6
	USQ6BgQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6xTN-00056Y-3Z; Sun, 08 Sep 2019 13:43:21 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6xT9-0004pe-RJ
 for linux-amlogic@lists.infradead.org; Sun, 08 Sep 2019 13:43:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id a11so1231623wrx.1
 for <linux-amlogic@lists.infradead.org>; Sun, 08 Sep 2019 06:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xt1ffsoUiU7bT/Gov0+R38ESRfVKrIaJ7x08/AD9uzc=;
 b=lbql9c8+5mvR7s5hfpeYHEGX44nXAwByd9MoEUudRXKDCdeTIQe/4v38PDvQWQfZld
 2IBA1YQXWdhy3Ww/R6HXHYdLi8j/vGRDOeMIB++OCr/0aQjHEY6Qq5JJ07scDhYtHBeh
 7/DBLZbcBSPfOPrpuo1se9tVTrcHpCYDJiNShaWxyMwrHO2zKWMQCqRCjyYvZc7hz5rP
 QLlBcksMZAX0b29TqiokQP9D91edjPv55/xfEc4U3PvTL8ZoxUb4leLIrg1jv9zpAlQe
 hByQQF4mjzB8y20bZSXdFBvUeLXG2PneuC7fvxJKn3bkIwXNrHyNSuQG7qzj+0WozHmd
 +OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xt1ffsoUiU7bT/Gov0+R38ESRfVKrIaJ7x08/AD9uzc=;
 b=TyP3Ay3xCFDuwsI2YMcCVP5p53x5tfhL7Ry0i5UmgQcKPWjH6LzIkHLZO6cP0GGm8h
 Xsn/8G+8pe1IRDad+DhO5Uuh+qLAlvoSCr+G7b50/P0Z+N4peUfYy3xZYSApTQOZsfkg
 0hW8DLAe/Y4x8dpf83k/ufhgectFXNZeCJHAKtOnGkDmKnomqkmQv5LCQUeLqSsMYF4q
 KRWF+WH7aeKPmPpqdeM84Z4gpbhSPG+SNdAIQS/J8kgCmdnnzqt/sca4iYJdYSB+i9N2
 YzlVqrdI4Ltm0mi/TdVNy9P7BodoQhS4hdrIjNMFB07F8TkQGsXZd97mYI+1RqABTUWD
 /C7w==
X-Gm-Message-State: APjAAAWloYPFoO1Q+ySxdKlvgRYGSV97go6AbyVTkKqPFHouQ3sareXK
 iUdC5+qAkIgLYvZjNSu0zKud9g==
X-Google-Smtp-Source: APXvYqyS25653EfNGnpyjyb3kIdPuTAn8ZaDNoaRLdF9Ag8xPDJ7VA8Zq5/dKaLqURBcQaOjHotmOA==
X-Received: by 2002:a5d:5444:: with SMTP id w4mr14661533wrv.180.1567950184983; 
 Sun, 08 Sep 2019 06:43:04 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id t203sm14313902wmf.42.2019.09.08.06.43.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 08 Sep 2019 06:43:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, bhelgaas@google.com, lorenzo.pieralisi@arm.com,
 yue.wang@Amlogic.com, kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: pci: amlogic,meson-pcie: Add G12A bindings
Date: Sun,  8 Sep 2019 13:42:53 +0000
Message-Id: <1567950178-4466-2-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
References: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190908_064307_891156_2D2662E7 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org,
 linux-kernel@vger.kernel.org, repk@triplefau.lt, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add PCIE bindings for the Amlogic G12A SoC, the support is the same
but the PHY is shared with USB3 to control the differential lines.

Thus this adds a phy phandle to control the PHY, and sets invalid
MIPI clock as optional for G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/pci/amlogic,meson-pcie.txt   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
index efa2c8b9b85a..84fdc422792e 100644
--- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
@@ -9,13 +9,16 @@ Additional properties are described here:
 
 Required properties:
 - compatible:
-	should contain "amlogic,axg-pcie" to identify the core.
+	should contain :
+	- "amlogic,axg-pcie" for AXG SoC Family
+	- "amlogic,g12a-pcie" for G12A SoC Family
+	to identify the core.
 - reg:
 	should contain the configuration address space.
 - reg-names: Must be
 	- "elbi"	External local bus interface registers
 	- "cfg"		Meson specific registers
-	- "phy"		Meson PCIE PHY registers
+	- "phy"		Meson PCIE PHY registers for AXG SoC Family
 	- "config"	PCIe configuration space
 - reset-gpios: The GPIO to generate PCIe PERST# assert and deassert signal.
 - clocks: Must contain an entry for each entry in clock-names.
@@ -23,12 +26,13 @@ Required properties:
 	- "pclk"       PCIe GEN 100M PLL clock
 	- "port"       PCIe_x(A or B) RC clock gate
 	- "general"    PCIe Phy clock
-	- "mipi"       PCIe_x(A or B) 100M ref clock gate
+	- "mipi"       PCIe_x(A or B) 100M ref clock gate for AXG SoC Family
 - resets: phandle to the reset lines.
 - reset-names: must contain "phy" "port" and "apb"
-       - "phy"         Share PHY reset
+       - "phy"         Share PHY reset for AXG SoC Family
        - "port"        Port A or B reset
        - "apb"         Share APB reset
+- phys: should contain a phandle to the shared phy for G12A SoC Family
 - device_type:
 	should be "pci". As specified in designware-pcie.txt
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
