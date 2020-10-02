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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2969FC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877FA206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cgdObibH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA7YHt1V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877FA206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=066PBO4up08RESHKbJddZF7DnqHfW2H2es6x7reyC3Q=; b=cgdObibH5bhg3yRsEt3Aa8+NFt
	ZgXG2S1XGe2YxSnPSBeUwDTY9jy0F00SnjVH8XZ9elcbJSml3iACmU8XKbd5nFeFZ1Ia6/qtAUDyT
	69OqaCbdJrxxtHmdgnpzCkkBbC2cqxWK4fqIy0RXXQR4kvBHlL0Y98aJQcT00nPt8+dFkiOgkTNW/
	JNnP+WOW1UqOgol5CoUrzsq6GKFjBzqFeO9zd7ouFvoDmBOkEBjOOzdzCBNlSqD4g1MTSa6nDRNe6
	KycDZdJKfoHzT1f3hPt/n1P9jpArLgeqcl0vaN5IK/YgK4ddUSqF6CeMmiAaCFrYNjHhxhdH2ah3z
	/zSQQjug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM75-0001qE-HY; Fri, 02 Oct 2020 14:32:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6M-0001PL-Ur; Fri, 02 Oct 2020 14:32:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id c18so2057864wrm.9;
 Fri, 02 Oct 2020 07:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DR+MN9yI45B0CbPas30C2sDxsoxmrDbz6ZTE82Yi1YU=;
 b=hA7YHt1VQf+I7mQTtL0IMemPkyrBpn14q39F9bkrXqgKjm6GF39cFze3zg/0sFyNRn
 SI1nL8BwioMNZhxPA9RBuIqWwLOXwpO8qjhw0fb7QkRu1b5TwOdyArOnZS51FvHKreOd
 qM7ylsMUE6Y8NJGjpPoMv5vS9BVdvLrm6FazfxWlJDZRJwTCRDQzAdfX11hFfb8KZVBe
 zs9G+uT4vqlBU2gRXljx63OZrYq0DIpqfhEcLYipci73WKwzovV9soeHOoujpjnqBR2C
 4ghq/CTJJCvN/pTD4YQHJzGYhjssztqvtu00CexQQcdWWzxIgdUJW4I1IXR91H0ekfAL
 Vb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DR+MN9yI45B0CbPas30C2sDxsoxmrDbz6ZTE82Yi1YU=;
 b=Pcj/BNkfaEDWNt8kT98XmbQ6XTVOQuQbLJNReMgqskPOphra+Iko5pZ+hoCisYLfzi
 dZzRbqrXorgmxo8wO288gDyIzBhToBP+N79a7DvqIkH9EBSP9xo6srrnbyWfxrDPCFmW
 KLtS8IVW11C11774H3GIdUdxe8pBwh6i0azcXvnUNx5PGWcZwcsF1iBvJcUoqM2AO84L
 cG9p/eVOLqYNGQOCy/UprDYcC4fI1ihK8aUDQOZ/t3qy7QMTIZ4CBMzMpC9w6ZkkEyep
 hi0IuFGWMEGM2T1pU8fo3Wqw4+hWnL6cm9wy2F4+/AJU6TxoMOqm8Nao7Zq3aFSkO6PY
 bQvg==
X-Gm-Message-State: AOAM530u3UZTRedpgH/P6Uny/OnZkv/Vwa59QmXwZJiK4k+ocbMTEo4d
 Dej7dmV5qJADABkoizTKB9nu92GrQIQ=
X-Google-Smtp-Source: ABdhPJzDRzc53W8EhYqCtpUVtGfSgBpzhIfazEvaTgRcMzr6Q/f+pHsYad3LwQes9oZBszHy/BCs3A==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr3398904wrq.365.1601649121861; 
 Fri, 02 Oct 2020 07:32:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:32:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] arm64: dts: meson: add audio playback to p212-s905x
 dtsi
Date: Fri,  2 Oct 2020 14:31:38 +0000
Message-Id: <20201002143141.14870-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103203_089391_5719AED3 
X-CRM114-Status: GOOD (  14.12  )
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
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 05cb2f5e5c36..40776d42bf8e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -11,6 +11,7 @@
 /* Common DTSI for devices which are based on the P212 reference board. */
 
 #include "meson-gxl-s905x.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	aliases {
@@ -85,6 +86,45 @@
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXL-S905X-P212";
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
