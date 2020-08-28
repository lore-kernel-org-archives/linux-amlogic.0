Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A0CC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:45:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B42120872
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rm8AzVdv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jZlxt7KT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B42120872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4WO+nBzjUiWLvUq2H7i+StSEGzcRQrYFNISWIe8JMuc=; b=rm8AzVdvQXXlMu3SyJkb/uZdMz
	aVDDRvnLZtc1sH+5jD9M8aFmnGOPL8fbvw4V2X/vr9Vgi35RHXsikTcszT2zIunVUcKGdbEPRoJVf
	afy3WELNEE2QIbLtKbFgqKKilLc8CKaIv4tpYHN5SE3Hmm/qHDTEkqYDM1s9HWsbJDJLebGGQbX0O
	iBdl+Px5ocDzROuqICj6VrC3tdKwuRh1ojdxarrb+FmgRE2lZpmUXQNGY1qgln+ucC2zZx0EPGz85
	uzxjW1KpjKlEU5EhWwD5rPUAv9MTB/kuKe4/flFNLwyFaaMvvx9ZH690uoj8e3njFG1saRHf3kuv7
	2KuXzKVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBgYh-0004wp-BV; Fri, 28 Aug 2020 15:44:55 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBgYb-0004uy-4a
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 15:44:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id y8so1075129wma.0
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qhATtI2Zvpm0REij3LLNrIfTJ+M9IJenHThWHoBmGiI=;
 b=jZlxt7KTrCVhDvXreRYPXF1OaonK1xNxowFd4BZXZLk8gKF/Rn6OWLCASLtc3w2voo
 bLdKPEkFuWD15c1SxL8cDCyzdpPoBPwRkSch3AEsalSkHub1CJ8/XKGq/N1jVYsqhlAg
 vq4w5fX8sCDVW3OkN4y+5grd42JBAhd9jpaqtA/EJB/8eKFNW/cwAxF2TvavVSnohzu2
 S92LyqNN6sWps7hFT9ZaYLBANjOi0JzLZGJNwvy7+2tRMD1N8MJy+De6faPAtRCCcRfH
 GmHY8nv1EWmFSp9QnzVXfZSAbvlUQj5d5RCP0SfMXwSs/tuaJS5cXbqEQGtg1av+yg9g
 L/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qhATtI2Zvpm0REij3LLNrIfTJ+M9IJenHThWHoBmGiI=;
 b=aIqCyibe0ov+pRsJrU7hSy1jvgfBPXUGDZXrseWjKo1NjAfmIzdmKQ9uS2KuAP2BE4
 ZDICdE3loGq6lko6WiCv5SPqS3xXp1NE2V6Oy/TK0SEPmrLGuKUsiA283WOW5vma77be
 p4ll09G8kN/CiAq8QKBZmzWlnkl+f3W1d5ji3YyVB76ZMMhhSlUtrdHSDTM+HHHCfRd6
 5vZOP75YxrmXdBcFvYO+2RvtZbCSG0l6BsrZVBkB/olDnvBZhFBOGIBtdMNFnHE+Aq/7
 T14xBaDILzkjQs9QTcJOIA8o2mz1TlYtaJJdSk5FlBDJ1/zswC8G+6OBDkDe2raF/C+Z
 RuJw==
X-Gm-Message-State: AOAM531XUuZG5LZNENqe9ntoChxeBr9S9NQAEv08FiAEy4p1TJ3ryUlV
 FDX1hwJmtIPtJgwxvWiOg+gAhw==
X-Google-Smtp-Source: ABdhPJxy2BkyCiF+ZCqVarqOqzbgJgq5QLL1gC452i5Iiak7H6GWWdIiVdBq4rcxr6lqvt42K+4agg==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr2167709wmb.24.1598629488091; 
 Fri, 28 Aug 2020 08:44:48 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 124sm3012467wmd.31.2020.08.28.08.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:44:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: vim3l: remove sound card definition
Date: Fri, 28 Aug 2020 17:44:35 +0200
Message-Id: <20200828154435.419561-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_114449_254288_3E148098 
X-CRM114-Status: GOOD (  10.52  )
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

The sound card definition should have been removed when the common
definition was added to the vim3 dtsi but this slips through.
Remove it now.

Fixes: 7c9c06246cea ("arm64: dts: meson: vim3: make sound card common to all variants")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 86 -------------------
 1 file changed, 86 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 0da56c051a0e..4b517ca72059 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -32,69 +32,6 @@ vddcpu: regulator-vddcpu {
 		regulator-boot-on;
 		regulator-always-on;
 	};
-
-	sound {
-		compatible = "amlogic,axg-sound-card";
-		model = "SM1-KHADAS-VIM3L";
-		audio-aux-devs = <&tdmout_a>;
-		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
-				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
-				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
-				"TDM_A Playback", "TDMOUT_A OUT";
-
-		assigned-clocks = <&clkc CLKID_MPLL2>,
-				  <&clkc CLKID_MPLL0>,
-				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
-		assigned-clock-rates = <294912000>,
-				       <270950400>,
-				       <393216000>;
-		status = "okay";
-
-		dai-link-0 {
-			sound-dai = <&frddr_a>;
-		};
-
-		dai-link-1 {
-			sound-dai = <&frddr_b>;
-		};
-
-		dai-link-2 {
-			sound-dai = <&frddr_c>;
-		};
-
-		/* 8ch hdmi interface */
-		dai-link-3 {
-			sound-dai = <&tdmif_a>;
-			dai-format = "i2s";
-			dai-tdm-slot-tx-mask-0 = <1 1>;
-			dai-tdm-slot-tx-mask-1 = <1 1>;
-			dai-tdm-slot-tx-mask-2 = <1 1>;
-			dai-tdm-slot-tx-mask-3 = <1 1>;
-			mclk-fs = <256>;
-
-			codec {
-				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
-			};
-		};
-
-		/* hdmi glue */
-		dai-link-4 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-			codec {
-				sound-dai = <&hdmi_tx>;
-			};
-		};
-	};
-};
-
-&arb {
-	status = "okay";
-};
-
-&clkc_audio {
-	status = "okay";
 };
 
 &cpu0 {
@@ -125,18 +62,6 @@ &cpu3 {
 	clock-latency = <50000>;
 };
 
-&frddr_a {
-	status = "okay";
-};
-
-&frddr_b {
-	status = "okay";
-};
-
-&frddr_c {
-	status = "okay";
-};
-
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
@@ -174,14 +99,3 @@ &usb {
 };
  */
 
-&tdmif_a {
-	status = "okay";
-};
-
-&tdmout_a {
-	status = "okay";
-};
-
-&tohdmitx {
-	status = "okay";
-};
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
