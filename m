Return-Path: <SRS0=lUps=HM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3F1C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 16:39:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF5664E8A
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 16:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF5664E8A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlB4R1SMF9eIzPuRzoQUYB29Ibd7vgBmdF5JsNJSVcU=; b=etmwURGa/T6ns6b3R5ofNISgZv
	Eybbj6AnsJdbOUocAeTxp0zkFFDjhsAudcSdMCm95kYa4whuKH+CXaluwHpx7/T1OPLuSKOENuvZi
	hDKkjnULxhFxyLDu+SjurzMZ5kx4xihLbJXKpW7gpLqPPxufVR6XeaSPvojKp9pbdyCw2W9ecmLyd
	P82agFl5mw26kZe/ZfR1XOjv7APMhNHVO05kDQi5TnpLFixRkb/7N8mSnCR2xiRh4q3ABihgfMWHM
	Sv1Tqn32FjCyRlaKunp2gtlfNkf1NscSv/2Z1sLPoVfWw9RISyR/P9riNG2EKFy6HGBPV52ZjwnFm
	H8uSwF2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9sWV-00026y-Se; Wed, 10 Feb 2021 16:39:27 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9sWR-00025S-GA; Wed, 10 Feb 2021 16:39:24 +0000
Received: by mail-oo1-f46.google.com with SMTP id x23so628490oop.1;
 Wed, 10 Feb 2021 08:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=hLABr+jMceH1pKsKVWNgeUVRSZCzmjSXfeG61+9prYk=;
 b=t5dBTWN1PZmKwAMVO8n4pkfZsd0UWS2zFgo70viFVI6VEa4bd23r1mlVCJOEm0EHgA
 Wz0m8yRnf6vpceOKnQipfb/rOAB7CC4inYAt4ZVySMVTDQlTrpN48ZAkSh79lBcLi2ky
 U8YHAdMDQEIwbx3vdfbCwLc9UzDgG2LunOmYPBy20iVwopssB8KFwqsFY1lDopKrsClx
 hTYFsawF3gZnssqUb0sNCRNeiiiZnGjpZyKAGKkd8/mxh9iQ8d2XDX2/gqk109GdPsQq
 GnM7dYbtizI0EIL0Nn/gnZq1dETAPIaNSM6k7QZPWcKc601pS9CR6jeF3QFgbEOAHlyS
 XJcQ==
X-Gm-Message-State: AOAM530j5MSqvJphz9OyUBnxOh+AIWcxlkNA418LHZp4fxLHrYc81fHv
 WLC6iPFLSfc5PJ9//ByK6A==
X-Google-Smtp-Source: ABdhPJzA1Ih5UrarX2Zd/+htFWKmORb2ZC39mQDt8TDt3wEzv7A8OepEaOs/O4rX1RA3yiSFUY5JUQ==
X-Received: by 2002:a4a:b103:: with SMTP id a3mr2640058ooo.30.1612975162288;
 Wed, 10 Feb 2021 08:39:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s2sm444254ooc.5.2021.02.10.08.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:39:21 -0800 (PST)
Received: (nullmailer pid 2293398 invoked by uid 1000);
 Wed, 10 Feb 2021 16:39:20 -0000
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
In-Reply-To: <20210210080736.771803-2-narmstrong@baylibre.com>
References: <20210210080736.771803-1-narmstrong@baylibre.com>
 <20210210080736.771803-2-narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI
 D-PHY bindings
Date: Wed, 10 Feb 2021 10:39:20 -0600
Message-Id: <1612975160.340384.2293397.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_113923_570982_EF831293 
X-CRM114-Status: GOOD (  12.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 vkoul@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 10 Feb 2021 09:07:35 +0100, Neil Armstrong wrote:
> The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
> 
> This Analog D-PHY works with a separate Digital MIPI D-PHY.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.example.dts:22.15-25: Warning (reg_format): /example-0/phy@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.example.dt.yaml: example-0: phy@0:reg:0: [0] is too short
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

See https://patchwork.ozlabs.org/patch/1438845

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
