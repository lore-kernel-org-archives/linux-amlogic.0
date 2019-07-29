Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3362C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B33206E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9r89+W5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="McTn4QAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B33206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4I/CV00yqx/i8a2C34F5a5xj6Nn3toXXZBT0rnufSI=; b=N9r89+W5uJ1biX
	tMwmiBgieBF2CbczMFAZRz18IYYTKw2T+NkXialHSs8WA10pHecGg59G2oQ2JQvxmCz1S924Ch1l2
	fGQy6EID2pAGmYSAZPf9XJAs/9+VUAQyI5VX45B9zf9Ih2O/d3w/FqPV2dQ0hRqYsjnnHkqyydgA/
	5rFK3vhUbLeKmq4e1Vf1nGJMk5EpghvQD2X5UV4DyyhZQHB076U2/j9wR033bqvKf2aJ9sqsvkwgb
	z/k6v7iuWJqcuC8dlnXiJAWWrZo4/cc3s6XP6n1xwietKicLY/9nqjfS1qx6U3n5yLWHWnNWmDblq
	8NMxsmYBTvfmMj8E6+Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5gB-0003no-Pe; Mon, 29 Jul 2019 13:27:07 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5fY-0002vu-Dl
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 13:26:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id n9so61957172wru.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 06:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YbnyzPyXWl1eZNV2k+kZ6P9lVCAjQouqQ6UbFSEsR+E=;
 b=McTn4QAK5Y8+kC+tAswOQHte57UIRh64u69oCDKhluhwLj6i5hW56hYzvWMzktfas7
 uTrppQZmd8F8Ji2C4wMh1ssx3iILN/pYHALYQthpxmKdLqkGkwgET4Z8D/FE9Dnb9+1z
 vz4UsOaCGgTd8Ox9E82TCHjY251sq03lFaT/n50WVnqXacp3H6fse4AhjVCN1KeOvc3a
 6ebEkGPX+2nb+NVQ5ELVmkURXVBLm1Qc66gN9hdHGzbUtAq9kXErEP2wXTnS2qld5zCQ
 CbHEqUL4avvLeHC2UtswTPYy1/NTxbJHlForQvccXGj9+JmPfYRsUfadEP9BFvPEEm8A
 IXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YbnyzPyXWl1eZNV2k+kZ6P9lVCAjQouqQ6UbFSEsR+E=;
 b=kwINobWTvxNwIqTapBs3OhswjO61mFto2+7tH9BMjaKC9RtzhrtHFVA2+RYY1ClgnS
 dl07F133TOsCHJmo8UTWIb2giKohH9TJiQdWCP+Kd6eAB5i5BxV5gjbtdU36AqGdXt/B
 T/RseFhUaCVeW2JgRoYibWSon9rO48CORP3mm5t7F9VXsCgsFSVGMRAqbFLVc4mMFm+1
 u4hLtcbJstx50z3a5n839hoIvu9e5nAsBtPw1xFtRWZjrwGywrlK9KixCio+SNQTYDBC
 jt/78gHjrNiGfcZLGUvDcuWY4l2RDBFq3a5MG3v8k7KqJ6yI6bWgLgM82fhVc+olorDz
 v99A==
X-Gm-Message-State: APjAAAVXIfgWITHYIjR0UfqG1nxpYleM43GY9TKLcAjS12CQQqGJNgNW
 6yZamkitbHRh3LbsVIRsBtYcrw==
X-Google-Smtp-Source: APXvYqxOVxv7hzBEczo6QBsd6n+qCueWZLH0Qtizk4W35djZW+vaI1LxwLE6MUGBvZYloUY1Z5c/dA==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr45573344wrn.11.1564406786840; 
 Mon, 29 Jul 2019 06:26:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y2sm50270053wrl.4.2019.07.29.06.26.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 06:26:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/6] arm64: dts: meson-g12a: add cpus OPP table
Date: Mon, 29 Jul 2019 15:26:19 +0200
Message-Id: <20190729132622.7566-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729132622.7566-1-narmstrong@baylibre.com>
References: <20190729132622.7566-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_062628_466939_4D716A18 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
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
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index ac15967bb7fa..733a9d46fc4b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -48,6 +48,66 @@
 			compatible = "cache";
 		};
 	};
+
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
 
 &sd_emmc_a {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
