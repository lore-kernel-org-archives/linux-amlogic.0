Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2943EC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPoBkfxu6Uj4OyJkf5TsGcf0Wxf2qnP+YbttdlyRjYA=; b=joplZhgkhn0Uyo
	NqZFrKeQhQmO1Y2TDCbVA/IZ4RPUEeS9RBJEwmVbdyrOZ27DZ0UJZ5fLjQt5iXU4/+ApqOctwZvmK
	i1u8htq95ivwOu4OPxVUwQTTaJ8kiKMRPjYWO+adARSXEkHP0MIAqEqxWQYjNX2g4sMEZGP3BZy/l
	X8sN6EWJMz05vy12A/l2CUY28IHuMIieIxVBGuK2TxfNAlwvAzocbzVvqdqhoRZdBfQNwgJsCYo9N
	SdKnI0ag2h+irtAdvbXzXAJJGxYzboag1w+Cgl8IsDvOa+iZiz66BO0g4YPXsi01y396bJz/w9t5s
	s4FrJueGSZ4c0/xePiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0E2-004Yt3-V7; Tue, 30 Nov 2021 10:19:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzxj-004Tje-63
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:02:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c4so43091107wrd.9
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQNf1jb+oM4Q0vCqJnqmXLx+F84dNeiuJDE210Yt7E4=;
 b=JloMFV+eOjaemtIsi6SlE3gSiN/2NjlDv5Q8eL9sKoO/ogaDDDrugB5Da56fUqKX6B
 0A9J41R2AurwDoBgRAKDYWSwTOC02AnHm5egm0FxYDV7MZnK8tpb4ATnLb5avGsNEs0S
 44Zcdn/nqrclaLb2t6+KS3ynvMfpKJ3ienvxiEX3Q9fQDP/ckDpO7bT6HjKSfjL1x1g1
 2+aGi4QP2JDt7U7+EI92Kqexm6sLRD50oNzFBWChatgXdLMsBioVComUOXOiFl3Et0Jj
 ApCKBfP4c6RfPsGQOOtsI3nIJyO8bly8t6RRc3nsFOssKJZuyqmTPRiZddGE+l6dHY30
 ZRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQNf1jb+oM4Q0vCqJnqmXLx+F84dNeiuJDE210Yt7E4=;
 b=0nbXrS3Fj11wphF7V380nvNlEfG1QUtdsBkPJCMOpzGdXi5vXXpB4MpRmOZuBa+Up1
 CJuAUaxSJERp3FcKlI9tqm79kWHyqTE4Aa4EOFvf5KMZVfJJgtWmNbhyHwngy/HKuYDx
 J5lp0/sm3odvHBRDe4aHLOEtxGTT4XY1wSjiFnKdtupyCXmQYDVKgUOpUq+lCvua3Oth
 pjiffhR3aUiTVTPIBzGKty2SV7GDHux7HCLEy8PC1L7Osp4cL9yXMaDFT465bswOrhP6
 MMAhLl3PEu95szyEISmkAUDEWKAKdxKSBYVbkmaUAjV1aPk1HOFxCvnuhNZFcLejiKzn
 zv6A==
X-Gm-Message-State: AOAM530dPurWOOAfngRoHj/7AutgRILWuiZ6ZgJP/kw2uBuJ5y37xoJ5
 roqr9Dab93dkyGj4BHvRVniAoQ==
X-Google-Smtp-Source: ABdhPJxT2VWRB6le7wRc5VAZr2LTZ47CKl+OU8xp96iK5sGkVWvF1Zr5R/74ZxBPJK1Tys/l9d2vVQ==
X-Received: by 2002:adf:a145:: with SMTP id r5mr37573738wrr.462.1638266529843; 
 Tue, 30 Nov 2021 02:02:09 -0800 (PST)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id e12sm21117166wrq.20.2021.11.30.02.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:02:09 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: meson: p241: add vcc_5v regulator
Date: Tue, 30 Nov 2021 11:01:58 +0100
Message-Id: <20211130100159.214489-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211130100159.214489-1-jbrunet@baylibre.com>
References: <20211130100159.214489-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_020211_281286_382A0032 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the VCC_5V regulator, which feeds the HDMI, USB and audio amplifier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index eb7f5a3fefd4..9d0684a8264b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -84,6 +84,14 @@ vcc_3v3: regulator-vcc_3v3 {
 		regulator-max-microvolt = <3300000>;
 	};
 
+	vcc_5v: regulator-vcc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
@@ -136,6 +144,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&vcc_5v>;
 };
 
 &hdmi_tx_tmds_port {
@@ -220,3 +229,7 @@ &usb {
 	status = "okay";
 	dr_mode = "host";
 };
+
+&usb2_phy0 {
+	phy-supply = <&vcc_5v>;
+};
-- 
2.34.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
