Return-Path: <SRS0=ZFy2=FH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3A8C64E7A
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B6C20665
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B6C20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THUFAmz4KvWEuAeAKnoWCuTzvx8CklF80ux4WRZem7A=; b=2ahlPumAe+WbKSZSIC3/Cd5nxy
	ZEhyiypMgRlK26jm8ErLQXMS556VUFrNmfN19BtU0j6P5wbgLtNuORsC/oWVut82ha7L/6Vao+hLq
	wm/drHXBsguj10tXki+8raRofel3/7v75nqDFn79LnhgJODthR1WJV1B/xEr5283jXXyKDzZA1Kmp
	/C9iNnDrGCtupVcNmINwMDS3luLfqIB/ksMiXNGh6etd5arYAoKf/kKzcebjQb9NuOcG4O/7Jp3pm
	NoP+I52dmEoQGzuv9UsTlkzG4SBwDo2uyZfUHTn9/IuUyRZGSkK7/drWI3xo4HKvMC5D/hsNzqUNY
	tRX1WXmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhfS-0008M5-JJ; Thu, 03 Dec 2020 06:00:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhfK-0008Jd-Tz; Thu, 03 Dec 2020 06:00:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id 64so590060wra.11;
 Wed, 02 Dec 2020 22:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yQx2ZxmNKfhSKBL/RrXY6Av26UDGD56hcg2QvfdLjZ8=;
 b=Jd9yX4ZOB15VnyBC8HtYGGV+qWz0rzvNEOgyLezF/x//sq2cSjs08/RZlvSTb6vzzc
 IL7EFIonPtrRIdECE+AmNaYdalTg9LEAJi8HQ/flZO0t+6Onye8s6cJdQ1WzlIrPPau4
 sg6OXgcT/7n3hBvQUOHL2Dmu8I/WjxRY92c5/D690ttwWsNHRhyXFOcxBuGy4VW4YIJO
 PjiryC/WXVbcmLbtFDLe6FjDl8/zBM88VPsCMUuLRARRJ7uAeGyAkLvBf/fMJD9EbziK
 G9hM8TnEGw+s5EduYmP64M55RuFReEV0OBrWFdvuCOod8CyWfTOve3JM8UKt7VNY/Bsa
 7NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yQx2ZxmNKfhSKBL/RrXY6Av26UDGD56hcg2QvfdLjZ8=;
 b=bHufd6McnmLn07eSsqDxbw8KC7hM0xwFMjggq5JvH2ftnkjyscbOOpq8SvI5z66GI2
 Mlueblwd0iBa7h4jfTY4crTq0YPZjSsICfXUrIrVl3FEYmTV2wRVXiSnupHBNXXjpySk
 fmI7ROFva/JzasF86vcaQmmSvF6KoUDILG2bF/ffRQs2j2eSPNWMe7Rrt2rgwvy96mwn
 NaUkWU3Dhsprhm+NjInhV8I9V9I+RQhuYG2aV24UqBLGbCzPGEvqG/inE+4Gar4PDfJh
 kbSJ5hAhtzJZHfuZwXMxcW+lkBgPiiB4NfTRVMj6QnNINQX8StKs6Rvqe0JwlzNKoma2
 xQTg==
X-Gm-Message-State: AOAM531FxZyfdGoS2DhOT4SPpsEHhuh+cDk4YO9oOjenvnss5sleal+1
 HbxnZ+hw0B4jWNiz0dJSK/M=
X-Google-Smtp-Source: ABdhPJz5touPQ8gRAj5bAX0jBVDBM4EYThkiQpjW8op4pjO742vkaxdCX2O0sKSfLgLIRh3HPv/WRg==
X-Received: by 2002:a05:6000:45:: with SMTP id
 k5mr1750499wrx.108.1606975230142; 
 Wed, 02 Dec 2020 22:00:30 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i11sm218439wro.85.2020.12.02.22.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:00:29 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] arm64: dts: meson: add audio playback to a95x
Date: Thu,  3 Dec 2020 06:00:17 +0000
Message-Id: <20201203060023.9454-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203060023.9454-1-christianshewitt@gmail.com>
References: <20201203060023.9454-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_010031_003036_3359A600 
X-CRM114-Status: GOOD (  13.37  )
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
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 67d901ed2fa3..b5b11cb9f393 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -10,6 +10,7 @@
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "nexbox,a95x", "amlogic,meson-gxbb";
@@ -139,6 +140,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-NEXBOX-A95X";
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
 
 &cvbs_vdac_port {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
