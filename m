Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755B3C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD86206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="064m4UsY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaUyGK84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD86206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3d+1qMAMCn/Ioafkz8OMog6BT9KDCTieY6SDpBFTj0=; b=064m4UsYXT1HxxyDBaadgcubkM
	0nNTV2kfubYv3nf57RIJiMQC73EKI5mLSfWhEJnXkVXnXK2iZ3hA6m+2sm4KkOuznc8zt6v/7vY1m
	pJTRg7nEjITrqCPsSh8qUJrAjuxXZkzULfUOfdAN4EBRZ0T5Bk388NZfVZoY+PiBYdCuDASZt6SwO
	hQsSI6gKPy3FtzCIR6qyuuAr1AHu5evKBCTXGdmV8PYjQBwX728WqSSuc9K0KhjLRq2zRQ293k2tC
	ssmmkks4ejPC9y+DYb2g4ShX98zf5ykO93WMY4sz7VtQH/IGg36nXqhxowRjm9i+SFg5sjPQ7GbpV
	xlRdtpZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM6h-0001bJ-Le; Fri, 02 Oct 2020 14:32:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6G-0001Lp-KC; Fri, 02 Oct 2020 14:31:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id w2so1913185wmi.1;
 Fri, 02 Oct 2020 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6vYF1uN6y1MEmfx/aSCmf3xT19pRJOVeWursMQGhdC8=;
 b=AaUyGK84xBFyPVOg0YZiTXYH5egnyUTDIGSp4B3YsaOkc9U3nnFYHcwiwY3ia2ZJd0
 zJjULreOxlvZEtIwUPLlPum3+szJpSsWj7kv7xETTJqISiBgjiQXMa5GSJKusmOmRibo
 Wsr7VJiQkaqQCPXqCr2FYuRfpYTH7pdIyrnjbPoWt4sPobl7CVYSfAXOqf3RGF5U6f1Q
 OCybM9VfznmPRqUuCcQe2vry+0WGUk7pj9HCOj6gU0H8l48UUzCOJs/2+adCV6S2whs6
 QcZPwp2MaJyAAURazMnjYt9KOtfw/mYobKtWrdixyRn/BGMKxUzCigAb+HmPkW4R7jmg
 xUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6vYF1uN6y1MEmfx/aSCmf3xT19pRJOVeWursMQGhdC8=;
 b=ot08dI7IlOwk1CQwmT3PWWPtl7bswnMm5g2P42Jo2HQvk8vIx4RadPhGzvNHhYs4O7
 AxlS3rjFUv0H15w/ISTlshlX78Zh/+mszSyyeKStOOuCycHuldnB6SsHTKP8uxrSSKCh
 XYThBQd4Bl0wZlwwlTsZVOBV4jKr88dLpvUGcehBsqd2XwlXaVBrSQIXxxTHxJhu9ZG+
 KVBTiuBG/S2vT/7h8XZDtbPqx3UNUwsc4JMHnMJSjvCv1dfLJ5yc+1pE0lkywxVYa1lc
 btHyv1UHn9V0Nv3AGsp69jUGQdWQMuJ44qFEZYoXWWEZ+K+/vKEY0wJN44UqxKG+PZyj
 0fAg==
X-Gm-Message-State: AOAM530IjJn4MqiVo/iOpnPWY9MubNZvhTnL8PcbjP2CD/jP86j4CBUL
 UnSzBAI3QkSxZks+4IiaWFo=
X-Google-Smtp-Source: ABdhPJzq2KLlz7Op/+6RpflhE0nKkBEmL5fs38a+YROdfaB2AoGUhFbZYrhx5MjHepSHaJ41Q7AYdA==
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr3202779wme.18.1601649115216; 
 Fri, 02 Oct 2020 07:31:55 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:31:54 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] arm64: dts: meson: add audio playback to odroid-c2
Date: Fri,  2 Oct 2020 14:31:35 +0000
Message-Id: <20201002143141.14870-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103156_680438_EFA440A1 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 70fcfb7b0683..9d8c919c6e19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -9,6 +9,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
@@ -172,6 +173,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-ODROID-C2";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
