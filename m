Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D83FC3404D
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 13:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D575120801
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 13:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ntdvOmBh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pgi+TBIf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D575120801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjbrqzn8tok/yynDh6JhOhH7dCr8N477ghg5CPLxiKQ=; b=ntdvOmBhcubuuZ
	UPaFkUeWCcJVln6Xxd1wTwmQgAxftMuaCGo5sspZA/qWTYwnqlh7bHeKf7m/C9smThz1VBa62G2Fg
	a/KadriPTP6El93vRCMQNRryeR385QH+nkZa/yVaufIxLC7nHqERPTZxBKKUEDROJe0vnL3T1O/gG
	Ws3MKu1xpaSB5R/6ZVj1RBJEqRpXLOgP5TJA5NXN8JYNmtlmqjAM5PBlwAfHLaQfZ8HDlsAX4a9G7
	Yl6AR2VVjle3fLJ7VkyMSiLfs40QbbOg4q1HNa9cBKYSNHTnC2ZOkD6b8/qj3/2sAqguvTTHgZafw
	zxXDjbiBMUiLw0r5fB0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4PXC-0007e0-AH; Wed, 19 Feb 2020 13:37:02 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4PX9-0007bG-4M
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 13:37:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id r11so536291wrq.10
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 05:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
 b=pgi+TBIfgcN3kTkndoro2wO8PcZFOTmypoXoT9oPvzBxZMrgOYmFREyP3GAWSdSFA9
 W/vH5mTeEJe6txM2vOAQ6qcI5zMlhWbBDJBd2DseAl76AwuZqBKKQCYRDewdfbQw+GNe
 jmsusBY99uLMfYUT0ZBXI87iPS9HRDmepSofoFVnzq+oTg3I9o+n3eHIv7Bf0DJi1GS6
 vPhREp4T+t+eKJkx9tcRWI3GlCMwIaMz0UT0dco4O68gnMIfvLVfpoSoW8iZIvblHvJp
 Wi6RwXWNKVFscVbHLjzE9FpD2OBeVcieFINJ3GJD1KQlakxunb2k4k1KzbE2esIPCnde
 LE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
 b=Pmb+X1YQ5wG26w3j0evBpgySSKdjCpM9ok8gTbBxf96fzbCI67mKNwabQ/xLk/CrpB
 Nfvj9pSgqm8uXrznE4uDetwy0BhXpfd9lyf44RfDQQkfxVqxN8lUQGEGUPuhmi5bpEtk
 5+SPekj+3yhvGDvSkstl6gI6+5iiWIiE8b00IN30NxwUSum8Pj0IpcfXvkNtYQN/Y4xg
 Pldgteb2Y1pw9vOsgU65OK7gRTWrGwqk/m6EKoE+NusnDLcIjjmatv6VxSoxEemePMiK
 46Zs7yzmi3XO6fr9/ysPv9vjCQQhDQskwuz3xJhtiaxJXfTbQmED3AilU/FkpNCYd6Dk
 VQ9A==
X-Gm-Message-State: APjAAAX38WsMyZc9Aui0bO9X3vulHjtE63GG0qPH//YJQWnrtGnXXxMa
 FUw1VyxAMcLhKF9uwN5t9abqSQ==
X-Google-Smtp-Source: APXvYqwCdG6arwwkXKRGXknOCJ7az3kOoi5ADFVldBeUfvCD9Xrxom8biCGNQ4YGwzDvnmboPbXyrw==
X-Received: by 2002:adf:dd0b:: with SMTP id a11mr37802096wrm.150.1582119416706; 
 Wed, 19 Feb 2020 05:36:56 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id q124sm8856480wme.2.2020.02.19.05.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 05:36:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: meson: add t9015 internal codec binding
 documentation
Date: Wed, 19 Feb 2020 14:36:45 +0100
Message-Id: <20200219133646.1035506-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219133646.1035506-1-jbrunet@baylibre.com>
References: <20200219133646.1035506-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_053659_168264_51BC7500 
X-CRM114-Status: GOOD (  10.24  )
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
