Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A34C636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqXx7tARLO48mV55eWo7lI8tATPPDYXUB1DfHWrCYhk=; b=k9nuNfbHDGI+dG
	tYz6QetQztYIfvid7rC4D9rm3tAz3CESbPcAnFKnt+Z1x10ghLFZxLD1ehbtho/K8zeRATTr3CR9e
	cnzhBdMmARlND67WIPgMwOqLp39a9hg8X8NU8ao4FVbhrShTkYSmEr5RCUOnuC9YWuWVm3nbmDuM8
	TxUH4NX2zNiOEcplkz1gZNlcd4C8ZcLkWV2aEBcJKxA4K1a8Ai4DTztWeAcV0zFulP53x38m6pwBJ
	0R0msU6ulMdUlV9NzaMJ4BV5q88vXOqHXSiPqX5tEBEpaxrIMDbshlqCscMTT6kMp2ySKBMhPS4/R
	9NBmfOxGsQZSbZZIRZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7eB-009mIO-UE; Mon, 06 Feb 2023 19:59:27 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7e8-009mH1-C5
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:59:25 +0000
Received: by mail-oi1-f182.google.com with SMTP id bx13so10703044oib.13
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kfUXbuBiDM9nMlhtgfoicYGOlCIHH58e/8hdvSE8jJ4=;
        b=Rwc8S1SKOpN2mO7m73c9uWL/zTAxEOmhykm2PLfaSxKKiULzB6dffLERoYwVaKsl6P
         52VdVAYIanzcxSZtYRaXsUXGkrK4eHRpja6PSlCdRXGnsZHL0h+YQiVbuGmN+FH6njK2
         UlDiznfLrQdLR9IWi+ApYDUMsUnKS5rEqqLk3hU6bR37aiEMQQVUFMvaqrsL9XcuO+vr
         i4TFyNhjRwRo1l6orENXzn1zhgz1/Pzyl4HtO9hRPWjG0RRUc+IeAUHAaDLzeGfIo/rM
         Tv0ebxMM6GcuwBvjqOZQFzudMzUz1y4yU2iPPt8qv6VvMmIS9rEdtKF8cR+I1cUSMmH0
         KRHg==
X-Gm-Message-State: AO0yUKXEMxEtJqjsWHTKUFhspj9kPKvGnyRj3ZWm96MqxaFwDAbTEHwN
	F3eUFdyddyjYWB5IY+XkRlLqFIOHfQ==
X-Google-Smtp-Source: AK7set/6Imd/3QnF67lbWtxRUQQuY9+VZu9NFwfZLt5/o89SdZ4M12nskxoufA3QrLtMbKAI2XInqA==
X-Received: by 2002:a05:6808:4296:b0:364:e9af:f254 with SMTP id dq22-20020a056808429600b00364e9aff254mr254470oib.49.1675713560836;
        Mon, 06 Feb 2023 11:59:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l5-20020a056808020500b0037834b1a20bsm4678259oie.0.2023.02.06.11.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 11:59:20 -0800 (PST)
Received: (nullmailer pid 1217213 invoked by uid 1000);
	Mon, 06 Feb 2023 19:59:19 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20230206153449.596326-3-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-3-jbrunet@baylibre.com>
Message-Id: <167571334291.1212116.1869881432057405431.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
Date: Mon, 06 Feb 2023 13:59:19 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_115924_432803_3B2FBF3A 
X-CRM114-Status: GOOD (  12.15  )
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


On Mon, 06 Feb 2023 16:34:44 +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/sound/component-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.example.dtb: audio-controller@500: False schema does not allow {'compatible': ['amlogic,g12a-tdmout'], 'reg': [[1280, 64]], 'resets': [[4294967295, 12]], 'clocks': [[4294967295, 35], [4294967295, 127], [4294967295, 120], [4294967295, 134], [4294967295, 134]], 'clock-names': ['pclk', 'sclk', 'sclk_sel', 'lrclk', 'lrclk_sel'], '$nodename': ['audio-controller@500']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230206153449.596326-3-jbrunet@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
