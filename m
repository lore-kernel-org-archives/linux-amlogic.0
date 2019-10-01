Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB41C352AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 07:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 122A021783
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 07:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFXzKGDC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNZoDGRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 122A021783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkA8B1D1gz8ufkYfy0k8ZV9pR93GbKkNN/Yye3Zeg54=; b=oFXzKGDCtJj+IS
	47GzMiX3fL75N37clQ4le48RNdLi0XLf+z2tUs2Hs3cu6HfPD5ZR24pD6ZYa/NpAhnAaNunanmvAu
	VIBwRxgn65WoP9IfZ6eSlvlddXCY9tcyyxAYI4i5kD25KMIjMLp0mAImfumRhJtKtm6M6baPjcTH2
	mq87cgKWDfYMR3kxbD4tUT4DmQ8alx4m0pypynSt9PQbmLNETPrdzkXCINHbNByyI2WPJsSMp2hxw
	0Mje/cBAsQ1/eDnlSDa74dvm+m9oZR49UJvKO+OALWL2RCVy59SYrqT3PWKfzSqolzUBfcgxSlhoW
	m7YT4rufUF8GIJ4NKpEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFCle-0002nh-49; Tue, 01 Oct 2019 07:40:18 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFCkq-0001uV-7v; Tue, 01 Oct 2019 07:39:29 +0000
Received: by mail-pf1-x442.google.com with SMTP id y72so7283117pfb.12;
 Tue, 01 Oct 2019 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPppnx0pHg/e5NQNVYHCSHLYJt27O7a0A615YGrLKc8=;
 b=RNZoDGRHpt/Wdb8dG1PMcaHqUo2VhanExRHm03EBTnxrfHRrlr1pSkkQgLSxVUEUUj
 Z6vB/F0ywZolrgx5IPX/8yng0MwAwu/DPV1rK3B4nL3+IoLa/eyhI7VjU/KSAMG8BlbP
 RCpDMtcc4aJ6aXqynVOxr6jaLN8pjcwS8Aq0e1fx4Kq79/y/wTCWyI1BAbAnG814e6QO
 mHOV8XCaLn4wjFnALqV/WTzNS3w5bP4Gx/jukPlzMZ9IdJmWPUu8r/Pp92GAUVnL+KTL
 uvstGokKaNAAVqVYsf8vzoGr2P1RkbVDt+Nm5gfzle0pA6YidHLShRRME3soF4usyYRj
 zRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPppnx0pHg/e5NQNVYHCSHLYJt27O7a0A615YGrLKc8=;
 b=aJQ3M0EojqSB1b/r3VoWZQWvXyIOnbIlg0LKa9OQgeX09hRb3b5eYzRV7wsKRsZM/5
 E06VF79K2/LZ5o5kF+BfG46uzNnsqy839+ZWgtjqZe/W1DIhReXWY9j8zrU+cR2dPNRw
 RQ8jZHbd4ijMuOlgnfls2WJpmW0sxRaBDTXvqRcBVa0/oaGaFsQHXU+U13FZEkvYQiU/
 jTo93hLQHZ1Nae++xjHcRhQvY1yQcJP1/MzP/SyL22/+YU5wbOAeWFKAQ2JDvS849TMB
 FqZFSVhT690bbKF6jmg4JsdegRVavHQxEN/4OWrhFfedz8VpVrkWKRdCb/AWCjfTkYb4
 PuAw==
X-Gm-Message-State: APjAAAVmpmzka1NclHk+Jcmzpbp9LSiQBA4KNqUQdCqGZUdr8KuKnH4y
 IYe3ts3LImijhrG3/7tlqTI=
X-Google-Smtp-Source: APXvYqwf/R8vsuDMrsHPW7AAcObC7akqhTa6ONGQou6OgWL5Xr1mJECAx9MceH6tA5EtUlPFROrz4Q==
X-Received: by 2002:a63:cf4e:: with SMTP id b14mr29075889pgj.109.1569915567708; 
 Tue, 01 Oct 2019 00:39:27 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.191])
 by smtp.gmail.com with ESMTPSA id g19sm23133024pgm.63.2019.10.01.00.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 00:39:27 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv3 RESEND-next 3/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to HDMI supply
Date: Tue,  1 Oct 2019 07:39:01 +0000
Message-Id: <20191001073901.372-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001073901.372-1-linux.amoon@gmail.com>
References: <20191001073901.372-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_003928_350383_38ADDE5F 
X-CRM114-Status: GOOD (  12.40  )
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
index 2fcd512373a3..6ded279c40c8 100644
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
