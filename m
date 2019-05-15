Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3494C04E87
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E8BE20881
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="th6HxE76";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tvLa8z4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E8BE20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elfzzcUKg+zUiWG2lplWcv4huhuGhovxU7xUjkdmIfI=; b=th6HxE76aOdoFI
	zuZuJ+S38XR7R41WMvAfEA+SESnq3bBIUnnVd1CmsNcxK+/RwmMusPL/KN0p038woF6IMDT+S5jbZ
	T3IyhzdL83/YN54BUcwF2AWD5KYOhjrXs2XsTWkKjncTNudZVH3FOfX/Sy7fi+3C7VXQzjXF2M+85
	Y+joAjJIY/cuKvclxvjPxja6ka/3+ulf/PcjGJtm87WxOyNTuyS4jErskQZf71Z8tseByVCdCCt0w
	LukIG2e1c0uVjYSyB34M6JdQtlC5hWOmoj2auh4ZSWVFz78hRwahKth4NBPDfSo82IV710qKW5KdE
	OGr5yhePsxokAHxK6wKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQtob-0004OI-5p; Wed, 15 May 2019 13:19:25 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQtoK-00048e-7K
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 13:19:22 +0000
Received: by mail-wr1-f68.google.com with SMTP id e15so2666601wrs.4
 for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2019 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7q3OboSn1Utxth2w6fivo99umEKJDOfPqrO+oZXrXms=;
 b=tvLa8z4mV3sY8knydD6Essai3H/kETAk/KI6JrKEK9QfiMUVTA38wqcQXDTOKehNHs
 k2TtGeTDDK3LQqAzrQsZsVKG+2mpEueikBtU76P4zE2IQ7ycRuw+/V2kZN1vIjkAoDZx
 NlHijfa0NIjgCu5/dDXqGiAnen31TVrdqtPS/5/Ge6NBsVeuoW9yJu3WjwmfsDw6cWoV
 eaMTsRQEoQhINML/KY6ON9L3nrEsrG+HJLuqaGxbSmA2K6Kl2b6XMvxlRT8Et9gXPKTB
 BZGMAW4O/3zkOsw/gXXKQt0I0XanyVNSE1soMo7aCi3h/tlGAj/gk8KfrMo0eTgsRAxU
 N2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7q3OboSn1Utxth2w6fivo99umEKJDOfPqrO+oZXrXms=;
 b=otzbYOraxe9/S3LBLjHGD9P7JvCisi1ng1Eh9HQvir+4/+lRLd0rtJdpLVDfQLAP9M
 DdtUqPdbLyDLgE83Uk25LHsNs0+drYC32peYQFwTN5czU7/RPZqiVdrl2h2KMZHAUEmi
 eECq0jhKRQ/aXvKDPiQhWQTWoX45dU+TkimrKlHHRcA+MrswKkNTcDuQP6HcqcTUOIJA
 7pnBNowGNp8KR2eUPNLW7RpnrbU1r7x8ShrhdwJNoJZjnc9+4yYadNP+O/k3O8oJ2DQX
 8UZMAb/FuIc69Lt/BrAeGtTf5DezfldI1c/fm5b2tP3EN3ssQzF0fCZgH5GuQIxMruJc
 5uhA==
X-Gm-Message-State: APjAAAVabUnJpRvTBIXz/fkWh0JAlD0ZvvPBhuDi2HlcJA7K6Eu8d1R3
 L+9ovJT0LP8khc1sxEFYBe2yuQ==
X-Google-Smtp-Source: APXvYqzd0y4lCucxlNEcZkrCxWfuLOprdX+AerEPcc1L9Cd78ryiISSjyaQQLjM/Tnd5vmfnDB0Wfg==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr26304190wrn.156.1557926346200; 
 Wed, 15 May 2019 06:19:06 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/5] ASoC: meson: add tohdmitx DT bindings
Date: Wed, 15 May 2019 15:18:56 +0200
Message-Id: <20190515131858.32130-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_061908_488039_6E84A959 
X-CRM114-Status: GOOD (  11.18  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the bindings and the related documentation for the audio hdmitx
control glue of the Amlogic g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,g12a-tohdmitx.txt  | 55 +++++++++++++++++++
 .../dt-bindings/sound/meson-g12a-tohdmitx.h   | 13 +++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 include/dt-bindings/sound/meson-g12a-tohdmitx.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
new file mode 100644
index 000000000000..aa6c35570d31
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -0,0 +1,55 @@
+* Amlogic HDMI Tx control glue
+
+Required properties:
+- compatible: "amlogic,g12a-tohdmitx"
+- reg: physical base address of the controller and length of memory
+       mapped region.
+- #sound-dai-cells: should be 1.
+
+Example on the S905X2 SoC:
+
+tohdmitx: audio-controller@744 {
+	compatible = "amlogic,g12a-tohdmitx";
+	reg = <0x0 0x744 0x0 0x4>;
+	#sound-dai-cells = <1>;
+};
+
+Example of an 'amlogic,axg-sound-card':
+
+sound {
+	compatible = "amlogic,axg-sound-card";
+
+[...]
+
+	dai-link-x {
+		sound-dai = <&tdmif_a>;
+		dai-format = "i2s";
+		dai-tdm-slot-tx-mask-0 = <1 1>;
+
+		codec-0 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
+		};
+
+		codec-1 {
+			sound-dai = <&external_dac>;
+		};
+	};
+
+	dai-link-y {
+		sound-dai = <&tdmif_c>;
+		dai-format = "i2s";
+		dai-tdm-slot-tx-mask-0 = <1 1>;
+
+		codec {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
+		};
+	};
+
+	dai-link-z {
+		sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+		codec {
+			sound-dai = <&hdmi_tx>;
+		};
+	};
+};
diff --git a/include/dt-bindings/sound/meson-g12a-tohdmitx.h b/include/dt-bindings/sound/meson-g12a-tohdmitx.h
new file mode 100644
index 000000000000..c5e1f48d30d0
--- /dev/null
+++ b/include/dt-bindings/sound/meson-g12a-tohdmitx.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_G12A_TOHDMITX_H
+#define __DT_MESON_G12A_TOHDMITX_H
+
+#define TOHDMITX_I2S_IN_A	0
+#define TOHDMITX_I2S_IN_B	1
+#define TOHDMITX_I2S_IN_C	2
+#define TOHDMITX_I2S_OUT	3
+#define TOHDMITX_SPDIF_IN_A	4
+#define TOHDMITX_SPDIF_IN_B	5
+#define TOHDMITX_SPDIF_OUT	6
+
+#endif /* __DT_MESON_G12A_TOHDMITX_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
