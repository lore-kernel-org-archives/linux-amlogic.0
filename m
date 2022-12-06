Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C76FC47090
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KL2pJqrkwyBV1NEPafwSLjPnVPiIXBdQKwIZSa0ivU=; b=cjBUmCet3O4zX1
	abDAE7OXihLCvq4AbzuQNhN1SPbwGT0oPYzvAu80uNQWtBOnpzhcecYfP1w775pDIc1xlZ8OhfvAo
	ERxe4IEUNHuEjIq6Nm8PKQifAfSOovrTlyA9GlcwOHPrAi80aa/vFs79utbORwDGx/ohx9TMvLzK4
	rHJ3/ipDMnexsTyKfSYRQH5xHeGL5GvSZRuBu+9CSfvX61YeQHV3+tr6z7T+oBNfE+4sBp2IYASy6
	CI9g5YPSkMsz82N90f8MwqYcBFklxvBJusWfm0R/ybScKdns+syx0mTZ2dsPwgtxKLnT3TGVARCeC
	TT90lyTiZUiJRO8VY9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XaR-009Txx-HI; Tue, 06 Dec 2022 13:02:15 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XaD-009TrW-L4; Tue, 06 Dec 2022 13:02:04 +0000
Received: by mail-ot1-f43.google.com with SMTP id q18-20020a056830441200b006704633f258so2840358otv.0;
        Tue, 06 Dec 2022 05:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxyzSpVUM6V4RTMjWwsFrePRYZPHGH5eY9Ph8J0tqOI=;
        b=gTnOVjCHoxq8eqLdixr8HrqxmSPVlTE4c5+IExsSg/bQS1ZoDtP1Oukp+UKgVAgGoP
         9tbXPyFtPEkL57tkBKG/x08mQ+86CfEZk55VDWL74U6YYCwJa5S24JOwgBSrN1D7a0XB
         x0n3nRZtJHAoa0ddCxAEE563vmxh0UOMcUBPqQrI1TCURqlEfjrZujygQ1rtQHVDL44w
         wbhBDzRPigoBtLJsNR4qLjHZdrppS1K6NuJXbFyWFsz0lnd1sbU1wfWlNPSxTKvI1+P1
         fL+De0SGrKzrIeXr2gGc5gUigxCZrKcSrbBbrwiaT3cOO9/HXXh5L2CWaFUpIvdQ9UU+
         8v+w==
X-Gm-Message-State: ANoB5plrk5mR1XrZSip0XG5Wt8JjYZN+1IY6Qx/Px3q8siovT+A54403
	UCA3aVqrfEC8irjtjPRcMQ==
X-Google-Smtp-Source: AA0mqf5JtrErllTMHorfM6i5uxzu4uWCVJfdLClwhU/c9p+zrauUfEIH4B6EJ8k4ODNVyVX99wU39Q==
X-Received: by 2002:a9d:6c10:0:b0:661:94ac:a555 with SMTP id f16-20020a9d6c10000000b0066194aca555mr31883302otq.291.1670331718884;
        Tue, 06 Dec 2022 05:01:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y35-20020a056870b02300b0013bc95650c8sm10618089oae.54.2022.12.06.05.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:01:58 -0800 (PST)
Received: (nullmailer pid 224573 invoked by uid 1000);
	Tue, 06 Dec 2022 13:01:57 -0000
Date: Tue, 6 Dec 2022 07:01:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jeff Chase <jnchase@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/9] media: dt-bindings: st,stm32-cec: move to cec
 subfolder
Message-ID: <167033171648.224515.10474001869932196398.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050201_708540_3704D3F2 
X-CRM114-Status: UNSURE (   9.72  )
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


On Mon, 05 Dec 2022 16:18:38 +0100, Krzysztof Kozlowski wrote:
> Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
> "bindings" in the title.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
