Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E536C2D0E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D752076A
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZ/NNRVm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D752076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXXaCH4XsO01cUldLbMvsjjbo+7ZdQgSG3P2pNN5ZUs=; b=ZZ/NNRVmcwVrpk
	VzxYhInfZeYzNfrlo31xYzMCbsY5aEZKbAfDdib0N90tX36AFKzp9LWL/T4mysXdHniCIclOVXeCo
	rsU83VB9+OLFgDGUSsxQycHU/mpeW/fInkvB9YzmOwGP3saMF5y/kHgr1TZ0i8b8lMGmDYPu6JOmu
	mbaOhwy3VLmCJZYpg3huDnYZQGwDm5zpCB0Epxh4gj6jVVl9dtwd3u2V8gkdmtA127zGgJaVeIt7I
	Uo9HLxJOQDb5cV5VkQEPk2ugc3jUfyiPyy7qqOx++gaNFzrfFgfBpxKJPlX+OA1IZIc1g6Qql4ED7
	xlRQa5AJ79QC31rL7HIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHEAN-00024p-Dl; Wed, 25 Mar 2020 22:06:27 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHE9o-0001Tl-AY; Wed, 25 Mar 2020 22:05:53 +0000
Received: by mail-il1-f194.google.com with SMTP id m7so3490390ilg.5;
 Wed, 25 Mar 2020 15:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Ulr9pBC4SUbqUU5FsVEbaY1gpVe/0DQ9QLWI1PPgfQ=;
 b=nv3+JTyJaZG120Ed7CWE6lwPNiAskNuyhOd9mL6Zir6GO3a0X1JsipiwnsgJ2inXor
 OIE/wg/Lvoqp/EPbiFsQX4wJUlQH7e4qVafzvL/WIWJdW3pAPahIOV6g8bqq7FEPYfze
 BGtCmT9y/gH+ym56YcwV8RBhh4R8kBBjv2CW90fzcQag1pGFk/6HsrQ6lkRMsWbPwNTk
 yULjlWUAO+FZJY4vQdwb3kIdgOcQC48OdIZEiVmIqdinPuewhNIaxhaP3CvrfIHbT8hS
 EtAoewR7mojaVbrHbLz0QOpr9geyl4mj8wVqvgcB8+1E/gfWepDfaf4DME/4ti1Iv2E/
 TzdQ==
X-Gm-Message-State: ANhLgQ0/oYBdarnMe9YsCUSk5WKhjko6LLY/zxsIwj6aQ1WmRLEq73RY
 KCTlXOWEagIn9sfAZUZ31A==
X-Google-Smtp-Source: ADFU+vue8Vxmky7PF9etOIHQcfy9dQqZ6AbqyS9J6TatHClhkfnl2UGT86/bcc6UGlxsmE61Cop/rw==
X-Received: by 2002:a92:6e11:: with SMTP id j17mr5689060ilc.249.1585173946547; 
 Wed, 25 Mar 2020 15:05:46 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.250])
 by smtp.googlemail.com with ESMTPSA id v8sm102390ioh.40.2020.03.25.15.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 15:05:45 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi,
 adxl345/6 from trivial-devices.yaml
Date: Wed, 25 Mar 2020 16:05:38 -0600
Message-Id: <20200325220542.19189-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220542.19189-1-robh@kernel.org>
References: <20200325220542.19189-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_150552_382725_EFC0E50B 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The 'adi,adxl345' definition is a duplicate as there's a full binding in:
Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml

The trivial-devices binding doesn't capture that 'adi,adxl346' has a
fallback compatible 'adi,adxl345', so let's add it to adi,adxl345.yaml.

Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iio/accel/adi,adxl345.yaml     | 10 +++++++---
 Documentation/devicetree/bindings/trivial-devices.yaml |  4 ----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
index c602b6fe1c0c..d124eba1ce54 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
@@ -17,9 +17,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - adi,adxl345
-      - adi,adxl375
+    oneOf:
+      - items:
+          - const: adi,adxl346
+          - const: adi,adxl345
+      - enum:
+          - adi,adxl345
+          - adi,adxl375
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 978de7d37c66..51d1f6e43c02 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -42,10 +42,6 @@ properties:
           - adi,adt7476
             # +/-1C TDM Extended Temp Range I.C
           - adi,adt7490
-            # Three-Axis Digital Accelerometer
-          - adi,adxl345
-            # Three-Axis Digital Accelerometer (backward-compatibility value "adi,adxl345" must be listed too)
-          - adi,adxl346
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
             # i2c serial eeprom  (24cxx)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
