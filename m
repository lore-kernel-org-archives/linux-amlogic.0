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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C47C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:12:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B744206CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y2lA5rE8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gSjEgukU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B744206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pmu8cXdQiSwA89tsgGa0PxanyUzjEmFjd1PQc8ZYp48=; b=Y2lA5rE8X1lwJq
	tjWBqFH4IZd00XY7negjilK9xeOjCNeBemSFfSaG2Pfm+0OepYRJpmDYshk49qdKqCmkxVPkj6yzb
	UVDA+YP/VyKyRVYY/lpO0yMubPXWIbGRoEy2c85IyiW0Wx0CpjiS14Mr/TTPm3DHtTSDBOeL1QdRP
	meJ206VZzM3SmRGXkKhPvz1+rt/84JRqyqE2Oe94xAMwH2e1u9dQkPGslgAAkq4Ia82CB2LeVTE9e
	yKQNYoCBTwxR2tdSrHB+tvmtgNMR/Z+UCy7kPCF0ZrjKV8CbsyTeDCjxJ0Q5GtX6WBmRF1xTMJOQ/
	GyG7nJVoNXSEqTFiSIsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ2e0-0002nf-Fi; Mon, 30 Mar 2020 22:12:32 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ2d4-0001lK-Cg; Mon, 30 Mar 2020 22:11:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id t128so500866wma.0;
 Mon, 30 Mar 2020 15:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cKp3v348vmyZeRheT+gdcc+gPdXRTpNkP+LQYIKnRY=;
 b=gSjEgukUqEEFV5PGf6eqXlNOdSmlijDI9Trne9JLdp++Q3i8ZTE8F9E1nWyxJs87+s
 2aJapUm5GSI1GekjpCVqG/KT0baw06lJdLtJgesPGw6ljriLeEpfup3I0dm+pbvL7jn/
 xZ27MfgHxZ7b8TiFWchs6Wv/hG27na7pRzCnM7ngQkKA8QgAItsu5rMd4g/aH69NzpkD
 UVyFqzPYcE6drMPOoGh6qk+fRLpE06IG4CVR0cnMM3YqmTRDtNQNIeP4Wc97L79/+A3d
 0z6D4+pKtBh+8MlYKFMtQxa6w+r21JMn0HfSIvk0UuuHYHqGdvKhImwKbdP9MbdnvOLz
 jz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cKp3v348vmyZeRheT+gdcc+gPdXRTpNkP+LQYIKnRY=;
 b=bEENqcF5GUjYxcUXf3fKLGTs1oIEkCkz0tgg/gqNDYkX1JX1aWzPlr09Zy02NX4coY
 R+N6ySd3Qmv5Yq4FjEDtkVlTQ4KBTIAUbQwce24kXpyO0Ue36jhls/YklNHEJ9ytcp9F
 12RZGwzX4JwN8w6oA2Z7vkw7ddyBzvkpB/gqTyhOehOq8XrZM5T0FpSkkeh8OVaxQxOL
 L0xX1eI7HU7ZBp67TuJ5jQpAkhKv1qYjl6B9fB9aa2jZ8LFF4h9hd3Ah+/I08KmbfMil
 YS6pK973rMEELlwNpDh0NEYBfYKQv7bbW4Vg750iHeBlzrx1FZoeBhM1f8eKeKk9Kn5n
 fvbA==
X-Gm-Message-State: ANhLgQ3aJdgf2yY6k7qbfvyTMqdIcLCYl35mmdC5RTXGzVKn6VGU4EUw
 nGMUG2njR7uIE+/XloCmclLzlVgy
X-Google-Smtp-Source: ADFU+vvjxSgdZSTx/q1zOs3QcY6XqTZOQEjlrmxJJzC3LdIEuRPhuZATHElr4P4u3rb8X9N0RauShw==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr212421wmi.55.1585606292625;
 Mon, 30 Mar 2020 15:11:32 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b187sm1260509wmc.14.2020.03.30.15.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 15:11:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 jbrunet@baylibre.com, narmstrong@baylibre.com
Subject: [RFC v1 4/5] arm64: dts: amlogic: meson-gxm: add the Mali OPP table
 and use DVFS
Date: Tue, 31 Mar 2020 00:11:03 +0200
Message-Id: <20200330221104.3163788-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
References: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_151134_571410_A146F7CF 
X-CRM114-Status: GOOD (  10.96  )
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

Add the OPP table for the Mali-T820 GPU and drop the hardcoded initial
clock configuration. This enables GPU DVFS and thus saves power when the
GPU is not in use while still being able switch to a higher clock on
demand.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 45 ++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index b6f89f108e28..0f1d1cf4248f 100644
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
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
