Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F185EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqZfsgA1liTzKZYJjSzh04JOtAWbTkBjBjLI4GUIzvc=; b=k+JT1dMyPv4HUd
	+ykb+pW6XW3NbVhYTflfkP3cWGlMmaxOBWavCUhAPPWe3DB376mQYL2ayaPh7kUS9ieY2XbvOwn0L
	ZoxmyKQkSIofhVYjnWgTcuekLYHAw51Llr6SpuihQDEUCbYkLuJLx6lNJjJ0BmPz+N7goX7kDHrIz
	sJd5SQupyWjHYKxujcV1z8czitq5AO9AdEEdF6iYWmtOv4g+lUnxl9OR8vjgqs0MQhqGDNOgVpHT1
	RQwyFnRT6rIm9PqysH1catRq2iw8P6Fa6NIy+n4PLxXIXBwgOzj4Kfv+vSJatQMwNUT9qOA4/dl/X
	+3VUWby8liWQ9QB+kM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iP-00CeVA-2q;
	Tue, 27 Jun 2023 09:10:25 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iE-00CePI-3B;
	Tue, 27 Jun 2023 09:10:16 +0000
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso34269811fa.0;
        Tue, 27 Jun 2023 02:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857013; x=1690449013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9kJhnQQpuNlGXFySNpCqJRJ4N1zKqdjcxf2FNcEDJQ=;
        b=LwMgWdPwNKuAoYpVs6M+okEGfcyTLYg5/pXuwAmyUohqJt85nHrFUKq9zZJeoaAQqm
         00hmattCaHE7O+vC9PGO6UKPBjo32SqEPxDGHOO/troUaJkdYL+J12gxu8FCH84JZFmC
         NMAXPSZAAotpWNdXIMvXlhHCb35qRfYqZWjWn58vAlhcIJow+gqdP8f044nntUj8pSjB
         XBW5wVmPY8OKIZekepLTSqveGLlSTEXoygFG+j8WiFNOr0DqbsgGSzuaGyYEIHznXum/
         pMGS6FHJjzlaMiVqJZkGPDco7QtPDis7gKfSN63IV9z+fRIiaQAnjjrY6ePr9yobP0I5
         o4EQ==
X-Gm-Message-State: AC+VfDxdZ0rdunqquBzvstmLIAt+sGy6KMtjc1UNpE0bAEbBNezt8ZxA
	0I943yroPy/5y6HkOYkstKk=
X-Google-Smtp-Source: ACHHUZ7t4X3QYGdcoOCu36DNAnqDE/XNKiYCsnFpy0LToVdoC4oa5Gxu5wZuh5KCD0wPfZiVzDOgAQ==
X-Received: by 2002:a2e:9ad6:0:b0:2b6:a5bd:da2d with SMTP id p22-20020a2e9ad6000000b002b6a5bdda2dmr3006645ljj.27.1687857012702;
        Tue, 27 Jun 2023 02:10:12 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm8880122wrs.55.2023.06.27.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:10:12 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v6 2/4] dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
Date: Tue, 27 Jun 2023 10:10:05 +0100
Message-ID: <20230627091007.190958-3-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627091007.190958-1-tanure@linux.com>
References: <20230627091007.190958-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_021015_020550_30B03BAC 
X-CRM114-Status: UNSURE (   8.65  )
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

Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add T7 compatible line for documentation.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..591d1f8de191 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -50,6 +50,10 @@ properties:
         items:
           - const: amlogic,meson-g12a-uart
           - const: amlogic,meson-gx-uart
+      - description: UART controller on S4 compatible SoCs
+        items:
+          - const: amlogic,t7-uart
+          - const: amlogic,meson-s4-uart
 
   reg:
     maxItems: 1
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
