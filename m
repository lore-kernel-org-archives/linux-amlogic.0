Return-Path: <SRS0=ZKB9=NC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CBBC4338F
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Aug 2021 05:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1765460F35
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Aug 2021 05:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1765460F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0RtERAH6W/LMO75t0zGFA10Ymzu7iOiII+hzxETyvqI=; b=LtdZv4KwVm6mjO
	85X5RcarXIktEoZY9iE7zUhtiZ/m3anrBk7oOJe2vKEoK/yVkpaOSrOyZC5QL0BeFpPvUpWBTMWpH
	9kbifqRG2EZxOE9l9VItE6ToHin3YXjJ5IOEfJiJ+lpO64y7to5r+5VM1aBDIlNJyOamgNMF97Ngi
	s7MW8GfWNJuCdWGT+tmsfUYWKuDumwkTexazYSPZHqV91Sl7hAZfF1gT4T/00meol+5VDrMyN7len
	tRFYXT55pDqnMxZs1Ju7G5tCF7GORAQ/DezqzbjCOZFxlLPOQc/U0/UheXAqXBCYYN1c2sIJjGrGm
	8L2mWJFIJgjp3MYUc1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDgVB-005bGw-Ba; Wed, 11 Aug 2021 05:10:05 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDgUy-005bFd-Ta; Wed, 11 Aug 2021 05:09:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so7739790pji.5; 
 Tue, 10 Aug 2021 22:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4+7r2wYydj9au+exa7oWuSxVTG1fG9vj88byQqpPzeA=;
 b=REqW9HT3NtCm96X/UTqL6H0NrJ1fIp6GMmyoBimTuev8tTbiuwvCtB4wIHxl7q4rDp
 mUfKK33ey52cW1j8jGxlmHWCk6awcVR4l/nqqpYq58rlaCtVnYphmP/H2vXrPp9lRnPR
 zPRMs7DYH+6BhhqSZbKaHoSHrQWUBFfJksWfig9AHRdTm/6a4yRuMEf+NodKwdwwrWi7
 NZKSCkgb1u0DTPQJHkFjaBg3CgnThigPF+WUn9+7+p2eG+Sb4Jqm968e/oT38GsYWJSD
 /PjxyVqblCnukoc37nQF4r5OPm84eeoJ5TquZNdN87M/xJdnp5rIo6/0fEpYrNSwU779
 XDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4+7r2wYydj9au+exa7oWuSxVTG1fG9vj88byQqpPzeA=;
 b=BILiHJhJ9mop6ECmiRMPkEv4diblODcvxfEX+aWdjJN5kESmDENR/p8/gDMhsMdkJ0
 nNsOIBFrT5eRDWdh0UJee2jwDwyGY9uzDCu+saDa2tSVkfia4u9FD9GhCMNCOu+StP33
 dJVdbfjDV/dYDc3Eqfoko4HyPO2yRSc/rJspoPOuFzwS/g1mNQunTWnOuLo345clGZD9
 grej33w41GadeidS/dV4qDHbVgF8Ho/CMQTcnvLCeZ1kDnkBLh9lZjdXZ15vtd7Vj+Q8
 iKAeVZg+gP7GlC08tTzMtStVqMYXS3yFyXZynOQN8KuklvPKdYMml7Nsr+sbU1qRNVob
 9tuw==
X-Gm-Message-State: AOAM533OpTvcwsnSUoxWnrQtWK45oy1oAuoU03lUDDWNfechthBXgvVT
 XmYeEglNFQi2/Qft5dnJClc=
X-Google-Smtp-Source: ABdhPJzQSclZvmDBAqfL4DFvgTqVQURrVJD2YoHY90U2Cizd0Xv0QwdLJYaVQMlPn0NbFY2atWrcrA==
X-Received: by 2002:a63:1359:: with SMTP id 25mr139944pgt.79.1628658591547;
 Tue, 10 Aug 2021 22:09:51 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id z15sm30314987pgc.13.2021.08.10.22.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 22:09:51 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
Date: Wed, 11 Aug 2021 13:09:41 +0800
Message-Id: <20210811050941.398360-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_220953_015713_1784E556 
X-CRM114-Status: UNSURE (   8.92  )
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

Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 3d8b1f4f2..1efdbb61e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
 			status = "disabled";
 		};
 
+		spdifin: audio-controller@400 {
+			compatible = "amlogic,g12a-spdifin",
+			"amlogic,axg-spdifin";
+			reg = <0x0 0x400 0x0 0x30>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFIN";
+			interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+			<&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+			clock-names = "pclk", "refclk";
+			resets = <&clkc_audio AUD_RESET_SPDIFIN>;
+			status = "disabled";
+		};
+
+		spdifout: audio-controller@480 {
+			compatible = "amlogic,g12a-spdifout",
+			"amlogic,axg-spdifout";
+			reg = <0x0 0x480 0x0 0x50>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFOUT";
+			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+			<&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+			clock-names = "pclk", "mclk";
+			resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
+			status = "disabled";
+		};
+
 		tdmout_a: audio-controller@500 {
 			compatible = "amlogic,sm1-tdmout";
 			reg = <0x0 0x500 0x0 0x40>;
@@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
 			status = "disabled";
 		};
 
+		spdifout_b: audio-controller@680 {
+			compatible = "amlogic,g12a-spdifout",
+			"amlogic,axg-spdifout";
+			reg = <0x0 0x680 0x0 0x50>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFOUT_B";
+			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
+			<&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
+			clock-names = "pclk", "mclk";
+			resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
+			status = "disabled";
+		};
+
 		toacodec: audio-controller@740 {
 			compatible = "amlogic,sm1-toacodec",
 				     "amlogic,g12a-toacodec";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
