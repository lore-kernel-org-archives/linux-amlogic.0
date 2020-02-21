Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE83C35646
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D5E24681
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qoJip+m+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0T5/Ac8p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D5E24681
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwsIQwYHPg4eHmDDUXxAodvLBan0ZwDFTiDjqUfQkyM=; b=qoJip+m+LwEqPF
	RvZZcaSQxIvQbDTNIlUBDBVMn9rTJtAS5y8HYWcVEaPuHPk3c+FwIT02PP14AKy9TPz6K1C4MgOLe
	lXHvJi7nw9DzfPiyzut6Rn3p+aJnpGAWcwlNlCVc7pqunG05/93AV9XmI4UCPmb1T2CjCt+gP4YHx
	EnRIpoVPMH3pCSXD/0XY40HSUKkB4gEpNnDP8CZYnR8t8cFrpDztbxeAfAFl/pAo4ima9p5Mhfvsl
	ErzDAZ3hxkUf/nsSqoXO5rFU4W+7R3yFNtk9GIuaqBTweWGq60Tihy64yBiB3icqH4CEph0t/vB8Y
	xE1IM0iaxIFoZS9w7aAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5ALj-00069s-NU; Fri, 21 Feb 2020 15:36:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5ALh-00068L-3r
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 15:36:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id z3so2546095wru.3
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 07:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=0T5/Ac8pG7SCsz1cnqyRMc5cIe8ygGAkotY1PXusnbjm2tsypcs42va2MNYIt+jzo9
 fFCnrYMJUF63MuM3G0CSFskZDpMHle3oiotewtYHh4W5k3vtQcz2iqRcO1aHRoFISH5Y
 UnjzTndrHEMh0uxLwF/XWDyIaQaracyyLucz4qj7vFEcRTZoRB85sgec+5ZQtcK8Tiwv
 GYnbwnpsrUxGRlhbqVQnq8y6zNPsMrULb4Lhh4hI6/ASo2Lc8w7inycVZHkrH6RH9y+t
 A7L6O49B8hCYUkdcvlh9t/0nx1Qbxmw1teBjfu0X0QRJzGBg4UBAMbtltS3hW3VFysWd
 IKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=ksaFQ05/GP+RgJSEn83SBsFOlbYDMHSWtRE2DqH9Vto8X/k3Hz3gV+5ckgCSbexZ66
 zJq41uw/DyWYIaplSAVdqY/JVDW31uPmCcWl61taaOLpLZ8PDuVy+njs56hHE/++bqbQ
 8qOPP7m7UnIUOvlcAkrAkE0SihwoPPMdHqvFccRxEarsEAw2aq2lSP3gnQsooHknYwOu
 /gjGlTKOAj0EHKUoxYPVLn/UIZk1fsWzZlX0xmQKq0nDORK4uPiYF8neSTSbROL+XNr4
 3WJ4KT63KO2N3Ee7+Kh8/yLmUntuetQgACj9A9F9V+JxfL89pbycpmyw2cmNRm7z61FN
 6dGQ==
X-Gm-Message-State: APjAAAVYp1seuzip0R7rDTrm049xyy9YCcnctkntrNDDX5hWt6AM4Koc
 OhD6S+n+EP9Cep76XPIzJ5y2zw==
X-Google-Smtp-Source: APXvYqw1G4TbUaW+Wcge3OpS17t14liivURN0gi87EFAbocCrA/IOohQfIWFsXyFdpZDZilJgBztOA==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr47970495wrp.236.1582299375762; 
 Fri, 21 Feb 2020 07:36:15 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id z25sm4198782wmf.14.2020.02.21.07.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:36:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 1/3] ASoC: meson: g12a: add toacodec dt-binding
 documentation
Date: Fri, 21 Feb 2020 16:36:05 +0100
Message-Id: <20200221153607.1585499-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221153607.1585499-1-jbrunet@baylibre.com>
References: <20200221153607.1585499-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_073617_155648_85C71CC7 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DT bindings and documentation of the internal audio DAC glue found
on Amlogic g12a and sm1 SoC families

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,g12a-toacodec.yaml | 51 +++++++++++++++++++
 .../dt-bindings/sound/meson-g12a-toacodec.h   | 10 ++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
 create mode 100644 include/dt-bindings/sound/meson-g12a-toacodec.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
new file mode 100644
index 000000000000..f778d3371fde
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,g12a-toacodec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12a Internal DAC Control Glue
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,g12a-toacodec
+      - items:
+        - enum:
+          - amlogic,sm1-toacodec
+        - const:
+            amlogic,g12a-toacodec
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    toacodec: audio-controller@740 {
+        compatible = "amlogic,g12a-toacodec";
+        reg = <0x0 0x740 0x0 0x4>;
+        #sound-dai-cells = <1>;
+        resets = <&clkc_audio AUD_RESET_TOACODEC>;
+    };
diff --git a/include/dt-bindings/sound/meson-g12a-toacodec.h b/include/dt-bindings/sound/meson-g12a-toacodec.h
new file mode 100644
index 000000000000..69d7a75592a2
--- /dev/null
+++ b/include/dt-bindings/sound/meson-g12a-toacodec.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_G12A_TOACODEC_H
+#define __DT_MESON_G12A_TOACODEC_H
+
+#define TOACODEC_IN_A	0
+#define TOACODEC_IN_B	1
+#define TOACODEC_IN_C	2
+#define TOACODEC_OUT	3
+
+#endif /* __DT_MESON_G12A_TOACODEC_H */
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
