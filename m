Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF994C4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:54:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78B8722B30
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78B8722B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yNmwecMpyuCvpeC2zJdzTdrxujOwbXvaGBXWY/KNl0o=; b=oWIHP8AmRWYyPudOaPcD9Bqoy
	cNnKKGVvacH8fS9pWCPHUqLIaXPKS6fH6Y+FZCtGr1DxbIhNNjjYbM7N2LIZ3xsH3EtVPQQQtZak+
	G6llEhRIK0LlbTtvzVC8UPFAFpk2qHmfrkVCH+rTLuX1Tnx54d9GZ/ZCAMgj9PK+/i64cG90vygt/
	NpYP4gB9fPzEGQYdnBbB0ZWWwVWVMypO/YOVc3ereHijdWXVgHIK6WJfPmQV8vH6nJrbL/PgX6UDe
	v8+jGECjQnWWn2Hjvcj/PcINNmsPKX0y0INUmywjsGja4om2e5A+i1PGWwX7PnWM2iw0bG7t72CG7
	n+JsKtu1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDDZ-0001cN-5I; Mon, 07 Dec 2020 09:54:05 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDDW-0001bL-3S
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 09:54:02 +0000
Received: by mail-wr1-x444.google.com with SMTP id x6so8179559wro.11
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 01:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+T69uWds35TQLG/jLTGEQSVL+H6ceRPvadepLDcX3dc=;
 b=2TL8+pWXVEUg1MlfV8WS+SppmrUsLz5DcTpIod+2sSBnsmaqSPH6DoQYpKypocIQeg
 frvq52OvsBQwjoqlWw+4UzZAYQMNYkVM2xkUTK1BBmouoscTddjAE/VxQV+ih9iIFHJo
 KGVNsRs2GakXwlhCWVWA9T7PaSw5wRxkpvUQFLusMJ5I5DZGf9g/8ntUsPNr5kaV52b/
 YSja3k+Cnxp/ol89eOWSwS6zSDLOV+g9Y+cPABNH164994EN36hPLKues5Ofb701ZGNs
 OOGG0uCy0hcWJeydOB1FqJB3vol0Pq4SoowKEDEk7RoRHoMmM9SDHbPF+p0jIOBl30bp
 0r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+T69uWds35TQLG/jLTGEQSVL+H6ceRPvadepLDcX3dc=;
 b=d+UY9Z9rE9Z4ZGymNy8MTCvFKIjZ7clzqTFCvlaJqsAwbiM67Y/ymySqENC+oY0UvJ
 yImKv70LQTeN8G++BrltbvbhfxUopGA8t0ZSvUywX1zd7DagZofKX2CW/0oLLn5NPUa8
 gQOaUhivUJvqbhrEX5TyAAwV4WtAn6Pbp3jbyyh6343gvZbNY39PvvuuLxFbgX+4lTaI
 wj3GV1Y2M5ukLmskYMLN77HHHKcYVF39y/EUKJzjIFURDyZJ6wPsFC89jK67f6pefPeX
 /KKhK1nKk59M45uO2DYyhK8dSixlGeLLPeIDe50htZCp2kfFQFAQeqIwIlleVNcKsbOc
 sf8w==
X-Gm-Message-State: AOAM5312U7RWe+bDo2UKnH+s6EUTspPC2Yw9K5ywmD2k31pX4k5aBDyO
 5kNqVjXKhnGV6e1PkwY74rUBqg==
X-Google-Smtp-Source: ABdhPJxDM4KNSH7f7/lDh1sIIdNLPg+kejrnj9WeGMYgaamDmfxL+LwJfinrmm+rbDfBMTWg3b1qiQ==
X-Received: by 2002:a5d:65c8:: with SMTP id e8mr19661606wrw.338.1607334840868; 
 Mon, 07 Dec 2020 01:54:00 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id t188sm13558066wmf.9.2020.12.07.01.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 01:54:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: vim3: enable hdmi audio loopback
Date: Mon,  7 Dec 2020 10:53:46 +0100
Message-Id: <20201207095346.26297-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207095346.26297-1-jbrunet@baylibre.com>
References: <20201207095346.26297-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_045402_153105_F6F507CB 
X-CRM114-Status: GOOD (  13.13  )
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

Enable audio capture frontends and a tdm decoder.
This makes it possible to loopback the audio played on the hdmi codec,
which is the only output interface at the moment.

Of course, one TODDR device would be enough to do that but since
the 3 FRDDRs are enabled on the playback side, let's do the same on the
capture side.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 41 +++++++++++++++++--
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 12465c4becc7..4cf2c193d168 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -166,11 +166,16 @@ hdmi_connector_in: endpoint {
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "G12B-KHADAS-VIM3";
-		audio-aux-devs = <&tdmout_a>;
+		audio-aux-devs = <&tdmin_a>, <&tdmout_a>;
 		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
 				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
 				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
-				"TDM_A Playback", "TDMOUT_A OUT";
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"TDMIN_A IN 1", "TDM_A Capture",
+				"TDMIN_A IN 3", "TDM_A Loopback",
+				"TODDR_A IN 0", "TDMIN_A OUT",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+				"TODDR_C IN 0", "TDMIN_A OUT";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -193,8 +198,20 @@ dai-link-2 {
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
 			sound-dai = <&tdmif_a>;
 			dai-format = "i2s";
 			dai-tdm-slot-tx-mask-0 = <1 1>;
@@ -209,7 +226,7 @@ codec {
 		};
 
 		/* hdmi glue */
-		dai-link-4 {
+		dai-link-7 {
 			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
 
 			codec {
@@ -449,10 +466,26 @@ &tdmif_a {
 	status = "okay";
 };
 
+&tdmin_a {
+	status = "okay";
+};
+
 &tdmout_a {
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
 &tohdmitx {
 	status = "okay";
 };
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
