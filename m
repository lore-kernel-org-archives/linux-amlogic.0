Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D41C433E3
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:02:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265A920658
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b2vNIoXZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m60s7AiY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 265A920658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vg02Pb/5B8Jn9u1ldiZ0nt6uk8yjf2SSwsq+6qEa1Ek=; b=b2vNIoXZ9I+3HvyHjxgC9aOT1
	MT2O1AO6TZItD6gtbyvGTGY+ndYJztGGKITPE6Vq1uFe8a9oqDuuiWenpUaZfkBhJHsJ824DuClWr
	bCk6pLsIXB2d+gkjIz5nLapiQAjekJwW5Bqdy31e5mWEvIhCGj3ubqeeOYSS0YRS4oDy0SF//suJD
	/GZouDJQrmw2TXA4DHTlbKwC0fh3e/QJBnwO1M6WU5i1T26nAPPonAGV1PlFS6qruYdQwCwKGk8vX
	84gmzL475+4WG2T4DXBZk9++xYj6R3Hdz1Lz58x5C3dDsDSd6aqpJg1VEqOwV3YcI/11rdNQQKrz6
	usiBez7RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvjrm-0008FC-BP; Wed, 15 Jul 2020 16:02:42 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvjri-0008E7-2J; Wed, 15 Jul 2020 16:02:39 +0000
Received: by mail-pg1-x543.google.com with SMTP id e8so3290634pgc.5;
 Wed, 15 Jul 2020 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2e7TAmb2L4R1UYaoTeIJ9mP17eces73nTO3RzK12slE=;
 b=m60s7AiY1voSD08dFil+1xdgIzKVRBs6UNqOPRMpd9PM+1p6rdrCxW/VfJxISNgf2Q
 IrxGXfcEEUTSqjiC/3d/tHPWTQmp5EVlNChu+cAQ0O07TFKI8WmYmshjcl+29LvFnl/f
 Wl/9ugnmj+IetmCmd7eH7baV8/ADNUaeFYWZIUobhNNTfAd95BwjHfEyg6KBJ8P7Wmrw
 XLUUXWMyyiXTfJzYhEH9TJ+701AmqNmSgiHgE43cbhb9+BuK77AvNyvoisp55X6hk0U4
 AsOwBK/rgh2V7aaUH4qksVGLTM5tcv19t9G3wUoNh1MhhKga0OMBNE1jsQ/l9l4GYN14
 cs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2e7TAmb2L4R1UYaoTeIJ9mP17eces73nTO3RzK12slE=;
 b=Tdt9CmbNyZSNiKReYKzCGuxfhrjJieHxFPf++i7/zrVJwzuSqRKjT19hLwJhQjBvMO
 xaU9+9hjsoP+BdO7I1NLPzAiKyobGnwBVHWJb0SjuQ5pv4viqepUoKuKSl5aBtlDId2H
 kol0lFwE6Old1yxm3NszSCutk4/PzbTxvBmpFJP35jVm0lrA7ER2YTLEWQh/oyhk0mK+
 LjqfLfpvb8Q19hleKeF9rrLAvjPWdESe7MqmZSenkhUNi5GwXQywOj6RxK875lIjsJYV
 HFCHCqosPU0aJ4lyl+ZLa/UbIrLnCdfZWrqIF9YVJL7KOHlsrmQwUAVgXvZBLy9+V8jv
 0B2A==
X-Gm-Message-State: AOAM532b8PDbH8X2KD+8/ajhjtvEr+L0kWdbgg8g3ZIMVzAJvNLjN/In
 DBG44JlyYgo7NhZH3+mPN8eHJesD
X-Google-Smtp-Source: ABdhPJw2/fbfirzliUb91U7ZlrQj8MyoY1h7nldzndKM/01OvlmJ02mE3Nr62oBSpGBQDycEE6tWrg==
X-Received: by 2002:a05:6a00:843:: with SMTP id
 q3mr9098725pfk.107.1594828956115; 
 Wed, 15 Jul 2020 09:02:36 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.198])
 by smtp.gmail.com with ESMTPSA id 4sm2520157pgk.68.2020.07.15.09.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 09:02:35 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller
 node
Date: Wed, 15 Jul 2020 16:02:07 +0000
Message-Id: <20200715160209.652-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715160209.652-1-linux.amoon@gmail.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_120238_840203_8A0180B0 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable RTC PCF8563 node on Odroid-N2 SBC, In order
to support the RTC wakealarm feature for suspend and resume.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
$ sudo hwclock -r && date
2020-07-15 13:11:53.862508+00:00
Wed Jul 15 13:11:54 UTC 2020

$ hwclock --show
2020-07-15 13:17:30.903300+00:00

But RTC wake up is not working at my end.
Any inputs are welcome.

$ time rtcwake -s 30 -m mem
rtcwake: /dev/rtc0 not enabled for wakeup events

real    0m0.002s
user    0m0.002s
sys     0m0.000s
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 169ea283d4ee..a447cba4dd53 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -391,6 +391,20 @@ hdmi_tx_tmds_out: endpoint {
 	};
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc: rtc@51 {
+		reg = <0x51>;
+		compatible = "nxp,pcf8563";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "rtc_clkout";
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
