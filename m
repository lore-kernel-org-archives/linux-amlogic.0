Return-Path: <SRS0=HvuL=B6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F9FC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 12:13:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6895207BB
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 12:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SH1LhXgT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mldFscpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6895207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iSPpdfuZDOoulARR6IhuEdxKJvkbIIcbFFMdXd1NkrQ=; b=SH1LhXgTS3m8HXzqKRIbA2Mhy
	jIv2ncy6wNDq0NHSTrN2Jer0ejy47P7Tn38PY5qgq+R4wXUaqcuprj1fyWrrnljPUeZsho7ifFF3L
	qI8UPL3V2S0JdcYiOMRoTYLAg5ru/WidGfX9i8q4fFKGIMtI6mm7IxOMw79Xu4mP4IS+4er/OtcJg
	HLc44osEiYshKSoZt9u9Pv6GloT6FsB/ulLWpLjQ3vazsU/SezQuMjzy2LQyj+RT2JuMCR4k8TSn7
	00SMXF0sbU41fiy0u/CZyFh9BLjY5b3vvVA05vor2lCIrGw5yNYCHtdkk4Xe40Vrt+RvHV3LqEG7J
	G4YVDDoag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8jRw-0003fv-UU; Thu, 20 Aug 2020 12:13:44 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8jRr-0003eX-V1; Thu, 20 Aug 2020 12:13:41 +0000
Received: by mail-pf1-x443.google.com with SMTP id x25so932979pff.4;
 Thu, 20 Aug 2020 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvaYpGhPiyzIV8u7Pu49cgT7qrkQ0eRWWRMKQuP5HaA=;
 b=mldFscpKgM3ipzzkLfP0lvFj1wLLTrVWsSfCnd5CMAAxGBKOs6PZgoxS7xR5+i6RLu
 MJOkwBORNxN3Z+BpvATXOYR4I4cXJGJzW251epBSZHOGfJP5jq2c4tfJXlMjhj/Gzp4q
 0fj39D35xxmV+PvhLdiRR1V7jNqeDvntsSoRef7nJhb3aUoZ+z10yl4v186fyh0u8kd0
 VLuurtQkBxy0WTB7UjeZej/yK2/Pu197/cERRpIQN4KaESH5NDdL+MnkVWxW7H2F344m
 msuGgYxi6TmLXtMfeIDfEfz4A5AiK3lAQG7XlADOCzaVZbmBQBtVvz9Hifzv/UCD6zQr
 12pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvaYpGhPiyzIV8u7Pu49cgT7qrkQ0eRWWRMKQuP5HaA=;
 b=UivefitvjhPwckwE1gvn9j5jldHmgZ4iLbUfzdi2hi31Q8XMP5/R+YlJBH2D4LuSNf
 Rc5Wb9ycIudSWIJ/cdxuRF7kXV+zDjlC37gEEJqFUkY3Lhenx/zaAx8YIRasQAPgKieY
 y2+GVJuXtn0Ss3HfWVvhw+7eTPfWmLyR2rg8S0+Ewd2gc1hmjWJ63L+t4/oNqPRWTLiK
 VRQZrA8YnRI2f3PQQ75yQaprjkuRWR6F8go2S6Ngz3rGL354ex4M6c8Skv0qUtsr6l3f
 uI5WfWW3ZL3HMB+eMRdIHgFnRu6B3iJX4pTDSiX3p1nEZmv4iQO3X93lSdEnjpBwjvHF
 +imQ==
X-Gm-Message-State: AOAM532KKfEexIYJ25WT1XpbSu60+v/OaXcQcobdkd+nLb8OkB5TpUqW
 t1DEjcNJ6vYZtxJRdR7Cxvg=
X-Google-Smtp-Source: ABdhPJy10u5ElLDD6qJCDxC8DtyeOr0hEPgkm9g/Vkrdr0Rn/axi1Qz1t+rNirf2rMoaKurT/sp+gA==
X-Received: by 2002:aa7:9569:: with SMTP id x9mr2208031pfq.16.1597925617760;
 Thu, 20 Aug 2020 05:13:37 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
 by smtp.gmail.com with ESMTPSA id p20sm1985937pjg.44.2020.08.20.05.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 05:13:37 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
Date: Thu, 20 Aug 2020 17:43:22 +0530
Message-Id: <20200820121323.564-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820121323.564-1-linux.amoon@gmail.com>
References: <20200820121323.564-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_081340_260179_0D0B7B59 
X-CRM114-Status: GOOD (  14.92  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
support the RTC wakealarm feature for suspend and resume.
Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
timer device to prevent it being assigned to /dev/rtc0
which disto userspace tools assume is a clock device.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes V3
--Drop the INI GPIOAO.BIT7 pinctrl.
--Added missing RTC alias so that rtc get assigned correcly,
  as suggested by Chris Hewitt.
changes v2
--Fix the missing INT (GPIOAO.BIT7) pinctrl.
--Fix the missing rtcwakeup.
--Drop the clock not required clock property by the PCF8563 driver.
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 34fffa6d859d..35a31cf181e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -19,6 +19,8 @@ / {
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		rtc0 = &rtc0;
+		rtc1 = &vrtc;
 	};
 
 	dioo2133: audio-amplifier-0 {
@@ -477,6 +479,18 @@ hdmi_tx_tmds_out: endpoint {
 	};
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc0: rtc@51 {
+		reg = <0x51>;
+		compatible = "nxp,pcf8563";
+		wakeup-source;
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
