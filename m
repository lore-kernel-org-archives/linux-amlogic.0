Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6131C74A5B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Mar 2023 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MA8kZplkvTEWbGccT6JpvaXq6XvYY7MAxY4IxIgHPX4=; b=kZCF+hZWnQddKf
	zUbrQRgopbKkOoNTuNrIEB+fWF+WWDt/3/DdCWe80cFimTl+iEhbXnWZugjivlkzfSwb4AOa+MEv+
	n1131la9ErF3eULOzO+vhcrjbv8z5XixRr412V6xTo34HfRXdn6ArXr8pzX7Y4dRd0qEfWyEFBYXd
	DLAKGYLlaJLxdSbEkajDxwTsUAI2P9tO9FqMUXYNLTNugZ8deROl44PQ42QO3nNQt1ZFssE+SVB3s
	kDKD3HaW7bMYsJrzFJtYVLcBcTMLIzqzOiAVkpY1muSPfgWtc/KnXqX1vUhDun0rMwY6mqMQD0NjQ
	iKD/vYmD5wujg9gUjSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pco37-00GbIZ-1k;
	Thu, 16 Mar 2023 13:53:45 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pco32-00GbGa-1Q;
	Thu, 16 Mar 2023 13:53:44 +0000
Received: by mail-il1-f178.google.com with SMTP id j6so1013847ilr.7;
        Thu, 16 Mar 2023 06:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974816;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2YWliqp5lNeWu2afRd3ESu/UMsrFmX/tSRvg7IvURw=;
        b=doShDdSDJgR46wzGgA3oObdx5RFUSbNwQoi8ZwfoWV7M+q/vnSZaIcuJcUrui09Dw0
         kdbP6+8uldVXC/J5/60RndQOuKUkCh2I1xskXZJzNxYSvbEVhmWMxf1T5GgRF9leyhGb
         2ZUkwKd5YNu5l4r64de2P0CUrVEm5EiZdkNSI+yKgKmRhRjI4mqYr658WIVj4pNuYxIZ
         f8aDV21tEHy+Nn69gQhPugO88GvX+4FAWOEjsdQIcQB4JMq++LRMrp7X4jIrKcKk7AVK
         C+bK3wf1DxSxVR/C5/vsfkefnd5CE4YmhhOYIjLcPnNg2wwSwdtmMia7cju0k3Y+Wdlr
         uEWQ==
X-Gm-Message-State: AO0yUKVhw7Y+9rDYichptV+Nu/KqBjMJUTgbXupreGQJ0BFO7MC5T9kL
	VNxzr7s0V9jIqqF/TSZisA==
X-Google-Smtp-Source: AK7set9+ROvBZ84DStyZ/uJRXWEQwE8vC++tqt8GomgY6VU/ZPg3glzuUD1UFHjHk1y+Mx6YW2MsHA==
X-Received: by 2002:a05:6e02:1a2f:b0:316:6c68:73df with SMTP id g15-20020a056e021a2f00b003166c6873dfmr9633016ile.31.1678974815995;
        Thu, 16 Mar 2023 06:53:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id k26-20020a02c77a000000b003eb1eee43a7sm2515373jao.112.2023.03.16.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:53:35 -0700 (PDT)
Received: (nullmailer pid 2744941 invoked by uid 1000);
	Thu, 16 Mar 2023 13:53:34 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
References: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
Message-Id: <167897435071.2729635.1810239851912837866.robh@kernel.org>
Subject: Re: [PATCH v5] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Date: Thu, 16 Mar 2023 08:53:34 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_065340_478923_02AA6216 
X-CRM114-Status: GOOD (  14.46  )
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


On Wed, 15 Mar 2023 22:23:57 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson pin controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> v4:
> - split patch to be able to deal with the different reg/reg-names
> v5:
> - remove compatible definition from common yaml
> - move pincfg-node and pinmux-node definition to meson-gpio object definition
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 63 +++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 52 ++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 64 +++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 68 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 72 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 74 +++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 393 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml: 'unevaluedProperties' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com

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
