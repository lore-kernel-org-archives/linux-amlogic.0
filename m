Return-Path: <SRS0=sv0b=VF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FB9C606BD
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2019 17:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FCC5217F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2019 17:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQjA5UJ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S91Bo/iS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FCC5217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27Bl7r5LcTWYJJhpp4SB4reBD5+4CcuIXG+EKcDe4dA=; b=OQjA5UJ3ynX7uq
	NKnwZnzD4eLEFGvGREKodWSPxamprSy3WeZ7RISGHqL8RADnvKKkSwvdSJa3VtBFn5FaUJsVKtryQ
	EKMiaeouDgRwCWSLbWtx+w89pdF48oYqkHNhejKkiMbrfhYiT8Mawn89cA39HUKfyHN7icuVIBQGx
	XagKZwsSdE1b3GdcU2iuU/iEMvTd8u3gYUDrgy+0BnAhRuLhA6slWsWsPXpvLrUYOy0BQJH/QrCGr
	kdKOIYA7AR99O0C8d/txMoLZ05lcFy5pLmtuZHoIb/NIWPAi6hQ+JjdBPluQkZSfVh8XfDi0G336Q
	Ympfh6XoCMwc2m0C5wSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkXWo-0004cw-Cu; Mon, 08 Jul 2019 17:34:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkXWR-0004L9-Rg; Mon, 08 Jul 2019 17:33:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id g17so7923283wrr.5;
 Mon, 08 Jul 2019 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86nG6aLjB0rQfTa1JeKBqtUNM26fhH8P2gspJ7zF79c=;
 b=S91Bo/iSQVilNEvDQZty21Czz8Xy6eSTLPIR5zKd1Rg3rP5WbxMvS/DJDOeyE/XVXW
 aHFHQjmdXwcK50Y4+jYXBYtJ1flCIXrr+hv3K83zh+T0ClE87unGP8Ase+6yhaoUxRkc
 NlXxB3Zlj5WCpM1b4n+Xrtzxp+0iAxSUa0Pos9bi6RDwo4CpGBfpNcsTpFuaXO9Wy0Xz
 OAmlBOT46F1pTnKUqTgqvOXEsiR2D1zso66KT8sXen593NvAguABVNshKJlE8cfbANZF
 D1iCIKKTJGv1/q0Knl1k9F3MhpY3FCEVKgaw4jtpS2fge1SVLP3Un54aAmOdwfnvWhgG
 zvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86nG6aLjB0rQfTa1JeKBqtUNM26fhH8P2gspJ7zF79c=;
 b=I7RehD1PAZPVI7wE6uSVQbPv3A+a0OYtf+3hAO+GXTBgMONVv3jrf+Q2d2+VFF0irl
 N3COYe5OMDp7W+FXVfhpvRWTl3SsXqRklhyBI34bEM3WgPTLQuMbf0kMaqmDtz0AN13U
 JuikQ8gb7AHPSvNpNosRIQ/ugLYqpROtA0lBIrgd5AS1uvIttMFdCEd6Eg4JgNHQfva3
 F42+W2g/LWzsyxfgbXgYFocSkufGvHttyljxNamtONN5B3MrO80DFJG8rt8ruq3oqaWv
 aJ/QdH/ohyq9K6SiyC7KPStHgli6iMhyhYg9pHcKaurHVkQfgi3raqA3M/zaVBrm9gP3
 4aWQ==
X-Gm-Message-State: APjAAAUty/5jEa31cVyAvZwz5gpnfvSw2JFRHRVPMpyVrV6aVFps/Cbl
 EGnR3+A/GeiK0UCryVWa8JN6GkZz
X-Google-Smtp-Source: APXvYqyw4e6GErWNnFPJZiRpLoMeZMMHruQUP6TKeaX/SOIK6VvvXaEFtgy43V9iJD0S5KCpV+zQhw==
X-Received: by 2002:adf:e947:: with SMTP id m7mr20530156wrn.123.1562607226315; 
 Mon, 08 Jul 2019 10:33:46 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133D62000D8A33B20A298F2F2.dip0.t-ipconnect.de.
 [2003:f1:33d6:2000:d8a3:3b20:a298:f2f2])
 by smtp.googlemail.com with ESMTPSA id s3sm222975wmh.27.2019.07.08.10.33.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 10:33:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, robh+dt@kernel.org, ulf.hansson@linaro.org,
 jianxin.pan@amlogic.com
Subject: [PATCH RFC v1 1/2] dt-bindings: mmc: Document the Amlogic Meson SDHC
 MMC host controller
Date: Mon,  8 Jul 2019 19:33:29 +0200
Message-Id: <20190708173330.13217-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708173330.13217-1-martin.blumenstingl@googlemail.com>
References: <20190708173330.13217-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_103351_894171_166D11AE 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: mark.rutland@arm.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This documents the devicetree bindings for the SDHC MMC host controller
found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
HS200 mode (up to 100MHz clock).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/mmc/amlogic,meson-mx-sdhc.txt    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.txt

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.txt
new file mode 100644
index 000000000000..afe14210030c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.txt
@@ -0,0 +1,34 @@
+* Amlogic Meson6, Meson8, Meson8b and Meson8m2 SDHC controller
+
+The SDHC MMC host controller on Amlogic SoCs provides an eMMC and MMC
+card interface with 1/4/8-bit bus width.
+It supports eMMC spec 4.4x/4.5x including HS200 (up to 100MHz clock).
+
+This file documents the properties in addition to those available in
+the MMC core bindings, documented by mmc.txt.
+
+Required properties:
+ - compatible : must be one of
+	- "amlogic,meson8-sdhc"
+	- "amlogic,meson8b-sdhc"
+	- "amlogic,meson8m2-sdhc"
+	preceded by the generic "amlogic,meson-mx-sdhc"
+ - reg : register base address and size
+ - interrupts : SDHC controller interrupt
+ - clocks : phandle to clock providers
+ - clock-names : "pclk", "clkin0", "clkin1", "clkin2" and "clkin3"
+		 ("pclk" is the module gate clock, and clkin are
+		  the inputs to the internal clock mux)
+
+Examples:
+	mmc@8e00 {
+		compatible = "amlogic,meson8-sdhc", "amlogic,meson-mx-sdhc";
+		reg = <0x8e00 0x42>;
+		interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&clkc CLKID_SDHC>,
+			<&clkc CLKID_XTAL>,
+			<&clkc CLKID_FCLK_DIV4>,
+			<&clkc CLKID_FCLK_DIV3>,
+			<&clkc CLKID_FCLK_DIV5>;
+		clock-names = "pclk", "clkin0", "clkin1", "clkin2", "clkin3";
+	};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
