Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6647C3064D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2024 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3az6aUTkU2Lbs7/hbk52woweAC+3R6o1YrzwrHFNjjw=; b=ATGVunr7j1xXaq
	yBzgnNdZUhMsx1RZ0ygTOwAy0/s8a+OFfChn25BTcdx1nuY5VdugoyK0Xg/nJxf5a/3JqPEZsMLr4
	OhExT5yZI4fCtOfC4lPnG5Mx3KKs94aU9mPkjb+DJarYrNc8t6s7yvb6jW/4bH0+ZH+vS3sDHkMuG
	imhvKj9In7GIfb77mcDXovpcpeO58unhuFE1jCWS8j7/14UACKaMHGOe1AJnEtHsggTBNCt+25Xbt
	4VMTcLCfT8hqEKirdr8dj6/8WczZ/ic422NKFUIc414TgJC73Au9QQTMe2e2YCa3SXspo96+koj4l
	F4aJVEasTZD1vo8aXJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUYp-00000007ODz-3uAO;
	Wed, 26 Jun 2024 15:27:51 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUYi-00000007OAO-3lRs
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jun 2024 15:27:48 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so77109481fa.2
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2024 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719415663; x=1720020463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dli0klT0JrJmYvluyt71Tv2QHkdxPzzP+lnfxnwDHgQ=;
        b=oWG9r657GBiP66qts+f+B4dw1c+2Nbj6yGhrHBg8z8eEGyUjNXFlDpKL7+8Ql1x9ZW
         3oWql7svokGMoePkeA9PLiTGtn9FwA5vtIlhRs+n98H+h432263C48+19UjZI+B0Ky8D
         mBU+B/5cEZzkVaiyPFOTxVcwk95SpsBMusLkVUWY+oyY59OHFbm8Vz6Cs4nQN2rilbSp
         y4rutCd6UtGrsUaaOVLtbFBeYl0hAvnH3QoGNUv/8xHkITKK5gYwnECYT7XEl6d7Ykcq
         HaCsPkU70QyfU681vmbL2hbJP9KwZP+/7ejs3wg8qvWYgah6WN50qKRx5dRoolAzou+g
         rBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415663; x=1720020463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dli0klT0JrJmYvluyt71Tv2QHkdxPzzP+lnfxnwDHgQ=;
        b=LNtLE460QBhbT7GsegP87iEpkWjQ0IE3146NzOT/JiE2DHP8cUVI8KBFuJQDpbEaSZ
         mNET6iqTIC+rqB8U12FPkYXbBL7pqKAYvrJwn62WarD/HmcTRHMK2eivlZ2p/+JYKpU8
         CYKyHuSPuQn5xNMkf44gaUJs8Z6xd218CMXn3pzBKIuTAcEM70snkF4zdr0f5ybmuXQy
         0qvj2At39pMlt2/KPM/F1oyAY4nfqASKCvjm5F5VVjw1KYrTV8qWpbSrjuYhFkLu/uAH
         frpASMfHu1gRF6i7pRAzZYcdyWjU0itFqWzTdFVNt71pIVcfqpPe2YTlI9Hb8WERiDoJ
         j8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8aJyJFl+31EsfDV0QrYY4bRHAgmotTs6RPwxpt8zHMacJIDcwd02JU4xqWvLx1GBe+6SivzXOhyP3aESzTxAIpxSyWszdNYFudX+RBooO/tk=
X-Gm-Message-State: AOJu0YypmebZxTnYTytPs8O5R9shHNpx4KJVlA844mKyzctcurB2DGHZ
	oTbr+Jx9BV2Id2e6ORrANwH0PEZyhJGqsMi3gaEBBUG7Y5634IqD7+f9ZxyOFbKlP/voGMBxjDa
	nfKk=
X-Google-Smtp-Source: AGHT+IEeSTyXRJHUOnk6F/6DYuHl5N4ZmAN2SVMYbgd+QvOtm5zHfhjVMr2psCBRFiepsL77IbqapQ==
X-Received: by 2002:a2e:9090:0:b0:2ec:5621:b9f2 with SMTP id 38308e7fff4ca-2ec5936fb3amr83095041fa.41.1719415662730;
        Wed, 26 Jun 2024 08:27:42 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7be7:aef1:af9e:fff6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4249b4233b3sm42321675e9.0.2024.06.26.08.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:27:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/2] arm64: dts: amlogic: setup hdmi system clock
Date: Wed, 26 Jun 2024 17:27:31 +0200
Message-ID: <20240626152733.1350376-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626152733.1350376-1-jbrunet@baylibre.com>
References: <20240626152733.1350376-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_082745_391407_1AE25B5E 
X-CRM114-Status: GOOD (  10.68  )
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

HDMI Tx needs the system clock set on the xtal rate.
This clock is managed by the main clock controller of the related SoCs.

Currently 2 part of the display drivers race to setup the HDMI system
clock by directly poking the controller register. The clock API should
be used to setup the rate instead.

Use assigned-clock to setup the HDMI system clock.

Fixes: 6939db7e0dbf ("ARM64: dts: meson-gx: Add support for HDMI output")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 354f3c722b04..0c425af3174d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -215,6 +215,11 @@ hdmi_tx: hdmi-tx@0 {
 				#sound-dai-cells = <0>;
 				status = "disabled";
 
+				assigned-clocks = <&clkc CLKID_HDMI_SEL>,
+						  <&clkc CLKID_HDMI>;
+				assigned-clock-parents = <&xtal>, <0>;
+				assigned-clock-rates = <0>, <24000000>;
+
 				/* VPU VENC Input */
 				hdmi_tx_venc_port: port@0 {
 					reg = <0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 041c37b809f2..ed00e67e6923 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -316,6 +316,11 @@ &hdmi_tx {
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
 	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
+
+	assigned-clocks = <&clkc CLKID_HDMI_SEL>,
+			  <&clkc CLKID_HDMI>;
+	assigned-clock-parents = <&xtal>, <0>;
+	assigned-clock-rates = <0>, <24000000>;
 };
 
 &sysctrl {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 067108800a58..f58d1790de1c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -328,6 +328,11 @@ &hdmi_tx {
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
 	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
+
+	assigned-clocks = <&clkc CLKID_HDMI_SEL>,
+			  <&clkc CLKID_HDMI>;
+	assigned-clock-parents = <&xtal>, <0>;
+	assigned-clock-rates = <0>, <24000000>;
 };
 
 &sysctrl {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
