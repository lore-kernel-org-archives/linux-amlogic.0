Return-Path: <SRS0=yTcF=CJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ED4C433E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 07:59:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5415A2073A
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 07:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dR4FbwNx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ubMhfIHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5415A2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MXy6c0+Bq9qv104dfjCpur/8ETCCP590wszSE+Cx+5g=; b=dR4FbwNxy/hOe2gA+wQtfoYhi
	WRakawBt2BrxG2dIe9OpoSa+x44WEJ3tOkOwOo6iXMOXLCLCcTkcEwBPtDzMI++NkFmynVVm3wkw/
	qFsoMjZivaDcV4A+ARDS6jd0/HoI+zfVVl9v4k8pwac0V11mMVqyKHUXkUxoUd8Qto6UZ3gyus+0S
	RaswL3tPZNI6vsjacbFFFwFRuFYnBAbyN29ES7cV62X8+Fu4MVkSbeOGLX0N8esboS/MlxiaREA7P
	h3fItv3uJWPP97dzLrgLaxA9V1Hy5lyKea+0L6nplxegmIvZPUtxLzfKttmwxCWvipe93IiIZm3or
	3WugCM5jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCej6-0005Jw-Pe; Mon, 31 Aug 2020 07:59:40 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCeis-0005FV-Vn; Mon, 31 Aug 2020 07:59:28 +0000
Received: by mail-pl1-x644.google.com with SMTP id z15so2645765plo.7;
 Mon, 31 Aug 2020 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00MyXJ6K5LmM33RR3H14Ts0vy+UoOPF4hpTglXJoQeQ=;
 b=ubMhfIHTSQklK0RqOD06+Iu3684jG6lmb3Y59x2clNGVhiqin5O0wtrCB24ubDABiW
 5BXt5wrorqYiwiEPQrnEhe9dZnrb6VedJv5DpaUzE4x2yrcG511YO8hVRmn8dHPpkqoM
 1Hmz/7kyjI0D3nQRKFzUGZc27BwZnqF4FWrJR0zEaVyQOD8O9rcuI6QNYvGlJMrFeXFm
 q4sUwco7hVF1I1AXfopJ+i3jpRMIjTX/08FN8SN9S2oXV+l2u0Z0bpqGlQy3Suxj57xR
 VfVMEpDCFbT+junAnKEkEwwQwiAEQ6UOonqDEP62bKp5PKs7//NFRfDjHP8ZgKNXLMEr
 yvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00MyXJ6K5LmM33RR3H14Ts0vy+UoOPF4hpTglXJoQeQ=;
 b=ryAt6Zrnrr64Pngwwa/srhI+WO4XR4xCtOgiOX7hy5qedcbbjHKvbJTmWYsHRA20DY
 P/BsAMPASLJ05BNxrXSfAowdQicA0P8XokLIsevohmfZkzwg9j9I/O/Hewtpt/wlhhRK
 gpmwqmvspSR7zrfED51aAOg92gmahyuLKaIowY/ZQTJopQ4hQ3qCoYiDvJFq+fGJesuy
 DZI92hngy7xgMyeu1MwNWW4XeDgoxajdoqC6Gd5kbQap4Qw6DMh1j1uOutm1mNb7XfbT
 7b572VMyNl99kGR55JnfP2p9AAjsomm3G7+TzHRrA/RwjyCrH04Vybzxln9SCJrXVilb
 ipcA==
X-Gm-Message-State: AOAM530UHvk3G1Mz3Zz5h0keV1/tHe8G7Fr3r6oXTAY6e/0DRn+2OfKC
 vBpa906Fv2zAWtj/yw4riK0=
X-Google-Smtp-Source: ABdhPJz8TIKyZLdE8Z9zuqnbRadotw69oPm7TqP48nNCS+hlOC5bVhWY0+3P2frjeHOQUr1bPHty3A==
X-Received: by 2002:a17:90b:384b:: with SMTP id
 nl11mr283434pjb.91.1598860764669; 
 Mon, 31 Aug 2020 00:59:24 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.190])
 by smtp.gmail.com with ESMTPSA id g19sm6424057pgj.86.2020.08.31.00.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 00:59:24 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v4 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
Date: Mon, 31 Aug 2020 13:29:10 +0530
Message-Id: <20200831075911.434-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831075911.434-1-linux.amoon@gmail.com>
References: <20200831075911.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_035927_128503_A9BA1F03 
X-CRM114-Status: GOOD (  14.76  )
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
Changes v4
--Add gpio interrupt for GPIOAO.BIT7 as suggested by Neil.
Changes v3
--Drop the INI GPIOAO.BIT7 pinctrl.
--Added missing RTC alias so that rtc get assigned correcly,
  as suggested by Chris Hewitt.
changes v2
--Fix the missing INT (GPIOAO.BIT7) pinctrl.
--Fix the missing rtcwakeup.
--Drop the clock not required clock property by the PCF8563 driver.
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 34fffa6d859d..3e2aaa6f48e5 100644
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
@@ -477,6 +479,21 @@ hdmi_tx_tmds_out: endpoint {
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
+		/* RTC INT */
+		interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio_intc>;
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
