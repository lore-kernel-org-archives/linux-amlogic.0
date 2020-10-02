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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CB1C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82340206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VIUD3AfA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbqwofO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82340206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Pk3vF50ESHZcpfQJ9f1EUt7hVg4dMuyz9kcXUOW7Gs=; b=VIUD3AfAg3KhZSeGxk6eXbq0yM
	JUHAT/J5Gf4e1fmP6MRzIv9Lf+cwEXmmOWh2ShLGTIeX2zgwBFmJDKiuZqWCUaz0g8bpY2FQpYf4r
	cJ46hhaRjCoZxMMOWDFCjTn0uHO/nZmKovmWPloSVguc1KGnDfWeA/E8Y5rNQVQMQk59dvcLoN2+z
	XZmS5XILFx+HU/ATdlmleuFkFJ15lTBGowYzWDaLo2QBwD8ln+TB6/qtkxjsyPBI0q3+HX2ZvG9kz
	JzSzLqMLVOqUG27ZFXcYnccVsV0eVrFKmW3h8YAQKDMiBKkQaO9e01mLMnjmMdqV9MmAUMp0zI+A9
	Ebnp7EXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM6m-0001e1-3d; Fri, 02 Oct 2020 14:32:28 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6I-0001Mo-Cd; Fri, 02 Oct 2020 14:31:59 +0000
Received: by mail-wr1-x443.google.com with SMTP id z1so2078138wrt.3;
 Fri, 02 Oct 2020 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ylzKfvJHgekxjZxp4VQuW17EoD7pYVoukf8XeW0SJg8=;
 b=XbqwofO3O11m65QXRe/QBPxMtlN0jHNDW1/9N1+6KY/kcOu4HpE6dpJb6A26HH3P8F
 1aKh9GaoUe2mGwk3lS6sYEvr8hKBKSFa6PxhJhe1IRjH/20J+qH6Nx1IVRqopBAqFp4b
 sHv+YoNSmLmrrgXOUyUA/xNYYYHix6ETd1bK7mj5mxeFBY5INPHFeF8GC1RQT9cw+qtk
 C0M8Uk4WjFZdsaaRa/omRTLiTz8RtjTQhJ1lPQ7JkltIDIL7Gp2YrUgL4vslq3+K9P0d
 0QVjmLEsJg1yxcMOR8aIhwLSg2lg5XBHAz4zTKCb3tXhD3wJ9llY5+uU4hHOGKZFX0iI
 9PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ylzKfvJHgekxjZxp4VQuW17EoD7pYVoukf8XeW0SJg8=;
 b=a4r9mkRenhVguKjPKZH43KSwwLPQep5W5L3/UAwXgQMrIIEpdDnXSUD9FdlQwly7cZ
 d+4Kr3ExHuDJwD+GeEznnUMccZlRCIQvNA7fUkUbR+Fyl8fFbqPBVsNb7R+N8EuPf5b/
 U04wpk8EJjl0toJ1HHcRTiMfbNeGMhAfYjlOzvxrCgLLTXz99rGRUU+LeyLO0kV6BK2s
 f29rReXHWl3SrJqNL1YgfLcRJbLU/LABB2CGOj92HgJq4EKQBHZzpYFwCfO6zTF4teVi
 UgXQ7s7xa2xU7eLGV/vS/7SB07KWQS61eehrRjVZoEoHdGE1pSQetjym5Vvtkim5huzJ
 JxXQ==
X-Gm-Message-State: AOAM532NHL0xgyvggBv3EjHA2imsFjJNPDEeXzlG67UfqZYzoqyEcCHr
 yztkR57tamqQ67trYBjVyoo=
X-Google-Smtp-Source: ABdhPJxuSUH+cCX/j54h5vSEXs1aca7IwudIaTc+P/uCLZpygcYQ2z5Wz5xyMZvEumEh7cMnuc9l2Q==
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr3327483wrs.48.1601649117431;
 Fri, 02 Oct 2020 07:31:57 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:31:56 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] arm64: dts: meson: add audio playback to p201
Date: Fri,  2 Oct 2020 14:31:36 +0000
Message-Id: <20201002143141.14870-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103158_465351_240D2D07 
X-CRM114-Status: GOOD (  13.14  )
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
 .../boot/dts/amlogic/meson-gxbb-p201.dts      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
index 150a82f3b2d7..2e2bccbcfd43 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
@@ -8,10 +8,50 @@
 /dts-v1/;
 
 #include "meson-gxbb-p20x.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p201", "amlogic,meson-gxbb";
 	model = "Amlogic Meson GXBB P201 Development Board";
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-P201";
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
 
 &ethmac {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
