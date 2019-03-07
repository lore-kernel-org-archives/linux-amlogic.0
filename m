Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5630C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5AF520643
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="akvFChqf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R88ieLyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5AF520643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHboH1tE3/KjnDYYgp6bTZuoZzihqKcHzK+Gc16dTXk=; b=akvFChqfvxVfef
	FLskQ9sHPhNMIcdWeIaymul9ENwatIvFikITH+vVp82WBmn5elly8NFLiZYjUhHVBeEQ82rGT7Ec0
	LlCC0hfisBfwFG5T5YbC5T/RPYx98SdICRMsZKdapbh0IDIFpns7t1/ExcW/wFoTMiHX2GBBevLFO
	8Td7Sc7Hua8e+OhTz4L94YIWRhoRoancJHlsFQqPbJWQB20WFD5OOTzPn3W//5eHR2YV00PiDoqu+
	Jo2m36akUHBSHiubRqAbOSRz1WhKkACHPJbuj4bdzptG//eyKyDSX9RuE8X8qV693hdJ1M+gFGSCj
	qWKEKaHegrNMcJEkD96g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1uv1-0002yD-GW; Thu, 07 Mar 2019 15:26:47 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiW-0003Uk-7o
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:14:03 +0000
Received: by mail-wm1-x342.google.com with SMTP id e74so9615043wmg.3
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmcKckFFoMcjeya15ZmDQKDKc+LuZwnHpbF6leSa7CM=;
 b=R88ieLypq4ahZHl4Hz/vkiNMGbHyglkQCCJ5MG2kcH/UTsHng7NZbOiIfgMHym0cnG
 u4lMN1tj+jEdL9JkpMTOQbQmHpd3dDFyQ7wDZbgjfCpVCbp00j4gH5RPxDfDQNfrzpLt
 6n0E/RYSlHhdAvH1ys2B6yJQ2jMuPSzN5djjlx/YGRUHqeYA982SL8lEQ+pFGWYOF5z3
 J55GT6KlkUTitEotrsOytI6ARK1OquHUFJ0o1I22Ji1DrMIF7tf5BJ8mo5SAYrMDpdc5
 cO8MByqVfyPfI8jr82qPSpsOa2x2I+GMEk/KjtTwegInJ1xa1qr26rcVZtrP9qN2lAFE
 Feog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmcKckFFoMcjeya15ZmDQKDKc+LuZwnHpbF6leSa7CM=;
 b=Ob2H889cEMHCCBTwAam1NvBhDAVUPSOpzPYKN5oAZmutbmNtfKp2pWI09GyoleBcqR
 EYkuKlSupHqcYzxJcRDUVszsgeZFx209VBaxFnKYaBvvh7DrzT/04Bj11juhJhZpSvVr
 A9IVyeDoQui+g04I0+4RluYOrNjFPveL2z7Ji7T4BdTCn57v57nci+0WGvLRkaPXTubM
 YS2xS90ODSfgR9VT0wlcNTFMlh1QQyE5lZxVkEKt22ZGbuiIanS1h6BcnkaU+4b9Bq9u
 kGu1rABia81buFHwA5VLn2biwHZs6nniLSCrlf7e2UV5Roz5z7swN++FzCInYo+ClCXe
 JcOg==
X-Gm-Message-State: APjAAAVHGbyKptBOAEkg6z0gfev4OGijb8lYppNjV7k+JC3TTjMzYSQl
 ++8hrs+yY91kpHYuDhGCuGjYtCvJVY7TKg==
X-Google-Smtp-Source: APXvYqxSlBK/CV8ggTc1nVlXI79nkBo7btojOUczdtNPu3F7Hj96Dipv0Fap+6ZNAh7o9KVT/Lswgw==
X-Received: by 2002:a1c:6506:: with SMTP id z6mr5902373wmb.153.1551971630737; 
 Thu, 07 Mar 2019 07:13:50 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:50 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 9/9] arm64: dts: meson: g12a: Add mali-g31 gpu node
Date: Thu,  7 Mar 2019 16:13:41 +0100
Message-Id: <20190307151342.7381-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071352_547042_6DA64F4C 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the ARM Mali G31 GPU node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 991883ea023c..bd2d9379dcb5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -431,6 +431,33 @@
 				snps,quirk-frame-length-adjustment;
 			};
 		};
+
+		mali: gpu@ffe40000 {
+			compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
+			reg = <0x0 0xffe40000 0x0 0x40000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gpu", "mmu", "job";
+			clocks = <&clkc CLKID_MALI>;
+			resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
+
+			/*
+			 * Mali clocking is provided by two identical clock paths
+			 * MALI_0 and MALI_1 muxed to a single clock by a glitch
+			 * free mux to safely change frequency while running.
+			 */
+			assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
+					  <&clkc CLKID_MALI_0>,
+					  <&clkc CLKID_MALI>; /* Glitch free mux */
+			assigned-clock-parents = <&clkc CLKID_FCLK_DIV2P5>,
+						 <0>, /* Do Nothing */
+						 <&clkc CLKID_MALI_0>;
+			assigned-clock-rates = <0>, /* Do Nothing */
+					       <800000000>,
+					       <0>; /* Do Nothing */
+		};
 	};
 
 	timer {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
