Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83960C4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HYIkZgk0iAsaoFROcdGrurow6nR3P0+KTgaHjxbYic=; b=39VS2yszNjaagO
	eMQGfnBGonOtdwcyOocb0ALKei349kRNpubnJtzynsCgTJYogUwgywsGEIWhIy5Ggy0aqqQqq6LqC
	HwM/MeWo/jaOBXpLo9duDjenQDJsYKzs24+Z655Nru5s24whOrv+9xIuEKraTFtRQuGB81UZBCbrA
	nBlQGOWdJHrjaIXMXGel19MLaAKDZqm2DB6yJouuXrbygfoi//2T9CQYg7ZZu9gkqwX4luKXtnXOd
	EVB0vHQaTdOTtpJczTp/ernpSOqgDMXkPlJoFr3Wzszog00c7e8e9nHSzW+3+eMmAuJdPAHc97Ko1
	3+hyvRmJzC5osAGUlLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2D4f-004VWG-47; Mon, 05 Dec 2022 15:08:05 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2D4T-004VPh-U2; Mon, 05 Dec 2022 15:07:55 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1322d768ba7so13767034fac.5;
        Mon, 05 Dec 2022 07:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=un2tfy4ahNo9zjbkY7O4xE/RSkvkF3i02AWzGP/4rig=;
        b=p2o2D1R6WomQe5WsJlEOR+Hv0WHm0CkR2Ox3Q8gwqtIkYKUXldi+4AsA2/WN6Rh5Mm
         jmwPcmB0bG7yxjFfMuiZBLZ65vAAZC75fDpCJxd/VAWxfNAZ6YamS6PwY5tj33lRZgA/
         Ki0OMpbpXhevNPd92RpUCFJm6sWk3DIBQmpy4t/RrFQMVgGpaWgUqWgFhJw+hWzsX6As
         KEQiRCv8IBnJNB05zA9tEn0ouqivJizEWkVyQ/ALYYiAkjLgPl5nwfRqICUrfY5Tt73K
         Z6w468EKOZqKsqV3+mbYJJMICT2Has7OY4uLT63kDzgOsdS5hrcyzBFWpjkamD7+eEIH
         PMtg==
X-Gm-Message-State: ANoB5pmP02rP0Q0dEBOOYfaL6uOhvw6bJerPUOs1UkM552V0eaPeT5iH
	8aKbVBba6CYCpbbX7Xj8ow==
X-Google-Smtp-Source: AA0mqf4u4kzZ1ZBWoQtzp872W52LKIVRXUvm43N91ZDjaWGZJYwEgFGMaehPuBK+w9wgO1cB9V4ooA==
X-Received: by 2002:a05:6870:ee16:b0:144:a24c:e1cb with SMTP id ga22-20020a056870ee1600b00144a24ce1cbmr2227077oab.164.1670252870872;
        Mon, 05 Dec 2022 07:07:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y30-20020a9d22a1000000b0066ea9650da8sm3195971ota.20.2022.12.05.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:07:50 -0800 (PST)
Received: (nullmailer pid 1794161 invoked by uid 1000);
	Mon, 05 Dec 2022 15:07:49 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org, Joe Tessler <jrt@google.com>, Jeff Chase <jnchase@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
Message-Id: <167025248440.1785019.8058849269946787324.robh@kernel.org>
Subject: Re: [PATCH 5/9] media: dt-bindings: chrontel,ch7322: reference common
 CEC properties
Date: Mon, 05 Dec 2022 09:07:49 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_070753_986380_AB036226 
X-CRM114-Status: GOOD (  12.27  )
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


On Sun, 04 Dec 2022 19:29:04 +0100, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/chrontel,ch7322.yaml   | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.example.dtb: ch7322@75: $nodename:0: 'ch7322@75' does not match '^cec(@[0-9a-f]+|-[0-9]+)?$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.example.dtb: ch7322@75: Unevaluated properties are not allowed ('hdmi-phandle' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221204182908.138910-5-krzysztof.kozlowski@linaro.org

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
