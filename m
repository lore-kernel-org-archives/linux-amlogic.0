Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DFBC433EB
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253542176B
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SohGoQzA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QhvqeFhN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253542176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6aFvl9Frg5MyWYJ3gV7BbdY4gzWwEHMpNhyvofN9tsg=; b=SohGoQzAK3meWuHozWkI1W1cC
	va6dUu4NQyn+LuhNwDMfF6FMefbufwj3xtCZq+Rh6dUk+02ubsx98mQLwqazHHsun6nwwY6AjIlPs
	vHChGqJnEH5q83Rk20a5VrvtnGmQckT2rtQZ+P8nF3A6yQrcr3ohohuFPxuDdCzH/x9IOuVDmttZP
	GfnDHcr15xrGfqN7fprhB2sGSMzxBa1IJ28XsGo1OLHUYjbeEQ0jMWkKBQ/vrGijaQIveKCzwhM5i
	pjgNQam1y572UMxjv/ZxCwixeV++nIWUVE2R7vTAfDrhaqrN7Nu/ubmxOxDocuCFbpCBcg40aDRdF
	Nsr1zL2gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxDG1-0007uK-4c; Sun, 19 Jul 2020 17:37:49 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxDFo-0007pg-Rp; Sun, 19 Jul 2020 17:37:38 +0000
Received: by mail-ej1-x642.google.com with SMTP id lx13so15821179ejb.4;
 Sun, 19 Jul 2020 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svBQ48FtEnymjEIEsIW4yq0ZVQW2iN3RktvuKlr5ugY=;
 b=QhvqeFhNUX3vLvzt9JVW8guBZMKIMLD+KyBKhJW9IqZxZ694qqzfwKxjXiB0aPEnzp
 iEfVa9bF1truGVUNYFRQ27dS7guNBErSgBPO3hkoPuGS/SQ2MIV2nMZOz9Yvl6E+e6LG
 B/9Sn5p0jMpyfaVZvVl+EXqPgCvFjvo4PWOBPW3dAHLuQyIzBwEz3Nth4XfynTZHtN9Z
 ggrJ3+57MdQCdTZ3Uwd+DUP7YREfzRGKOJghP/WZBVSZXkDXSXnCVHV/yRPDNX52yN+e
 K1LrCDkQJFW9RNgQTPEy9N/CWt1Ywy56JYpcakBoANPGlh8eT65gGAz9toDXNfn3fjST
 clAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svBQ48FtEnymjEIEsIW4yq0ZVQW2iN3RktvuKlr5ugY=;
 b=CHMlI0fbyC0EGCar9xPB/WFLKzJwffU/Tzj0JYLCXP9dBDIh6EqKL3JVyoeojjAWX1
 0NXamgg4fQdIGXFJWwOppuiMLts/ns+TZCw3t6JbWUboNAzU5sRagljAAn4hHiSM90+C
 59IibDooBBYQ48k9hJLi0B52NsYI7L8z9ve4oKQRG9+b6bgxGFG1bXS+yYI3PCe07DZL
 RY5aQ3UgoO4fHPp0EvqffcUGhYnBRQ/gMcadJoulj43NTGhyFfX27O5Ru+NS77J8m0is
 sBv4O7zb3GZGpAJl+GfcqYAXvqevNdhVexvbmYuZaTMXKBfdK+sgrmV4XcFWtuNIqvZv
 xbQw==
X-Gm-Message-State: AOAM532Tt3+OCwZlRfaREnn5aecXowd/NskD5MHhm7H0XoO8Koi86aby
 Stm0IJsw7oXJVf8Fe9vwXxF/RS0Qnw4=
X-Google-Smtp-Source: ABdhPJy7/IVYkZ2KV3q8/4zJ5tfp9P7YFMYauWis/C0570Yxr2ABjYO24fK6l9CSUG8KVuZjFAJwGg==
X-Received: by 2002:a17:906:7709:: with SMTP id
 q9mr17111096ejm.123.1595180255290; 
 Sun, 19 Jul 2020 10:37:35 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f13716be00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3716:be00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 bc23sm13563208edb.90.2020.07.19.10.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 10:37:34 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 3/3] arm64: dts: amlogic: meson-g12: add the Mali OPP table
 and use DVFS
Date: Sun, 19 Jul 2020 19:32:13 +0200
Message-Id: <20200719173213.639540-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
References: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_133736_967402_B589F28A 
X-CRM114-Status: GOOD (  14.17  )
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
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the OPP table for the Mali Bifrost GPU and drop the hardcoded
initial clock configuration. This enables GPU DVFS and thus saves power
when the GPU is not in use while still being able switch to a higher
clock on demand.

Set the GP0_PLL clock to 744MHz (which is the only frequency which
cannot be derived from the FCLK dividers) as the clock driver avoids
setting the parent clock rates so the HIFI PLL clock isn't changed (as
that's reserved for audio).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 49 +++++++++++++------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 41805f2ed8fc..1e83ec5b8c91 100644
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
@@ -2362,21 +2395,7 @@ mali: gpu@ffe40000 {
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
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
