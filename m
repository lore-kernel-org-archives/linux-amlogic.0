Return-Path: <SRS0=hrph=PL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9846AC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:50:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6E260E74
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D6E260E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghzOac1TazDUf/PhICsDh2oPZfps9f0geMAJKJ6hMNA=; b=CjtVhWi4NRwTnk
	qxOUgxagmklbarQuo87Qgjx3qJISKoTg6w7dWq+FWmml0oTTszUkvSGVYNW3y/RkQy7adD+fqanmQ
	SvAe9aJg50P7AtdbfXvIXfxiIjWIC8NKe+NEEbu5qDf6P/odCvVb+Q2y3bQMVvzna6c/Wqkp1A1al
	Ci2b74ylgD1PEQ11KRpwpjMlpHQzY+yu6AO3YaJ/709XKelDnPzRPtAW3Q+kMRspdCz0lM23c0zTh
	OfDRkergRTrvcSEVp623C8nSoqG42310gCpiLZDr4savIW+9cQDMbjukiGzSP1UmfoYbwO1g+a9KQ
	r8WS1UlNhQk8hU7B3x2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meOtt-00DPa5-MB; Sat, 23 Oct 2021 21:50:01 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meOtL-00DPOi-AC; Sat, 23 Oct 2021 21:49:28 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4HcFH46HnTzQk9v;
 Sat, 23 Oct 2021 23:49:20 +0200 (CEST)
Authentication-Results: spamfilter06.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635025758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUrf1nhCDOQOUrHJ4BpLdwx5eRFkj1jY2SKiUa9xR7Y=;
 b=UH2Og2Dd5olf5BYh4ctgBx5DX1NVE39Vrbhw3sluYAni+lGSNhx6nZ8aCt8KQBHk0XJgG6
 Ia3PxgsgSLf1d4BaOI7nEBtxk/3oUBZsiYs/HJ3jTVr1m3aRB3zzrYp7XNsF0OuLLSlyLH
 WIkZVstG5LGxCWGzQKIpUmXSA0GtxDttbAj1JRn1Cxn75qLzQ74Eer9mpQ444LieVNxego
 eL2WlOjfb3KQayFl+kglRtnQ2lFFForR950Ww9yTTz1EJjhI07Is1GSR1tA8Zp2qTqS8lV
 jTk5PjWWxgxkWDUrDtNAtwyv30ZLcQVsCTQ1frPbIrOph+JjLeN1ckf3DBNx5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received; s=
 mail20150812; t=1635025756; bh=WVaRi2mv/LzxxFIw9X7g8t0al5oNdUKDS
 Nx8JxCKcUs=; b=XiUgyRw5XRbWWxomalYqgAWGoiYfUxiwAhljlXe5Wc5cL7MAz
 QQAZxMDSgdjPmvQbLKk++cr/ZmtC4CdfpFpRT82WdCDtAQ3LpuMA6sahyiN1ZoO/
 KHALymaJ7CJ35fYjb9w2DvR2vhxoIeuWFZIu0blz8/mfLuBjBdDxor8W1dOHKx6K
 LgIDrb2dLc6jRXnj9lJb9hyaO4xlE7fMQYffOS8v3FahwZBEPBG78oz0VvHJU94h
 4Fzpu9izbvHCG8G3EoX81us0W5D1Z2/CQdbreaAN9PgWT7NIIh30RfS8Zik9bI5b
 BII47aBS/AtpYhRUybGz86z6j+Ufn6w9IgxxQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: dts: amlogic: meson-g12: Fix thermal-zones indent
Date: Sat, 23 Oct 2021 23:48:54 +0200
Message-Id: <20211023214856.30097-2-alexander.stein@mailbox.org>
In-Reply-To: <20211023214856.30097-1-alexander.stein@mailbox.org>
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: BC7861312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_144927_526538_D0C3EA80 
X-CRM114-Status: GOOD (  13.73  )
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

Fixes: e7251ed74ef7 ("arm64: dts: meson: g12: Add minimal thermal zone")
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
I admit I'm a bit unsure about the 'Fixes' tag as at the time when those
thermal-zones were added there was no schema present. So there was no bug at
the time of writing. I'm ok either way.

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
