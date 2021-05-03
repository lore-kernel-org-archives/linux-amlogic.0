Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEF4C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:04:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA75B611C9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA75B611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NVDZ6GIYi9iWwLS+ARKpugQpDvG2u43BO2JMfS1jLFs=; b=ZgIVo8p/G64I6ZqUs+7zJwPKc
	Hrq7VlcwgkhDyJw5vp1EeHr8k8ABSf/SKwvEUNh87CjlOPdxqcqomMq4ArNntawkaT5X4QPH0UoFy
	oh+EW1zW/MXzPtXDhhLPnRgsn2Gnqq1cFvIcNgji5S8wThmGvpFr1UQuHDFJb6yMFHMM2jRSFVlbt
	222alWnqnUZ+r08sXgHaYqfHNrTCxVhmA8MmYvizDgaD52mVb1O/YMbQ+CYp3zUJQxYdhcbu64ulY
	x+5WWjYwqQmMPWy8BrSeuf0N0Qlsap85DhyNg4tCvC0Fwbe5fOR/og1J0Yt6JLhMJlPD0839Cyv44
	MrXVUn0rA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda7b-00EAZT-2D; Mon, 03 May 2021 15:04:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda4Q-00E9ck-Bz; Mon, 03 May 2021 15:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YzG6TYaBk4Qe9UbFXrh/j9QrDTmla6rvT2wheqgzLQs=; b=sxFdGHX1Pq++Xhd51cMRdSNNJs
 GIu8XDyLU26wVxl19b6MJaVyUOTfmyg3GXCbe1a119O5QmBl6OhXo5H7E+JdWRea2OHXANssmkSxU
 nxWsKFvqREZPyd22z7sMeDPsY5EbrlReYhfpqnZUYPjuDWNTXHZ/e7tCSlXp/w1kXk0ZpN86r884C
 lfNI0Bvm1XgEONWOV+pvAYS3f2zfxp0flVUxUqeM3Mr2jIwViIFydZv70M9EAJ00OYFSkilcejC3N
 aZ/BjjTwiBK48Asa+i22USeTW8OQuRq5sGG8MIIyygcB6YA++AjgGRQGMs7H7o4jz+Sv1BZlAsWZ3
 dwBAHH2g==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda4N-0039Rx-3B; Mon, 03 May 2021 15:01:13 +0000
Received: by mail-pg1-x536.google.com with SMTP id d10so3803704pgf.12;
 Mon, 03 May 2021 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzG6TYaBk4Qe9UbFXrh/j9QrDTmla6rvT2wheqgzLQs=;
 b=gNv0dT9iqEmA1FbX2ZnULrP0GwUvez39zyRMZtvZRoGxoTXvfIYG7xug/dwu27ruvv
 07GcoeS4p+Wjhw2ZXBDWwJBvJlxCH8DfsEu3mtxrl8uDcr/jiz+U2N9KgzQlQ0Yd+o2p
 UvHDSQGO/3uWY4Y5mv7ty0OzyBNPkfVdgzEuVZzryXipNjpqueXAm7eSa6cNfndkUr8s
 i8qDvM2GWGJR8uhSui4kUJsb2WoltKrFkMbnGNxo0tkGJeGHsQH5fAP3lqJI9OuNJ+95
 znoYwTT6N6dcRW7/2oQ/ZCorJSfBuky3wNKd8vaNczLsUQeHr/utmUjAasrCFCvT94Av
 TACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzG6TYaBk4Qe9UbFXrh/j9QrDTmla6rvT2wheqgzLQs=;
 b=WVP5xfA6sh5WwC6Bc8fQFf8aQBvFuBKSzF8Mld2COcg99LO8BPn1T6oe7CTv+BRjBZ
 9tX2IxLLb7nNgRRI7kRZxmXRAHwKTSOdAE2aGfGTaVuLMLYzpj8EagAtzuDjln6It4i2
 ug7aw54nCmvoVbVh8DxmXPOALhqCRzubVd7I/DRrGDUOiXOj/VRlamjse14EouASOvCK
 1311JzcQW0v4Grjf9bd7Qd4Nw5uIfdtNSqLrOHb1aSVKGs3oF0+5H0PVXEZP+99B0na/
 aKXCuBw6wb/pIZPBZAoKWm/wfyv3G3Ci/DlhbzBpJUZ241239uIg5y7PsgDW+Pm0VpzO
 SB7w==
X-Gm-Message-State: AOAM530R3qRlggPbk5q4iEetlG0YQ5r4qsJj7LcPHqmqlEBNYlGhM7SD
 U4xkRIDQknW1oOgXj0sr9Fc=
X-Google-Smtp-Source: ABdhPJwcFkN18aNRaGLRVRuH+apJNsXdOiZbqkCT0QVIRODxLq4T1QwXn1UM8TIy/L+SDchtZj7wcQ==
X-Received: by 2002:aa7:8097:0:b029:229:83ec:cac0 with SMTP id
 v23-20020aa780970000b029022983eccac0mr18926519pff.67.1620054069894; 
 Mon, 03 May 2021 08:01:09 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:01:08 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 9/9] arm64: dts: amlogic: Add hdmi power domain for gxbb and
 gxl
Date: Mon,  3 May 2021 14:54:42 +0000
Message-Id: <20210503145503.1477-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_080111_163899_78C03CE5 
X-CRM114-Status: GOOD (  10.78  )
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

Add hdmi power domain id for hdmi on gxbb and gxl and gxm sbc
to enable hdmi power domain, via "pwrc" controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi          | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi             | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts            | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts          | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts             | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi                | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi            | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi               | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts            | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts            | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts      | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts            | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts           | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts             | 1 +
 18 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 2d7032f41e4b..272e54be0365 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -311,6 +311,7 @@ &hdmi_tx {
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
 	hdmi-supply = <&vcc5v>;
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index dafc841f7c16..c9f17174436f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -220,6 +220,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 	hdmi-supply = <&hdmi_5v>;
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7273eed5292c..6b5330344b94 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -219,6 +219,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index f887bfb445fd..569b32f9e8e7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -222,6 +222,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 201596247fd9..344834f6c475 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -269,6 +269,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 	hdmi-supply = <&hdmi_p5v0>;
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index e803a466fe4e..b747cdc6ede8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -132,6 +132,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 9b0b81f191f1..ae10bd4cb858 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -140,6 +140,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index a350fee1264d..609544efd742 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -161,6 +161,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 2d769203f671..f8cd86c13765 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -209,6 +209,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index eb7f5a3fefd4..ec38ca9a6818 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -136,6 +136,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index b2ab05c22090..b0707382da30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -95,6 +95,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 60feac0179c0..0266a14c428c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -116,6 +116,7 @@ &hdmi_tx {
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
 	hdmi-supply = <&hdmi_5v>;
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 93d8f8aff70d..bd3be5a2f4bf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -224,6 +224,7 @@ &hdmi_tx {
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	hdmi-supply = <&vcc5v>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 82bfabfbd39c..8f6fdcf8466b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -229,6 +229,7 @@ &hdmi_tx {
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
 	hdmi-supply = <&hdmi_5v>;
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index f1acca5c4434..5837114368b5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -127,6 +127,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
index 2602940c2077..b951cd767c30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
@@ -52,6 +52,7 @@ &hdmi_tx {
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
 	hdmi-supply = <&hdmi_5v>;
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 18a4b7a6c5df..64ccf599fc76 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -246,6 +246,7 @@ &hdmi_tx {
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
 	hdmi-supply = <&hdmi_5v>;
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index dfa7a37a1281..c64d1fcda299 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -121,6 +121,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_GXBB_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
