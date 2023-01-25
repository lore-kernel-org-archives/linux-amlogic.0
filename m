Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A21FC54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 22:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsrNyhCwRMGP/wkpQ//BJ4+G23GJDKpESoZOpCLaIKo=; b=i3qdsAY0J6bt6v
	kvauhYns00UpbxbdBVOCUE9uD8FcGIyKea4Ia9tAkp4z2MXTl37NVOUrRsreqxaHtasZZxwr1Koog
	+LtQkrL2xQYKoppBMzCLgUCchdKeRK44bNZzGIqkw1aIo20YT96dQRSSWjgoQtDmAGozVf+bu+ECC
	TKw4aL9yBfGPQ1PYSdNSrviemEO5Ce6ypKrk7wAOcOBeylGcEPNLjVPUq9jOsr/KUrHKhQO6YFnOc
	Bhq2WmXCqqPvEQF0ayopTT+fZg3aVcugcdByh1w49fQseIPjADSXvrR/d+VmyEOwi1Jwhyt0lSFN2
	E3EdRcbX6LMbQXf3tfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKoGJ-0090nv-PP; Wed, 25 Jan 2023 22:28:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKoG9-0090l9-2S; Wed, 25 Jan 2023 22:28:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id x10so262389edd.10;
        Wed, 25 Jan 2023 14:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SknBnpJKa9Le9Ohn9Af3FhBYcCoixgyHtGZJrle29Mk=;
        b=BMeY2H1SnnytoFvIB2srqelouqpuy0uyMXWk7FXrOEoOjRW2PKZnNM3y5qTgPaZv/Z
         kOh4aVcU9bUwP8VC+7zepandHCecvhrh6ljiIRDqLlf+zDly2gwUapfvCarEEn6nFQ4x
         9aYQSlWWBHbByY1U1ij31MGlwJ8XNJMGyBIkZz4SGXu0WF6kCW+6AywVngtYhILFzMzx
         Up6vqe+DKosm0oqjHUPXIcQhYDWXyUPYuB3NK4R511oRem4Wosh021bZT45V4Dq/De8C
         xaNB6/QirxI8HpSqf/oM/9jeZMcPGuG1nE1hkorH5OOJl83hKTikJV5w/QnYeMyf7aJS
         e6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SknBnpJKa9Le9Ohn9Af3FhBYcCoixgyHtGZJrle29Mk=;
        b=K810T4IwiCsAv7qr07wKdHXy7fClsI4u1gg4zrZlk0C4k1I0OJF6eKGp0mZD5DGoY6
         u/cyqBDpMEiK/4giiNW/PY3Baa0gT/HjRjJpPh7BsSNQRjLj118R6AuwWNcQA5duGsHL
         5onnWO1wqK/xWqx+cW6yH678UVTQx0du5OPEVHU9g8ZruvW597W7KPJbGeSkxCj2WMLX
         w8VlxJlMAzvahwKPdwcPQI5CZEda6ISy+WQKbojfN6jkLbZhL20HTiP+KtWtNPtpmlJ9
         Kd5ANuerohC/YO9fF0ZLdmGEbCg9SpJiOHNAVEgwAOENLj4f3EgS5BPv0ERetZosTUxx
         DvLg==
X-Gm-Message-State: AFqh2kpEKQPG13n/p4WOD5wN9rXHqLJMhTt6ekXLjVhbxjWqbvy4hk4l
	dy/EXWMTfYEmdQWAvtqH/IA=
X-Google-Smtp-Source: AMrXdXtVNwIZ/OnkeKeiaUswnp8VEO04Z8vkoe1lxyyoTajb75PHr6b6G1JW46m7LrDgU36GFXWXfg==
X-Received: by 2002:a05:6402:1f13:b0:49b:cf25:152d with SMTP id b19-20020a0564021f1300b0049bcf25152dmr32007759edb.24.1674685726784;
        Wed, 25 Jan 2023 14:28:46 -0800 (PST)
Received: from ?IPV6:2a01:c22:720f:5a00:b1aa:59d6:6587:3051? (dynamic-2a01-0c22-720f-5a00-b1aa-59d6-6587-3051.c22.pool.telefonica.de. [2a01:c22:720f:5a00:b1aa:59d6:6587:3051])
        by smtp.googlemail.com with ESMTPSA id u10-20020aa7db8a000000b00487b73912c2sm2891416edt.12.2023.01.25.14.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 14:28:46 -0800 (PST)
Message-ID: <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
Date: Wed, 25 Jan 2023 23:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] dt-bindings: rtc: Convert Amlogic Meson vrtc controller
 binding
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-rtc@vger.kernel.org
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Language: en-US
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_142849_160625_7FD972C5 
X-CRM114-Status: GOOD (  16.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert Amlogic Meson vrtc controller binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve title and commit message
- remove bus part from example
---
 .../bindings/rtc/amlogic,meson-vrtc.yaml      | 44 +++++++++++++++++++
 .../bindings/rtc/rtc-meson-vrtc.txt           | 22 ----------
 2 files changed, 44 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
new file mode 100644
index 000000000..a89865fa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,meson-vrtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Virtual RTC (VRTC)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  This is a Linux interface to an RTC managed by firmware, hence it's
+  virtual from a Linux perspective.  The interface is 1 register where
+  an alarm time (in seconds) is to be written.
+  The alarm register is a simple scratch register shared between the
+  application processors (AP) and the secure co-processor (SCP.)  When
+  the AP suspends, the SCP will use the value of this register to
+  program an always-on timer before going sleep. When the timer expires,
+  the SCP will wake up and will then wake the AP.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-vrtc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@a8 {
+      compatible = "amlogic,meson-vrtc";
+      reg = <0x000a8 0x4>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
deleted file mode 100644
index c014f54a9..000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Virtual RTC (VRTC)
-
-This is a Linux interface to an RTC managed by firmware, hence it's
-virtual from a Linux perspective.  The interface is 1 register where
-an alarm time (in seconds) is to be written.
-
-Required properties:
-- compatible: should be "amlogic,meson-vrtc"
-- reg: physical address for the alarm register
-
-The alarm register is a simple scratch register shared between the
-application processors (AP) and the secure co-processor (SCP.)  When
-the AP suspends, the SCP will use the value of this register to
-program an always-on timer before going sleep. When the timer expires,
-the SCP will wake up and will then wake the AP.
-
-Example:
-
-	vrtc: rtc@0a8 {
-		compatible = "amlogic,meson-vrtc";
-		reg = <0x0 0x000a8 0x0 0x4>;
-	};
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
