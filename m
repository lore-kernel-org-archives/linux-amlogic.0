Return-Path: <SRS0=bxQo=AM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6D4C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCE42067D
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3bhD3Av";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PId0Flju"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CCE42067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CSddWu21ibY7fr8zZzvKpy+YWIImRlLVrwlYL614++A=; b=d3bhD3Av57x2Gmf1hnjHrShf9
	Gkz7bc1kmRXny7abD5Os4VsFQtQc2mRD/jrwyNGXi54Q5Xepb8mbzun9Xd3OwiYuCU8H2oISb5kuP
	0CnyQMh5L/owfN56/vsCcoVqA2LjfoRpOV2ULNt/KsWQ8NmagSDIIBDmDQhzmQJ+W+RDOcAPj5AqM
	HCSLsQRtHB374JaclHyOvl5lmwY/5aYrYhpxNZ5si6C/UBDiFFaGgIwNr/KfUSgEUyykMm1k+8WAW
	H+BpYBNc1pxzntE8KmlSUMqz45C0gRMlDKsPpHQR4lbVXb1YIzmvp6nCnQRgkDUc/1nghtk/Do0CM
	1NQG3X+bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZJn-0003Gm-EH; Wed, 01 Jul 2020 09:46:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqZJd-0003BN-V7
 for linux-amlogic@lists.infradead.org; Wed, 01 Jul 2020 09:46:09 +0000
Received: by mail-wm1-x344.google.com with SMTP id w3so10059705wmi.4
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2020 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4XcfcAkqZ4hOUekNAJTnLH2TON/M34d5Vhe+YnBg/I=;
 b=PId0Flju4Q2mnrmD+zyXcMyBEX/vsGY7PaI1Jqf3GwnZ45nmIjaJKl71CR0hmJIihG
 SJTMuR80xK7ueQ+ZhlIv3mFmX74kZIeYpjZcf6J5/WZZYnVJyNFxMRhvqGTF9Z4T9+m4
 GNM3ScLuTEDLnSjWIo446YAVCYLBB3yxXeFip4mLplgBsl6cjjp2otK+1LZTPuMI4Bc5
 Typvtipqs3kyWZ7ISzuVtRu3pFRi2wobeJgZjCfSrU9vzUvSqP/7JJ1N5eBBwsTpnTQI
 WduSPKG8IxfrKAp1EohfeeP42Y/ltaL+eG6heWoZGWo7zhaHyi/DXGRBrS/KK3QB54ay
 hzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4XcfcAkqZ4hOUekNAJTnLH2TON/M34d5Vhe+YnBg/I=;
 b=Nb4P8bxG1pWLfe4EBXggHjbheBaj1iv7kxrWEtCjKA9qtcyZ04un8fzX2z6p9slJnu
 s7AjYQo4rv/RM9taafPTCH3iwfLtVZNMu6oBl4Fiul0bIqxn83ux4Ln2IMEmSJC1In/j
 eGDLzPwLzfhPSrIxXxTkhBFDDS86dJd51SBPubHPH8xKToPqtqug1XCLb/LayGnZab9W
 QgmTH3KFXF9tTtFwuWTJY7fORXBwIt/bR2VOPqq2aZ9rB/24pxwAgpASuulUzQoQmD0q
 4XfBTcPcDJnZA/NYREmLr2wNOFoEam8wQPwBAAfjYwvpFiFbTwKkTijJ4XNhO3figGWR
 mAkQ==
X-Gm-Message-State: AOAM5303u/bsQrKHHtECrZGUbNtRBcek0lO8TzcUcYGw2tY6ACJQbfO4
 L//dpf+EKi//UizqwswCSeP8mg==
X-Google-Smtp-Source: ABdhPJwGYCx4064BPXe4yJCuTcAybc1uPAIFv4sHsqvIdcGQlkWgNAjEJ8RRaVlmu28j/JoPLobTAA==
X-Received: by 2002:a1c:c387:: with SMTP id t129mr18585253wmf.27.1593596763411; 
 Wed, 01 Jul 2020 02:46:03 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f13sm6270472wmb.33.2020.07.01.02.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:46:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: odroid-n2: enable audio loopback
Date: Wed,  1 Jul 2020 11:45:55 +0200
Message-Id: <20200701094556.194498-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200701094556.194498-1-jbrunet@baylibre.com>
References: <20200701094556.194498-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_054606_013374_F72C4DC2 
X-CRM114-Status: GOOD (  10.09  )
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

Add capture pcm interfaces and loopback routes to the odroid-n2

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 65 +++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 169ea283d4ee..d4421ad164bd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -209,11 +209,28 @@ hdmi_connector_in: endpoint {
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "G12B-ODROID-N2";
-		audio-aux-devs = <&tdmout_b>;
+		audio-aux-devs = <&tdmout_b>, <&tdmin_a>, <&tdmin_b>,
+				 <&tdmin_c>, <&tdmin_lb>;
 		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
 				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
-				"TDM_B Playback", "TDMOUT_B OUT";
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"TDMIN_A IN 4", "TDM_B Loopback",
+				"TDMIN_B IN 4", "TDM_B Loopback",
+				"TDMIN_C IN 4", "TDM_B Loopback",
+				"TDMIN_LB IN 1", "TDM_B Loopback",
+				"TODDR_A IN 0", "TDMIN_A OUT",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+				"TODDR_C IN 0", "TDMIN_A OUT",
+				"TODDR_A IN 1", "TDMIN_B OUT",
+				"TODDR_B IN 1", "TDMIN_B OUT",
+				"TODDR_C IN 1", "TDMIN_B OUT",
+				"TODDR_A IN 2", "TDMIN_C OUT",
+				"TODDR_B IN 2", "TDMIN_C OUT",
+				"TODDR_C IN 2", "TDMIN_C OUT",
+				"TODDR_A IN 6", "TDMIN_LB OUT",
+				"TODDR_B IN 6", "TDMIN_LB OUT",
+				"TODDR_C IN 6", "TDMIN_LB OUT";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -236,8 +253,20 @@ dai-link-2 {
 			sound-dai = <&frddr_c>;
 		};
 
-		/* 8ch hdmi interface */
 		dai-link-3 {
+			sound-dai = <&toddr_a>;
+		};
+
+		dai-link-4 {
+			sound-dai = <&toddr_b>;
+		};
+
+		dai-link-5 {
+			sound-dai = <&toddr_c>;
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-6 {
 			sound-dai = <&tdmif_b>;
 			dai-format = "i2s";
 			dai-tdm-slot-tx-mask-0 = <1 1>;
@@ -252,7 +281,7 @@ codec {
 		};
 
 		/* hdmi glue */
-		dai-link-4 {
+		dai-link-7 {
 			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
 
 			codec {
@@ -476,6 +505,22 @@ &tdmif_b {
 	status = "okay";
 };
 
+&tdmin_a {
+	status = "okay";
+};
+
+&tdmin_b {
+	status = "okay";
+};
+
+&tdmin_c {
+	status = "okay";
+};
+
+&tdmin_lb {
+	status = "okay";
+};
+
 &tdmout_b {
 	status = "okay";
 };
@@ -484,6 +529,18 @@ &tohdmitx {
 	status = "okay";
 };
 
+&toddr_a {
+	status = "okay";
+};
+
+&toddr_b {
+	status = "okay";
+};
+
+&toddr_c {
+	status = "okay";
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
