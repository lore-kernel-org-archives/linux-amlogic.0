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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81424C433E7
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5632B21744
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pb5rJiyp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mmhnMc5v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5632B21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HlpFtSEz8rU2D5alj/e5LfP3CTleVZH6mfjteOwH27M=; b=Pb5rJiypPwFJJHpcEq1oA9nz2
	/4zVoBR0L6mat2mHOe10U94LSD/TT/A+xNKAlklO17LmHVYJNVT/YVKDowuOI1w/6GmWxXdeTegEu
	v8MwjYin3tAjsoFsxKd5Fp9p0uyDIU130K8ik5YCfNNGwS2n3hkEsa1lYfxMZ87WwWi+ScR5iEnY5
	MDM56ydahncXBBqtzzypL+LpbiSUv+y2c0CwZi4YCGVz1sJI7BgAJ4AeL/337QVXGjN9N/4MVxM3W
	05EkTzRbmGjC4KI5ams+483sL6lVy63HqKioDI4kWqLryP9blk5Ta0cNUYaTM5RuCQczeedT5gfZL
	NHRWc8nww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxDFy-0007tQ-La; Sun, 19 Jul 2020 17:37:46 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxDFo-0007pQ-Mk; Sun, 19 Jul 2020 17:37:37 +0000
Received: by mail-ed1-x541.google.com with SMTP id d16so11171150edz.12;
 Sun, 19 Jul 2020 10:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=atFB64GMftmxCJqSX3W1/fEQ8GEvmP5dj65WEvyj6Ig=;
 b=mmhnMc5vvkBqUY0g5HcVQnVGha99Zfdec61Tou2dUibaW5JUS7JO9bNNfvtYpwJ+vq
 hnoVjYPmydDsLmq2ALE42DKGR3bCPjARORiV7FSS+BttYbwKdcIHN5kJb+2Avo0AU7eO
 6Q2VNbvcEPxmwf7G6l8fAdYXA5S7If0nePOAR+x3oRKZnfiodDqaCTqbAXarJnJau+IU
 liE1f2UxDZ4yboz/a8PT2RrYcu7J/NFKwxquV1VwOs55EvTXEk9N6F3s2/0A+Y/iwm5K
 B7iYlhvt7AQOcN2Dw5HTnZgjitOyBQ26kvG95FU1Sip5FseFlyGD8HdPNk7aTs8hGIS4
 AlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=atFB64GMftmxCJqSX3W1/fEQ8GEvmP5dj65WEvyj6Ig=;
 b=SBNKLW1qj7sr6n0cV31SvSZGsFAd6wJ6ZEeD07lnLiCTdgzkyqc7Tty7b5G1ujezG/
 v8BLWb116WKuosENyKWtXz7+yAhZcSSQ1535HWupafB5++K/gLeacMS44gSoFmXhTaR9
 bs4qSJ7ic6cJzIBOCJvTbgPI2t+Ju0NyfYlHUqzUfZfGz4Ng3AsF0gXRzJWdJ4vtShPI
 AKwqd0cKKkiBHIvc7ar1Hd1mNKhi38NeZaFQzH9JAclRYNpXLTX0AjOPz1CInJEXjBLA
 j8OI/BRNA6JipOczepEA0DqIv/GCWh+Q8ViisHL5DMbsq/bDtalidFYn4sis9iLaqrTU
 Hbwg==
X-Gm-Message-State: AOAM531y4mCt6sGJNhi/jNjhYrZzXwv030kyZRVfDpaL3G8wQPO3U/OZ
 Xg4DP9Q9Qni6pEup8gSJck9Jeo9Zd9Y=
X-Google-Smtp-Source: ABdhPJysERv/Ac35vflCRyqxg9bHk1hc90cB8jVuB1DDa9obY0Stkk9WaOiezLCZdgLsjY8QLx8EUw==
X-Received: by 2002:a50:8186:: with SMTP id 6mr18611601ede.45.1595180254322;
 Sun, 19 Jul 2020 10:37:34 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f13716be00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3716:be00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 bc23sm13563208edb.90.2020.07.19.10.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 10:37:33 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 2/3] arm64: dts: amlogic: meson-gxm: add the Mali OPP table
 and use DVFS
Date: Sun, 19 Jul 2020 19:32:12 +0200
Message-Id: <20200719173213.639540-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
References: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_133736_773270_39352DFB 
X-CRM114-Status: GOOD (  13.07  )
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

Add the OPP table for the Mali-T820 GPU and drop the hardcoded initial
clock configuration. This enables GPU DVFS and thus saves power when the
GPU is not in use while still being able switch to a higher clock on
demand.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 45 ++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index 40e3e123e05b..fe4145112295 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -82,6 +82,35 @@ cpu7: cpu@103 {
 			#cooling-cells = <2>;
 		};
 	};
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-125000000 {
+			opp-hz = /bits/ 64 <125000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-285714285 {
+			opp-hz = /bits/ 64 <285714285>;
+			opp-microvolt = <950000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-666666666 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <950000>;
+		};
+	};
 };
 
 &apb {
@@ -106,21 +135,7 @@ mali: gpu@c0000 {
 		interrupt-names = "job", "mmu", "gpu";
 		clocks = <&clkc CLKID_MALI>;
 		resets = <&reset RESET_MALI_CAPB3>, <&reset RESET_MALI>;
-
-		/*
-		 * Mali clocking is provided by two identical clock paths
-		 * MALI_0 and MALI_1 muxed to a single clock by a glitch
-		 * free mux to safely change frequency while running.
-		 */
-		assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
-				  <&clkc CLKID_MALI_0>,
-				  <&clkc CLKID_MALI>; /* Glitch free mux */
-		assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
-					 <0>, /* Do Nothing */
-					 <&clkc CLKID_MALI_0>;
-		assigned-clock-rates = <0>, /* Do Nothing */
-				       <666666666>,
-				       <0>; /* Do Nothing */
+		operating-points-v2 = <&gpu_opp_table>;
 	};
 };
 
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
