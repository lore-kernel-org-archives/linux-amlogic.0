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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F27C63777
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:01:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7990720665
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7990720665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1xOaGwtqOC+1eBoeiD0azyIqQG1wJHGvNbxSgK9U3c=; b=H6IlbRC5FG/9yQnrnaO5yFZvDC
	4e10GBO0eyFtU3plJy6mOWbxmOJjSH0ct33sYKsgy/IpHvW/Oz2/d+ZPOBOus01MWLKYCoqajIEW4
	QitfgaLNj+92bVAkWcv+KqA2XwcmkHlt4ukaCItxSlFqfJ4MmqK7GwekuIomB8WyntzRp27nJDhSx
	mQENPUOIVMtRviFEDLHVSxza/Cms+7cNEBJXRSLl016fobcEBjWXUYjIehX9NAOKX36y4PPRVaQ93
	fDfGg0BfvaYLA9lxaTX409p7RGuvxDhQgecZ4SUpi27TrgBpv7AVJAI8yRZW/xsyRoYt+hjW796sx
	vr4l0few==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhg5-0000EQ-Gq; Thu, 03 Dec 2020 06:01:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhfX-0008NK-43; Thu, 03 Dec 2020 06:00:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id g185so2547582wmf.3;
 Wed, 02 Dec 2020 22:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=flzzMcNnuQ2TK+9oOreZP7+ZK5g8q35jbbhYIv7bR/Q=;
 b=b4oROn2uYBd3EJILA6VTP3ZDTBrWylRxn6PJTleoUIkOvvCZOYF2O5TCsKirv7nKwd
 8yxywt0SE3XJ8NZx1PY1nDQIWU7Pn7zvp2zIg8/Q3abg0d9k6gazejgLdybzJ5Phs6Z9
 VCfFmaL3TrGx4ArFqlzCmqemyijff4HfifG0IAzqFCIUwpI6EJhOTrzJdvvVSIN5Wi50
 RSDPuzJitQ70GCzfOyQXEyBhFrXxeEt9rivzMiHQF1Gl4hqeJwlsEQrI2MMVoxTnUmm6
 s2VDOVOvRInrBckzN7BlAAlRHcT1PyX9qauil1ld1uZNwvJgSMF+6xlhtWARAekuCren
 rQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=flzzMcNnuQ2TK+9oOreZP7+ZK5g8q35jbbhYIv7bR/Q=;
 b=Qp3gCnz5KzTmz+Bi9DTe32igPkAgY9+h+bXGvn/4RIAey6lukUI1IRpEAWIo94RcON
 giPirxQqn2aPhpyy1YYUnb4Ld6H7LVOmmw0LGZy9VUo+FxRIwbDYMxNPbUkt/mhR9sYY
 IgFEWDde94x1G4jjDvAU9+BAjpLymN34VnmCCHaQklC2ST+FAIc7cMfK5Kzdj5lzoVWU
 zGmh5s0pxMSk7atFawT66Uyno/aPUOatG8Em4/+VRQO3ohcYP1nHT7nbrA5HZXGlSuHB
 ng5XfZ36KPFtAMy0pJwYlZWNIDQTnw+zW38bP7knJV+61jXqI5pYQ0dSCavcPvCUwBVP
 e/Sg==
X-Gm-Message-State: AOAM531SRaQ+OkwkHZFWrYXmqIZqo1XzP4Y46jlMHFN+0n1Fmv71NPaT
 gEvA9AIuW7LB0eEeAOFtDY0=
X-Google-Smtp-Source: ABdhPJyasl5FzioZeX74Iy3aXqmjj6CpZAy6X9j/0JXgw2knVm/Hcb1ZR5D932g1/aJpwkMPrcH6Vw==
X-Received: by 2002:a1c:e901:: with SMTP id q1mr1395679wmc.148.1606975241061; 
 Wed, 02 Dec 2020 22:00:41 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i11sm218439wro.85.2020.12.02.22.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:00:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] arm64: dts: meson: add audio playback to wetek-hub
Date: Thu,  3 Dec 2020 06:00:22 +0000
Message-Id: <20201203060023.9454-7-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203060023.9454-1-christianshewitt@gmail.com>
References: <20201203060023.9454-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_010044_036769_A85E9849 
X-CRM114-Status: GOOD (  12.78  )
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
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index 83b985bb015e..0c1570153842 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -7,10 +7,50 @@
 /dts-v1/;
 
 #include "meson-gxbb-wetek.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "wetek,hub", "amlogic,meson-gxbb";
 	model = "WeTek Hub";
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-WETEK-HUB";
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
 
 &ir {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
