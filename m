Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A181C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175E42084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJwLCb+r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LUsrQuhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175E42084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PW+WCODhjxu7hBQHo9Csu0GY3NrAwoBawXETH2zPwjg=; b=UJwLCb+rnGNsYm
	Wm13imPKc4qo4qGQ4vfW0g2aKk+mW7NoaR3tQLSbRkUbNIAhFUlk3l1yk9a2URs7cvpmNjGJLYKju
	hHaNcDI6AquWJB45se8Ioq3hDGoWCjW8lEG7Gi6B4xhtkJ26kgWqZ7qaGiFinZjLDirWViBIp7Fod
	NEFpfwZ35K/ycYh2N63HAyFJEebI5IWKSUj1lUTlUDSW/onZquwoDcwgNmRAFF2kTUwNsblQr6eK4
	gQ5Qx8wmyyRWHAdTGbKyRJwpZXAf1PTUCyidy8onO3ORRm8H/1w6MwrgYByyeURMoFNdo2gnZuN3J
	IjkW7fRus1NfbPgL3KPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEvfz-0004Iw-HJ; Fri, 12 Apr 2019 12:53:03 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEveu-0002w8-Cg
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 12:52:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id n25so10882610wmk.4
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Niok7+mQ1HMXYhWIferbfqJsQTk/gK20ga0eIZkuSs=;
 b=LUsrQuhyPX+sl/sci8Wxo10d+c5z2DVx3f3EnZ074fFT0jH7dLmqYugHEzwuwt4/L2
 UvGo6eC9cVmNy0bGM4OI36yNDLbAxOf8W0idOaWJox4mZ8YGIFCilpqqNZlN0rUKGY3f
 9PV4Aszv7H+uHYx0b45aNekCsrtXScFsXctc/CXoranGBWfc+/VhQGFhImQ756rNXZfd
 8Zdd2LDOS9lin8FztiZny6CeG/ACB8APOdQeH1m4X0I9k986bC3eVP3OCqZotiCrKOZw
 uwSaxXrEU5t9yXSNT+ZFGViQq/woq3KNGK6Wr4jh4Blg/Wy8V9/7R2mMdyn2CAubtP3C
 a+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Niok7+mQ1HMXYhWIferbfqJsQTk/gK20ga0eIZkuSs=;
 b=FS10aaFX6R+gtmeDcK2jEfGPQ3rdTqAqD3HpjbXKxiUmubSWF40txPyPI0U8fGuq42
 4dbwYXsqCpktkbZLvJc7jaaXOyNpR7QLwbiallnwfM05mj3W/GxENFH2RlybxQZiAv1P
 1KejQZcHuUmtfnrpILGdgqSLPk851B3RKiq1YW7EZIt5HoWFSyonOSDv2c20bgXFFArv
 iuUroRUa87ym2xxjDXBbvtl4ZvFyuAKUFnnDpni12maRYSXhBELs/KDPrQe72gC4bbPJ
 NgGVV5yFxaWwT0In9INPVWx6nMlY2JRtw/MigAjesBTikgAgSAYkRXXxFFdIAXe32Jmi
 rpPw==
X-Gm-Message-State: APjAAAVRs17Y9NbPsuxVZLAF0O4EDcpm8cQttKqBxZw2aATgBEWGww9j
 8pBEIRaPKkKaUbHNIPScujrnng==
X-Google-Smtp-Source: APXvYqwkv/HuIzCLU2dgZttfVJ4dJ0e06IQmwSTo+V6pVJ+Cp/Lid5XtfgOmZK0WgM6dZWLq7DqetA==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr10691902wmc.1.1555073515021; 
 Fri, 12 Apr 2019 05:51:55 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 b3sm42049702wrx.57.2019.04.12.05.51.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Apr 2019 05:51:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 5/7] arm64: dts: meson: g12a: add spdifouts
Date: Fri, 12 Apr 2019 14:51:34 +0200
Message-Id: <20190412125136.28232-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_055156_935484_E08E05F6 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the spdif output devices of the g12a SoCs.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 5f5b8c67df49..90b23bacd51c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -414,6 +414,18 @@
 					status = "disabled";
 				};
 
+				spdifout: audio-controller@480 {
+					compatible = "amlogic,g12a-spdifout",
+						     "amlogic,axg-spdifout";
+					reg = <0x0 0x480 0x0 0x50>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "SPDIFOUT";
+					clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+						 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+					clock-names = "pclk", "mclk";
+					status = "disabled";
+				};
+
 				tdmout_a: audio-controller@500 {
 					compatible = "amlogic,g12a-tdmout";
 					reg = <0x0 0x500 0x0 0x40>;
@@ -455,6 +467,18 @@
 						      "lrclk", "lrclk_sel";
 					status = "disabled";
 				};
+
+				spdifout_b: audio-controller@680 {
+					compatible = "amlogic,g12a-spdifout",
+						     "amlogic,axg-spdifout";
+					reg = <0x0 0x680 0x0 0x50>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "SPDIFOUT_B";
+					clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
+						 <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
+					clock-names = "pclk", "mclk";
+					status = "disabled";
+				};
 			};
 		};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
