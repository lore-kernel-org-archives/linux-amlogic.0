Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BEAC27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVtr7KNS98B8YKsSGcptNjnk9rD6coEjJgCD9H0bqYA=; b=iWzeBn4ibzFL3+
	Q1toqG8veEXJI3N0yTM8Z6hbu6wTSqsWcNFck45fFAS3vQYfNWEPZQsRP7LWlCflozolmYk+eohYV
	dmRh0MOkb1uFX55H+urR8TNJJr2m4lYSF8DU2u0T9hd+4eROhGBW9qckvKChkoWgOS3j0P+0rgM+q
	EcMVkSyU/MiTrKprBZ6D+d8DA37orY19REgHA3SmdTcLy9RiCYVLS59sNXzhJh1GLZ3uPGPDgAiKO
	5Acu/f9q6smZ6QtqJBcgfzBl2iL5HBcCcNFOyXE2f8q1fJIcXBUekcpuFrOZrr/nqwAaz5oIWLUv/
	2QRLawmi98tj1CKy1EOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgs6-007Zdu-VP; Wed, 25 Jan 2023 14:35:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrO-007ZBf-UB
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 14:34:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d3so18030187plr.10
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 06:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl6Yi+gm6x0jddwKUYCeMj4VHkB5ErH9lG4Oo4LvHEI=;
        b=UTCrM5Ts3D+yEtU/KCHhWsAXHapP08wO/KjKMqHYe9yj2GF1ch9RqJJf+heWVMtBy8
         Dk/Iep6KJsQQrmSo5dE8av/feMByB04hc4uRjTskJti89/F4Yb3TsjNEe/0h+RZuXDnz
         lTwBzPnyftadre+sp7SCUwyvxhikmt718eNJG9vysYXXw1nDtBy4843hQ6VyowtdLU2H
         IlrT0nyknu7PKTCYNG575dWrl3mMrhiLz13KMSKlQPocVnalREz/Br3m2wQtybHWRJiK
         sVezqiyX2i4tl/NRPUJ5AAy/Dp2/QioyaoHw7eyrs2ahqrUe5ttWkz3h0YMq4oZMafia
         jONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl6Yi+gm6x0jddwKUYCeMj4VHkB5ErH9lG4Oo4LvHEI=;
        b=LqWZ6zJv3RFcTgEom+0MaV7pDyTcoNymlKVO6glitfOvD+ajRP3xO4lXHuAUnSMKqr
         35qVeoCbx+IP7DGJizEydKmWU7KcenVP+s19Zxw2wbyXIBez+NpVnCueaxcsFcpH2Y+H
         XXASK/WFWKtcQ+/Qz/DbV8QwP7Dmm1yUrztOQVWzbKeefVVr4WTkJSGSm57pGeuJc4mz
         hn3rb34iZpxQUYzyto012SBBAAv20MKIjGZ2lrU1CaFRQFQroks5wpXdB9tN4keZesH5
         CrMCqlAJYhcPQ1pIp9Dp9OcqR7w4VzFueOpxlKuuEw32DIODAJReHAw2s65zxP6GVEik
         x8QQ==
X-Gm-Message-State: AFqh2krLod8T1j+JPoSdDYsxz/6ECkM9v+pC8Ji0Glc1TH7ZFfZEtYwD
	UalctH5AKBWMK29yL6pTwP7OJAvAf1U=
X-Google-Smtp-Source: AMrXdXtvjxXhIcJ2tVOdp1iKzinV8pzyoZgxU25wu2sydM8Afq2kh6MP3sp+3RaSnj7uV+rlPS1qDw==
X-Received: by 2002:a17:90a:f612:b0:225:e88c:33c2 with SMTP id bw18-20020a17090af61200b00225e88c33c2mr34864397pjb.7.1674657283921;
        Wed, 25 Jan 2023 06:34:43 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090a1d0200b0022c033f501asm1671465pjd.41.2023.01.25.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:34:43 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND linux-next v4.1 4/4] dt-bindings: usb: Fix properties for VL817 hub controller
Date: Wed, 25 Jan 2023 14:34:03 +0000
Message-Id: <20230125143404.1424-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125143404.1424-1-linux.amoon@gmail.com>
References: <20230125143404.1424-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063447_029739_846BFF5B 
X-CRM114-Status: GOOD (  11.70  )
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
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Dropped Rev Krzysztof.
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
