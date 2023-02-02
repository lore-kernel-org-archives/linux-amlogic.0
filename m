Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADAFC636D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAEG+kDAyBbRKWKHULrQeHxyG5f+ISMC4IeCIq7ypRM=; b=M7wf17hQujOz1I
	f3Syl066+3O8j9nTDEZs0Hx4qIlG7wHabSkxeQAIzO0kHRPlba3hccW2CUnimyNvn/97NNrl24Omw
	wjMeEm0Tc3J/IpdvNVlbbA6lk0ZCEDh7s9hlT6CmeBH74edzJsmZwXs6HrTt19w+YYXWM16NuL3gZ
	d+fVxOKfb52Q0ZbKKgmko+sN2EoZspAjsIpwv5T2WnJws9hTnqz+fmjPhoeV242DemIT4suWE8rok
	w5Ft+/+5TRXBQKhlUwpZmhX951duQWH5/rRG+Y69LDLUA4qzJoldUSPU8vXaGOf6roYokH+ikfzgH
	bmhPCUCpJhoW+9oh3/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSj-00Gy2G-4J; Thu, 02 Feb 2023 18:37:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSg-00Gy1O-PE
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t18so2577965wro.1
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it81YP95JIRPJswh/FgK8dhTohEGTS21tUAjm96BPMQ=;
        b=T35BJJthNSXWGuipJ/S57/Vin4LoRONI1yOJ2iw8a6ampM/SH/alQlaM3pwJXbfIto
         rhB/lH9b1SfkOR19HeWTkVB7VSSsTJgHyiavcYsEoM/cXzmWt6zg2rxDTIV6fKG7uY6C
         R59zbQQItYpdbiiKXP3AQ7Vsyoc4Swh2MVx05ksPml3KYRaXwgZdpVxGAzQzbmS6ZsUk
         hFKqBE/i/V1NnVVjwq0cZN7FQRbfbNj0VLT9zzJo0vI2vf1zI2ghqgOOttCZZN4+N/qR
         OJNFfbUx3uQyls1lZ4AVo++FolCmlr1lg3WtFc0TRW0TSRpiuvX8jLi/jVecCpg+wtgK
         voEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=it81YP95JIRPJswh/FgK8dhTohEGTS21tUAjm96BPMQ=;
        b=bdGrvii1eomOrmmpRsvukPRl7efhTPr8/GgnphFBJEXxYTIP/QiqYzNkESpLBzBuHh
         BgG7PEDmebWA9icEJ/LxBFR0hRYOvwighpZefr+mJk8aVJKhsSCiZl3zErRRoqN1sjma
         6fJVGDhVraPxY1dwpCt09NxSx2yGcmU3B3+KgMU/e84J9hjGWIeUw4iiAwqBEvZ2OniI
         NeLAvXeJK3FNnGC/1Rk6uHuQelChfeTjv6u2zYv//kGF6TZ9ie45cq2MgikKVVHDSqf4
         iCBnhRRFBLjEos3nVjM02LmqvaeFlalBx7suOYvfLj+2oLGdZ7hpqxDt2n978ygqOEZt
         2vPg==
X-Gm-Message-State: AO0yUKVDPM5DBpVcRV49qpDR78MLg77VUf5m/8C6UNLDmFFSknS0c4in
	S83QU06MmnlUtyD2olG6tN27uQ==
X-Google-Smtp-Source: AK7set9UbIruMnv6kKNSa19q5j5yp9TO2ovfLKQ/UNar58Gc9j9V2Mg4N6Ph1JnAFCA//MyCXwBx+Q==
X-Received: by 2002:a05:6000:1285:b0:2bf:b036:ffe3 with SMTP id f5-20020a056000128500b002bfb036ffe3mr6707490wrx.45.1675363047162;
        Thu, 02 Feb 2023 10:37:27 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] ASoC: dt-bindings: create component common schema
Date: Thu,  2 Feb 2023 19:36:45 +0100
Message-Id: <20230202183653.486216-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103730_838028_F8F4D94C 
X-CRM114-Status: GOOD (  15.56  )
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

All DAIs are component but not all components are DAI.
Move the component properties (sound-name-prefix ATM) to a separate schema
file so it can be used by non-DAI components, such as auxiliary devices.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/component-common.yaml      | 21 +++++++++++++++++++
 .../devicetree/bindings/sound/dai-common.yaml | 11 +++-------
 2 files changed, 24 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/component-common.yaml

diff --git a/Documentation/devicetree/bindings/sound/component-common.yaml b/Documentation/devicetree/bindings/sound/component-common.yaml
new file mode 100644
index 000000000000..37766c5f3974
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/component-common.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/component-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Component Common Properties
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Card implementing the routing property define the connection between
+      audio components as list of string pair. Component using the same
+      sink/source names may use this property to prepend the name of their
+      sinks/sources with the provided string.
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/dai-common.yaml b/Documentation/devicetree/bindings/sound/dai-common.yaml
index d858eea73ed7..1aed2f0f1775 100644
--- a/Documentation/devicetree/bindings/sound/dai-common.yaml
+++ b/Documentation/devicetree/bindings/sound/dai-common.yaml
@@ -9,15 +9,10 @@ title: Digital Audio Interface Common Properties
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
-properties:
-  sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: |
-      Card implementing the routing property define the connection between
-      audio components as list of string pair. Component using the same
-      sink/source names may use this property to prepend the name of their
-      sinks/sources with the provided string.
+allOf:
+  - $ref: component-common.yaml#
 
+properties:
   '#sound-dai-cells': true
 
 additionalProperties: true
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
