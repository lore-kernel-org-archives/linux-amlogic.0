Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECBCC64EB1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:53:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1B420892
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="br94c/rB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CPEXXHMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1B420892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU1C/AnGrRa0eF6iIIHcAPug7DyrSuYRFJ/uYu49xrM=; b=br94c/rBmqQ0Dh
	KSTdEW/ymwtaLScRU/R4dOReSGXsu4NzDDeMDByWpDDlqSN76gLFUAlSa2nis3H2uI5igb94EAwTk
	GK25oxTHzhqaHMvqATHb+wLo3k3QOElGlU5ViZnQa4iqJHMFfFjw0Vol3zFAhCJZR5ugyDT+lIeuQ
	ZZ2dcCsvT1StGZWPPAjFqJXPkFs7Wi2jxbGY7L+YyayJkAsUh3h35qjfIrLp9TU8zq6eqpOkBbCdx
	IBUHbKnaF33WnXQetQHPkH09BkKUXFAKINqwvq2UXARiJ5rWI7rVjgNN3LoIpYPeqI9ulP0FGkKes
	yzYUF2UHLmPsqWCY4CQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVDkv-0007Sp-Ij; Fri, 07 Dec 2018 10:53:13 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVDkW-0006y0-Dd
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 10:52:50 +0000
Received: by mail-wm1-x343.google.com with SMTP id y185so1047271wmd.1
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 02:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/vQo9Rx195PT21mlOBWdYcriHO5lvZbWlk7QCDAmXo=;
 b=CPEXXHMjRhhS39zsmYQRXgQ41ROFhA6OBSITXP3xZaSCAvZqjjRaXEUrF7KPSa2Cqj
 DBrWd1L/JBB/d/9XtURupDhApWy/f6SduIpc0Oo/KjExm6uGXbvSwz/ClJcm0Q3jSIDt
 GVVCiaKtVDaxEoqhxsqKhLRx4s53Yw6lp9tinN+GqJYV62HOcfxEPF+MRUO3MFckOyDp
 W4HoOgY0kGU5Kn+7xCfERETd2pix6ltluhU8ZB/VlhaoWajlAKPMAgfbaoGzDFNNBp4L
 0N7hf9CnYdrprgavVI2fCSWAS7kY4XCKQFhFeScFvHRY2y9kwYj6ewK9dCMlMBRN6fw9
 wqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/vQo9Rx195PT21mlOBWdYcriHO5lvZbWlk7QCDAmXo=;
 b=aJ1l6uMbTqto1znSpffwHsIyTzFFVbUCj3XzY1g1cPMGULBz5fycvAjzRspnM9oFMG
 BQqY1lTnZbx3DUK7SRxttaueMKdoa2aO92EWZl/Qbuwm0astwkysxNWyDS+BpBEr2tFH
 73i9Aga9S9d0iTBWJnKxe7pPSF/lx4Xrb7R0xdpy/lYrED1V9k0bSeynlGJDlYiV4BoD
 PVojizl8GKAckbgRFkDUx0PhVlEUpbQ3KW6/llu44lPl3+tFJEMzoP9tr9a4EK8hIWNi
 +lTWw1UyoMHWGuE3RTgOt2L7XkbAOnPOLDS+1/LAE7fCv5Nq29k/UZEG5XZogHZkgQba
 d/0A==
X-Gm-Message-State: AA+aEWa1Gf8B6miQLN4r0D1WfUplNu5FqDdajPMpfyH2A4rssc5s1YD8
 C23zN6ZXcD8FH55RF246o9i0Pg==
X-Google-Smtp-Source: AFSGD/UGklAC1lTwzrN+f06JJI246eXUpGvGQHAgDX0oone1PcSvJx5IUVtIAAh9qnW3ork+ZM7cZQ==
X-Received: by 2002:a1c:ce0e:: with SMTP id e14mr1891764wmg.53.1544179956883; 
 Fri, 07 Dec 2018 02:52:36 -0800 (PST)
Received: from xps.home ([2a00:23c4:f7a1:ce00:800d:14be:d1d:88c5])
 by smtp.gmail.com with ESMTPSA id v187sm1234684wme.0.2018.12.07.02.52.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 02:52:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com,
 ingrassia@epigenesys.com
Subject: [PATCH v2 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
Date: Fri,  7 Dec 2018 10:52:30 +0000
Message-Id: <20181207105231.25593-2-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181207105231.25593-1-ccaione@baylibre.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_025248_455638_8C673F50 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

A long running stress test on a custom board shipping an AXG SoCs and a
Realtek RTL8211F PHY revealed that after a few hours the connection
speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
the 'macirq' (eth0) IRQ would stop being triggered at all and as
consequence the GMAC IRQs never ACKed.

After a painful investigation the problem seemed to be due to a wrong
defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
EDGE_RISING.

The change in the macirq IRQ type also solved another long standing
issue affecting this SoC/PHY where EEE was causing the network
connection to die after stressing it with iperf3 (even though much
sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
well.

Fixes: feb3cbea0946 ("ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage")
Fixes: 6d28d577510f ("ARM64: dts: meson-axg: fix ethernet stability issue")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
 5 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 18778ada7bd3..4d57363ac536 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -357,7 +357,6 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
-			eee-broken-1000t;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index df017dbd2e57..b1a42e99cb67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -143,7 +143,7 @@
 			compatible = "amlogic,meson-axg-dwmac", "snps,dwmac";
 			reg = <0x0 0xff3f0000 0x0 0x10000
 			       0x0 0xff634540 0x0 0x8>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
 				 <&clkc CLKID_FCLK_DIV2>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index f1e5cdbade5e..58e6bcaac1d8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -462,7 +462,7 @@
 			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 54954b314a45..f8d1cedbe600 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -143,7 +143,6 @@
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
-			eee-broken-1000t;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 70325b273bd2..ec09bb5792b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -142,7 +142,6 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
-			eee-broken-1000t;
 		};
 	};
 };
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
