Return-Path: <SRS0=3F0F=AF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D3BC433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:16:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BAB20A8B
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ts1tmTjH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HbBo8+WP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BAB20A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dvkNOfxU4hliDUp7ouWf3Xe1/is0Jcsy1nUMJlD0NCw=; b=Ts1tmTjHKcqkZQTp+yEIvheZZ
	LyrEcQ0FZoEkSLjjD9J6xpjrKf2tJcQqKjQUShFswXrTyfcVf69RrQgFMYX/ly5B8q/JldRs8Ombw
	MvNuZgmpWUx0KUPZHihbXTqkz81Gv3EgZMMS1KIU4dIrhf20CELY/Q6MSuHk8VuGSIEVx3etbe3m4
	4sssCp4G/GLchWgnbTagUAMnVQSGFBTr8QAhv2c9+3LmRdjAFIOBz9ldDomcyyVSQ3lW2PRzRJgB5
	lUY5vYPfqNSgvUnBl3c3j3vVAUCQUvVsiDaahq+mHzSJ3TONQHuL2q75oDOk3r3z2/5nmDCia/+z6
	oudx2fEzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo83v-0002rK-MY; Wed, 24 Jun 2020 16:15:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo83l-0002nh-1W
 for linux-amlogic@lists.infradead.org; Wed, 24 Jun 2020 16:15:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id s10so2825319wrw.12
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2020 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kinXBvz5+I1FgSK2RxVnBM/4h4YycBTf3sfQytiCbSA=;
 b=HbBo8+WPRj3gAUYINsoDzCjuSTiw+4IVXg1BUTCPeS9//rIx0Msd7C2/3IOEqhT2au
 ifH40qsXdeHZFBuxYayakoHeI5GVZtrXYa4z/w6+0z4jER+c72ovBtthOxjKcI41NM67
 YXA/sWFk3I3nvVOvAOmNu0p9vJXZsy+n6tDOMAWADhcErgHqJsG6kn/gtiN8Efait3Vu
 g7U8caQMJnfPSx32TxlICATow4MuWMRnhUBnVT4P0Qt7NW+LmYXoK2t0ILvx+H877gGQ
 k9atIi2siVCtlFJt9Qsxt86a9HGAidyo95/yFVpj4YC7TNm3Lvqbki1DKAzL5+qtILlf
 3PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kinXBvz5+I1FgSK2RxVnBM/4h4YycBTf3sfQytiCbSA=;
 b=ZS1M/dlf9H3I3H0FH+ogQJRMNqcHkXFzCdoluyMAC2N9IJvrOX7PJga1o1dVvI9VB9
 0hrGuQnBqnDkHTMIorlDjsY1epPLnU5Mu7XCRXMIiNOPI2a+ONmz9chiP5QuC4DtHYm/
 l73+SXCcXE+wHgIZS/qIIbdU+NrrhNcVbxvLlOGmbgltRTtoQ9XWskp1peTUZO0eJZPJ
 tZJATMYPlpBBrpj+/K9PuYaC6ySjvq5GrwYEPGq0PnuW3B3lMDheef6yXGo0KiCrYP5N
 cu5pmkbRlAIN+xGBWa9/sMzDAzRNML6j5n3f9QS9GHVqHK1lMy+exLHmRjRokoMTxDXi
 X6KQ==
X-Gm-Message-State: AOAM530646I63GbDEZdIo19/KF08Nd+AKf0NDhBYrpBeOUyl+wECtiDM
 svx+VjvJCOhV6NhouAhz8c1OHQ==
X-Google-Smtp-Source: ABdhPJzU5QZYipbkQZi8xo157t2PrVSjzPMHytPFcg1TfZKTGu677lOERbPf8aPK6zEzeiz5pYn3xQ==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr5463690wrq.38.1593015335565;
 Wed, 24 Jun 2020 09:15:35 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:89ac:d9e8:f44c:b137])
 by smtp.gmail.com with ESMTPSA id t15sm8716207wmj.14.2020.06.24.09.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 09:15:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v5 2/2] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
Date: Wed, 24 Jun 2020 18:15:28 +0200
Message-Id: <20200624161528.12664-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200624161528.12664-1-narmstrong@baylibre.com>
References: <20200624161528.12664-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
