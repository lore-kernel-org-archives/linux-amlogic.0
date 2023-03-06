Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107A9C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xScYvo8vp81d6HRa7esCVGtkhMvbS5UfCfaSCmV5OHc=; b=cdLjwc9q5pxSK3
	lDx6K62BJycR5Uj7nqeXnOgQFVgoimIfjAX+oYy5yDyFO7xSKMQHdd+yfEQI6nJVO8vmX1LOOpQt6
	aQgYusl+bq+yGvVfQDGvtJSY4JwajlWp1T5SKZTXUmRafdBztwezr1/BuYeaZ1w4+r5JuinbXoKoY
	Oah3Ikt1L8QL6eDTKC7x4CCEF7Z6aWE2Dla4S6nCRLGEbIRq8s0GQq/WfU2rMDGjmZj0qTGQUs0np
	8lE+sVsvG8hi8gvxlviFS30ZOiMDkqLC7sA7+IvSUVJe5zrTQEWHd3UEsDMFY7l7MK5POi0jk8AP9
	ZNrqM1ByMJzZHo1x6i0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjX-00Ee0z-5v; Mon, 06 Mar 2023 19:42:55 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjT-00EdxX-LO; Mon, 06 Mar 2023 19:42:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o12so43292399edb.9;
        Mon, 06 Mar 2023 11:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678131762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAuGjsD3YjXPSmXRNqq5neuVV5rzxkAVxoe9/cuaDU8=;
        b=gMg8Ztq7gcsPGSligxplddglJIR4jRc3VmdV6qWwyR7aJXUnu+KbOFa0tyhC9VmLCN
         /PBoOGB345nuH6q/57SPzmAf25HZ+4lNncybUkDBZcV0rWQpctVOLDp4wPJsDDnFd3ni
         h+wu9yNwqjKtIewqXoKqRGJ1D+R1JpYXXOYnpS2QOPUzT8AyIN+ZSO0j+3yapFa23frB
         dLKAokjsldKcjmJR3zl13eMZKD21u6iMA6ELfUx3kpv4BrJRlCwuJjLqEsJ340GvqGBi
         6id1CfRUttoVmY4G4Stbe/++WLf0Uo03S/9TSkMEcAfuU4gm4yq3kXTO7y7uKYjxWcWG
         8XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678131762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAuGjsD3YjXPSmXRNqq5neuVV5rzxkAVxoe9/cuaDU8=;
        b=LCxkZ/jALs0ss+m6L5CvSQ3a5dqiHHlVWaX3tjaJHKmLSSfxWRFGVPZteHcboHEax/
         KhUOVa9rGANW4WztW5MjwMzKBNRjcCYPEQgpTtRbiRHuWTVkki5KXAgyl3ncp2ugMAR/
         dcxFdwCMrmGKhUNno4TfRPP66tqkGupG+DrAwMx74mOnxTBbRDYwIPYwV7V3al2Ho6O2
         nkf1psvwJJzR5zqFbA88lU1KFOtzyKbroxnny9mZDlomolP4zyi/qP5p2niSkRY5qtih
         +3jSXaVgGlBLxZgCplz3nVRHp0W1RzYSVZgCVUdNgw63wddKuP4iFN9sehx2D5hmGCiQ
         mz9w==
X-Gm-Message-State: AO0yUKX8NgMIQYKshEGhR6ZA3hxLW/1P+w1p2l25CDze2JuqBde3ukHB
	9nsbWDCMiggTuFlraMNeVFF0bwPG59c=
X-Google-Smtp-Source: AK7set/vI81sU/bEE2xdggFmsoR+9XzbWFDXJj4M4FS2nSfJbOPBifs6jt9xxUd+fzvvBM5h4FCrRw==
X-Received: by 2002:aa7:d296:0:b0:4bd:6b93:1286 with SMTP id w22-20020aa7d296000000b004bd6b931286mr12532264edq.25.1678131762493;
        Mon, 06 Mar 2023 11:42:42 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c405-5c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c405:5c00::e63])
        by smtp.googlemail.com with ESMTPSA id e19-20020a170906315300b008f2b0c6052csm4951868eje.89.2023.03.06.11.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:42:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: serial: amlogic,meson-uart: Add compatible string for G12A
Date: Mon,  6 Mar 2023 20:42:21 +0100
Message-Id: <20230306194223.1869814-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
References: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_114252_254945_CECA074C 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12A SoCs gained a new "divide XTAL by 2" bit. Everything else
(we know about) is identical to the UART IP on GX (GXBB/GXL/GXM) SoCs.
Add a new compatible string for this SoC so this new bit can be managed
accordingly while keeping "amlogic,meson-gx-uart" as fallback compatible
string.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes from v1 -> v2:
- make meson-gx-uart a valid compatible string for meson-g12a-uart


 .../bindings/serial/amlogic,meson-uart.yaml   | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 3cbdde85ed71..f3af0da8edaf 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -26,21 +26,31 @@ properties:
   compatible:
     oneOf:
       - description: Always-on power domain UART controller
-        items:
+        oneOf:
+          - items:
+              - enum:
+                  - amlogic,meson6-uart
+                  - amlogic,meson8-uart
+                  - amlogic,meson8b-uart
+                  - amlogic,meson-gx-uart
+                  - amlogic,meson-s4-uart
+              - const: amlogic,meson-ao-uart
+          - items:
+              - const: amlogic,meson-g12a-uart
+              - const: amlogic,meson-gx-uart
+              - const: amlogic,meson-ao-uart
+      - description: Everything-Else power domain UART controller
+        oneOf:
           - enum:
               - amlogic,meson6-uart
               - amlogic,meson8-uart
               - amlogic,meson8b-uart
               - amlogic,meson-gx-uart
+              - amlogic,meson-g12a-uart
               - amlogic,meson-s4-uart
-          - const: amlogic,meson-ao-uart
-      - description: Everything-Else power domain UART controller
-        enum:
-          - amlogic,meson6-uart
-          - amlogic,meson8-uart
-          - amlogic,meson8b-uart
-          - amlogic,meson-gx-uart
-          - amlogic,meson-s4-uart
+          - items:
+              - const: amlogic,meson-g12a-uart
+              - const: amlogic,meson-gx-uart
 
   reg:
     maxItems: 1
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
