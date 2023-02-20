Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E34DC61DA3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Feb 2023 21:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zGhSsNt3zBvKHcX8XMLDHrLhXlblmK0qbK77HZ8Nyvg=; b=DbSRPqkXUFH9Qa
	l2X3kI2R4fTMtxUp8CsatDT5bxVjlqpHr6lBzBA/TY7n6k3FUkrOAaFh5jkUs1c57VzzRgYiuEMvl
	W59QwT4t9UV7UtyJJ6Keg82RcdiEdUQv+TQCX/Ibylp48YS8eckofUkh077twztdiaztk/BghttrW
	tuJ7apnzHWxp0srxrLi0+UDipxFB4Us08Lu2JN2b/vmypLw31ILnXla+2gaxRX69Uu2KQEk4zUEZh
	0jYYLteIWVLhw6DAa2uuf/huj+z4jTClc8bzkgsSuM0FCiMs98ZVygEj4C9eJbvUlahxO6cx3SUNC
	EwExuZULp6Ts62sdbXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUDZa-005ckk-19; Mon, 20 Feb 2023 21:19:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUDZW-005cji-KR; Mon, 20 Feb 2023 21:19:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id x10so8675358edd.13;
        Mon, 20 Feb 2023 13:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Krn4mdiwPO7RgJcS0ry9rwU7Q7xFzYK+OYfjpV3ivsI=;
        b=fxUq1YMIrrx79mcA8LAWzyZf/PRVs1AZFAPvTq8diDbB+JJvfNwctNvc4LSXxO9qGO
         Xz+BDPCKnE0J66iw84XW5+dGolqYlEp0FG9Gtn4QDL7CmxVh/YzZOgTeZd8JyDZjz4gs
         PGorg0ETawWwwUKAeHQGyC8Ey4O9Btlf/TV7MS9fS8dwJi3Xdex9OmZA8IcwI0a8Srv6
         sGaE/lwDEYFv/O8uiE9O4VVaupRhIai1YoBeRXDx8ssC/wBR0pxt2JZMWehXi2jWSwBB
         k+GT72harPeEdc2tEhFKNkO9wERV1gZ4x+oRHlYM3kHRYuugft9fWU5LBaPcJPHBu84i
         Asow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Krn4mdiwPO7RgJcS0ry9rwU7Q7xFzYK+OYfjpV3ivsI=;
        b=x5R2M2Gr/rU6n493H1s2/U7G+s/BCGoUw7l8UX7wLcG2VSfnITku4tV402Ns4O+4yJ
         PEcZJhSWlv1iVnSPS3G7DQNxqiw+Ney3D8FAUvp5ISZcbUZFBffEAP63CalfxR67/5ZZ
         i66qAVcxpBJHjxE+qPgKGIXZpi7iJFjMehNFHcpSA7LkMez8jpPtoARlXRWzcMcwXn+j
         HeMAeeTqtFbOjRiG/8BHX55cUuaZG9pC9q+59oPqTPRne1mVvBhtFY9c/ODBEmLYBtAY
         u8ZD+600PX0lWDka9/h6q7kUWhWlgpkImNueZYJRwT/4uDQf+jo6G7brAB/Shn7NvIKe
         K78A==
X-Gm-Message-State: AO0yUKXWj7Rj1yvx2NjCB0BBe0UdQmtUqGGbfrONFT3wrMNN8cQ4GAV1
	iCaPHOUtv6073EWTbmc3AwI=
X-Google-Smtp-Source: AK7set9EeTUNTI2HkoW56+iZZgNRkR4NOCQmig3msSVl0Y2slouobFgE3Rmh9ob6P98UkyScldVLsw==
X-Received: by 2002:a17:907:3201:b0:888:a32d:b50 with SMTP id xg1-20020a170907320100b00888a32d0b50mr15228948ejb.40.1676927978618;
        Mon, 20 Feb 2023 13:19:38 -0800 (PST)
Received: from ?IPV6:2a01:c22:77a6:b600:80c9:a4ca:b3fa:5ed4? (dynamic-2a01-0c22-77a6-b600-80c9-a4ca-b3fa-5ed4.c22.pool.telefonica.de. [2a01:c22:77a6:b600:80c9:a4ca:b3fa:5ed4])
        by smtp.googlemail.com with ESMTPSA id z11-20020a1709060acb00b008ba9e67ea4asm3997643ejf.133.2023.02.20.13.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 13:19:38 -0800 (PST)
Message-ID: <3edc5ba6-bf3d-e45b-377a-9e7ece7642a7@gmail.com>
Date: Mon, 20 Feb 2023 22:19:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-pwm@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESEND v4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_131942_720235_FF0B9E9E 
X-CRM114-Status: GOOD (  11.96  )
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

Convert Amlogic Meson PWM binding to yaml.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
Seems patch got lost over the question who takes it.
Please apply through the pwm tree.

v2:
- fix clocks and clock-names
- consider that more than one compatible may be set
v3:
- remove minItem/maxItem properties for compatible
v4:
- remove not needed "items" before "enum"
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 70 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-meson.txt     | 29 --------
 2 files changed, 70 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
new file mode 100644
index 000000000..527864a4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic PWM
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson8b-pwm
+          - amlogic,meson-gxbb-pwm
+          - amlogic,meson-gxbb-ao-pwm
+          - amlogic,meson-axg-ee-pwm
+          - amlogic,meson-axg-ao-pwm
+          - amlogic,meson-g12a-ee-pwm
+          - amlogic,meson-g12a-ao-pwm-ab
+          - amlogic,meson-g12a-ao-pwm-cd
+          - amlogic,meson-s4-pwm
+      - items:
+          - const: amlogic,meson-gx-pwm
+          - const: amlogic,meson-gxbb-pwm
+      - items:
+          - const: amlogic,meson-gx-ao-pwm
+          - const: amlogic,meson-gxbb-ao-pwm
+      - items:
+          - const: amlogic,meson8-pwm
+          - const: amlogic,meson8b-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [clkin0, clkin1]
+      - items:
+          - const: clkin0
+          - const: clkin1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@8550 {
+      compatible = "amlogic,meson-gxbb-pwm";
+      reg = <0x08550 0x10>;
+      clocks = <&xtal>, <&xtal>;
+      clock-names = "clkin0", "clkin1";
+      #pwm-cells = <3>;
+    };
diff --git a/Documentation/devicetree/bindings/pwm/pwm-meson.txt b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
deleted file mode 100644
index bd02b0a14..000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-meson.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Amlogic Meson PWM Controller
-============================
-
-Required properties:
-- compatible: Shall contain "amlogic,meson8b-pwm"
-                         or "amlogic,meson-gxbb-pwm"
-                         or "amlogic,meson-gxbb-ao-pwm"
-                         or "amlogic,meson-axg-ee-pwm"
-                         or "amlogic,meson-axg-ao-pwm"
-                         or "amlogic,meson-g12a-ee-pwm"
-                         or "amlogic,meson-g12a-ao-pwm-ab"
-                         or "amlogic,meson-g12a-ao-pwm-cd"
-- #pwm-cells: Should be 3. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Optional properties:
-- clocks: Could contain one or two parents clocks phandle for each of the two
-  PWM channels.
-- clock-names: Could contain at least the "clkin0" and/or "clkin1" names.
-
-Example:
-
-	pwm_ab: pwm@8550 {
-		compatible = "amlogic,meson-gxbb-pwm";
-		reg = <0x0 0x08550 0x0 0x10>;
-		#pwm-cells = <3>;
-		clocks = <&xtal>, <&xtal>;
-		clock-names = "clkin0", "clkin1";
-	}
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
