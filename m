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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2353C47423
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F98320719
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LyoV0rfT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQ8HuosK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F98320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asE5S9SkJwiFyxEVX1d4dB0PPFcoC8gFkgyBO8KVPRM=; b=LyoV0rfTyFBRlVKoGjQOFKxXAo
	1GAVzNxVTxwfESnCv4+JxACEFODwvVp0mjuaHXljJQIn0oG8IGQBThFSQbiRNEg5kAcW+MuEU7uHQ
	sKog5YTOOzVcPAxyeHDAtT0Xa25n5c+JigQKWgh1wkt01zWqerc4ra8l6DIT6grKjkNccwkp7ET9T
	WVoGkgQn+4Nl6krpCNv6W+0kwqy2Vv/9S54m0RApoGo9eWMA3ExjBqRWcjrR2q8TkZh8xncnFA9Da
	IWIgsroFGhhMWtTCSLdAK8ax37G+EIQ7UcX2A3xMfjAjjCOyygucWE2866d0z5cvbD9mZYEE8/kDP
	WQ5ZMKbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM6X-0001W1-Vh; Fri, 02 Oct 2020 14:32:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6E-0001L3-9i; Fri, 02 Oct 2020 14:31:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id x14so2049012wrl.12;
 Fri, 02 Oct 2020 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0aTKJ5HZFsSQ+eCcPAw4QelVRGYoHt0VsuUcLv/a/yw=;
 b=bQ8HuosKyxmeQ3WbtUyTHC4zSKTW3v4sCj/w+hkIYKGWd7XdCAZD0GBPUL7DLxQLDJ
 36GQTQg2Y12jWPm3ewVItJvqSrnt9pR/Wr4JyKxDDhzlOlv8G5QRqWubIbQwQr90ENg4
 xkcTBaQMnQvTxw/WVhlSeiOvxfvKvNg74hMXch3/rxGQraMhMLKfZuaSE0Ekow9McZNk
 QjYDmuUq0K5MjR0uEv9zL8OH4ZpAEiS14ZCs2RdeERbOEkKIS0TiwcOKaqlSCj0WYvOa
 r3wmT06NDWs6sqL61W0oa2vup1/eknpbsQgIsbCX6pslMBVRdKxrpZ2aYAegl28QRqii
 61Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0aTKJ5HZFsSQ+eCcPAw4QelVRGYoHt0VsuUcLv/a/yw=;
 b=Qj0Km1PWPP0Q+xAxQraLLjzhT7oQOT4SCKOUYI5P/DXm8xKuZtIMT59EcKkXEKq8Ef
 DK6ay0cJDzGM96swQ2jA8jkIgLmqNJuQxLhAnX/Q7fHBLGqXX6wX93TeLFyuNAJlRJbm
 9UJLgECtQkSPnZ6Apf17PgpAt0RrTgA24yVJ0Tg/VmTe6/4aeZimwXQ7Eeu7pChNJx4u
 Q7givoMxbjR8veJjee3xkwyeEUP+llGyrr3VjTEqOMjydeVSrI1rqJD8FJomlJdf4F3a
 8qD50yZyTCJ09PB6HgKi11o2YVCYIR2DF5yYZuIQ0kztw597vPlQ9/X7HboICZdT5KTd
 AMkQ==
X-Gm-Message-State: AOAM533PO9rE+gBeAI0rzG2BW+0unBEm4CWSB7oXFLexqyOknQqK75P4
 vK4A7wRvh/tDxBErtaMsVmo=
X-Google-Smtp-Source: ABdhPJzmGKTSVIyJKZrq/Ucd6LZFnwsseoUQA8ZLNCQLzqK4EYyKzRlzyq63/XFTwQCkOAT7QSFprw==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr3660294wrn.12.1601649112935; 
 Fri, 02 Oct 2020 07:31:52 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:31:52 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] arm64: dts: meson: add audio playback to nanopi-k2
Date: Fri,  2 Oct 2020 14:31:34 +0000
Message-Id: <20201002143141.14870-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103154_419380_9F47C47A 
X-CRM114-Status: GOOD (  13.95  )
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
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7be3e354093b..8e5df00b06a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -7,6 +7,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
@@ -130,6 +131,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-NANOPI-K2";
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
