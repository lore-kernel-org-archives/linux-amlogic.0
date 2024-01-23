Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19804C47258
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jan 2024 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qYwqvdRyE0q3xOEC5yv+OGEeqXoMhcALrpH1OaL/6Wc=; b=XDf7M9ECmiT/gK
	rk1pBs0YH1yerXvkn6hJxcJp0rvPRsVSP8u6A3ZPT1jqS6HfqSLHE6ebzlxvPZcTZiS6WUApYLY2P
	VodHPgXnmpTli57CTgflA7+rmWbSi/MEmRScYJ63wTv0H6M6e0KqXXJYSPCWc0DYqM9g28q9gqtiJ
	RppG5ytmJ22XDRiZDXDYgy5i5OqalmyxuFk/P+Bp3ErSF9VXUYQ6gv/4s9JNYHZFAMFt+co6lqwSk
	DN/08zwRTZ0TbrpcbV7cYU8dhaSEX2IoA5QqMxDCm3di8IbJue9dk+F0v3vKknh+wDTvcKR5I91z7
	pPSbUVBQWAKt9Q4Rvkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSCFd-00FZnW-0q;
	Tue, 23 Jan 2024 08:35:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSCFZ-00FZk3-2y
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jan 2024 08:35:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so16640265e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jan 2024 00:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998914; x=1706603714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fdfFrklpfzHBV16Dhq98a7qVy1esOltm6odDyiqYZd0=;
        b=XvvOn33rl3LdaxqxliWU/2O+60nazQGqkxHzXqxLOjlGMa6mP2nl/gFOkAf/JIRkzc
         ALe998iXTgWVRy5eejqJbfWmXaqOItbMUYLYj35S7QNR61qpt3DEv5CSumwNnmr4TbZM
         IxR7yBccB+Fdc9Ff6ivm6Inr7ZcnwOVmSn58YMuteiiyikkjfcIO5nRlvIeUbkfVhj4c
         xjxHeYJS7r6jpnb5hJcTAoOFosER3iiLyryjUDFab4NIEzVnwfYB+DkdjoXC9R9Q2niR
         bAXVhIh3p1cOm4NONrKbeiNGst60hAQbsELWcqy+oTbOxH8EZveOIfC4fRfJ/eZrcNsu
         +Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998914; x=1706603714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdfFrklpfzHBV16Dhq98a7qVy1esOltm6odDyiqYZd0=;
        b=ZULcDr83u2ae1DgOxzgdFqLSGdcjfAofpIl308iGYFIjJ3hV+BRzF8hdAymTErWoUi
         w68HlJHj4ZjrSc3JsTJFOIQpMItJz3fj8YQDJmEcbux/LrT1vUDBOOonWIam6e0oHtRt
         fJHqnRacQ1smLfEjV4t/M45Fpb4XG3j5qqqDMygLjHknNwnHOEt1MTYkvxlAMNH0om25
         ph7/vimEhyh6GKIVGEREikIJp5EgTPZO8kVjQOG/GfsdhhQEcoCv1drlj+AwCUyqsbRn
         3g50l05FmtC1Ut+7j2xAcb7cIoFhlfCmHimTVCJ+1C3C32wnW+m7rJUxeTB+QBEW970t
         lcQw==
X-Gm-Message-State: AOJu0YyELEsHmc80Z2L6oVoJK5WxU+ML2UtmncONaY1lDhDMUfVseP+W
	zjFyPALmHq+D655IRxmWARojkYOc1IIzhFD0M/CLNi67qR+W10+dFW6pEIiI1sY=
X-Google-Smtp-Source: AGHT+IF9LMj2Y7QXHww2dLQc2dx1tE4yQOn/mCe9OD4aOrfDghJAioHG7cXnf0wusg59QKpSBEfY1w==
X-Received: by 2002:a05:600c:2247:b0:40e:4576:53f7 with SMTP id a7-20020a05600c224700b0040e457653f7mr330077wmm.49.1705998914494;
        Tue, 23 Jan 2024 00:35:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id iv11-20020a05600c548b00b0040d8ff79fd8sm41778732wmb.7.2024.01.23.00.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:35:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: amlogic: narrow regex for unit address to hex numbers
Date: Tue, 23 Jan 2024 09:35:11 +0100
Message-Id: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_003517_959198_A684B57D 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Regular expression used to match the unit address part should not allow
non-hex numbers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml   | 2 +-
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml      | 2 +-
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml    | 2 +-
 .../bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml          | 2 +-
 .../bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index c7df4cd34197..d9e0b2c48e84 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -24,7 +24,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
index 0942ea60c6cd..108719bde0d0 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -21,7 +21,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
index e3c8bde30559..dc277f2e2edf 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -21,7 +21,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index c1b03147e8ec..add83c676327 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -29,7 +29,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index 4ec85b8248fa..412bbcc276f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -29,7 +29,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
