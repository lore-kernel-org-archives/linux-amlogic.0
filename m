Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEFFC64EB1
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 17:14:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0082083D
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 17:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKQ3kdWf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JCUbcy8f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0082083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qz0ldlZPnh6A2/wbgPL9mG7PZ6OB3VcFdQpKivtIo5Y=; b=NKQ3kdWfQ3UTMi
	5e/wvo3emTCbplBLkikQPDOhOOkVMBbDskImPjwgRLgCDIkjCScxRQrx9JXC3C6dUUZCxIMWP1hI5
	5pwsebQlBCgiflO3XIsqNgSKBj1hgUpb+aT0JCeN8NLFzIja9Pm1gcuHzPLeKT3bARforbGTjuAbZ
	31We4Npev/ICWxMYRRhtzqQH0Vpf550sPGq4WbhFXUQMCXU4Rk/1Af1KD9kio6ntS8ayexPoaYmeD
	LK+40fFl+Wp+e7Z8S5iYANO8drd1FYq2UYyh58ODBsJyo9YFhfGJGaL1uETJdxVOw9hOOQCOpfZLk
	AOz496tYU8xj/ew8egCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVgBb-00052K-9q; Sat, 08 Dec 2018 17:14:39 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVgAP-0003bi-A0; Sat, 08 Dec 2018 17:13:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id z18so7124328wmc.4;
 Sat, 08 Dec 2018 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufWx9PbgvHd9u7lf9dIhnJP1Zesf1aI0AT2ABxZ8FWo=;
 b=JCUbcy8fbbriT57TP9EbGaiaRen5dOCaEiISWaE3Vds2FvaKPFRRP/8G0KisekQrml
 seG1pJZd4ccrt+6vjQ7L16FxkbcsLYdIy0+xA3TwGVq2xYQCVbp+D5Sy78X0JzCdpio4
 l3StGo6j5L9BBFtrRRYXn+fay+aYMqAv33V/K/ijB/KnBjxFXHKkkUgPoEtxrCoVPgfj
 IJkQXg90NqfYeqOcUxGDLqCrJkIUdUqWXDVVaVU9ZPo4Rt3kchilKMxLvbPn3MTWrSXP
 UPxq4duDD0bEprwNPxWZVPztSnw1/3bcDCpE380NO+hCz/4cDCcRyOj9xKsq8V2b+1Oz
 VuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufWx9PbgvHd9u7lf9dIhnJP1Zesf1aI0AT2ABxZ8FWo=;
 b=YABUhgj0h0u25L8MDaDwVNNrANcNG3bO2LWmIXYKuIbtz9AEBKEPcl97P1U8tWibLZ
 l4Wtci/mtooWiUZiyjcIkWNFlbJGuF85bd7PJ3YR2zWD84iUsET3llVjjpGqAE5S4myZ
 ofp/EZtbryaGGS1zgHqmoBqvvuW6Ph4gnu4EuNOUWdI4TcEJYi57l9YDcfGWD4mWkCtO
 F574OjZYYUgBBRViE6kUF9nhqCaIB9Ms8VQHTy07EJs3PXZniSd1ooC21H4CuDX8Uaox
 OVdbvGe2BVkqoR6kzxicfJ/pnzbLUcKewNmpbEXPzxWg+oty5qCaAYcJWWZ4YY6h0buw
 KGcA==
X-Gm-Message-State: AA+aEWbQdEcdAG/8jkQzPAtztELtxTKJA/ZEoziHEo3IsBT6cupxT87i
 uqlEmQg5hWXa8nPvPGDw1Y/hsvZ7
X-Google-Smtp-Source: AFSGD/V6NFAWTfGZ5JvBUa068LACjLxWCimV72QfskWrn1em9hf1ynaHN1tLJ6ZdJ5uUDtKMbv20TQ==
X-Received: by 2002:a1c:650b:: with SMTP id z11mr5656692wmb.23.1544289193388; 
 Sat, 08 Dec 2018 09:13:13 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73FBA00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73f:ba00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r12sm4995851wrq.3.2018.12.08.09.13.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Dec 2018 09:13:12 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 robh+dt@kernel.org
Subject: [PATCH 4/5] ARM: dts: meson8: add the Mali-450 MP6 GPU
Date: Sat,  8 Dec 2018 18:12:46 +0100
Message-Id: <20181208171247.22238-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
References: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181208_091325_760102_8B51685E 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Mali-450 GPU and it's OPP table for the Meson8 and Meson8m2 (the
latter inherits meson8.dtsi).
These SoCs have a Mali-450 GPU with six pixel processors. The OPP table
is taken from the 3.10 vendor kernel which uses the following table:
  FCLK_DEV7 | 1,     /* 182.1 Mhz */
  FCLK_DEV4 | 1,     /* 318.7 Mhz */
  FCLK_DEV3 | 1,     /* 425 Mhz */
  FCLK_DEV5 | 0,     /* 510 Mhz */
  FCLK_DEV4 | 0,     /* 637.5 Mhz */
This describes the mux (FCLK_DEVx) and a 0-based divider in the clock
controller. "FCLK" is "fixed_pll" which is running at 2550MHz.
The "turbo" setting is described by "turbo_clock = 4" where 4 is the
index of the table above.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 3fd8260eba92..1ea5a36c5040 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -166,6 +166,32 @@
 		};
 	};
 
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-182150000 {
+			opp-hz = /bits/ 64 <182150000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-318750000 {
+			opp-hz = /bits/ 64 <318750000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-425000000 {
+			opp-hz = /bits/ 64 <425000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-510000000 {
+			opp-hz = /bits/ 64 <510000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-637500000 {
+			opp-hz = /bits/ 64 <637500000>;
+			opp-microvolt = <1150000>;
+			turbo-mode;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
@@ -208,6 +234,38 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0xd0000000 0x200000>;
+
+		mali: gpu@c0000 {
+			compatible = "amlogic,meson8-mali", "arm,mali-450";
+			reg = <0xc0000 0x40000>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gp", "gpmmu", "pp", "pmu",
+					  "pp0", "ppmmu0", "pp1", "ppmmu1",
+					  "pp2", "ppmmu2", "pp4", "ppmmu4",
+					  "pp5", "ppmmu5", "pp6", "ppmmu6";
+			resets = <&reset RESET_MALI>;
+			clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
+			clock-names = "bus", "core";
+			operating-points-v2 = <&gpu_opp_table>;
+			switch-delay = <0xffff>;
+		};
 	};
 }; /* end of / */
 
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
