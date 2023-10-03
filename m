Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E16E75426
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Oct 2023 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ctEWgRxiOaDJJZkzOuLqW56pS/ib1LiKAF+CRP0tpik=; b=ZZxuxkmRsK41K8
	MMSgh4IznBgZfAHHVfamKiIwL9aML3uKR8/cIM2J0NZuVmv/J9Aoq5/Oi8PuNiVo0kkgSM7Uw4S4W
	apTn58U0DqaWqQ1XrXYJMnwmbrMm3G3PJ5Ayf1RTSPcTz0u3aIbKnqI0xJlJYaEgpgBqm+s3mqgBj
	ychusiQoTIIzVdP+aCwUK9ID/Z82Rtqo8VOEK64DGR0McrY63B7/7plqEhP/oF8sTceH3T/iinAzM
	crEY8+UJrGAAbDLwSE7rhoGiGysxTHpoMqYFNQYxNW2Pm6v5zXONezsVQoWautDybCqSwEms71Jlw
	R31jWbzUYI+Pop7FnVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneGC-00Eavn-2j;
	Tue, 03 Oct 2023 12:12:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneG9-00Eaug-20
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Oct 2023 12:12:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3215f19a13aso885103f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Oct 2023 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696335134; x=1696939934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndmM4JbR+kmn5XX/WNfIjfT5Y4Gu1IiD0B/toAwyHcg=;
        b=YIuqqLJis6VsRBE8BOqT55wu+BKsL5tTwdw/KXclqr12HP+kf9igfz4Klt+qO5x+dp
         U4s9FwrttCUm1FbNvoiZUhUavsb11rRJP9h4qJ9KTixdDK1WNdS62jx/PjVsf380cDB1
         KKtff1KcyMETauSqI7KUGq/beSpXRZr94DmrNQRsUl0fE7xYkYOuJQrfVHNdTGseIMhC
         aJ0zSnDx/D8GszRbR6LTc0J/T263BfvHjdR8lw4ybFb8FoRfdMEpkNuGqmZYTr2RvYdW
         Pi5Lj+hVcxPtCIcQErMdtB+UAbfqL8yGx7olK6pcBrleyGb0+IHssZMLeDx94QbiUVtb
         Z+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696335134; x=1696939934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndmM4JbR+kmn5XX/WNfIjfT5Y4Gu1IiD0B/toAwyHcg=;
        b=c/T2qgXrHgm05LDeJexaxmb6bfhq/jt1k86jP/k6uFkXuRq1sscbNZ6qiccQTtDcTd
         UdpgRVGuJCDPbrTtYEcCVcqBMR2MYbSnTlGyQ/vZ1crPfYP5Fg1i1xOQekeR5g/16Cun
         3HsMOnPg2mp2GWziTokoJZt4S3+JTTmK/7xUNz5X9XBfe4P48P7wjIVS/i29Dp9RK1j+
         3/zvIKQXprbxab80Gv/s0rFQdSZRGIUW4ZPNwZlvbCCDxJhhopBo5lsiZ9fqj6MGcMoE
         isA6Cp79tewoygWRWqRfyNA93oQm+rC3vZSdbumfRi8vIgsIBE+RczFfkBf/9LeEO5u+
         01cQ==
X-Gm-Message-State: AOJu0YwT9Wig3jm0yhDF5XfrmKJLjaoD8aawYpkCXj0zipa+N/vyTglm
	5VnjMtFyec28dZWWEVnEy9NSwg==
X-Google-Smtp-Source: AGHT+IGxM9GQG5hZXhtn4gzyjVX9e5VJ9hbuqnhWi1ArsHR5MP/tYUrn4k11rz6jZV4/HWXFyPRcRA==
X-Received: by 2002:a5d:4385:0:b0:321:677d:98b0 with SMTP id i5-20020a5d4385000000b00321677d98b0mr12588341wrq.11.1696335134390;
        Tue, 03 Oct 2023 05:12:14 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:15bf:5b59:3e24:71fe])
        by smtp.googlemail.com with ESMTPSA id p3-20020a05600c204300b0040648217f4fsm9269649wmg.39.2023.10.03.05.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 05:12:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: amlogic: add spdifout on libretech potatoes
Date: Tue,  3 Oct 2023 14:12:04 +0200
Message-Id: <20231003121205.2870923-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_051217_871097_BD4C7F50 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

SPDIF output is available libretech's Potato v1 and v2, on a dedicated
header. Add the codec, pinmux and dai link to enable it on the sound card.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 17 +++++++++++++++++
 .../amlogic/meson-gxl-s905x-libretech-cc.dts    | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 2825db91e462..ca6f922d162d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -23,6 +23,13 @@ aliases {
 		spi0 = &spifc;
 	};
 
+	spdif_dit: audio-codec {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "9J2";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -189,11 +196,21 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
 	};
 };
 
 &aiu {
 	status = "okay";
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
 };
 
 &cec_AO {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 27093e6ac9e2..8b3234a9cb45 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -29,6 +29,13 @@ dio2133: analog-amplifier {
 		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
 	};
 
+	spdif_dit: audio-codec {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "9J1";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -183,6 +190,14 @@ codec-0 {
 				sound-dai = <&acodec>;
 			};
 		};
+
+		dai-link-4 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
 	};
 };
 
@@ -193,6 +208,8 @@ &acodec {
 
 &aiu {
 	status = "okay";
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
 };
 
 &cec_AO {
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
