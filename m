Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F49EC6FD1E
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+fMr7+3MYIQop8zlAgJUAf+aKtA3yo6KgAR5AG/BxE=; b=xGlWQwmGec53XK
	UT5o6TfMyXxVDSQHtYzbtqXLSzun5fjrJOqLMwhXBYNy2JTr2+2dgY9fuHs2J4X3W65f88eQ8/NNj
	tmTUMAGAvgCCWA7aZKCSlkKb3oy/DeyhF16RzafSt/+dXnybYDo713sQY8UV80SQ/Jea6wHwGeGkL
	lPLwK5viju/XTQSAxqXsIvkzeU7PrwYNtgKqMJ9lHdNYWJlHHy1ycXL9o4rrPnk55EXWuKAO0MFzA
	+ywvYVcrwht0xWiYs82zu33Rkdfts7VYkMvq9Uu8KAqkdBJRVbpwkbDeiEaDSHjZQywv0/yrAhLBv
	Y3maaQFYSGwDiH+A8J/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfm0-002f1Y-AW; Tue, 07 Mar 2023 22:27:08 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZflx-002f02-6E; Tue, 07 Mar 2023 22:27:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id s11so58475509edy.8;
        Tue, 07 Mar 2023 14:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678228023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReUzQTPrVvG5iby/h9m+/R0jY9DDZJr5kroiPbP9VlI=;
        b=cYU4TMzZdmqPqI5Bu/OyoS+YivWNYKc5Db6vGbYpDkZON/UKHT0kW8l5+M1gJGJSuy
         ovQ3G+LSB/FefY8jf2s3iqH772fBWzSwZ6lrgOWZmjC3mWXl2KTAUNztegaeSoX8MKV7
         5bOqpDLr87hhzJ6CdpMGWIfw7OGMBDGLsD5acBrRf2qh5COyMabfMIj2aMLVVE6Bi/LT
         agzH6dXWnuNk9uYrCo0eOKQtFnGproh76TcOoCj58XGvog5v+nf5ndq668auPAMRfX/k
         tORQ+QamXruKaVFVg2xLW9k3luspGvEUEBZmH9M7r90658qO4r0YICMo0eK61Mmfyi3d
         fs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678228023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReUzQTPrVvG5iby/h9m+/R0jY9DDZJr5kroiPbP9VlI=;
        b=NSL1C3HQmCh4mUs+xb82NAxaT0fG6aJRKolB5mMX1cPzfDa9MwnzA0KYrqrY/ysAqH
         jx4wdv7ZWMEBBfExFrXiNDZrsqBBcq1XoBDUnSAfd113PjXJnl9KiZ2RFHkiN/qGaVpq
         EfJElmwucuIVEr7rbOH5o0GWTtsZI9bbmrkDzqRsKJTiKZoBJfI5r3hs8ZL5IpIwamJZ
         kijZyD0M3FIqrs+e96KHHVtBJ9zdj2Ag00C0EM/aTgJH7toalIho9RVyDul+2jH0D+IN
         SKf3GSLCiEte8NBLAMgBYUW6KLfmiYHMGD4j9qULmZFW5JIN5dq04qddEh65dK14u6aS
         ZGgA==
X-Gm-Message-State: AO0yUKU0EiElnZb8EJa/nrL+HJlA9BX1Hv8bq7tN15nW9q0r41JKGLpc
	vTAEGSZqMV2pdVr07fFF57OzMqb5On4=
X-Google-Smtp-Source: AK7set90bv5W4k0vkQtEyMMJeUJVKAtudDQCtnPoIM/WgyMwR4FeOENO0NtjA/+I6emRet/kB7wS8Q==
X-Received: by 2002:a17:906:4e15:b0:883:3299:91c8 with SMTP id z21-20020a1709064e1500b00883329991c8mr15786241eju.55.1678228022566;
        Tue, 07 Mar 2023 14:27:02 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c485-ef00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c485:ef00::e63])
        by smtp.googlemail.com with ESMTPSA id t19-20020a170906065300b008be996c1630sm6669412ejb.39.2023.03.07.14.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:27:02 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: serial: amlogic,meson-uart: Add compatible string for G12A
Date: Tue,  7 Mar 2023 23:26:49 +0100
Message-Id: <20230307222651.2106615-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
References: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_142705_266007_E670F8AA 
X-CRM114-Status: GOOD (  10.05  )
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

Changes from v2 -> v3:
- don't add extra oneOf as all of the entries are enclosed in oneOf
  already
- don't allow amlogic,meson-g12a-uart as standalone compatible string
  (which slipped through in v2 due to all of the formatting changes
  that the extra oneOf required)


 .../devicetree/bindings/serial/amlogic,meson-uart.yaml   | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 3cbdde85ed71..22656efe8ddc 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -34,6 +34,11 @@ properties:
               - amlogic,meson-gx-uart
               - amlogic,meson-s4-uart
           - const: amlogic,meson-ao-uart
+      - description: Always-on power domain UART controller on G12A SoCs
+        items:
+          - const: amlogic,meson-g12a-uart
+          - const: amlogic,meson-gx-uart
+          - const: amlogic,meson-ao-uart
       - description: Everything-Else power domain UART controller
         enum:
           - amlogic,meson6-uart
@@ -41,6 +46,10 @@ properties:
           - amlogic,meson8b-uart
           - amlogic,meson-gx-uart
           - amlogic,meson-s4-uart
+      - description: Everything-Else power domain UART controller on G12A SoCs
+        items:
+          - const: amlogic,meson-g12a-uart
+          - const: amlogic,meson-gx-uart
 
   reg:
     maxItems: 1
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
