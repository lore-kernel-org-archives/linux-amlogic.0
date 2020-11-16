Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B43C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B59202222E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LaoQ2za2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTG5fnT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B59202222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f29Ak/YBGdXXrOlOM+JgrPxtDxdKoZDrmmcmJ+FzxsE=; b=LaoQ2za26GIsOsgLuPHCwTl0z6
	rh1QIMaBlvpeXQCPQn4HqiUHhxcKJXJjj5ADye20n22gY128m2avRZlXGDitShOv4No9pInLjWTjw
	w+0IH6LvQuS3fYBbLQDvMlL2iBaZ5Ow5/wq+XS0S05N8EQJ3Y6sg+/LZtu6rZQPyL/Ak9C5+qZvxm
	2awryB0mUWKf4NV+XGyicni7OnSBEpVOnAJwJmaWxyeLvIQepNV0eeJ/19exlIPjxPcjpLOSAOuJ1
	vpepEgxXNmuVL4i1AkTdyYwG/8JKyTf/SRt/ChX2wsx9WHLgm81OuXKxwCEjMVrRLy0QFubk1f27a
	asrd4dpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXsz-0001Ee-3Q; Mon, 16 Nov 2020 06:21:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsW-00014e-IY; Mon, 16 Nov 2020 06:20:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id d12so17340291wrr.13;
 Sun, 15 Nov 2020 22:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hYiWLdXKkzPeHdrQPfgrV2RjQ9E5+nTOH1ppXyWYIkY=;
 b=HTG5fnT3HJe751cxn7ehGB/SWGvCNm86fAMak0bPBh6vbmDlFLMgoNFp0USjV+3uUD
 CZxpIBv2h51wgul+lSCw9fxbjrRAcy4gn7EiBZQ9ZW4H1IsIvf8w5iaPkOOpgfMsXF9I
 QsfPTnCFNG0PL97HsI9VR99h+WzAOjjFIDJbBwDCk7AJibY4Ou54ImjN5adXo6r42DCG
 xqAjL7V/O7WZAy4hVDeaFLuu4QYsZHFLXxXGAqjPENRiiOwBSCPGM+ELI8KvoTQxURNV
 ULkJb/onDyi0VkcqsP+NyJxyXp0jtkhPctSerkON2EPBhk0bRViagYzz0NCwe5WEiBaQ
 2/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hYiWLdXKkzPeHdrQPfgrV2RjQ9E5+nTOH1ppXyWYIkY=;
 b=ltnn3c3LvMqaSRbk224BvVSGjrz9dpl/EptM+9bR/DCX+xfClTwcprkYaQZEkAP+8M
 KUOVZpZFPqMyCLfKRZqU/pObAkpp7H4zmwD5cnznewrdNi+zhZoqGl6w29FaCTYvapmG
 JwMJ1SjIK8thsV3OL6NQPStk9DnZqEODUAH717859hm58fkPBCvt6i1Qo6x6dgTr++Yo
 X2kutWpbaOcPy6x/bc8Mry0EAubAzfyAeZ7N5YNwowFsJrVl6xBMk4LhfBVs7MAn2y0s
 KLa+U/dr+iubZAx7WVbkgvsXzCkAVMVGR1DkQ2HLtxUVDeirAo9y910m2lC7zzFMBSMi
 eKTA==
X-Gm-Message-State: AOAM531ALbFPA/d5oBYE7sCt0+PwRHyngP3PMVxiwSAq2Jav7peAeORl
 hvOxQZJ2lkQFCSHrhcwx2NY=
X-Google-Smtp-Source: ABdhPJxLfaHICNguiyOYcs7944lNnn8viM5jjfq3HveUvEWUl73g5UbldCOK1lDXxH11Va6cR/8dJg==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr17004655wrq.236.1605507639509; 
 Sun, 15 Nov 2020 22:20:39 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:39 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] arm64: dts: meson: add audio playback to khadas-vim
Date: Mon, 16 Nov 2020 06:20:26 +0000
Message-Id: <20201116062031.11233-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116062031.11233-1-christianshewitt@gmail.com>
References: <20201116062031.11233-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012040_703488_744049E1 
X-CRM114-Status: GOOD (  14.51  )
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
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8bcdffdf55d0..de5361f20cd6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -5,9 +5,9 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
-
 #include "meson-gxl-s905x-p212.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "khadas,vim", "amlogic,s905x", "amlogic,meson-gxl";
@@ -63,6 +63,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXL-KHADAS-VIM1";
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
