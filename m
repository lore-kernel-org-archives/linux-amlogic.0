Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62797C34047
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 16:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3589220675
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 16:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tkG2hwSk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Uc0tsC47"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3589220675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjbrqzn8tok/yynDh6JhOhH7dCr8N477ghg5CPLxiKQ=; b=tkG2hwSkqRHB9R
	+X8MsCnfXAMn8tSfnuG6GnF+gQkpAnAAZ3huej6TQPXEUb6b6r85PGU6pbJcpXLfNCN3xQnerRCql
	SK7GA7efIzrh+v2RVzH9WIWztHsk1CvPrCgJDrtVNmjik8zK4+XG+/2OOZA2oaJYSS3xrWmKSSrhv
	HDMpVOuvFPift7knLVs/zQ9OueB3ce/yHsZEvZA4cIqqptpnyZVFkDnJ+wehlociU0MVrZ5N9cLDX
	yj3VgAvViw+D0F9AcVyGnjmi8vyjZPiCwGKQ0A1foFdvnNymAEUlXOsYzZfbmMntSQeAW/P+EebZW
	NaCFE7qo8zCRuDN7qq0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4S1i-00069k-6Q; Wed, 19 Feb 2020 16:16:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4S1a-00065a-UL
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 16:16:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id q9so1280782wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 08:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
 b=Uc0tsC47BaJeKfd4KzNsQc2dQXTzEw8wn8WAQTvg9GaYhQ+XL4GRBQy6qoOqYrWTsI
 Xhq1W4SawLW4FeBhdv3QBtpMRf+VHCyuFqybW0T00Y8dj4c/BNQQqnku4zpu1b37qODQ
 fEJD/cJ4M9Ad17f4GnDIJO1GCnfV91kyVB6iFsPQlFfFTUWMEMgSTobfXqu1u7o0LaN6
 KYuUUk7B3O8SLIiuJ13yplhm74KbwSNDcWDEMG+TeQDQAc34laenw0KmksTAatngio3N
 7ZyacehueKO5IMc8NfA4nMBZwX6Vj2Btv0XZV6XSvw3KPKn/hGabu+4pNpO7CLWPg7Fn
 v41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
 b=cLFQhxZZ4V1sakHWgE3gVn5JLZTse6Qm3WGDPrZ3UrRiJsWkjr4hhqloK4lwr99ELp
 dyUZ0Nh7VnkNP3lMKGXfqwSbplVYsLR3zdZwBNl0BdNYo5Ha3tSJ63RzNye5o2zhk6bN
 /Xdsw6zRwt8f+graU2qLo/m5ZLpY/fuePvrHdi5Myh3wtDQ6Bw9HakNhHaGs7AwK3Yuf
 wBa+DAdx4Rxzl3g/siFABcZVZlVgUhx7VspiXJpoMxztswd/23ZZyEZ04xzVSGf34dqA
 OUddWFJmKGnyxChg3Szwdgjy8eahSx22Rw8lDdP5HoCc7KgNKBa50GYrrdIn3SjBxSFg
 fCZQ==
X-Gm-Message-State: APjAAAXqDaL1W6lSIB+5u7ltd9iF4JzwdMu3pGqXBpklhecJ2I8dFIgh
 BdGV79YAXjIhbSJi0HnrkmeLU6+R8/E=
X-Google-Smtp-Source: APXvYqyxsijU5d9Vs4rJZhP2IlvQTVINyfHLXZAjIwR5PKz7AyNYQdmxrleEMtbffmdy05IniAkW0Q==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr10662910wmj.96.1582128993481; 
 Wed, 19 Feb 2020 08:16:33 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id a22sm437140wmd.20.2020.02.19.08.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:16:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 1/2] ASoC: meson: add t9015 internal codec binding
 documentation
Date: Wed, 19 Feb 2020 17:16:24 +0100
Message-Id: <20200219161625.1078051-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219161625.1078051-1-jbrunet@baylibre.com>
References: <20200219161625.1078051-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_081638_083224_C4B7E656 
X-CRM114-Status: GOOD (  10.45  )
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

Add the DT binding documention of the internal DAC found in the Amlogic
gxl, g12a and sm1 SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,t9015.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
new file mode 100644
index 000000000000..b7c38c2b5b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,t9015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T9015 Internal Audio DAC
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - const: amlogic,t9015
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  clock-names:
+    items:
+      - const: pclk
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
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/g12a-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
+
+    acodec: audio-controller@32000 {
+        compatible = "amlogic,t9015";
+        reg = <0x0 0x32000 0x0 0x14>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc CLKID_AUDIO_CODEC>;
+        clock-names = "pclk";
+        resets = <&reset RESET_AUDIO_CODEC>;
+    };
+
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
