Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1AEC43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:33:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C1820854
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YgTaHEr6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O12Uv9X9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C1820854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFAz6rMH8/JQR7cvorJ7yXCeI0IVHtU96ONb+K3NaiE=; b=YgTaHEr6lm8fYr
	oZ5BLIvrlewgix8n0RP3wS6FfzVYHZefR40ErrGwxXqR9PIzMPjFkfQEAm2238M0Z/PlrnrT8p68G
	tipZp5evX4i/18udZXnyMPxD2DLKYHEZtDYdVJZcpzTMVESKqpWCj4cMM1rg33frJ2wzl+6zFCypd
	B8qm0rY8aZoo4X3ewk/oevO7r3XA6Bdw+cIhOj9st/0/DJ+Me4v3xVE6WpLv2yrWBsU8RnQpUkc2v
	vZzJ4EiLE7hjE+Bl9o+jzSKoadNSOFNftb4ReDC8HCa5mslHjcOoNSu9N998ztG1WSr32uhCb1ZbI
	GFFHWP50Qq6W4p5OpwXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6DR4-0002LZ-7Y; Fri, 06 Sep 2019 12:33:54 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6DQh-0001lv-AJ; Fri, 06 Sep 2019 12:33:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id q5so4361839pfg.13;
 Fri, 06 Sep 2019 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XL1ecQdL6XPXwXmH0af6w6z5EAVN9fbcG5PWEOAOqeY=;
 b=O12Uv9X9eemdfbjlXdCH2RTvg+MPXjGz7vY/Gqhp9Vj6RUSWZ07sdHYmuQR8ZvgWFs
 VyKcVO1orqcRK9nyqvKzbZq5RGYpAxNtMgJbLa6CM1Ilx+S0oAEyvnSr3zJSaH+i96pu
 VOB4HBsJA+fXKbKhjPwRisv4UQFwFhd20dFfyEdwminLOg5nMmvQMsDOXDa7Wm7+dMf1
 Oz89BWwmy1YqxRSz034Wn8dVYdLSPFdh5djemm0EzoFNpsJ+rHMDQSejhkgCbKw7HZdj
 KpAeKb0mbfxTdUwKa0xjxkIy0ovq1u0rY+2gGwEgT6awyEb27GFDTn7F2Dq5IgBZZpBY
 L8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XL1ecQdL6XPXwXmH0af6w6z5EAVN9fbcG5PWEOAOqeY=;
 b=ujRgqAm+KL1vChNvHd8Yc6G4sGIH6vNKI4XAEl3sEEjTFk/xYn/TGW97y27iVGC9Li
 +9kBOQgLCaF3u/6FFfKC+BcUaB/WIwTjRG7yBSGRL4LdD2hONuM2u3UBILjQd11favPU
 aqOt3GpbPe+KJ3/Bry61lB5gZosAHa3bBWfBPu9x208JnSW/OtLtz30jlYaidppalKO6
 U5Fq8yT7vm3u5NZauPR/8pn1TtrI0dHnGoERNCirBs6IXVXKYrGi8CR9IKxnkLzfR9DD
 nNnKi2ekzW2zrzAhmgL+IrcOKEp961mwrTH6DJPuWoLwPKZ18emMudkGze90se6wBxIA
 WYzg==
X-Gm-Message-State: APjAAAVjXMpZkrx27TdAMFwwaGIhgucvx1gT5QB6n1QJmchBdMfH7eB/
 Mu8ILGIEqI3SBIMXP4MUp3g=
X-Google-Smtp-Source: APXvYqxYnVrJx8RQe8BwVimz0PHJn0+JCbOvLTf90TebAgJeKUBRjRR9eIXxqaR93YpHo+orEUkpSg==
X-Received: by 2002:a63:534d:: with SMTP id t13mr7774981pgl.313.1567773210032; 
 Fri, 06 Sep 2019 05:33:30 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id h70sm4752933pgc.36.2019.09.06.05.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:33:29 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv3-next 3/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to HDMI supply
Date: Fri,  6 Sep 2019 12:32:59 +0000
Message-Id: <20190906123259.351-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906123259.351-1-linux.amoon@gmail.com>
References: <20190906123259.351-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_053331_464865_A41690E8 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per schematics HDMI_P5V0 is supplied by P5V0 so add missing link.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes from previous
Patchv1
- As per Martin's suggestion added the HDMI_P5V0 fix regulator node.
Patchv2
- Added Matrin's and Neil's Reviewed-by.
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5624ff034659..6ae9fafe4244 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -66,6 +66,15 @@
 		regulator-always-on;
 	};
 
+	hdmi_p5v0: regulator-hdmi_p5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "HDMI_P5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		/* AP2331SA-7 */
+		vin-supply = <&p5v0>;
+	};
+
 	tflash_vdd: regulator-tflash_vdd {
 		compatible = "regulator-fixed";
 
@@ -220,6 +229,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_p5v0>;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
