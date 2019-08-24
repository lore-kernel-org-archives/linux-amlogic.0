Return-Path: <SRS0=wfDe=WU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E3C3A59E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 18:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7635206B7
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 18:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqVNt+OP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ueVeoJxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7635206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcphgB7PovP3lBtCxUcabrIyDxStteQvPECdbn74CmE=; b=CqVNt+OPEs6RA4
	MDw0+yTz4LRxWB6amhzhAI83X/htxf4ipf47kuBBCGZrrq7mYMLYwCriFtZtOe3fANHuzaRmjH/LZ
	VAnEBNrcQfoafAnLHYcwNZ1aOmOhjMNeFYlZm9dV2E9e2ZMmngh9i6yVYIA4oJ/Caeo642ysa0KJF
	A65jQYjpCRejYPKc2YINmBa/D3TwRn2u7L/UTozLYcgvO7+mOvnV0MOEyHsF69yDLxSaWLjKEdRwz
	0JlUBF+fUnxVpwNJMsHMowcL/P0fAJj61JpDGs7L1/BapaO1XfveWdHZJw6/fwVc5ia6JxAE5gGMo
	9DvKjaVo3z/Sr0ez5vBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1b7E-0006Sd-GF; Sat, 24 Aug 2019 18:50:20 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1b6q-000535-Vi; Sat, 24 Aug 2019 18:49:58 +0000
Received: by mail-pl1-x641.google.com with SMTP id t14so7606254plr.11;
 Sat, 24 Aug 2019 11:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWM5LytVm+qVRCAst8MByyiY2Qa5JPuN6rsR3ZQ70z8=;
 b=ueVeoJxLluToFx+7NSL/79KFr3FgDymk0Q3IbzlNc+RpUCVdkfYubfuw6llg0MT83V
 RHgYVMjGtjLKwPLF61/YYc9Vamj9ZHFRtdUo1R167dxlVQEzi/NmTBb21scWlroo54nQ
 20pTzu1ghzF8CEsSaxA7nT5KeVzB/td+GaCu8w9N/gYCutyTid0mHqavLhEVZneea+rj
 JcOH9hMGAmiucsSC3yXuhy6M96YV9hDz7evYiEfc8txKzC7iBrMNFDwUvCdW8R8kudaY
 9bIZTWwLbpD0meiOnN64iZxIGMznrvrI9DZZyZ2P6xjpAc7JzbmhzPAwsq0nwUJzuxxv
 18Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWM5LytVm+qVRCAst8MByyiY2Qa5JPuN6rsR3ZQ70z8=;
 b=bJtwJ2VZGLzrloUl1rzGXl48nHDn3Edjx87eVcxSqNAmB3b20OlmiUplgbfmgMkajM
 zkCloX89fDDgb4NIntpkohC59uBdmgSSukks8Si5z1h0O/9BwQT7qE18OX1RObxH6HWu
 prabXpSIuriBjiaqIXUYHBQwEaxx9IS1v9/jTO49NaVtpkNiypDbi+1bCrug8peQjNBa
 7dC9qc8k5ZfhibK9NU88M3GuSFlffPAA/QiOAXRWA02ZjjYVtBGI2ouL2L81rbUNDZNV
 KdyXQNsOhrtdArqVN1Y30905/yqE+V6EPhTeRviQx1VVfHTyoQnT3GXmxhqVrshFx/Ph
 z75A==
X-Gm-Message-State: APjAAAWnEuB8uqY/rp+8Y8V81Mu38AUHBMiG7IjvpCrnO+ZoWXDq/INP
 SqSXrsLA10HuWmlR5ftHQ+I=
X-Google-Smtp-Source: APXvYqxcnSVgRSIlKHxAzb4Ia7pYMTMytnfEb5MOPyrQskplVfhLXfLS9fKipFL2C/aKSs2M2GNqjw==
X-Received: by 2002:a17:902:1105:: with SMTP id
 d5mr11346603pla.197.1566672596225; 
 Sat, 24 Aug 2019 11:49:56 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.111])
 by smtp.gmail.com with ESMTPSA id t8sm5519292pji.24.2019.08.24.11.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2019 11:49:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv4 1/3] arm64: dts: meson: odroid-c2: p5v0 is the main 5V power
 input
Date: Sat, 24 Aug 2019 18:49:10 +0000
Message-Id: <20190824184912.795-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190824184912.795-1-linux.amoon@gmail.com>
References: <20190824184912.795-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_114957_016298_7A8DD601 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

As per the schematic Monolithic Power Systems MP2161GJ-C499
supply a fixed output voltage of 5.0V. This supplies linked
to VDD_EE, HDMI_P5V0, USB_POWER, VCCK, VDDIO_AO1V8, DDR_VDDC
according to the schematics.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes from my previous attempt below
[1] https://lore.kernel.org/patchwork/patch/1031243/

New patch and fix the commit message.
Added regulator-always-on since this is core input regulator.
Split the linking on regulator and usb node in separate patch.

Later more patchs will follow linking more core regulator as per
shematics.
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 9972b1515da6..41d5fa370eb3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -50,6 +50,15 @@
 		};
 	};
 
+	p5v0: regulator-p5v0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "P5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	tflash_vdd: regulator-tflash_vdd {
 		/*
 		 * signal name from schematics: TFLASH_VDD_EN
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
