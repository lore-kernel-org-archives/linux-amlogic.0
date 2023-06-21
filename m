Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A54EB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pMc0CaZ97HAjrRKG1nZ2epV2pqqXLynDdmZZFhpsOA=; b=ZvYlnKiEIuXmzY
	I7nYPmXNwl/sg2yNQloU/a2aT5oJ0M4BoA6vcVa3TXdO70A53ggRXydcccKkG1xwB4/aa93biRQaf
	zCD8Rc2U9IAFSGx3CoDr6tIKi607f8VuvaAxjOby4ld+ofUJg2pJq9fd4PFyB79HP5v87UViRAQrX
	5n4dyWLWCVwWM7TlFvhCiMfwRB/EdzrodYg4v29m26cMKby6l+CJpEw9aRkfPDB+uURZusBdKThDr
	+JVKSSgH+EWXEWO+AGpLaIQLvJC35D1H2cbcwjTGf0jo9vDLfd6O7NwXVE3Np6UshbSORnPwHjQ5I
	q7vrDllWm64QgJtz6GnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxwq-00Egrz-30;
	Wed, 21 Jun 2023 13:32:36 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxwi-00Egmm-2z;
	Wed, 21 Jun 2023 13:32:30 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a04e5baffcso277927b6e.3;
        Wed, 21 Jun 2023 06:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687354347; x=1689946347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+epYfBWfb+1x9J48BBgefK4RbF1tT6DdUYZkz0j7yII=;
        b=AEWA752kxKiL6K/O7Ms2+ZU8csuitYsPEoPBhhUYC9K80NOThFxNP4Jmp9hEvvHz9I
         f+5xyJzHAldkUggwiEl7PiJdkO+SCdt4FgpJOCvR4LHnlBFBLKIfG8VBeLybin91Hlyz
         IoBVXTaPetTrF0hkh5yK5ClU20JMRxagtOc6OFW+l3VaLDZtrFLGTEhd7vDA/TCoSQXV
         Ej010TVVferESi8NvoidoaWF3fjpA5mLt77/4tDZJsdJ1MAatH1jE129o59fgxI/TNJl
         ka1DlkkfmUbCozGvMhe9jnA6YTMfI6TjZ4BPHjUl8mfta01DTLLxDgfb4pE4JU1rBfpL
         8fIA==
X-Gm-Message-State: AC+VfDyQKIa8IZZ+vMjavAA7gCJdgLHbmpS5VTd0yn0PWGcWTDqJrIsk
	gEWkOiEAiOXTNR/qQVaFmJk=
X-Google-Smtp-Source: ACHHUZ4zNPDAe5uEN/n6D0xeeiNucAc8zANUHhXM9re06jw8HAHMKRDY+ryg26hjRI79GzQMdlcUjA==
X-Received: by 2002:aca:f0b:0:b0:396:11b3:5851 with SMTP id 11-20020aca0f0b000000b0039611b35851mr16382216oip.54.1687354347631;
        Wed, 21 Jun 2023 06:32:27 -0700 (PDT)
Received: from localhost.localdomain (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id bf24-20020a056808191800b00395f2c84b81sm2114206oib.54.2023.06.21.06.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 06:32:26 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
Date: Wed, 21 Jun 2023 14:32:14 +0100
Message-ID: <20230621133215.109254-3-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621133215.109254-1-tanure@linux.com>
References: <20230621133215.109254-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_063228_991049_EC83E190 
X-CRM114-Status: UNSURE (   9.36  )
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
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..860ab58d87b0 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -33,6 +33,7 @@ properties:
               - amlogic,meson8b-uart
               - amlogic,meson-gx-uart
               - amlogic,meson-s4-uart
+              - amlogic,meson-t7-uart
           - const: amlogic,meson-ao-uart
       - description: Always-on power domain UART controller on G12A SoCs
         items:
@@ -46,6 +47,7 @@ properties:
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
