Return-Path: <SRS0=DoMk=PO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6CAC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 18:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43DA60F9D
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 18:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D43DA60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mYo3hr/k5Q0Ao8+NvMFQKD3iOjzhw4ZNSLz5f9+sjMo=; b=cca80Q4e5JhCdw
	Jvv4810BvV/bPOJ8t8M/ZviLF+GHgijw6KIkSwUVenBiYeLpaYh9PVukqQAI/bZhNVY14swc1H7Dk
	TD1wE1TgZN63+HrHyW+MpLX/dMf3oPDhi5eiDP4J25c/ow0Bthn2/NSCDNmaA7I4tIheIm3EnBLjA
	jK3QgbjTF5BEj+Jx3fwpTrQjcYV1jtzOUZpqcSbjJopjE4BoDVUjeJcQy7hSxMNRaysupS5Ys6LjO
	cNxiyuJMxFOMPyqId5afPAcE1k/2mNWsSDONIjR/TwuZO5OChc/d+vQ41OwSmV18hwQKzPpQiNIqC
	N7ozVhKSLYNvNDAFL20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfRBW-002lU2-0e; Tue, 26 Oct 2021 18:28:30 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfRBT-002lSH-8F; Tue, 26 Oct 2021 18:28:28 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Hf0gq50mSzQkFN;
 Tue, 26 Oct 2021 20:28:23 +0200 (CEST)
Authentication-Results: spamfilter02.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635272901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Kwmkfdr1tdKOPf9kwPjK4+8v+qrVHfWTmkeRVh2gk5Q=;
 b=jAsYDLeYsybyQTLy3CCXXMSh0bMGlWzKoWzZ6ZXc6xOEKdZ3jKCmNfK4G1T5kqMtz2McNK
 48EZamaTfX347vvkav+n44waRAzv+AdN9IZGC62OTI3JkokemztCN/9A5VdkFkQZk09OGI
 Ia8ACvhLwDvpP4G+9GA8iuP9Xr1dwl5hLKc3lo7HVlxHiHcVvxsFyEaElCya+g9hETZlYu
 4bNj590yPzJBj/HEu4f0SGNwOu26PutzTFOUCDHg1jwGc8WrLDpfl+7nVFJEeaTFL2slsD
 ZKdCVQiMK/TNstQiioesxtvkiPLUD6PP3e3LoR8k2mKCbvW5Sv7bMBr23d0d0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1635272900; bh=OZWgoDAZIwVxdVotKLIbWL9cDngEId/kN0TTaN37g68=; b=a
 i30sRuivFe5u0Ph3RVWu47o2o+xEnfT+0++k0AQUmpeYLsLkdJKjgGS2ktSYTC5W
 1EZwPETe3KQ36UyRqAA45gF2ndGwiw0ZU+UyOW3oGbMxHwWzJFuPRN+tulSiHBxS
 negORHWutt668MgVWHPsy0Lzk3rUwRdVq1UhRZVMej1/jBZymrSWurdBc+pr7GI8
 yE+xQXsNCxkKTGA1PXzIaG8ebUz38tRstJbxtSlIHxBUWS2h+mRz5toNwX+Sy2tY
 cIia2uhC1Uaxmyfx4mLsiEyzhBvl/qV/C959qOSpzp0QIY+j5LaCPA5mmKnVs2W7
 pPLCKHFuXdViMiLRSfTxg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/3] arm64: dts: amlogic: meson-g12: Fix thermal-zones
 indent
Date: Tue, 26 Oct 2021 20:28:11 +0200
Message-Id: <20211026182813.900775-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 5591F1312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_112827_478651_D069476B 
X-CRM114-Status: GOOD (  13.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This node is currently at /soc/thermal-zones, but the later introduced
bindings in commit 1202a442a31f ("dt-bindings: thermal: Add yaml bindings
for thermal zones") put this at /thermal-zones.
Fix dtb_check warning by moving the thermal-zones node to /

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
Changes in v2:
* Separated from DT bindings patch in v1 (PATCH 1/4)
* Dropped the Fixes tag

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 110 +++++++++---------
 1 file changed, 55 insertions(+), 55 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 00c6f53290d4..ff987e7ccff2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -159,61 +159,6 @@ &clkc CLKID_PCIE_COMB
 			status = "disabled";
 		};
 
-		thermal-zones {
-			cpu_thermal: cpu-thermal {
-				polling-delay = <1000>;
-				polling-delay-passive = <100>;
-				thermal-sensors = <&cpu_temp>;
-
-				trips {
-					cpu_passive: cpu-passive {
-						temperature = <85000>; /* millicelsius */
-						hysteresis = <2000>; /* millicelsius */
-						type = "passive";
-					};
-
-					cpu_hot: cpu-hot {
-						temperature = <95000>; /* millicelsius */
-						hysteresis = <2000>; /* millicelsius */
-						type = "hot";
-					};
-
-					cpu_critical: cpu-critical {
-						temperature = <110000>; /* millicelsius */
-						hysteresis = <2000>; /* millicelsius */
-						type = "critical";
-					};
-				};
-			};
-
-			ddr_thermal: ddr-thermal {
-				polling-delay = <1000>;
-				polling-delay-passive = <100>;
-				thermal-sensors = <&ddr_temp>;
-
-				trips {
-					ddr_passive: ddr-passive {
-						temperature = <85000>; /* millicelsius */
-						hysteresis = <2000>; /* millicelsius */
-						type = "passive";
-					};
-
-					ddr_critical: ddr-critical {
-						temperature = <110000>; /* millicelsius */
-						hysteresis = <2000>; /* millicelsius */
-						type = "critical";
-					};
-				};
-
-				cooling-maps {
-					map {
-						trip = <&ddr_passive>;
-						cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-					};
-				};
-			};
-		};
-
 		ethmac: ethernet@ff3f0000 {
 			compatible = "amlogic,meson-g12a-dwmac",
 				     "snps,dwmac-3.70a",
@@ -2415,6 +2360,61 @@ mali: gpu@ffe40000 {
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&cpu_temp>;
+
+			trips {
+				cpu_passive: cpu-passive {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "passive";
+				};
+
+				cpu_hot: cpu-hot {
+					temperature = <95000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "hot";
+				};
+
+				cpu_critical: cpu-critical {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		ddr_thermal: ddr-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&ddr_temp>;
+
+			trips {
+				ddr_passive: ddr-passive {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "passive";
+				};
+
+				ddr_critical: ddr-critical {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&ddr_passive>;
+					cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
