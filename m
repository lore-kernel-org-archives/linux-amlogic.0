Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73511C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 08:43:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D28613F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 08:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D28613F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E7DjlIfqgySzTG0tDOhvLDTJHRhrDVigP7PPz/o5K34=; b=B7CJrs+FEUXp6XKSvNHPw1zpWU
	+2/ye89VHmgRWHA6O7rhFODrY6M2lLwe1Kr7wNoz5mn3oNHzqKcdGD6fBKaWpcBpSvGMoG0LyECPq
	RQPAQKyFNltEIZjE9LIcREFAjKZLW4JXD2EkTmWKhHXSVSAuSi5Thp9rimZ0wl1RCpvsaxO89tMK3
	sYF/nlgcZPsHBxrG57GSo8D+lBJ9zTMuiKJauotsKHGCF7ae4vx+Tg7HKxS+yalFamv3kA8ZIGoZA
	Pd2CgRGZfrBjNN47xdCJWbLM/ac+kN4L/lq3VqyVIs7pJ2eC9dLCDMzRpQ2rm21T+V5jbLBCEw6gw
	po2rBoJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2GG-005LZ3-7H; Thu, 29 Apr 2021 08:43:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2GC-005LYS-UZ
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 08:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=caSZIsnAQyTh4yU5NXoNe4Iv3Mgw3V9GFqN8gWGL8Gw=; b=4syx+Wgjx9GHDUkmao33T6I/sD
 T7IjATQbocoWNNUJk0UPkv7Ft93+EXxZeOoMGBt+eBL1gUlnqEg+uk4md/XOy8skynWZuh/LNTCmM
 tupKb6094YD+ZAIrkmogft1BLTuTNEHBU4Bm7bWApjzGBcyjbg1ldvT82zPfAYCzHoyvQrPsgoxV4
 mVbBfL0PAO9xfhAlzVXgZYSxbFVr0tOnJarKLrQyTcP8/nHCdE7Yk4u+mC0gkqK7Uqsa/BM6LgLs2
 ZLDQMU00HzOdCjzE/JTqH0ViFEbN67cEjsgU5oo1qxyZNXVJajRFz9Objh/s8L3aqZtSrDLlyys+7
 XNTZL1gw==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2GA-000UrB-Az
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 08:42:59 +0000
Received: by mail-ej1-x62c.google.com with SMTP id n2so98646711ejy.7
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 01:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=caSZIsnAQyTh4yU5NXoNe4Iv3Mgw3V9GFqN8gWGL8Gw=;
 b=lxiug90+yt5JjRhNJkn7Iu2J4iI88r4aaS7h4CRaO3LLN5p9p1mhgw6U27vgIfln73
 kxyzxt1ng9yEDa1GHMN+DuTjxbzbHy7hv+bPbTdN/poU7r9wIK04f8CXHjSoRwGHumu2
 GTkfSQPEf8K/s7SLZIXsq5Mbqii18MkUsK4zoJ+F21qdFMHHmZc74ys7k9TKbTEcMX7+
 9r59AGgku7DqvMpZFbJlMN/0uAX5Rv7zKQpVVOn/J9BbZVOSiH5vgyprDrpj7zG/Hii+
 k3m87dS/rEJkjXYHlp5LdSTMGJ6y6LZDabJp9ZW/SCI0VTlYHiUIfimuW8uQBnunBUob
 6AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=caSZIsnAQyTh4yU5NXoNe4Iv3Mgw3V9GFqN8gWGL8Gw=;
 b=TJj8H11Q0VazAgNomQG/+TGPtkW9JLV9p0cw3VISws/8y7z1ICAPmuqHRftZI7MTMT
 04sa/0tyw0OClo23JYQ6LKE9f0Njceg7GR8NZHKQ0skrr3KsUmob/0P3VyZoook1xrQH
 UDaemAKYzQKN+ddO6Ix+ISGHnEhq/tzQj7f1g5t7PywUYKIi1SHStc1abSXd5xufvro0
 KApx7uE0FFssXWuYqT7GiaoqyQnzf9qa1MO6Pk8UZCr7nEAf/gZHMjmTy/56B+k0okuH
 thi6cU/Fw2HrH8sHmCQO/IDvDINZzSfP7O/kWkxYCiypgYIGKVqbelTb2IXCrVhta5KM
 IHIg==
X-Gm-Message-State: AOAM531QpaVKlL45iIAPcbEXJ7r8CiPo9lqLmmR0XJeemVv7YVeVJW6J
 SEyjwdh0SRkgTV7iSyiHLgS4zg==
X-Google-Smtp-Source: ABdhPJwiUHLs2mMBYuedWUxl21/X9b7CdLNPsi0Z9Z1kRvKBsSabtpssEPSDA/aYG4wYvc7dVRi1Jg==
X-Received: by 2002:a17:906:414d:: with SMTP id
 l13mr21127861ejk.527.1619685776575; 
 Thu, 29 Apr 2021 01:42:56 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n17sm1758930eds.72.2021.04.29.01.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 01:42:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: vim3: enable hdmi audio loopback
Date: Thu, 29 Apr 2021 10:42:53 +0200
Message-Id: <20210429084253.59692-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_014258_403174_33AA2E76 
X-CRM114-Status: GOOD (  12.04  )
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

Enable audio capture frontends and a tdm decoder.
This makes it possible to loopback the audio played on the hdmi codec,
which is the only output interface at the moment.

Of course, one TODDR device would be enough to do that but since
the 3 FRDDRs are enabled on the playback side, let's do the same on the
capture side.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 41 +++++++++++++++++--
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 13 ++++++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 66d67524b031..3cf4ecb6d52e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -171,11 +171,16 @@ hdmi_connector_in: endpoint {
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "KHADAS-VIM3";
-		audio-aux-devs = <&tdmout_a>;
+		audio-aux-devs = <&tdmin_a>, <&tdmout_a>;
 		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
 				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
 				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
-				"TDM_A Playback", "TDMOUT_A OUT";
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"TDMIN_A IN 0", "TDM_A Capture",
+				"TDMIN_A IN 3", "TDM_A Loopback",
+				"TODDR_A IN 0", "TDMIN_A OUT",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+				"TODDR_C IN 0", "TDMIN_A OUT";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -198,8 +203,20 @@ dai-link-2 {
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
@@ -214,7 +231,7 @@ codec {
 		};
 
 		/* hdmi glue */
-		dai-link-4 {
+		dai-link-7 {
 			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
 
 			codec {
@@ -454,10 +471,26 @@ &tdmif_a {
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
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 06de0b1ce726..f2c098143594 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -32,6 +32,19 @@ vddcpu: regulator-vddcpu {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sound {
+		model = "G12B-KHADAS-VIM3L";
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
+				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
+				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"TDMIN_A IN 0", "TDM_A Capture",
+				"TDMIN_A IN 13", "TDM_A Loopback",
+				"TODDR_A IN 0", "TDMIN_A OUT",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+				"TODDR_C IN 0", "TDMIN_A OUT";
+	};
 };
 
 &cpu0 {
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
