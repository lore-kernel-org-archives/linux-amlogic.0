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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060BDC43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:01:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F234611CD
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F234611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BNI4IJM7FJ81DTqB9twP4AQNziE996JKKzp43BiPPJU=; b=d3gv+t4IHYl+5wyGC/QrV3z0j
	j6crcyhu9KOTvRD4Xs9wJMTuGqGr6bw01KIBLw/YMN4HRDiyz3R8ytIO57bCVCfmIEUo4cmgfwq/Y
	fpoTn8qIipXAWYXo4jpOXLtOCD8OJUG6MMURZg3svvMaFr9KN6jyK4BrIeRwe0znO2SluDjT4bTVl
	0uNy337V6k7C9bPm6OH/y0Ykdxr0nV1nxfHgE3se+S3ddGR5N4bRyGV3Lgev6onfADioY+YspLbZ2
	EBX24VFGz2OYIKGXsJ9zLnoKs/0kCfFvc9MM6KbwPmp/Gyg/lFrK3+fwRo/LLtIX7ASNC5NEXnxz8
	0Q5+kv5WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda4H-00E9ZX-7h; Mon, 03 May 2021 15:01:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda2O-00E95U-Ax; Mon, 03 May 2021 14:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=T8p4SUJLNthax2VMMiUlx/ciMxgy2stQoSBLgzmRg+g=; b=ql8BG5REJjH97rTN3LLPnmHpQz
 G3WUj0WISk4pVar80qKh61ce8Rjs+u+z5O+9WvBMU6MClPWu+sPWtrHEQv648DRl57E6F5zo/NC1b
 AJusc3m/qmFP5mryTSGQAmh1Zg7NkpYvwhlbPAAUlHJ4WGRejQy/mci2D9XxEhTz9hzUD20netYIU
 xy5y2v6l5qf3eQHd5Vzo1ZfPEsJ+vb0nM01coYdFUVFEFIrV99x0qtjm3ymvlYZ2WVOzoU0vkE1nW
 P9UC6AVbAQgivemIlYqAYuqgstFoX9+2voH+YxmSq8Ig0+xlSSLwxQEvTuMbQm2sa1R9vlPURYZdY
 rSa2RI/A==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda2L-0039JX-39; Mon, 03 May 2021 14:59:07 +0000
Received: by mail-pf1-x433.google.com with SMTP id v191so4327654pfc.8;
 Mon, 03 May 2021 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8p4SUJLNthax2VMMiUlx/ciMxgy2stQoSBLgzmRg+g=;
 b=Gyh63uTqoLi7xsgZ8KFZaHgp195t2COs1Khr7pQ3v3A9jLYYZQXEjcWBtTUufMCcfB
 W+GO0ZWMoDybJX7KCZd3BvRgPKHGqObtZS/baocMeDHNKRejFzLpDpH03rmoAo9Ca8J4
 Et5Efebw+4X+iPhyk/c8HzcbHm2HU/mgfR2BBicvP4BqMMCNGRtKQHtsbWsXoRZU+wGs
 6bhrQqefGjajYe+bz4iYSeZbx08Xb9YUOhdq+M1LnYK4uJxIdeUns1UP4BP6dSUfvwwm
 AinFqwNIFo5hNk6AbN8hUjRnkEIMhvggISNVNBLDUD47dsf+Za8Aga0RHXMu033ayhgM
 jL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8p4SUJLNthax2VMMiUlx/ciMxgy2stQoSBLgzmRg+g=;
 b=h3I9GwGPIYB2nGrgd8gLX1qSBtdCC4+rzcSwFvGWEaWw6TDfMdEZZghjBojAG331Hn
 8dk54ZV5zh/2trYr7pVUh+qNpmLB1lKUbhlACwnkxSlT0wVP85KbieEtWzj7+cwecsyv
 cyDjZw42UbJc0Ny/Vn70vgFtIXZ2JQ3kni5CIosfkrXXN3ue9U+fdisl888UkFAb7+Js
 CVsINZlu4lQK6WvOngy5Boct4SvGspf56bcy6gdTGuRSqXdfq5m6MorX0OlI3Z6vIQMd
 gECSWXehId7mJYXQFEETHgPd3N67gkzuD8S2NGQpLzomA/JMR40Tl/KufYWKxM7RnXhr
 +BLw==
X-Gm-Message-State: AOAM5326llhIHQoQuJwEA1Vocau0g8/s+NW99bBP+si8/NzgwNdBKRb3
 ShFHKORoI5OhgI7O472yG7Y=
X-Google-Smtp-Source: ABdhPJyTCiMr85dToL7W7xU2vb4Qpo5Ks5YqJPeyX7+h1d8WLSi2KDlGbuhXJN3MMLzCNr93NeBiLw==
X-Received: by 2002:a63:1c02:: with SMTP id c2mr18586031pgc.195.1620053942631; 
 Mon, 03 May 2021 07:59:02 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.07.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:59:02 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 4/9] arm64: dts: amlogic: Add hdmi power domain for g12a and
 g12b
Date: Mon,  3 May 2021 14:54:37 +0000
Message-Id: <20210503145503.1477-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075905_587115_6BF971A0 
X-CRM114-Status: GOOD (  10.91  )
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

Add hdmi power domain id for hdmi on g12a and g12b sbc
to enable hdmi power domain via "pwrc" controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts       | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 24599f448564..23de424b58ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -373,6 +373,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_G12A_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index a26bfe72550f..4a8b3bc07151 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -208,6 +208,7 @@ &hdmi_tx {
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
 	pinctrl-names = "default";
 	hdmi-supply = <&vcc_5v>;
+	power-domains = <&pwrc PWRC_G12A_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 1c821800514a..09ce4a95ed7e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -309,6 +309,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_G12A_HDMI_ID>;
 	hdmi-supply = <&vcc_5v>;
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index e99533dd64c2..2ac7cdcd622a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -510,6 +510,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_G12A_HDMI_ID>;
 	hdmi-supply = <&vcc_5v>;
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index feb088504740..f8ff459cff78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -286,6 +286,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_G12A_HDMI_ID>;
 	hdmi-supply = <&vcc_5v>;
 };
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
