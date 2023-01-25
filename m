Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218C2C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvkkae4OMoxEAKNap6+L96dhZAkVmI0i/AbFGEgDy1c=; b=dji20j+K0qU43y
	97TfURAn3ZswOlIuRVHwWZCtkmXwlAqpfKKL9VJutGeK4DyV8WGwivg5+yhZfZvQyyel+cXqjqlFW
	YgjqVaTkDdqOK/Keda+R3Mw0UCAempkScYLpxEIqY0tQO3an2Gp1e4pZg0z8V/Yao8r7aRMC7rpnr
	Hlkum50DE32lM3fc3wQv0hSr93weJm6DXT0P3yTG6PQxgfOFB92mHmTMq6GO23Oml+u+8ALQs3Bk6
	HdR8HbGZGq2UmAuk2UFHBKk+iOAtBMaiqcHt5XXh1CAJOCIRlrksmiNdL0bBIo1/ThoBFZVqpBF7l
	v5QjDczpELGGtlQ1pFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaBQ-006EWY-9s; Wed, 25 Jan 2023 07:27:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaBC-006EOp-HD
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 07:26:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso1120727pjj.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 23:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq3YLnLVdkwJ+hnndTnVXYO2IvsFe7R/GdMhEuzT5j4=;
        b=eXrMPHaKJJACcgNbFqY2MDAunrGJohcSX0+b/zZxdECntrVwymZjD+yOT6pSbC9HqI
         7qSpSKQWfJUvWCfG5mkvrnOPcsf7NsPVW0BFPd2UVWjfJk7g2fTbzt8El0BmAfHDmgMH
         AXv7eJuaagz8LUGm/uHJMqIEKdLhkERxNkq3+YMtBLA4t4zg8MIYlEL8pxxC3i5tayCH
         OYdhUL3ybK/mnER140UZB9853TdZ8J8aIXHe1GFqP0cZfK48qXnGzM9On6PVMuvnXMH4
         +gavM0ogR2a/Rtzj/G4pgVsSYWWSgXqFw5Vfod4SsO0i5WQ/hIhFjnmFOh02f0Cm/JXG
         mIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq3YLnLVdkwJ+hnndTnVXYO2IvsFe7R/GdMhEuzT5j4=;
        b=Y4Evf75/cyblCkfo4ZH5Dkq1Or/XH2dzj2SwEa+ZcEtRqW/sRRdvBx5kZm4u8JYw7c
         UWX17cnkMRhxjYW883/3EOKxKgSm5H8s8I7Wlcsd8mL967atqI3SJzMaREhlEubAMahB
         2FZmBbNotFcaRdEPI00i8fRae5bs1Fu9eckDlanYj5dqEgJPGCd09bOflhQ7X/p9QH+s
         PzwYEmSVZAzZOtNMtRKDAF85JzeIx+F4RwWRHb4Eo5cWcVf2E2WRRCadzLt4eWafjaon
         l5LIYXtdDTSPnGEUkmk+yXxJbALbK+H/CX//X9z5nAEyLL8xNxN6JNDK+os2RJvEN/BX
         Ji8g==
X-Gm-Message-State: AFqh2koGO6VSe1+rUta4ncWp2HUk5p7CMv5JV3grydHiXJknyy5goelS
	DcP/bKfGuFzg1+mdDmL+AO4=
X-Google-Smtp-Source: AMrXdXstAyLpMzWAC60MRIw9AG6QXdX7KPpnlpPM+JvyeDaY19pGDE6gRaLGJiCKZwcMgWfTDsZ/Ig==
X-Received: by 2002:a17:903:2289:b0:194:9290:fa6f with SMTP id b9-20020a170903228900b001949290fa6fmr43429571plh.25.1674631603605;
        Tue, 24 Jan 2023 23:26:43 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001769e6d4fafsm2902500plf.57.2023.01.24.23.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 23:26:43 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND linux-next v4 4/4] dt-bindings: usb: Fix properties for VL817 hub controller
Date: Wed, 25 Jan 2023 07:26:04 +0000
Message-Id: <20230125072605.1121-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125072605.1121-1-linux.amoon@gmail.com>
References: <20230125072605.1121-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_232646_578954_2CE92F13 
X-CRM114-Status: GOOD (  11.99  )
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

Cleanup by removing unneeded quotes from refs and
add maxItems to reset-gpios and fix the required list.

Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../devicetree/bindings/usb/vialab,vl817.yaml  | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index 5f9771e22058..23a13e1d5c7a 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -14,29 +14,32 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - usb2109,2817
-          - usb2109,817
+    enum:
+      - usb2109,2817
+      - usb2109,817
 
   reg: true
 
   reset-gpios:
-    description: GPIO controlling the RESET# pin.
+    maxItems: 1
+    description:
+      GPIO controlling the RESET# pin.
 
   vdd-supply:
     description:
       phandle to the regulator that provides power to the hub.
 
   peer-hub:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the peer hub on the controller.
 
 required:
-  - peer-hub
   - compatible
   - reg
+  - reset-gpios
+  - vdd-supply
+  - peer-hub
 
 additionalProperties: false
 
@@ -45,7 +48,6 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
 
     usb {
-        dr_mode = "host";
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
