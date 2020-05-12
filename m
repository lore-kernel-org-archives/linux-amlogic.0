Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E80C54E4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 13:28:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4651420730
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 13:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YrvccTVR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s5XV7mjG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4651420730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLbhSBh0JLLie4NGY3kjYuSqmB9r0UE9pu5zdMtkN2k=; b=YrvccTVRT4J0p/
	uLkBccv64KJWUEJDaTRtVkFuoTBTuJ+xp3/YwUT917VGeIYJng89P1tc7oWSVjxPFyPbu/LSggu+g
	CfeaKHnYLU1qOOn2zZ+KpjRJ2Yo+qgHKxpXu6Dhx1QBIn6vHNynmnTtz/+lKu7Sksdlv2rigHO9gw
	NvGYm9BDYBq4uY4LrSZK7VWFCM0rIIlPPY1XuBxF/LKiv+XDmdqsRoxUzGvyu81KE09rD4ev0WIKA
	WIViOrqCLB7JtaZWrN/K9otqVLqZxPOhcS8+tLLx/yk3TzqnCi5MNdl7uoBGi7il/3Mpde1Eov7pT
	wmOtL2pH4lrrhvo96sDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYUx7-0003Em-83; Tue, 12 May 2020 13:28:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYUvU-0001a7-GO
 for linux-amlogic@lists.infradead.org; Tue, 12 May 2020 13:26:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id w7so15373584wre.13
 for <linux-amlogic@lists.infradead.org>; Tue, 12 May 2020 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itZ8nYpO9rVwAB+XOSiZ1Zaz+WlUMeN8KYJbRrgai8w=;
 b=s5XV7mjGrnG0C7b3JFLWA/serjUzf8eM5Sv6bPOzzXrvy+bBn5NGBA9t3ERPFyJuv2
 SJow9GGfQvqbEJVESTH5XaRi90qYMpkAc+33nM7/TD7ZR1hX6v4OJx27XmVk0E2Ua+0d
 OqhN5SQaS1ajL2aQAdCfmyj6fWL1oVA/nBjIhPvI+Aj7x30jz7wxC2/JcETHuxaAcBB5
 L8ywmE6m4FE94yCLZXU+LyWBxWS25UJ7Yj6YtCist9nBGE0fUFb/fO7lTzHvgMgJr8k6
 5aV2w0izr+/SeOV1SgeR5tFhJsdUfk0n7g/S3Kdy+4sfHzBCmohoIfu8Us6qrTf3KT9/
 8JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itZ8nYpO9rVwAB+XOSiZ1Zaz+WlUMeN8KYJbRrgai8w=;
 b=W5zaDLh26bgUJeo1HvDKpCMgUkEEYBuIeBsdsApCJ2pL7nYl2O4KOWgWS4AMtk8B7x
 bK7SZxhZ9x6h2vOzF+yY/tmEAxJeYIPvO6M0aGv01sbaaBvrVLvdbaKe7D0gNjpzUzUo
 5GVM8ev+62mh+t/d8gnYaFc9X5VcmU8EcE3S78oUL5HumAm7Y/JZ7dQ/ZOxKMtKCb7IA
 /pHr66SlLJvtJECRbwiJn2Sg5Dv3PGEfqEJpffBMXPvP0sHu+IWpC39+mP9bB2Pbf+98
 fBgWVivfPCrINvPF1PCPSOYm0lAhnoZkmhfKXQIoqBWcNMGTZjq3pLCoMi+FC+THS6Ca
 9Kjg==
X-Gm-Message-State: AOAM530j1hDxAjztW7DEvaUwPqT0+7yuvA5TH/Tx4Bg+FAcKozYlurvd
 OnIDq+wK8QZ4kdnPnZWrY2AHgw==
X-Google-Smtp-Source: ABdhPJygO+LIUhXBZipYlpV1NjUWfdUnA48iHtMRa0nv+p1cN8d+bHqiZL+GB9Ig3+I8VNBJDIQMug==
X-Received: by 2002:adf:de05:: with SMTP id b5mr1650574wrm.299.1589289986709; 
 Tue, 12 May 2020 06:26:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 g15sm14441844wro.71.2020.05.12.06.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 06:26:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 6/6] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
Date: Tue, 12 May 2020 15:26:13 +0200
Message-Id: <20200512132613.31507-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200512132613.31507-1-narmstrong@baylibre.com>
References: <20200512132613.31507-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_062628_553462_36340626 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Khadas MCU node with active FAN thermal nodes for all the
Khadas VIM3 variants.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 094ecf2222bb..3325e54ea690 100644
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
