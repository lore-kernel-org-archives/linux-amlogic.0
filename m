Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97BFC54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XWtbgXxeMixXxgKKY1vdJ/zxhsgILJmk1ZGDZvZYgI=; b=uiOJ3jDats7yHi
	y5DVupyZKtmt39i6Xn8KuIymb+Ef88XCdGzGOb0asYqM6MqdAHiphtLP4UHrnYNjA9hrclunWd6db
	mpnQ8EtwvN81QoCZPxW82pae75hj2Emw/wNYrZ6zincooKP3u7fuD+0w5GPFw2hQCYVLMd9eqYV3m
	Hg/aYeTEBChLCCGsCOdT5yTRSjhlFXiFbVT2WDotjwRHhTbN439caZA/SZo7ySUtWKVdFUTJkmdBJ
	PCItzunvgm7Bl2H2EhZIj0ebc47eVU7KS/LItzhlUPZNuHKpruxKT8D7cS7TxTLq9T+slpWK4ts8z
	DJSH7PCpZVqgMKOabujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPtj-002iHh-Ci; Mon, 30 Jan 2023 08:52:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPpv-002hHt-5H
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 08:48:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso14705026pjj.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 00:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dgMsTq5Ts9YEjqdpbek5QxemQ/PfLYpnehoHOo4hN8=;
        b=kRlKvwqJrudORyPXxYlY6uAPXAorGilGpcQYT9VxBv+HOC0g2w6/zeryG5O0wZF8xJ
         1hO/UFchFYBL4M00kX7zFg+5A4IrEt2454v2kJkfXXAvlLsiwDZRY1eBfjYdEwafGoRz
         3skVunpDqqgQgy+Gh445WndXIdL7eQag6l6SfTvwTjz2+VD8zocooGY6yf3sLTDAWTSA
         zVxnnOycc0BZgmmJk6Rj3zT0rn/rf9C+FDI8jMzf5MuRH/BPNjmNIWSyLye0UY7cB5cC
         iMj6VpJQ7lO382Mr04hN2ECiwIhsjcwhao8NVosolZwUiT+0W1r5MrMeBMEcp4KLTtP/
         8GpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dgMsTq5Ts9YEjqdpbek5QxemQ/PfLYpnehoHOo4hN8=;
        b=xkutw/6oToYjHiRPgM73HB/XeRYs8xRT1Ks9m0XY9fLbjGIboGHHQ/Cak3J90GJ1w5
         JbbFGOHZeMiGBYp0hSI8GlyGWKVOINbJ5NZZ38xHaUr7fdtz20+l9THuvaf1wLSTlYey
         DoB9573iFkGjsJqNw6rki34zpnXRSCkCfhrMYgDrH0wiMC62zGNyMobZNLzCwh38K5zt
         BW8VRzwrpGAhoy3thJtRToZwQXzDoVlEuxI3i6vW7jcog384H6L/uHjEM7Po2ELgHEOI
         x98QjJnaZGCKE1q8MyQHTf8rHhMJXlWGU9IjqI119kZeQ8dM6Ifec2lixkMsFHLmuiEN
         4FgA==
X-Gm-Message-State: AO0yUKX19FEl/r23lZmBhP+/kmxyCtExObyZUQgYfAj0LHBJpHhqEGKE
	21Ew34g8fiZd+NdjF6t1CWWN+IsuLQ4=
X-Google-Smtp-Source: AK7set8Nlmxdg0CtwUfU9uT+3YiRsDDX20CZDBHXxQPB1hfblLlao+qqh6ph4W22gi2k3hBv3FKL7w==
X-Received: by 2002:a17:903:11cd:b0:196:8d33:f083 with SMTP id q13-20020a17090311cd00b001968d33f083mr1179155plh.28.1675068502630;
        Mon, 30 Jan 2023 00:48:22 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id ix1-20020a170902f80100b00192d9258512sm7205284plb.154.2023.01.30.00.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 00:48:22 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v5 4/4] dt-bindings: usb: vialab,vl817: Cleanup compatible, reset-gpios and required
Date: Mon, 30 Jan 2023 08:47:43 +0000
Message-Id: <20230130084744.2539-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230130084744.2539-1-linux.amoon@gmail.com>
References: <20230130084744.2539-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_004823_220280_66563CC2 
X-CRM114-Status: GOOD (  11.79  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v5: added Rev by Krzysztof
    fix the subject as suggested by Krzysztof.
v4: Fix the subject and patch description.
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
