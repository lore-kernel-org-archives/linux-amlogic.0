Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7D2EB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFKkD/c9rUkQGfa9pyS6S54aHk+PvSv9kZMPIcjXlzQ=; b=EiQcZvP223zkv+
	BvOnu9TA/+KN3yzj7LbedZJ+NHC9TU3avmTzYGtEGl3ZQeMUgLiETtaVYMfmNaboVHg/bRctENaJj
	yPgBBv+JqLXfQoPZe+/Xnxc+nVU3JngsbHfjIhiTXZrDVu8Cqi2koWdGwX+5OgDgPHsAwbLMzchuP
	UT7miX3cwcEpGuhJvFdxwUimdL8rrY0oyzikx/0G2Vx6OIeRaEOTYLlnfwYoSJDR8TmoSFIHh5Kf1
	Y8PJX/FAonUoXVgFAbikzPwQqau0hPAbz2Keul0qMTrSrvQfco5EuyxPsm9gi8qLIFmqgYvNSenxX
	WASiRZ3SxHF9ovUVJkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rjL-00Fkgy-2X;
	Thu, 15 Jun 2023 18:29:59 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rj9-00FkZT-1d;
	Thu, 15 Jun 2023 18:29:49 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-311183ef595so719533f8f.0;
        Thu, 15 Jun 2023 11:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686853786; x=1689445786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CTYF5ruN+Zlst0kqVClfG2q0zNldhioydCFUBAjqvk=;
        b=BBe1TV6jBT/xHGJVEXRzPTl7eZVVRb2VwwkgEO5biX43VItYModiwiR9WUci7w2xnT
         aa5wmq2eCTW7zaFDRLZcT/j1Nm+lXXqXHx87m6XQxpEv9utBQCuhWyQ58/BjZR0FB1dX
         9GSsQZgdj45KKg1r429CZsfwKZtZZefQhQZwSPxQzQ+zemkI5y0pX+txtApv03xtAUC0
         pMxPbIo1In7OjrD5gpfOyflBMzdXG3iqwkOt0CfzbDKu4eF7dlfKvkGk6qQK/FBVYiNE
         TkZ3Jil1zVTI+uGTi4L8H8jHnxcCKVDS86/KZZGoqJcaUoPt65fEoBNLpeEInImb9K6t
         HwvA==
X-Gm-Message-State: AC+VfDxTwASzzce8ozRs3vFqpxVEyde+CwLgS13Zr8w8XK71n6tpsbet
	fpPIC9IGKLuN3g+pL0O04AI=
X-Google-Smtp-Source: ACHHUZ5vOqyhP1OdkXL8MuvOVzixmo0+GdlGzvK4fRijspT6ebuOU5lRkUpf2TtIYL8e5FP59PQNaQ==
X-Received: by 2002:a5d:6408:0:b0:30f:a938:6d5d with SMTP id z8-20020a5d6408000000b0030fa9386d5dmr10449466wru.56.1686853785730;
        Thu, 15 Jun 2023 11:29:45 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb03000000b0030ab5ebefa8sm21525887wrr.46.2023.06.15.11.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 11:29:45 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH 4/6] dt-bindings: serial: amlogic, meson-uart: support T7
Date: Thu, 15 Jun 2023 19:29:36 +0100
Message-ID: <20230615182938.18487-5-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615182938.18487-1-tanure@linux.com>
References: <20230615182938.18487-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_112947_559211_4E632E47 
X-CRM114-Status: UNSURE (   7.81  )
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

Add serial bindings support menson T7 SoC family.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..01b01f8840ea 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -46,6 +46,7 @@ properties:
           - amlogic,meson8b-uart
           - amlogic,meson-gx-uart
           - amlogic,meson-s4-uart
+          - amlogic,meson-t7-uart
       - description: Everything-Else power domain UART controller on G12A SoCs
         items:
           - const: amlogic,meson-g12a-uart
--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
