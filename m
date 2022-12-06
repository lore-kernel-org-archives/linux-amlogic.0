Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD2DC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9yuG3OYTbpN/MupyuM6u6UxMoqVDLX6UPFxvLIi4ks=; b=Ltw8a9VQlGa9Nj
	SXiwIK1ULn8PvYMQJxFWXIJnQ0xudpOsORWUBiLZq8KmD83GYjQ8ZHr86W0OB6H8tZombYHdpn+b9
	SWoExMddEsjlpsIkht3yBIyyEAOCxoS90eQWIGY01ng3pj8h7kF8a346y+KoOrL1mnWKz2zftgonP
	+LoUpxJCzbC9Ue6kLnawjkeiQO+loNlUJ2g4cy9wSWpWTRyVdVWTb6aVNZOvyhzJ7E0YkOF3O8AkF
	AvlIleINtygoEJtttL0wvCEfC00cvmAB9QjQ8cW50YSlwjU5JjhNJd4iFVj417gyisZO0xBPekwck
	Jk0pFPFB5+FyT67/hsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XZz-009Tmi-MK; Tue, 06 Dec 2022 13:01:47 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XZu-009TjU-LS; Tue, 06 Dec 2022 13:01:46 +0000
Received: by mail-ot1-f52.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so9205149otl.3;
        Tue, 06 Dec 2022 05:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7Hbffxdj76xYFdF4l0QY3Nbhb00ty2h6F92vl5ePeM=;
        b=BrJSgm+HZz8lHlm51kFhmyknAEmL6eSHfVLT589jMqp9+kJlFgFH019G6Albk4Ss/R
         69y4MvGrbOYZuZVtP6iyzUD30vte+3rmQWZpHLaXwPuRUASQxoEjtxe8mw/R9gSnl1Wi
         foWURMMYyIT47BECFPMS0C5nPceamMkuJmvFGRKtotle01f756x2zL7gWPYUx4XaDv9g
         sL4jNRNPboholata/D4gsfypu2GXgtEpQOQVlxf2CZNelekmQK1/EaUh2/fTjXeJ/5hE
         4tvX3ju0rUXMsn+CwNdghxSD0RsMrj/+vIaiW3MxJdGUTRXrSGDS9b4QNaeMctbs0sF3
         1Trg==
X-Gm-Message-State: ANoB5pkOqMbUsalvmgeOpelEKzIuke5ux1w36Ajjc3n9jpUMES+Vxg7F
	+IbwrD4IARUp2kJaTFZD6g==
X-Google-Smtp-Source: AA0mqf4k5ByXOavEm8wTJJndBCnqCb7kXMspArChR3P/1CC6EiJONndeKfl7Me39LQ6wRjgZBQUqlg==
X-Received: by 2002:a05:6830:110e:b0:661:c5ac:7324 with SMTP id w14-20020a056830110e00b00661c5ac7324mr44543682otq.179.1670331699671;
        Tue, 06 Dec 2022 05:01:39 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g33-20020a9d2da4000000b00661af2f9a1asm9201988otb.49.2022.12.06.05.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:01:38 -0800 (PST)
Received: (nullmailer pid 224048 invoked by uid 1000);
	Tue, 06 Dec 2022 13:01:37 -0000
Date: Tue, 6 Dec 2022 07:01:37 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, linux-media@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>, linux-amlogic@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jeff Chase <jnchase@google.com>, linux-tegra@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move
 to cec subfolder
Message-ID: <167033169684.223985.8563268980146610337.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050142_717551_6D096B1E 
X-CRM114-Status: UNSURE (   9.84  )
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


On Mon, 05 Dec 2022 16:18:37 +0100, Krzysztof Kozlowski wrote:
> Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
> unneeded quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
>  MAINTAINERS                                                   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
