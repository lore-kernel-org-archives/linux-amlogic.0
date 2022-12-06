Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA489C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdWp163zSKZYwdfitkIEUcRekLLb8MZpq7uJFQyf6G4=; b=zgTfIImYrKY8gU
	2DCGYB5Ap7+pQDXGyDmwm7YGVeQq7biU51rA+mZbrlDGHqZDj2ld6+74QS1P7b8zc1igbijRLOQFU
	79J54dIbUa2cScnNryAtaJPi1DcybbyueDbIfno3KzsbwRSLGM0zPWrRpa1QVyxBSFoqCx5rlvGzY
	FjVULV2ntVaK47FgrUeMBUoYItUwE10YKXNMr+u2y2CbZmPx2SI62KVQlTn0+Ni+E+gHgekUC4snt
	8ko40cSOzIf3C6iDdKk+lNEmkllMTGLz3WS9kgStfHiPyzkPxGc7Ramz/FeXAapm0iJlwLoxwAZ9I
	rphz7LWQ/DfmrIyIm4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XcC-009UyW-H7; Tue, 06 Dec 2022 13:04:04 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xc6-009Uss-Cc; Tue, 06 Dec 2022 13:04:02 +0000
Received: by mail-ot1-f50.google.com with SMTP id q18-20020a056830441200b006704633f258so2843562otv.0;
        Tue, 06 Dec 2022 05:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXIFyP+UTIEk0Yojx26A5iXgnHl9m8JY0GBl53V7tbQ=;
        b=WDQ3gD/bFxnSBTAXtRUcYxTgAUt7hjQDRJpWd1CKz1VFAaOPHe602ZHwCCxuopoTEb
         zMYpJQhvKk/Z5sRM/wR6Qx9J3VjaEv8kyCgM/6mr5MXvbt5B9jc8vxOnbvxO1gf/ggg2
         PGkSYbgfx7oVv1eAHA21x5T6KwhtZkd4ZxhYXjK8nQKOtuaaNM/2YgVRLqhtM9y/okbI
         cxfNRvXbPkdHmv61BCfzudXAO9fsUX5lqhzFEhJKyEYU4dCjnkZm5XFYhmkGq4pS1Blz
         hxKKMBKY2rj9wqKBWu7SE/5AVb1ucEO5aA4r1HdjNBnklKntbPPGznZGByK+ici/eGTs
         ZpZQ==
X-Gm-Message-State: ANoB5pn+x5MRIVZQ1kYdNZUW85sUHLXTZkuTYeVu/J9GW/gthijDUOgo
	02j914iUxgf1XBFNdwHdEA==
X-Google-Smtp-Source: AA0mqf7Q/7VtDzt3A993Wg1brZgvtLz+mD83kkYPL9YunOoWHl5PrH+2cBdscmR+RDa3oJj02LwLrA==
X-Received: by 2002:a9d:578c:0:b0:66e:66c7:9f71 with SMTP id q12-20020a9d578c000000b0066e66c79f71mr15134597oth.333.1670331834777;
        Tue, 06 Dec 2022 05:03:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h3-20020a9d6403000000b0066de9dc966fsm8861582otl.65.2022.12.06.05.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:03:51 -0800 (PST)
Received: (nullmailer pid 227640 invoked by uid 1000);
	Tue, 06 Dec 2022 13:03:50 -0000
Date: Tue, 6 Dec 2022 07:03:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-stm32@st-md-mailman.stormreply.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joe Tessler <jrt@google.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jeff Chase <jnchase@google.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 6/9] media: dt-bindings: samsung,s5p-cec: convert to
 DT schema
Message-ID: <167033182977.227580.3241593783297091470.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050358_471360_8F4E82AA 
X-CRM114-Status: UNSURE (   9.01  )
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


On Mon, 05 Dec 2022 16:18:42 +0100, Krzysztof Kozlowski wrote:
> Convert Samsung S5P HDMI CEC adapter bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/cec/samsung,s5p-cec.yaml   | 66 +++++++++++++++++++
>  .../devicetree/bindings/media/s5p-cec.txt     | 36 ----------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 67 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/s5p-cec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
