Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D05C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:05:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4874D20673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJxSp9VQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q7N99tjj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4874D20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9cEOVreqdfcAksp1y5BY1dH+wRn6EOXnZA1/8bt+MM=; b=cJxSp9VQgkSXjV
	OZDoq/KWsUgRUJPIdk51/MZ+sp7Sz7watFYBybiXemWM6kD+d+VkLwetEzDqe4SR0gLM8T5+Z0Z/x
	azHNCjvVn6S/m9Aiz4uvJAwTMs9yMRyB7TWgZSw/Y3J4CFUl1tdbDv9BodNkTfFMzVNgDCUWaOA9L
	bDeHi47RgiYL6j1dlm1C7R33LDTOZT56kw5yWlp68LIIvzcc9FYUxIMnloSnNU7P6f5V0jMoT/eas
	8CybcS8le8KgFB3CHpbFtKcAts71V7V3di4KpgUZwaCV+IFBIBZjidVyinrR8yHynMHJw5QX9g4fl
	ttnBQASMwGRSlh40F+aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdycb-0006tb-PV; Thu, 20 Jun 2019 15:05:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyYE-0003IP-QA
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id p13so3355342wru.10
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C68d+qcYguHz3zXhv5eHfQ0ZAq7PycGdrc5Cah7BDk8=;
 b=q7N99tjjzhN3+LiLDy4XSG+Gx7+YBnKRo480RP/3ZjsunVDNZDHveRkH/fnqlxH7gD
 /1G4pCqT4MeJ18eq9ir+0HgAJR6JKyYdRD/DbF7xBlUXfI3t/UajywczG0oY1fICNK2H
 MrCPZmxutbZ6yCXVV7t3gsjA8tRtZzj4Y0ONAzVb4wRs4BMP/bReGXley9Sqo/XsjzoP
 4wTPRi8VIIjf7kiySou96AwTW4CNtm3OWC3TSQj37L/SSNqyG/wYegbtv47GTVgBvlFT
 azXZdbCCDMP6bb1j/ehf5HawzD+uHHfihTOUcox/C/pq/+k783QM/nhqc9ytGfdacg8O
 MzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C68d+qcYguHz3zXhv5eHfQ0ZAq7PycGdrc5Cah7BDk8=;
 b=ZIUt/+zAvgruchUNbk8ZRwezHULwxofb5HuIwN0uZQRT0zpFMKAvm68Ej+iUDtDbZ2
 x0ADFFuUdIpoq2FCYkBg9uD1Ad87AqfYtvba1I+az6SoESTRlQ1Zmj0psBZLhJ+Sx9jp
 wiOPx/D6FvNq0xz+fXoChL4S3pUhqraBVE8IPpRSUa2Rtr/GAgI18wpNIM8KrwMIGK+a
 ts1bX/RZB1EbIorPWPflxExH1IaJf8hC7xSP7jjwWL2KnsS4UcroCZWC6emtCIqnIeMM
 EJgw7DccA2ONzAyEj+tkensoTvriG/qkulp/fGN84IMYBRyz78NznyAMqJ9Bqruv0I0n
 QuQQ==
X-Gm-Message-State: APjAAAVDyM+O7EdpP2hz925uI/QYSdJCBUKH2eLMY/NLIAVs/t+neqQX
 zYdBvc2g6Ss7Jf6SdlJum8U+Ig==
X-Google-Smtp-Source: APXvYqzErbqy4BohHinkppm/dPifMbl7dbPGdWxW8WZ7N66gJ3ZM2HTJNXQ2nC2N7QCBPq1HW1MRaA==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr4725863wrp.245.1561042832953; 
 Thu, 20 Jun 2019 08:00:32 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 11/14] arm64: dts: meson-g12a: add cpus OPP table
Date: Thu, 20 Jun 2019 17:00:10 +0200
Message-Id: <20190620150013.13462-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080034_895430_A748A9A5 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the OPP table taken from the vendor u200 and u211 DTS.

The Amlogic G12A SoC seems to available in 3 types :
- low-speed: up to 1,8GHz
- mid-speed: up to 1,908GHz
- high-speed: up to 2.1GHz

And the S905X2 opp voltages are slightly higher than the S905D2
OPP voltages for the low-speed table.

This adds the conservative OPP table with the S905X2 higher voltages
and the maximum low-speed OPP frequency.

The values were tested to be stable on an Amlogic U200 Reference Board,
SeiRobotics SEI510 and X96 Max Set-Top-Boxes running the arm64 cpuburn
at [1] and cycling between all the possible cpufreq translations and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 62 ++++++++++++++++++++-
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index ac15967bb7fa..ba9aab39fd95 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -48,8 +48,64 @@
 			compatible = "cache";
 		};
 	};
-};
 
-&sd_emmc_a {
-	amlogic,dram-access-quirk;
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <761000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <831000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <981000>;
+		};
+	};
 };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
