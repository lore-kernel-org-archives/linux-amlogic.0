Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36FC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IpN0YwbOruY9igNxITqlrQknUa5sVkpR92epFRtStg=; b=N1pfUsT72mktEx
	SeWd/T6pJglkBLte8xKsb3djxzTEssJlkT2vzZOQ4hgHsbVgLS9ejftPRRpqTX8cGW/aZ5WphsCCO
	w/UiW5GHzLVsgTodoIcXwyLQqqr9tFpTm0vXb9W17UztNS+NgpRoWsfdsYMqwNqhoEQRBq71R8QvG
	WjRDH4vLDlAqpXboyGqCMDHR+wkQYVloIEc1gaZRNPE6Aofs7gq5+QCWjhhkc84o5/sijVFResna6
	g+OkLmGzv8Dwr37f9oM4CHmF1Ljou7adGY/V4GFgp1UCPRSZdkrB6cRaWOyUDosxz6Wb1ZeKPacBD
	yFljgW5RDHNIxcQvAzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xbw-009Uox-WD; Tue, 06 Dec 2022 13:03:49 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xbd-009UbF-OC; Tue, 06 Dec 2022 13:03:34 +0000
Received: by mail-oi1-f178.google.com with SMTP id t62so16787869oib.12;
        Tue, 06 Dec 2022 05:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/rhl8A2LmGiFpiqJZUQMjFZh8zPPfjZ5d/GnnGY7hE=;
        b=EluYOInwfEE/C5DBj6MFnOKv/G8GoJhIoGqaoBf/0RQVQsbGcMm4pkbaUN0vzBIaQn
         MTgtrzjakMzWz8awL5ShAXR9slyXpO4vSGr1AdzvXt3XPQuPgrCnm6VywX+AEP5Nn7E1
         lVkbLTE0L1X2iqezGkWzrsoKqbiw9HUg2rA1MQSNPauXlzARby2Ii0Xm3AazYdvHiseG
         zok9Qf0Ty5i4baBhE6I6vn9XFLqCMQWWyrjfEfwMwjIwF34f/1SVKPALkAs9J8SPolel
         J8CoJYkA69fGYps9Rt4EVdACiUigOf3bmHA7OXo1CD/ela1sJnrlMz2cD+7GdTv802UR
         wKbw==
X-Gm-Message-State: ANoB5pncnzOROJHzEoRu2rpng2fkD0oMlutRbm//07piqgqCR1YfVbnu
	jQcEXRaTWbbuGX6eTrI4PA==
X-Google-Smtp-Source: AA0mqf7Ot/umK5fnMfyAlv+iZ1LRDQEusBhDifCXxjp48bJ1W4lhwy7s7Mz6V/1NxN8Ex6D5o4LGSA==
X-Received: by 2002:a05:6808:1452:b0:35a:812c:3eae with SMTP id x18-20020a056808145200b0035a812c3eaemr42973469oiv.218.1670331805265;
        Tue, 06 Dec 2022 05:03:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v10-20020a05687105ca00b00143776f70d3sm10638605oan.29.2022.12.06.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:03:24 -0800 (PST)
Received: (nullmailer pid 226920 invoked by uid 1000);
	Tue, 06 Dec 2022 13:03:22 -0000
Date: Tue, 6 Dec 2022 07:03:22 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org, Yannick Fertre <yannick.fertre@foss.st.com>, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Jeff Chase <jnchase@google.com>, Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-tegra@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/9] media: dt-bindings: chrontel,ch7322: reference
 common CEC properties
Message-ID: <167033180245.226868.8088580036081648142.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-6-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050329_825371_D2DA6CCD 
X-CRM114-Status: GOOD (  10.81  )
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


On Mon, 05 Dec 2022 16:18:41 +0100, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.  The common CEC
> binding expects also node name to be 'cec'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Fix node name to cec.
> ---
>  .../bindings/media/i2c/chrontel,ch7322.yaml           | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
