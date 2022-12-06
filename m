Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9024BC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgNROXrb4es6y2q3MTuX76d0olH6rkQcbt0OW5kF4bU=; b=S1KNnEtP4Svwrk
	HPukL4DzR3FKTRRpqPcFMoK/swJaw6dYHTSKp2D2fwf7//FPYrfN0atKwXGnGAvzLDN9gvgL0XGLO
	uoXC8XoFlnl2F2m66wKRh05pf/V1mdutEMev39/PawOoxjceP98s0X/h+19qKuf0Yb37wHEfrsvYw
	x1Uulv8aGWMOsyNSiP6+xzMCYVI2GhpVe+GPwlr9PrhTLIk04k0WUyjIE0Q5uYUzoUWWwsR34J+Gk
	Y7oxn2EeJD2koV0yD4h5eaFpJoOArYpdw8wiL44MA7bWoF68ofN8qaY+2o+PM6FJCT/C2l8dirWVu
	aPQk3rOY6TPeEvdBOuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xec-009WEi-TH; Tue, 06 Dec 2022 13:06:34 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xdz-009VuJ-93; Tue, 06 Dec 2022 13:05:59 +0000
Received: by mail-ot1-f53.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so9214589otb.1;
        Tue, 06 Dec 2022 05:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7j3ufR+17LIatwXfzkS37AMrM5wspfABSKG5ziauPQ=;
        b=YiPsQFZrCUIssR7l7M+ffpRG1B9PqWoy2LecAO1nB2OGU9TKCI+8pLHJ4J66JX5XRo
         LbWEe4Rp+5hKtAlnZ6xmCNMvSz1zZsahCBEBx7Ixh7TuiUMTwbvus+RfOHJDQPM5wd5t
         7ZRK3pM+qcFG0OvrYItykJB9wcR3ZCMtP8KoFOhmPqxzMk3rALV4IkT8AdcjMbvW+Jyi
         7ocFaDm+pW4Jvf1XPtlE6CxC20A6O/ugHwU4786ViEVSbxP0rd88MoxTugiwYNClbHaO
         T0Nv2c2vPlOc5AA6fF9yoxnXVR3vg/cRK5idYPGpPcZc9W9qaNejIuI85tIpxhd+mC5h
         cYZQ==
X-Gm-Message-State: ANoB5pn20zl0P45oZKDvIMikeUl6mT8pZKcSkLn468YoEs/e/P5Wsz/M
	DOYq1ALw0w4dyy+DZVc6FYSTOp3oUw==
X-Google-Smtp-Source: AA0mqf6fMNQa1MZRHTu4Mys3lQ0bmDkZi6wAqFtT3FMcdVbZJcgwFXkLbhyX3YOzWrZ33rTdzoJTUg==
X-Received: by 2002:a05:6830:698f:b0:66c:57d2:54fc with SMTP id cy15-20020a056830698f00b0066c57d254fcmr35241262otb.378.1670331952892;
        Tue, 06 Dec 2022 05:05:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a10-20020a056870d60a00b001438fb3b0a0sm10568716oaq.44.2022.12.06.05.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:05:52 -0800 (PST)
Received: (nullmailer pid 230603 invoked by uid 1000);
	Tue, 06 Dec 2022 13:05:51 -0000
Date: Tue, 6 Dec 2022 07:05:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, Jeff Chase <jnchase@google.com>, Joe Tessler <jrt@google.com>, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, Marek Szyprowski <m.szyprowski@samsung.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 9/9] media: dt-bindings: st,stih-cec: convert to DT
 schema
Message-ID: <167033195070.230546.1336389323664376235.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-10-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050555_362775_65A25246 
X-CRM114-Status: UNSURE (   9.30  )
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


On Mon, 05 Dec 2022 16:18:45 +0100, Krzysztof Kozlowski wrote:
> Convert ST STIH4xx HDMI CEC bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++++
>  .../devicetree/bindings/media/stih-cec.txt    | 27 --------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 67 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
