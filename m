Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0316BC4708C
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cp6qlYBSm8KEeF6N/VfJeO6LongMwAiUiift8J9mvKo=; b=MJX2jOV5oxrLlw
	SPfL4+Kmc0GMnKfsYshKl4SeJfMBL45cdFlLREOtuPG493DWlYBA9ZPYr3byBBc70/3herb/b8FZJ
	75PmneCiPjsOoSlBwptPsrOY9hWHA9Gm0gbl/GBboYwFHvkvxhjFmcGFARnjo6bXd0Fw6837BE+b9
	dhWkhprprKANY1ipkELu7GtSZs2+mi6WL3k+2dkbOeR+XoMuQmPctdeC6ffHULI+krGCL71fq/J1q
	pCTa6bnMzc+bauhi1R2RAkKE37TYoZueQQzN+nIIxEbq+hw7jk6Qa/Ufp4hg6LMxokfg6n28CBZZe
	tf707cd/k4jmobZgzzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xb3-009UGj-9x; Tue, 06 Dec 2022 13:02:53 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xax-009UCm-9a; Tue, 06 Dec 2022 13:02:51 +0000
Received: by mail-oo1-f41.google.com with SMTP id f7-20020a4a8907000000b004a0cb08d0afso762359ooi.8;
        Tue, 06 Dec 2022 05:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4xw/+ywJXT3DJB58fwNh/xTT90tKd1q3hEDbHNq8ZI=;
        b=sxR/+9lMGU+5Kv+mYe0xSJwo+S2y66wrlHtVNTzqQU5PShaI2cW5Z9mb2ERXnBRX5A
         NLA4asJtHuB2x51NrDSnU5JS8eGnhs7nJ4G8J1R/8Hbl7VAdJ+gkw+AjVb/Pqo/xK1e+
         XYFycJ+LE+0s1J/FE+ML9iFU+KLtHSSForNzmW0nVsDoLUi2cKYaP2H9pBbXgC6CQrqv
         W69UvdvYE4d6Fus7a4ShW8uXZ8Mw5PiwC6n10LccSPuDOu3bz5f1zTWi8dpt+wA08gdY
         PRZWDfG7yAb1J23f46PSuueNvcbyh5Vs5V3L6025oFBATExqVUCmmjo+jNoT67D4Piv1
         MW5Q==
X-Gm-Message-State: ANoB5pl/4ruTFQOXuE7DkDj4g3HoNbtRj3JvN1tlT7sUQL7O/YNfpsFl
	KHfUlP8ek2zaHRx7cJKYvw==
X-Google-Smtp-Source: AA0mqf43zncrSVF/3luC/HIGUW+nK43yAhxSLf/Tk1XAQeHQa4RnY5NNOQwlENA38AbtEYq7O7vwjw==
X-Received: by 2002:a4a:ad49:0:b0:49b:c0e:3d5f with SMTP id s9-20020a4aad49000000b0049b0c0e3d5fmr36865349oon.69.1670331764762;
        Tue, 06 Dec 2022 05:02:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s11-20020a4ac10b000000b00499527def25sm1547158oop.47.2022.12.06.05.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:02:43 -0800 (PST)
Received: (nullmailer pid 225694 invoked by uid 1000);
	Tue, 06 Dec 2022 13:02:42 -0000
Date: Tue, 6 Dec 2022 07:02:42 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Alain Volmat <alain.volmat@foss.st.com>, linux-samsung-soc@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Marek Szyprowski <m.szyprowski@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>, Thierry Reding <thierry.reding@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Joe Tessler <jrt@google.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 3/9] media: dt-bindings: cec: convert common CEC
 properties to DT schema
Message-ID: <167033176212.225636.18251903992063817307.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050247_350972_A63E6616 
X-CRM114-Status: UNSURE (   9.51  )
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


On Mon, 05 Dec 2022 16:18:39 +0100, Krzysztof Kozlowski wrote:
> Convert common HDMI CEC adapter bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../devicetree/bindings/media/cec.txt         |  8 ------
>  .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 29 insertions(+), 9 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
