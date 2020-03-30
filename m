Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA500C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:12:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 954AE206CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDXsM/Tv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="B1Yi4hJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 954AE206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjSKoTL8cnafCZ6X/6kIYfeXtKxrXXecZSy4GKH3ekw=; b=VDXsM/TvqRQXSK
	0nQiZOY6HmwqqVCCO9PMsoB+NUMlWCcgb0YVjRN5yfmSKb/zMlKCH+DIuXrV9zd8Bof+BcK/wh7f6
	6A6xdjRv2h64gBMscXQtjMTsErMtMAPhzpAmS1dlMm8U7L21rW4bE7+tNhfTieuT5Wl4IcHzLjXh3
	oTLAe3J2pEHf9xGE3J0/qktYfrJoOB5N5MPO/jORaSZ8nUL1HoIb4PkfSrea5XOhNG9IEmoJwlU3O
	g1kPgnhu6Mwc9BstwTr1pCGakoxKVJFnbEKL+g+qUA7VBhtnmCYuUpERj61Dfs+qiQvEXaOYYgYXk
	G7HF/Wypsgr2oCt/KXSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ2eD-000340-UP; Mon, 30 Mar 2020 22:12:45 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ2d5-0001mN-UB; Mon, 30 Mar 2020 22:11:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id z18so487419wmk.2;
 Mon, 30 Mar 2020 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzCUFuMkzWlLXqOmVXLBXxeE6kPrzuWsI5J2b3JrmKY=;
 b=B1Yi4hJe9+jP1oYxumDlnQbGxnGbQdeD6mr579nVjX9OZZyUZ8ZLyJ6jYNz9MBj1bx
 7maTetDDohQQUmSd5H3Bo71qQkiExseTWyE69vSfxXUpIQkBoYOVsVLlHvz2160L3s55
 QaLzK0+XdB+D2QBN7ymd6vDgY6yu1wRmxSHDMRiSB9Nnqd4vMeAB7BovKAoK7v5uVF5M
 F65EwRTVh0KZvIv/uND1prJXmqY3a7Gvnhv3sdr4QtyqwhfGlfGtEqPjiwzXgfzWyby5
 CovMn2lfBAf/Nte7H15w0e2jvI0kcYNhtrItVakqPwm7VHgAG/xsERYOQRHXXpeCZUOW
 ytfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzCUFuMkzWlLXqOmVXLBXxeE6kPrzuWsI5J2b3JrmKY=;
 b=DaC5XhiPv5uDYuO32RBwAWvh9UDjttgzoKIFXjMElQl3j6ReI3u3luld1Y7RyJh+lp
 J9uH7H/3hDeIzMHrsn2n7EUrkikh/qV1ojP8O2EUJwwWY6/dn8+GGxVTQ2ohM60qJi0d
 D6oBP4MO/yQycMBv/oZpvGyafwg60ISudghxxNsl4B3eq6m4S9+mXjtWEQgv9VpLFXkB
 GSj2SyL3BiLkle7raXsIP6tJnWtQoHw109qe8UtBB4uIzjKQjZz5Bmn8g4Qz5gw3sS6M
 /r2vd+Qrt2brZIllerPgNkUiuM5qwl1GLo20VU1A96CFh6RCJOsNBaCJ3U5eT5Y9Vg5r
 EMig==
X-Gm-Message-State: ANhLgQ3OmpZlAqmSwr3UnAoQGmYB/wxul+icIpQBdT1Fa8zcBBuzaeAD
 uzdtsxb4NNKa2IVvirTvTYelkr3m
X-Google-Smtp-Source: ADFU+vv9tfk0eQLYelRcKNSFwd6CAWgH4qjrJ4Aiglq2T0D+CdLr1vDM+HDBUlMkqJzRgb5BkDwq+g==
X-Received: by 2002:a1c:e203:: with SMTP id z3mr216866wmg.71.1585606293721;
 Mon, 30 Mar 2020 15:11:33 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b187sm1260509wmc.14.2020.03.30.15.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 15:11:33 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 jbrunet@baylibre.com, narmstrong@baylibre.com
Subject: [RFC v1 5/5] arm64: dts: amlogic: meson-g12: add the Mali OPP table
 and use DVFS
Date: Tue, 31 Mar 2020 00:11:04 +0200
Message-Id: <20200330221104.3163788-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
References: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_151135_979145_45183467 
X-CRM114-Status: GOOD (  11.08  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the OPP table for the Mali Bifrost GPU and drop the hardcoded
initial clock configuration. This enables GPU DVFS and thus saves power
when the GPU is not in use while still being able switch to a higher
clock on demand.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 49 +++++++++++++------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0882ea215b88..3f2c7d0802af 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -52,6 +52,39 @@ efuse: efuse {
 		secure-monitor = <&sm>;
 	};
 
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-124999998 {
+			opp-hz = /bits/ 64 <124999998>;
+			opp-microvolt = <800000>;
+		};
+		opp-249999996 {
+			opp-hz = /bits/ 64 <249999996>;
+			opp-microvolt = <800000>;
+		};
+		opp-285714281 {
+			opp-hz = /bits/ 64 <285714281>;
+			opp-microvolt = <800000>;
+		};
+		opp-399999994 {
+			opp-hz = /bits/ 64 <399999994>;
+			opp-microvolt = <800000>;
+		};
+		opp-499999992 {
+			opp-hz = /bits/ 64 <499999992>;
+			opp-microvolt = <800000>;
+		};
+		opp-666666656 {
+			opp-hz = /bits/ 64 <666666656>;
+			opp-microvolt = <800000>;
+		};
+		opp-799999987 {
+			opp-hz = /bits/ 64 <799999987>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -2349,21 +2382,7 @@ mali: gpu@ffe40000 {
 			interrupt-names = "job", "mmu", "gpu";
 			clocks = <&clkc CLKID_MALI>;
 			resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
-
-			/*
-			 * Mali clocking is provided by two identical clock paths
-			 * MALI_0 and MALI_1 muxed to a single clock by a glitch
-			 * free mux to safely change frequency while running.
-			 */
-			assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
-					  <&clkc CLKID_MALI_0>,
-					  <&clkc CLKID_MALI>; /* Glitch free mux */
-			assigned-clock-parents = <&clkc CLKID_FCLK_DIV2P5>,
-						 <0>, /* Do Nothing */
-						 <&clkc CLKID_MALI_0>;
-			assigned-clock-rates = <0>, /* Do Nothing */
-					       <800000000>,
-					       <0>; /* Do Nothing */
+			operating-points-v2 = <&gpu_opp_table>;
 			#cooling-cells = <2>;
 		};
 	};
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
