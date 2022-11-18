Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF94EC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 18:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIZgLX4uqUQjIm/x3G5aym/rIH7S0Qy8wMpz0wLtbGE=; b=FAXDjfNgzXF6gQ
	C8zYfNq6c1Q768SiBUdhsmBBtDlTzkUYBS4RwWe1qdnJ58Y3hsZDdkTUBVFbF6LvB2DDqZOyw/ppN
	K/Mrwz6zACMIKieDf6QLPJ+x3u/v3+fKL+uBEa6gJgujmAK4b6pqUk+5oRRm2mVpJXla5Za9Oye7t
	KEpxwV7HLYj2O8FIZiUywyljSfyXtZ1i+5OVWnTq1YyJzaLfc6S7flJTfFaKN788DTFIrAKiJZ6w8
	EDjwJiYJw+wZJl6+25l5yYkccrXWwuIRxb3bJaUizSwxLWGivyLD+9lDSi1VPpOESUmgkKWryg4OQ
	Pt14Shuw26jJhf8WX6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6SJ-007JJN-V6; Fri, 18 Nov 2022 18:51:15 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6S4-007J4e-Aq; Fri, 18 Nov 2022 18:51:02 +0000
Received: by mail-oi1-f170.google.com with SMTP id q83so6278524oib.10;
        Fri, 18 Nov 2022 10:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/ee9MiYM54ZuabkBQ/+PieDZU39cYWg6HtAgSwxpls=;
        b=rqZXbRXB+EJrQhJX3yTWZOIApmpxMv5WhoDphVcO8H2HlqPE8946rrIXJLryPzmHcK
         s0+OWuqZkdaGZ53RU75Q8zA0oys7ZedwpmZ30uyWcAM+JjdQjdRbXmTgmhMRWVPCHMLX
         ofW3NMaO/t0CjuNate/uVdRy2VZl0gG0iLWHXCpmjwJ2o0D8f9ezJWWepyyIaffPCgc4
         z4jz27Tm1iF+IyQGWpI0ARbdcEExKundkRrygGoIjHe9qaXV9CgaaBWV4lXkoTNlzpda
         dj31Kz9pJtiByJV3vb5cK3AL1hJz4XDzInkgDO1WVtNcYIERvLLSHK0Vyk0ANX5J8qeU
         fPiQ==
X-Gm-Message-State: ANoB5pllZuH0Lf/nHYPLyVMKeKN1xK89be+/4WSal4qpMj33NlPKw9IB
	wYV0VlFBf7EL16h7HzY9iA==
X-Google-Smtp-Source: AA0mqf4e21GRZkvWRvpSWmFSf0jhJjI8oAjyXchPeZTiL+IQp+8Fo3DKEDFsXheGcyees+YCBTMuIw==
X-Received: by 2002:aca:2113:0:b0:35a:d72:5504 with SMTP id 19-20020aca2113000000b0035a0d725504mr4073684oiz.209.1668797457330;
        Fri, 18 Nov 2022 10:50:57 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e19-20020a0568301e5300b00637032a39a3sm1883737otj.6.2022.11.18.10.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 10:50:56 -0800 (PST)
Received: (nullmailer pid 856967 invoked by uid 1000);
	Fri, 18 Nov 2022 18:50:54 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, linux-amlogic@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Russell King <linux@armlinux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-watchdog@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, 
	Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, 
	Ulf Hansson <ulf.hansson@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Eric Dumazet <edumazet@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Jakub Kicinski <kuba@kernel.org>, linux-pci@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-phy@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-media@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
In-Reply-To:   <20221117-b4-amlogic-bindings-convert-v1-11-3f025599b968@linaro.org>
References:  <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org> 
 <20221117-b4-amlogic-bindings-convert-v1-11-3f025599b968@linaro.org>
Message-Id: <166879731890.853508.15161413381354216091.robh@kernel.org>
Subject: Re: [PATCH 11/12] dt-bindings: pcie: convert amlogic,meson-pcie.txt
 to dt-schema
Date: Fri, 18 Nov 2022 12:50:54 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_105100_392276_C4A8662B 
X-CRM114-Status: GOOD (  11.25  )
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


On Fri, 18 Nov 2022 15:33:37 +0100, Neil Armstrong wrote:
> Convert the Amlogic Meson AXG DWC PCIE SoC controller bindings to
> dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 129 +++++++++++++++++++++
>  .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
>  2 files changed, 129 insertions(+), 70 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221117-b4-amlogic-bindings-convert-v1-11-3f025599b968@linaro.org


pcie@f9800000: clock-names:0: 'pclk' was expected
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@f9800000: clock-names:1: 'port' was expected
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@f9800000: clock-names:2: 'general' was expected
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@f9800000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@fa000000: clock-names:0: 'pclk' was expected
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@fa000000: clock-names:1: 'port' was expected
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@fa000000: clock-names:2: 'general' was expected
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@fa000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

pcie@fc000000: clock-names:0: 'pclk' was expected
	arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb

pcie@fc000000: clock-names:1: 'port' was expected
	arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb

pcie@fc000000: clock-names:2: 'general' was expected
	arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb

pcie@fc000000: Unevaluated properties are not allowed ('clock-names', 'power-domains' were unexpected)
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb

pcie@fc000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
