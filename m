Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26ABC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:54:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5557822B30
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5557822B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0IEc/T9iMWKANb9KCd1/MV6D3IiUwg7U6zSBmIbklqw=; b=psZ1XEb5YHC5FgExkJd46/hzg
	bgMWpRg5BZZCesPWrmQaYCigOk9I/GKro5F3ytTN35CjLSdtuilSlg9a4Ii2qkgzWwZY6eIjOXFot
	qPXoHPmo7l85M9z2Xrn+ijnnUHElYk02rCotTc+YSG8NcdZrsrqR9KvcoOlkDacllDoRVDgpOy/DP
	zAw9OzwCUKKnwf64hJzMoYcyVf4S1yMKBIaXo8+LFyujEiqs+0D/lL1b6MCqDCIuIUuxkOY5KQiq4
	/IndeY4dJXFvx+SxRSRZJ6Iyf29b/MA49hwyKD+ZqLB62mOy8cspRaCd6RrT2wcdy3LxCdo88dUXH
	Qoc6Y/NpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDDX-0001bm-0m; Mon, 07 Dec 2020 09:54:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDDU-0001b2-Sy
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 09:54:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id r7so858902wrc.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UN6aA93vC/SD1YPAlyO4uMMoWkJ3/yWMdTSHUtoRruw=;
 b=Ngjq0VL1bGmIacQy8lD1k+mnd2pOVCuiQowuKH23U05X0K6xGYSmPPDoff2IOyaTD5
 lP5irBVNsOIAzXuCsEWw+Nv5H8BQM32H0/dLssasSlAIPIT9E8WnppPURWE9Ou0/Iz7u
 g0047BFjLgGkufv41sfwaTLxWfBY52mGddcJ6ZtaIhLc3oUF2PlEAuYsnarqRHJuP2N/
 IW0kRQ14Mkl0fMzGb9LjlphMRzlXvM99J9SNd4lgPKmEjuhuYulpM8XivmTbltHVgSzs
 x8tQmN5SJCRI//UKSAJwGoVqYKWAqAgJU3mTU0o0/t+7kG8uMR//D0g+Se8q5CRPCfAq
 JUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UN6aA93vC/SD1YPAlyO4uMMoWkJ3/yWMdTSHUtoRruw=;
 b=ocXc90cMXp/8+pP2YXX6AFMYU9E9EGq/7ikoRn82vdLrDouLxWElGDrwSiVVOh1zq9
 UdEI98R3ZsCepWEn2bd8f4T6v07OG87IC0QcNxyFmzQRN88wUJWKI6cn9G/BO7hlbX5N
 GlKHsG8vMq2PiAdxcEq7mejmKIkzAf4q+TuZ7BnWVqLoj0yP74wArVrMjaie6IX9mE/g
 FQEMlIjxKudxDmy1qHj2JMDNQwoIb5DmOV4hZSTNmRw9e3DSqP8hi1pvyhaNbnhk6Zom
 0vhkpOeBZ0RgKXl1aZ8kIdcjoTkMLjqzs0/TIl1wwJPxx/3M8/ehuQf3Z/Nvh6bQEQfI
 l6/A==
X-Gm-Message-State: AOAM531dEs3IeJ01sTWo1W6E154ifQZg237tEUmBPAVnBP7Mz3Aavy4O
 jMohFT3+agzKBiG3yQPjVbzoqQ==
X-Google-Smtp-Source: ABdhPJz4OF1tVrrRgNAaVkaq9+EQ2tLGO5ijsEk4DKSFcpZF86rWp2XsV1fs+9Znyx+o4qdaXtgMWw==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr18403591wrw.43.1607334839917; 
 Mon, 07 Dec 2020 01:53:59 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id t188sm13558066wmf.9.2020.12.07.01.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 01:53:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: vim3: whitespace fixups
Date: Mon,  7 Dec 2020 10:53:45 +0100
Message-Id: <20201207095346.26297-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207095346.26297-1-jbrunet@baylibre.com>
References: <20201207095346.26297-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_045400_948891_1D8A9F55 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Spaces have been used to indent 2 nodes.
Replace those with tabs and remove one extra newline

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 7b46555ac55a..12465c4becc7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -278,12 +278,12 @@ external_phy: ethernet-phy@0 {
 };
 
 &ethmac {
-        pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
-        pinctrl-names = "default";
-        status = "okay";
-        phy-mode = "rgmii";
-        phy-handle = <&external_phy>;
-        amlogic,tx-delay-ns = <2>;
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
 };
 
 &frddr_a {
@@ -349,9 +349,9 @@ &pcie {
 };
 
 &pwm_ef {
-        status = "okay";
-        pinctrl-0 = <&pwm_e_pins>;
-        pinctrl-names = "default";
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
 };
 
 &saradc {
@@ -445,7 +445,6 @@ w25q128: spi-flash@0 {
 	};
 };
 
-
 &tdmif_a {
 	status = "okay";
 };
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
