Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02AC636CC
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdgn6GgifgeztObaU+yQdaU5CDC+G6/3NJl2ARRw5ko=; b=QSM7ws9RKPoBD0
	LaNrzrrDe9s7VpkVgzFJM1YJ5sslJYUL6U3ouLoxEESakG2x+T2dE3O/fD72BHxLpN6jm1RHPPOq7
	97jD4BQijMfEmP03z0UrmVyBdTYpQD+8SFJD7jlA6dJLJmHIJ0qWBD4nhVf50dn/Ip/bu9uRQlTC9
	Fia839mACAM3whyuGLB3bEBP56IuStGYLgecW/MJTLdaUBjG+FltCiUvXzk/qUV+JKY+BqC6Cx+pI
	Q0xMRyP7iE9n0mzsrOi+3eqS3jxqdNqvhazL5wBNxveURZMTl5TOtKCcso5pwSMSCUvbUrS67ZrGZ
	GPtx/kSs7JduCTbw2xjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMu5O-008nho-Qp; Tue, 31 Jan 2023 17:06:22 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMu5D-008nei-KM; Tue, 31 Jan 2023 17:06:13 +0000
Received: by mail-ot1-x32a.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so1396197otj.3;
        Tue, 31 Jan 2023 09:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+8rBCXp9QUszN6EtdlrzESk2YRd1LhFxQMBHxqvRZ8=;
        b=KIotuXGen7IPQ2MM3jARlRJcgpTMmXnjonwSHT+XpZMX1+12fCZD0G96L0aAkPfdMS
         JAHa/KIhvXy01RkzKieONIFgBovrC4z8J77AAyJPbvvJGJBhYkeZE63h9y9Q+dalddna
         PRK0CAY2UAlQhTL3jJs0e4S33SYUchhScZ+3cEp1zWv3CrhIaqr1ZwwH9rnrfE5O1uGb
         8yb79/rJu1S0QRRcyN2iE0OAsr3Yp7k2g9ph4snwSPo9xtOyX3Yjc6HPa4d6SIGZbfnd
         Tfg87yjJPUuO696M3UjVX7oStAxPrNPOkWDXt/2gqibuMnOUNXmVnRByLYZqWojpaWgB
         GukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+8rBCXp9QUszN6EtdlrzESk2YRd1LhFxQMBHxqvRZ8=;
        b=XZk9/FK+JP7GwerXke8QlIC6XuRTytgEOky4hX3nyvijjo2M7IGgsDeSGO54asLKlr
         DsUQksSyVfxSkSr356zKJtdhyQGiFCreaRQnuRN23a5EewgnY9TaeoL9gg8Cu0fU08u4
         rbKduHiUHq40VFX1o04ww9ZQ8F7fRsBQtXHLohfqaK92AKJb0fnwcKu4j39DWOLftcXz
         HJ0Sp8MVsM/RFeOdG1eFVpOHvY2NrGHqOuRWIzUQ1goa+qqYrJAzfsJdUApJwLAAG+2Z
         Yfl/TOatjKW4SOy9IFXKzNNj5xVxfsmFtf9fDySSgrHxkvRWeO1frrHILY+mJGICGKvM
         ulXQ==
X-Gm-Message-State: AO0yUKVPk+DRLKxnx8MWoZeEADQOVNgMPT4QJ6Shx3I5Hxj623OMpmXt
	m9dEXM4dO4Z/rE2KnoSDUZs=
X-Google-Smtp-Source: AK7set/3cx199W6dlm+bCYeBqwh7XTb78l9Pdy4589af0XRP0nPAx1JUE7sHjjl+5ymFcH8PmR8lxQ==
X-Received: by 2002:a9d:688:0:b0:68d:3e10:2951 with SMTP id 8-20020a9d0688000000b0068d3e102951mr89946otx.3.1675184768344;
        Tue, 31 Jan 2023 09:06:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t14-20020a9d590e000000b006864816ecd9sm6740348oth.59.2023.01.31.09.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 09:06:07 -0800 (PST)
Date: Tue, 31 Jan 2023 09:06:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: watchdog: convert meson-wdt.txt to
 dt-schema
Message-ID: <20230131170606.GA3599161@roeck-us.net>
References: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v3-3-e28dd31e3bed@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v3-3-e28dd31e3bed@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_090611_692353_36EBD7D4 
X-CRM114-Status: GOOD (  20.52  )
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

On Mon, Jan 23, 2023 at 11:10:00AM +0100, Neil Armstrong wrote:
> Convert the Amlogic Meson6 SoCs Watchdog timer bindings to dt-schema.
> 
> Take in account the used interrupts property.
> 
> The "amlogic,meson8-wdt" representation has been simplified
> since there's no users of this compatible used along the
> "amlogic,meson6-wdt".
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/amlogic,meson6-wdt.yaml      | 50 ++++++++++++++++++++++
>  .../devicetree/bindings/watchdog/meson-wdt.txt     | 21 ---------
>  2 files changed, 50 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml
> new file mode 100644
> index 000000000000..84732cb58ec4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/amlogic,meson6-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson6 SoCs Watchdog timer
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - amlogic,meson6-wdt
> +          - amlogic,meson8-wdt
> +          - amlogic,meson8b-wdt
> +      - items:
> +          - const: amlogic,meson8m2-wdt
> +          - const: amlogic,meson8b-wdt
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    wdt: watchdog@c1109900 {
> +        compatible = "amlogic,meson6-wdt";
> +        reg = <0xc1109900 0x8>;
> +        interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> +        timeout-sec = <10>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
> deleted file mode 100644
> index 7588cc3971bf..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Meson SoCs Watchdog timer
> -
> -Required properties:
> -
> -- compatible : depending on the SoC this should be one of:
> -	"amlogic,meson6-wdt" on Meson6 SoCs
> -	"amlogic,meson8-wdt" and "amlogic,meson6-wdt" on Meson8 SoCs
> -	"amlogic,meson8b-wdt" on Meson8b SoCs
> -	"amlogic,meson8m2-wdt" and "amlogic,meson8b-wdt" on Meson8m2 SoCs
> -- reg : Specifies base physical address and size of the registers.
> -
> -Optional properties:
> -- timeout-sec: contains the watchdog timeout in seconds.
> -
> -Example:
> -
> -wdt: watchdog@c1109900 {
> -	compatible = "amlogic,meson6-wdt";
> -	reg = <0xc1109900 0x8>;
> -	timeout-sec = <10>;
> -};

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
