Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B582C49ED7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0C3216C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAfrKajb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hGzPVFic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E0C3216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rngLxNC4oHzrmoVOn2xt/BKbqMVD4uxmRRbmF4micwE=; b=eAfrKajbhjSkWT
	S4nkk9OC/3l2XkVelXAz/VWHVX0Rrf0Y7bkfw2VI2wQbfdiv9OxzzhC6xQ1WjrGimRGq3N2JrIA+v
	Xi9d5X5X4bNifOnTxFvmi67YHEQhAKPWrP25fRexfISZ4x3tROLpR2me94rRBnrswnjj0au8TYLNV
	68u/LYo2u4TCuwNJ69JgF66lLj27o2P4dIDa/zyLv6uFWgUlIiL3B/UBcsjdb2K/jwvc8/+/fg/Wh
	TMez3kQLfDeOtwhVJDFkc0tRsHlronJDVWEn25ncC3pxP2pDM4lUOFi5FAO20uAc7otCJ85+j1GGV
	5k5u2MQ/7df0faS+MiJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qSe-0002qj-1C; Mon, 16 Sep 2019 12:50:32 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qSY-0002n9-RT
 for linux-amlogic@lists.infradead.org; Mon, 16 Sep 2019 12:50:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id o184so10211751wme.3
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2019 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUfEPcm9zIxhFldZrxhkkyEwszDIg8DVmTXvmpvcNks=;
 b=hGzPVFic9jJ7l+dNqFEPZDAs17LUMFemybtUi2RQyKw4lNI31vG7ESwuhjCNfAhchl
 XL+JaCuTHmaduj2rp+jzvbG91jeWWFl1S9rh+MWdyOgDafQ3dHPu6spLWfinKamEXsYu
 k7J6v10E1nloeG+cbZ/Flvr4V7zrS9/24ysmPwpsMtcwmsC6Z6s2dyXzqyPMKgBDTPXE
 DbPgewVsW58oXs4phbQA2y/j4zIEN0faYeqmg0zyBS5BTYeL59yvrlEaFGFlFzr5IEwm
 l9RMFVTn1uiwphZ5Tf7dAoaD0AhtQYQ8F+B91Hhfkaknc14B0KVq7faVT4m9nScuyOuZ
 9+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XUfEPcm9zIxhFldZrxhkkyEwszDIg8DVmTXvmpvcNks=;
 b=jl4PL8KPGFc40TvvrjW5jKJ7Ycg7+grDUltKikoZkgY6rTmECCyg+TLJQLfwrP9r05
 wV/1rgXShwP0iK19eAIxWYbQeeIVQSpeqiTXJ/f/aP1+qEXyecwWGY4dbqi/QVxjz8dP
 0A6rLIL5x1in8bssc4H6g9BxtYJyGCpbQdIZJx2ZbtVihkJ62d8leaAFv7EcWbeKlDlc
 7hpaVk2opFsuqOarJwjYEeo/ICYm2pGFwbU/90BuHkSaTeuMXdQyOJ9oIzzr/PZ32e+k
 AXxyQ9MvRttHrNhz4JTemgdVeJiDYLk91Is1HZKOimrGoeUf5wmqRmEVm/jj+HUIJng4
 5eHw==
X-Gm-Message-State: APjAAAWft6vRncWSR/5ffLsqe0ebMij8/l5UXUkRJE846ClsIuWvbgoK
 KOqIQnKB11CjgdeI+ONknRNpYw==
X-Google-Smtp-Source: APXvYqzlEUxhl3f79IATgDynHyFjQHa279fyhuqpYRKAX5RH9mVOwoSkz7D6xHrly5Fbd8jfpRx2NQ==
X-Received: by 2002:a1c:7fcc:: with SMTP id a195mr14283145wmd.27.1568638225511; 
 Mon, 16 Sep 2019 05:50:25 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o12sm15109960wrm.23.2019.09.16.05.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 05:50:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lorenzo.pieralisi@arm.com, kishon@ti.com,
 bhelgaas@google.com, andrew.murray@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: pci: amlogic,
 meson-pcie: Add G12A bindings
Date: Mon, 16 Sep 2019 14:50:17 +0200
Message-Id: <20190916125022.10754-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190916125022.10754-1-narmstrong@baylibre.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_055027_118969_1574BD86 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: Rob Herring <robh@kernel.org>, gouwa@khadas.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 nick@khadas.com, linux-kernel@vger.kernel.org, yue.wang@Amlogic.com,
 repk@triplefau.lt, maz@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add PCIE bindings for the Amlogic G12A SoC, the support is the same
but the PHY is shared with USB3 to control the differential lines.

Thus this adds a phy phandle to control the PHY, and only requires the
MIPI clock for the Amlogic AXG SoC Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
