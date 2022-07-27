Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB96C19F21
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 03:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TM9YhFRwK9EqxBhY6GpuKyauoz4DVbNSrEteUHi8+I0=; b=b/MDFVMTZ1Xdq7
	QmbIBpnddrvleIFEIBsAL8SDUNJ+/ZCOCujFHybQa7N7e38ln2RpFjTL0unjfX2dlYRNz+qBdPl2Z
	QoWJ+qv8kcMRJcRgx2hZeVAnL2uS7SVKPlu8xFieMrICVX07MSELXkJ8PewVCcFiGJf/KEP5pOHHI
	x3+MySNGDEU2AMS5ssHMBw0mASxsknkj1LiS+XIdiy4Z2sRADqbcUNwuUupHI1FaWQNuNN/t+Q2O2
	Au5p6nyI31XrhHRetmRLdi0TWD8aZ+AEMpVI//ORlGLymbrn/IK/qNtyoJ0ZFQyLwz0gH4+hIu0xg
	89gmrhR7bbMjveMC7k5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGXqR-008OLu-Lf; Wed, 27 Jul 2022 03:36:23 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGXqF-008OCu-9j; Wed, 27 Jul 2022 03:36:13 +0000
Received: by mail-il1-f174.google.com with SMTP id y10so533131ili.3;
        Tue, 26 Jul 2022 20:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=dnK7WbRCdK4HBAuf4lsZCAqmt9UgwDBVwNpaccKaKvo=;
        b=sh+/4Ji4qp+Y1WEwjKSmTlrbOwcwh6ulxc+nZ9QBQlSV/i69HmhB8uPg1SNAnYEnHs
         ZHY4yYFIedT8XEnFbs4/Upv0kcvuY2gWPJCtE6kq1M9srqVPWM/2l7KtnSq/Y6LoTTUS
         X9UuNKTMSIv3V7ycxPPLpyR16uSzk2KiF/bQxgZNqu5c3s2quslmOeIpbnsxQNDdB3aF
         qH1sLfhANBIg0gV5nRsBf7/8SWNAg/u3PeSe30z4FDicicdxfA793NmE6n5bTW/fzN9J
         Cq3v8IVATXOLCH9DcyepM0IeqyS2f2NkVbysEX+KJxmrm3mxK1FjBOcwr+5PBRP+DqnP
         bJtw==
X-Gm-Message-State: AJIora9GoHK42f6hIIng/2PICEzrrKzzgdGBjscQTpjp/xGrgbCHLYeo
	VA6dlpIiOiBsg8qaKK8xmg==
X-Google-Smtp-Source: AGRyM1vPpRVEUNUO4vaxRM4Cs/vOlGLG2Tz+Cv5RcXMqMX7kBrmifz+HCaRGiayZ4f4YJmOABxm/aQ==
X-Received: by 2002:a05:6e02:11a3:b0:2dd:1a51:119c with SMTP id 3-20020a056e0211a300b002dd1a51119cmr7657899ilj.308.1658892965199;
        Tue, 26 Jul 2022 20:36:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y4-20020a056602178400b0067c05ad90d6sm8016707iox.19.2022.07.26.20.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 20:36:04 -0700 (PDT)
Received: (nullmailer pid 1589324 invoked by uid 1000);
	Wed, 27 Jul 2022 03:36:03 -0000
From: Rob Herring <robh@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Chris Healy <cphealy@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20220726230329.2844101-4-jiucheng.xu@amlogic.com>
References: <20220726230329.2844101-1-jiucheng.xu@amlogic.com> <20220726230329.2844101-4-jiucheng.xu@amlogic.com>
Subject: Re: [PATCH v2 4/4] dt-binding: perf: Add Amlogic DDR PMU
Date: Tue, 26 Jul 2022 21:36:03 -0600
Message-Id: <1658892963.218595.1589323.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_203611_359691_41E9C5F2 
X-CRM114-Status: GOOD (  13.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 27 Jul 2022 07:03:29 +0800, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v1 -> v2:
>   - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
>   - Delete "model", "dmc_nr", "chann_nr" new properties
>   - Fix compiling error
> ---
>  .../bindings/perf/amlogic,g12_ddr_pmu.yaml    | 45 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/perf/amlogic,g12_ddr_pmu.yaml#
Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.example.dts:21.26-29.11: Warning (unit_address_vs_reg): /example-0/ddr_pmu: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.example.dtb:0:0: /example-0/ddr_pmu: failed to match any schema with compatible: ['amlogic,g12a-ddr-pmu']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
