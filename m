Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AA5C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 06:59:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDF620663
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 06:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuLj412Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LOn2ya0S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDF620663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dvkNOfxU4hliDUp7ouWf3Xe1/is0Jcsy1nUMJlD0NCw=; b=TuLj412Zvz7UrrJXTEdAqXdxcd
	ym0afFnS+YcBDwti+vVZ+UQ05S8PoiHcHnhFogV3oGp8NsaAoH7NRGEoJ0TGRRbaoURs89392Pspz
	mxdQOF2vVZfqzplwFCNlGMv3Wf/6nEj1YQccVZrSovEvfcEuexEFdx9v5mcHJ2xntGLeSqxmlMdKd
	1mtXHPnev17jcruiIefbt/kMNknRktIIR77dtgwHEKJr959K1qOhtomqrNvWNwdPmpcQAtenXBHD3
	kGimuA+ALlyJ7rrCLEmHXn9ScA2Ml3Pw1Ui5pDy5q1oaT5BTttEG640LVhJTzDvVv1tUFN9gLija9
	09Skm+dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusRC-0000b0-PP; Mon, 13 Jul 2020 06:59:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusR6-0000Yq-Pm
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 06:59:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id q5so14399043wru.6
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2020 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kinXBvz5+I1FgSK2RxVnBM/4h4YycBTf3sfQytiCbSA=;
 b=LOn2ya0S5OB7Y5uvhFHYl/XEYXEVgKVvfjwGLeRxcYVK8kubTPZZMct7qQYidJpeJo
 5RUTN+UHsk4k/Qyma5I22GYlfRjlugEU7XomNMheUP3bbRuVS3/7SVVRaLlvSvu9kIv0
 zNERj4P/Ai70ommBpNcyUDpRDqCTUpmukH7M8y7dkrOPktVxKlk2m9rIEQYdjNL4DXJf
 3dHT+wE8SFOp+bWdrs5z8K/msRqurH1sHrU/3qxb9ytCFJsAv3jeVQCpy/h6kbMLwWvc
 JUuFw3rEpW2tqWqGZlQUKhB2PfFXs+/fxA6PhzCBkW1019Sgorg6Uw2dk03Ajt6NceSh
 +oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kinXBvz5+I1FgSK2RxVnBM/4h4YycBTf3sfQytiCbSA=;
 b=hXiUCncnZAaN2hjjRNRudMMnNexNnm3GbzBxAg8wWsa+Kt/LEwuOZKGAGs3+AZK/7w
 V3ewCv9PiRM0f7Autsm45VrVZm4a6a3Sd0w+BYYBknMOhH164DU3Y87E6xNkEtI9gaVN
 3+npshzqTPsZscuKvmLk8cr/IujkBz1k8Nor7QaQyLTnKItLOU3zKDV2O0HRDRKMs5FF
 3BoSkFY72611Z0IGUL6Mi6KiDjqiuuSqg/yk16hnTSDncYTUWmxgKMtrSlLY1EaPBsnu
 xIqyO9cRUpxouej0wRnWOw9VQG4Fl3w0TnGp+eG28mjoO5soql+7UaiSASeyR+Kt07ms
 j76g==
X-Gm-Message-State: AOAM530ADJuFGb3bJEmiKcb4844d8YVg8dHVMdf4Q/TRyaPNYJXEOfu0
 +PheW4rbCoXWHVchNxIbNuzEAw==
X-Google-Smtp-Source: ABdhPJyVPeQ7ShrahAXpJcoWO4VTZySPJoqio9Q2uZh9sFtU3rbW6xzIeLZOkXeBF0Flfj7vAttPig==
X-Received: by 2002:a5d:404e:: with SMTP id w14mr76901144wrp.268.1594623573901; 
 Sun, 12 Jul 2020 23:59:33 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 92sm24394143wrr.96.2020.07.12.23.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:59:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
Date: Mon, 13 Jul 2020 08:59:31 +0200
Message-Id: <20200713065931.19845-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_025936_968633_DC721325 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: amit.kucheria@verdurent.com, daniel.lezcano@linaro.org,
 linux-pm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-amlogic@lists.infradead.org, rui.zhang@intel.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Khadas MCU node with active FAN thermal nodes for all the
Khadas VIM3 variants.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
Hi Kevin,

The bindings has been reviewed and merged by Lee,
could you apply this one via the amlogic tree ?

Thanks,
Neil

 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 1ef1e3672b96..27408c10a811 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -183,6 +183,23 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu_active>;
+			cooling-device = <&khadas_mcu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
@@ -222,6 +239,12 @@
 	pinctrl-0 = <&i2c_ao_sck_pins>, <&i2c_ao_sda_pins>;
 	pinctrl-names = "default";
 
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,mcu";
+		reg = <0x18>;
+		#cooling-cells = <2>;
+	};
+
 	gpio_expander: gpio-controller@20 {
 		compatible = "ti,tca6408";
 		reg = <0x20>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
