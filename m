Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B161C43219
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ID8oYAU5grq4WM2dFA881rtJ+Y6U0QhWyMMxmNpRKik=; b=wpiJllc39LZpfB
	4SWGeSxdXbPGNhp5KNckVmGzLOmTgHjXphS6OazrTjO1CSNPveqdBgih8Rgs4x6Cfa9xFLX/bzTfa
	/kFiBUyIaUM7gg7puMQ1wQvgW/PkRwRLj4n72qlgFCv4UaTpJPd5g2dZd/OoDqEbkiodWBTZmFa0B
	py4j/fmphNFLrxJv9TTuq2EMxKu/ZMNZpCMSJlacTQe8HvUCNUoHF9+0Pmgj66ptP6K8i1Ecvq3lE
	BtfbiY71s1CETl98QX9DvFPUqxxftqgLs/qVvBw2jWYkNJOtJ4pF83wLcn116K6Bett5ljp/NIfMt
	Ej28S5Azxql7hVjoIuAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6Tx-007KNf-3s; Fri, 18 Nov 2022 18:52:57 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6SC-007JD3-6i; Fri, 18 Nov 2022 18:51:10 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-12c8312131fso6973271fac.4;
        Fri, 18 Nov 2022 10:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uuUisE6muQ2a8H+UFn8jxcAB9pjTtgR2YYMbLsdm6pE=;
        b=XLpvS/pWGRi0WvDfxcpOukEREwt6x6vzZft0+ihGZsdrAYpS6mKVBYFoKLwxYxWr3U
         WpAWZRNiFmHdI4sL4vzXS0Qm2oVfKbeuh/cmkLth3nyAMfMAHmojS2sNO2gJpG6LFVit
         FeZomdHo6Plmi8jVooAXrJkk8gJreErqoH0lCdo4gEe01p74wdBNQyOLClXbahTGFwTF
         +7S1z7Td16FPXQhULz78KYuWmY3IizKBDKb9EJ16N3j7tle3xliyGYdrmyVGjR8mU601
         MLo5VLT5frroLQkm5SaBcHJnihJcJnWY9F/Z/MLrOY8x+e4JfsFZYAXo9CS7rZYSzH9R
         AjLA==
X-Gm-Message-State: ANoB5pkrSYzg7WqPlfJ9gdKQsuTMhttdCKmGlrxzVvYH5ooKIchj14Kc
	t42hex6X3Rg3K9n/DwMiWw==
X-Google-Smtp-Source: AA0mqf6bf2HY2HW6lGRmiXPWhAMZr4bJ2EvTFxkJh7esTNkKUL2fjgko3ZlpdrkN1JGLcX4aBxGgag==
X-Received: by 2002:a05:6870:bf0b:b0:136:66d0:b853 with SMTP id qh11-20020a056870bf0b00b0013666d0b853mr4647233oab.161.1668797465890;
        Fri, 18 Nov 2022 10:51:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i25-20020a056871029900b0010c727a3c79sm2408247oae.26.2022.11.18.10.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 10:51:05 -0800 (PST)
Received: (nullmailer pid 856961 invoked by uid 1000);
	Fri, 18 Nov 2022 18:50:54 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-media@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Jerome Brunet <jbrunet@baylibre.com>, linux-rtc@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-phy@lists.infradead.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
In-Reply-To:   <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
References:  <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org> 
 <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
Message-Id: <166879731312.851419.16320390143824776926.robh@kernel.org>
Subject:  Re: [PATCH 04/12] dt-bindings: watchdog: convert meson-wdt.txt to dt-schema
Date: Fri, 18 Nov 2022 12:50:54 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_105108_266969_C0AAD07C 
X-CRM114-Status: GOOD (  11.51  )
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


On Fri, 18 Nov 2022 15:33:30 +0100, Neil Armstrong wrote:
> Convert the Amlogic Meson6 SoCs Watchdog timer bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/watchdog/amlogic,meson6-wdt.yaml      | 39 ++++++++++++++++++++++
>  .../devicetree/bindings/watchdog/meson-wdt.txt     | 21 ------------
>  2 files changed, 39 insertions(+), 21 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org


watchdog@9900: compatible: ['amlogic,meson8m2-wdt', 'amlogic,meson8b-wdt'] is too long
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb

watchdog@9900: Unevaluated properties are not allowed ('compatible', 'interrupts' were unexpected)
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb

watchdog@9900: Unevaluated properties are not allowed ('interrupts' was unexpected)
	arch/arm/boot/dts/meson6-atv1200.dtb
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
