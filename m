Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AF6C4708E
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p61SYWro2BaAQN9dhiLwo8y3qXCjowLJz6HZ6ZvTJOg=; b=Zg4HY9UhmPPfwP
	rSp1xq7QU3HaobzZ3mvGtVywrsq2Q6J6J1XGZqjwjiSA1UfrxqdTsckPRO/5sTxZ3RLqaaGuldMOi
	deXL2IaP8K5h4J/DGWlhV5RwhZF4gbKvKoXmNsWN+IeARrPcTrfCyVJpfgGrwGqzDNagpw2JQC0LU
	7dVKKY/9RIVO9m9EAkJxetmatcxN7OC6RX6jqP398J7vkpNK3FsJjeDPBEnecT3QMwqrnQNVNfxFg
	/PNA+HLTc0XejZneF+AzzMWXJFbhG2NSnyoYOt4ETkuA3l+7CnzGIUwC8LBE2cREvOcM8lAgzE7SL
	hIlv3h8OmmAQBFXl36MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XbM-009USz-Vj; Tue, 06 Dec 2022 13:03:12 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XbJ-009UON-3A; Tue, 06 Dec 2022 13:03:10 +0000
Received: by mail-ot1-f42.google.com with SMTP id m7-20020a9d6447000000b0066da0504b5eso9173449otl.13;
        Tue, 06 Dec 2022 05:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsHz7oem0hvoy253pLElia6MFpzna6RsOWGgM/OIK/c=;
        b=lw6bIqVb9OIENSZRX8ZyI4WZkRAK+54SMnOJY8IdQ2ow8srcDHab0GvoZpE97a32V2
         S3NK5mh1ST3cBmBEAQn84tG/7xpwA4gp6arPt2HgCp+ww2q63rj/dxiCt7W7Vz883SYn
         znAL1w1CuZ0zC82ByN5mYpZg8f6FjH2y0k8VHfIXV4fqqL+JpE4e8YiZz//b9jYC6fgj
         AedWq3pswa6oosovT4xVh/E5Ttx/YcjL4U2mW3/KCdzFXtMJ+4lDHMGDfvSCMfdwsJb0
         GBCi5sJnoISbIDiTlWn/6ROh0lVrYLHvpNKWSuFQpJ5s51colUncTpQxjQ8eLaN4gFDX
         c3dw==
X-Gm-Message-State: ANoB5plH7f0zq6z64Ux+a8HqSUNQHotCTLe2jbQAlu5SxQSciYw2d57/
	A2ZqNKDhmXa/yUU4EBx3Ew==
X-Google-Smtp-Source: AA0mqf4yMjf4z/y/6VWpMK8yj5aLgyx2b7hfiA+lsr5PO0CdV8vmOyeAkgnmUv8+mjnlGm72eQ9eCg==
X-Received: by 2002:a05:6830:3499:b0:66e:6dc2:cc19 with SMTP id c25-20020a056830349900b0066e6dc2cc19mr13611372otu.28.1670331786082;
        Tue, 06 Dec 2022 05:03:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q38-20020a056871082600b00144a3c526d9sm3252124oap.52.2022.12.06.05.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:03:04 -0800 (PST)
Received: (nullmailer pid 226253 invoked by uid 1000);
	Tue, 06 Dec 2022 13:03:03 -0000
Date: Tue, 6 Dec 2022 07:03:03 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Joe Tessler <jrt@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, linux-tegra@vger.kernel.org, Jeff Chase <jnchase@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Yannick Fertre <yannick.fertre@foss.st.com>, linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec:
 reference common CEC properties
Message-ID: <167033178234.226181.8075242304535927739.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050309_195910_95F2CD3B 
X-CRM114-Status: GOOD (  10.08  )
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


On Mon, 05 Dec 2022 16:18:40 +0100, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
