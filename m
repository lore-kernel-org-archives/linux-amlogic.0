Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BFCC636D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nn8cvXzvjoy8dlSmjfVhtyUXmBftb3Pi3kr2i40yWpc=; b=EeCtHBvXQEUNCu
	9T2FiLnYtR04S9pW2blB4BV5wTkcrDyvZtOcEd6opWDB/A4qYx47XFCzj9imCNFtbKqbrxBf/SUSm
	5uvccZCVpJUXpDwK+jSUeEZkFCINfuD8EyBgDFhZtwCjrsHez7knBxL+OVS6XxEMTmDFPqeejd67Z
	5dY5gyM9aYyHdpIzge+bFBLH3v2ox4AUO5DXPAqdTkAYeMYPOrsXazbcKzxp4k6fykQQYwcKTVuwN
	fifEk7vNb7eM3HjbVtim714v8LWH13IYXJPf1hmkseRdA7QaMGUGvuF5xm6Nc3b83211Ukxpl2ImB
	C57neRMKyNkYOI41A/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPu9L-00HEAP-Kl; Wed, 08 Feb 2023 23:46:51 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPu97-00HE3M-Dr; Wed, 08 Feb 2023 23:46:38 +0000
Received: by mail-oo1-f47.google.com with SMTP id z138-20020a4a4990000000b005175b8ae66cso63570ooa.6;
        Wed, 08 Feb 2023 15:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbEn39jZuVbrp1KfyknBN5gIqFu1Lykme5hYfqFo0KQ=;
        b=GCKg3KVDg4HWxubByf5jnKZluKXyJzqeMCl7RB3JlKsSFE6DV9x2vrEdbzlxt2I0UK
         8g0f+knrJrUl70JZayCZeik8mtnA13kWzsALfqt1IwtIa+YKkOT3CT081fE9zDXbMrfU
         AfWQuvFaCwP/FbNLEgnAb+uIBi/guRA6Y1ItqG634mfWGSMhn/TkhED+H9StM0ttIjHZ
         zWmWBo4zlfv1gTA6JxGPeDg1YHq49js3KQOQpgOuVt1TDe7Bf6luM2rgRLT64+I/r/Id
         bR1rC4MNQ2PLTqmxn2SzZjAHBBZBHSSSc4pAOPRluHRTAS9kunyiovI45isFVNB/rYgY
         L1jQ==
X-Gm-Message-State: AO0yUKUNxw5/H3HfZGSZBQrLJ/ZyVWKk+UWjOIGQeSmRUvN/9TQs93/V
	0m8HhRnUseN6yK/CYsM9uQ==
X-Google-Smtp-Source: AK7set+u84M8vV5Z7iR2FMh6IRGAFVe2dAiIP5ph2YQMbwK4m652fyZPas/rGZQc1f3IcdFVrQdE1g==
X-Received: by 2002:a05:6820:1355:b0:517:98b6:b08b with SMTP id b21-20020a056820135500b0051798b6b08bmr4911474oow.2.1675899994513;
        Wed, 08 Feb 2023 15:46:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g26-20020a4ab81a000000b0051a72e69e24sm6388811oop.37.2023.02.08.15.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:46:34 -0800 (PST)
Received: (nullmailer pid 2934831 invoked by uid 1000);
	Wed, 08 Feb 2023 23:46:33 -0000
Date: Wed, 8 Feb 2023 17:46:33 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: make G12A
 usb3-phy0 optional
Message-ID: <167589999250.2934778.14203415915697370629.robh@kernel.org>
References: <20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-v1-1-c310293da7a2@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-v1-1-c310293da7a2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_154637_493522_29B7ABDB 
X-CRM114-Status: GOOD (  11.04  )
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


On Tue, 07 Feb 2023 16:02:04 +0100, Neil Armstrong wrote:
> On the G12A USB complex, the USB3 PHY is shared with the PCIe controller,
> thus on designs without PCIe enabled the USB3 PHY entry can be ommited from
> the PHY list.
> 
> Fixes: cdff2c946f06 ("dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG Families USB Glue Bindings")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
