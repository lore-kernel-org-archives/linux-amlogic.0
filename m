Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CFEC4740C
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:20:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D10520C01
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="odNYkrXP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KWRSBJVs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D10520C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPHN+cAUqORl/b54/+dE5raKe+pBZD+P8E9g86far6U=; b=odNYkrXP7PJReS
	0w6TpeSNmscPKGAfhzr+7XRiWvCpCwneCevwwbRcDzmKvjc2VLBxDKiO87x4NcYy/Ii9GtJj1mPKc
	8IeQlzD1v2M7+n17PxtT9p1XFDI8OeWxI2p3WitxRSDWI6kLiZwLfmrHWwGS2ZjnJxCIyVX3RZjbY
	XxTPsf4lmhPghSVJi61BiKrlb4O1X5ISs4EyiviFCIzTOo6pVv35qQgbscz7N0D3ORfIsTDkngOCl
	OrIRccSNbe1N9egp8dDTVfkoBJfqOBvX2BU7jenGFBBkUn7JonQTnkVauh0scf/R1MnX6nASMfDqP
	mSVt5xPKzSmWIAdjbouA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBhBi-0004kb-0t; Sat, 21 Sep 2019 15:20:42 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBh9z-000284-1Q; Sat, 21 Sep 2019 15:18:56 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so5373936wma.5;
 Sat, 21 Sep 2019 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR91Xkho7A58iCTl5ApNx6Gn9blyxo7jlHkr4Z2ufbE=;
 b=KWRSBJVsDsKJOmZiT5h/pv4+GIz8T9Vn5Sg/QFlaN8AL6lpIc1VBJZRBiglIK0acUE
 I3dWlqeUmi5lESjDBd6eVVY/oe0QcxsXIiUsgm8iyKkH45U0jTjcZ+AW0SHByk0LJ7CB
 VWrOs6MKnx4J7EUGSv4VqEHMZddFyBeCYc3HwSrh80uTIV2QwkjsQ48C/iQdRtltTsUH
 zJhAfbRzf8oB2sLRFT/h10adWMx+BQ/HkJgch2fFN1QNfLxoXG6Rc+ITjehYR9n9IKgY
 ynAE5QCmoybHDI8BN1BJVEhTDhXRcNnOTzuOdg15ms4wnY8vWzupygv0snfKJA6MgOd/
 /+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR91Xkho7A58iCTl5ApNx6Gn9blyxo7jlHkr4Z2ufbE=;
 b=ejtOHA9u0JKXDCk31px3ntT/YDBv9wOqDXEuBxcBfUit7caPw0AtyzWbBwYCA1s3N4
 5EoOXNXNMqmPA+y3oxTRYrJL1qDBs6qrDQBIRDdIlRKEkFZQcE5rdYGZRLunwgdnsN+G
 qUVTLxCdqX/wIks3cxmHwdDfsr++gMzCGf8UmjBJmvDaILeHG6QPtjW7CORjJz1VnWuE
 nVQ4MtZD6Lt8kwzLIAteO0cLAG/X0zHsFFyWTkrtxq+jmNfTMAYnx6Doozob/7MRqa9Z
 tOV4RaNHcK/IplzQRztIx2+S762azxdWPYAv6DP5+5/DWh6L6QWygJ+JoxpMkOsvXcth
 HH7g==
X-Gm-Message-State: APjAAAXbTO0gUH0Zqhu+w66mAHjOAWBNSbFwsV5i8NmWeCJ4ecNXtkR2
 yE1tISlgkf/oelnXbNUAjX0=
X-Google-Smtp-Source: APXvYqxVJaRV1NZ9p+a9UvRRJxgcRUElyATnSz2niSamFqTnFOLRoyRIYqzSD+uFEQH+1eVwneDFYg==
X-Received: by 2002:a1c:ba08:: with SMTP id k8mr7603515wmf.63.1569079133659;
 Sat, 21 Sep 2019 08:18:53 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id c6sm6003120wrb.60.2019.09.21.08.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:18:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 5/6] ARM: dts: meson8: add the DDR clock controller
Date: Sat, 21 Sep 2019 17:18:34 +0200
Message-Id: <20190921151835.770263-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081855_079984_9507599B 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DDR clock controller and pass it's DDR_CLKID_DDR_PLL to the main
(HHI) clock controller as "ddr_clk". The "ddr_clk" is used as one of the
inputs for the audio clock muxes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 4f59a4c8f036..257c1364864c 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -3,6 +3,7 @@
  * Copyright 2014 Carlo Caione <carlo@caione.org>
  */
 
+#include <dt-bindings/clock/meson8-ddr-clkc.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
 #include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
@@ -195,6 +196,14 @@
 		#size-cells = <1>;
 		ranges = <0x0 0xc8000000 0x8000>;
 
+		ddr_clkc: clock-controller@400 {
+			compatible = "amlogic,meson8-ddr-clkc";
+			reg = <0x400 0x20>;
+			clocks = <&xtal>;
+			clock-names = "xtal";
+			#clock-cells = <1>;
+		};
+
 		dmcbus: bus@6000 {
 			compatible = "simple-bus";
 			reg = <0x6000 0x400>;
@@ -455,8 +464,8 @@
 &hhi {
 	clkc: clock-controller {
 		compatible = "amlogic,meson8-clkc";
-		clocks = <&xtal>;
-		clock-names = "xtal";
+		clocks = <&xtal>, <&ddr_clkc DDR_CLKID_DDR_PLL>;
+		clock-names = "xtal", "ddr_pll";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
