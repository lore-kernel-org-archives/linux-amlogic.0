Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B21C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D3F20659
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ahSGCIJE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o4L9YZI4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D3F20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQMGoiWdQRL57wNvJHfEUhT4h+288LCLb2ZDctQVqcM=; b=ahSGCIJEUHFN7/
	SqKCrv8UZFbVgdPqNr7wxgyALSSB9w7hnIDAkRXhgiFa4M0gRBbhNqDFnmXUdaZ/yDBQFcLY1QdC2
	I/v5wPTDuwWd2SpOCUdfTKe2JijO3kavr8WVs01a7zNDJsEtvszPdNG/MIWLooJxtlWB6zgFFEWk2
	WePCqljOnH0avL485FPA5D5DQMU+bpP6YhzVONfXObiNGHPdSl3X3KmvCBvqTobKi0D1S73WQ3c0d
	IVYjLajxTmYn5XyWKzv0SP4GpHA4af188eguUc91ndExXrE5Bc814ejwvoSuRns3yXh6tyLcjK/BP
	rYiwsoD/kNMgsrMjCYyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhsRu-00088a-Mm; Mon, 01 Jul 2019 09:18:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhsNI-0003O5-JY
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 09:13:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id v14so12911361wrr.4
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 02:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
 b=o4L9YZI4tirHAWoEPlRw2Wu8JfyvxaIcAG41fQgsQnQuu/MRiDTmbBRd2WwQI0lTMO
 2EbfBJktCWM1c8YziYL//jsayWaNiqNfnlsEQBWs+ar1gmJ3faCTTRQER4NoHKZ0VAYG
 iDBXVeUUbTFdI+sM1nU9ywFdWBk81nG3uqMfGy/QfLa10tET1aPMcNGB106uZkIYcAHz
 bTYrgbgF08lACA/XI4EFiEhkuDWTFg8SI1cgoqnc3N2fJJqSdz1qgwVAtB63IwjYy5p9
 7kjToRe9mLpK+7ezTc5njCXjRZfmV/oh+bVCUGdGaoyU7A/lE+dDQyxDTEd59Y5TMnW4
 g4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
 b=R27uuh1kjC3MvdzZAZrTSMyF3kk5I84LP4DA2PZmC+lBF1xJNTIe8zBE4StE0LZQpW
 2JD2xphVuhYVHTgSNZkVxBgeEz3PBx/EV0qnszIiFFrtScVcSaXb0QR7CeXmMNpAG3De
 ZsmQhGc6vooTCum03//UUvK32dLci6SUb8bzTm/3mU8bL1JLgkTYZTAwZ4TJZaWQ8Z97
 mjAmTC2W1AHXDV/WOFt7afu4dOzX6KvPlCTYNo1213Np4LXFpFwHfSzmtWy5CJLnmjK1
 tNWCWScohdbfps/RC2FgzBe0CMiyMO7vMcjD5WL4lRfG5HTtLI0U1dFzrG6hIHlIGj6W
 6iow==
X-Gm-Message-State: APjAAAU+wzidANjXncXzmS2uiO0ZiAHPRED5zuXXcmqzHFW0enUCIhgd
 Ao5sh0aiFO+pZmP0larAPmblBQ==
X-Google-Smtp-Source: APXvYqxpEi241eMf9Uet7rcLU8HyQtNZPpgJjWPMlLqvr3ED55RqUQtQ1LLomYcRVppfIgf4uAhC3Q==
X-Received: by 2002:a5d:4acf:: with SMTP id y15mr12097174wrs.208.1561972402370; 
 Mon, 01 Jul 2019 02:13:22 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 02:13:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v3 11/14] arm64: dts: meson-g12a: add cpus OPP table
Date: Mon,  1 Jul 2019 11:12:55 +0200
Message-Id: <20190701091258.3870-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_021324_712149_4943B6B7 
X-CRM114-Status: GOOD (  10.65  )
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
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
