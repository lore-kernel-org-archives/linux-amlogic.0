Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3112CC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2024 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wA+WKd9Oxu6kQWXZ1vbbO+MEmaGxod+xGSOgSyOEUvc=; b=UP9RlJjmotDVCdOCBX9rGGkH6H
	yep/cgZ031hfL1zpyPxAgXW/hoKiClvHl7njvIFerZ3/i8FzYKKtkKvhUMM+2BPsDsDba1Fk3r5mX
	TWNP7NqprVMsU8JK+sE4g0/tbfHSUKY2sDS9IetFL+zkAfRsa++faTUftfCao1a5FXawgmFPfYEP4
	XwIrLlI1hPsGMXKRXDzMduCRv33IShaLIMCtw/qXlvy+9qbq8GvTzb6WQsJxzITgMakSg+C3aHFAY
	6Gcx1P+XeEETqJHu9dJN4ZGoWg9NiX1D8cUGRVG94Q2Bkd10tXBoT90Mxe/IKj7VgqNiRj6nTSpFe
	v1ICNU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxrLS-00000006ObI-1I0B;
	Fri, 19 Apr 2024 16:44:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxrLO-00000006OZJ-1ejI;
	Fri, 19 Apr 2024 16:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 254C0CE1B52;
	Fri, 19 Apr 2024 16:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AF6C2BD10;
	Fri, 19 Apr 2024 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713545044;
	bh=EAIyrDoQ4YoT2Dsm6kgF6uHOznfOFQEAv/ygoBq63sY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mJjpC5Ib9GO8rtPw5czyeIrWEymHj3ywrDQCaKdY08xgybtRacyrEO3mHJhWmDZcX
	 gHiTxYV38C7MgvfRbfH3ybmSlQhs4BP7cnNZ+uXOHIBJ7qV/7KuddJ6WQ0/S4ju5uD
	 xWg9Sffpe9J2MGoo116QSXCe10GYl28F4sWUZaEChUh6Kn/O+E41Hq4t8rPK83GFV0
	 etV0POHFPLJ86Ixq+4Z1Fo2t8KaE8mubswrTB2q5w6dPpqY0+bfSjOGdHwRHjHrJrv
	 adfzhvpjDYZrtVf8uGQib/qbR0jk9y3w0+XzWoa9p4graIsv9h1VOF04h3AbEH1ngO
	 kdjyZ4KBoEGIA==
Date: Fri, 19 Apr 2024 11:44:03 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: linux-kernel@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-clk@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
Message-Id: <171354504249.3529859.17389375879772293692.robh@kernel.org>
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_094410_849139_34B3750B 
X-CRM114-Status: GOOD (  18.77  )
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


On Fri, 19 Apr 2024 15:58:10 +0300, Jan Dakinevich wrote:
> Add device tree bindings for A1 SoC audio clock and reset controllers.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
> 
> This controller has 6 mandatory and up to 20 optional clocks. To describe
> this, I use 'additionalItems'. It produces correct processed-schema.json:
> 
>   "clock-names": {
>       "maxItems": 26,
>       "items": [
>           {
>               "const": "pclk"
>           },
>           {
>               "const": "dds_in"
>           },
>           {
>               "const": "fclk_div2"
>           },
>           {
>               "const": "fclk_div3"
>           },
>           {
>               "const": "hifi_pll"
>           },
>           {
>               "const": "xtal"
>           }
>       ],
>       "additionalItems": {
>           "oneOf": [
>               {
>                   "pattern": "^slv_sclk[0-9]$"
>               },
>               {
>                   "pattern": "^slv_lrclk[0-9]$"
>               }
>           ]
>       },
>       "type": "array",
>       "minItems": 6
>   },
> 
> and it behaves as expected. However, the checking is followed by
> complaints like this:
> 
>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
> 
> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
> do it right?
> ---
>  .../bindings/clock/amlogic,a1-audio-clkc.yaml | 124 ++++++++++++++++++
>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 +++++++++++++++++
>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 ++++
>  3 files changed, 275 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clocks:additionalItems: {'oneOf': [{'description': 'slv_sclk[0-9] - slave bit clocks provided by external components'}, {'description': 'slv_lrclk[0-9]- slave sample clocks provided by external components'}]} is not of type 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
		'items' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'additionalItems' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
		'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
		'additionalItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
		{'oneOf': [{'description': 'slv_sclk[0-9] - slave bit clocks provided by external components'}, {'description': 'slv_lrclk[0-9]- slave sample clocks provided by external components'}]} is not of type 'boolean'
			hint: Arrays must be described with a combination of minItems/maxItems/items
		True was expected
			hint: Arrays must be described with a combination of minItems/maxItems/items
		1 was expected
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
		from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
	'maxItems' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	'items' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	'additionalItems' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	'type' is a required property
		hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.example.dtb: /example-0/audio/clock-controller@fe054800: failed to match any schema with compatible: ['amlogic,a1-audio2-clkc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240419125812.983409-5-jan.dakinevich@salutedevices.com

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
