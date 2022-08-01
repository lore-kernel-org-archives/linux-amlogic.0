Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20128C00144
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Aug 2022 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6jOagu6FEr+donumw4/X757wkU4JdKYYO38u7kU7cc=; b=bNCxSQhZlAjkmr
	4N6gh8Fp40hT+xiuOI1OyRR18QU4H9V1Nrd4xaC+Ql1DD640Olk3U1OL7o0hORjI4UGaRrKDKqVmE
	jMuB0N40urPp9uuDTVnUrMZp896pQ6dmbvMOW24Ub5J84Y7A9sMFoBEPlk1YSging8VLZoe5fARAJ
	74fFinxgeKulJ5rIbkMXUTEAUt8x2VWhgrprObeIVYlGTo2yzXmA0DGPM6aqob++RpIh15akmal0I
	MF4Znfm+ZDOESQzERRxerjUHx/bt2pvWRSrayxemXoZgj817Ku5PF5L7io0448C+h02T+mw6sb4eU
	8RMOi7kIFasxGc8YrOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIViX-006n6P-Ic; Mon, 01 Aug 2022 13:44:21 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIViE-006mxL-3s; Mon, 01 Aug 2022 13:44:03 +0000
Received: by mail-io1-f46.google.com with SMTP id l24so8353891ion.13;
        Mon, 01 Aug 2022 06:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=zsZQN63lOHh8h4GXaIvhTBnUEILZRHFu8ewz58HKTGY=;
        b=KfC1GU+t34iyivo4WqGGAX9luPG0ZtOyKZytzGqMRuLlZefxuqlF5UyxqvsnKE8vyt
         LqUrEObHCW3ns2oFCinn8X50QoXCbVsDNVOl5cE+XE4JZjq/DN5mYEPIs+sPVLysHkPt
         bJNuK/jJjbwHIBIgCS/cOrCkL4oRrB/dZ+hxSmJc2xe9YwTiWSIYWBZygvdq0Go9AX+6
         YHTrdGa7Ck9tK8yqP0BClA89bSk6FKfDRU8UrMslhaiFDnLigEPM9zCkTurdq/GeC3pi
         O63o+pnzM9uSmud0T8raUKeokEO1w10yBKwDkzfCMDRbd1WeMLSjei/esopvsgFmYV+A
         lsKw==
X-Gm-Message-State: AJIora+id9plkxCDXeu0QjltqRc1SrXlH79WmhZAhcadTn7K9WnGYAc1
	pmOP/Fmf9H7OopnWSigq9PGe6UBWgQ==
X-Google-Smtp-Source: AGRyM1t9Mj5nTHd4BV8E79tZn1dYTdEMV9X5kGdVN8crTiTo4iJ1VJeyJLdxHMNomc1wjgRKUpobrw==
X-Received: by 2002:a05:6638:30b:b0:33f:8d28:4d85 with SMTP id w11-20020a056638030b00b0033f8d284d85mr5996500jap.13.1659361436772;
        Mon, 01 Aug 2022 06:43:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t3-20020a02b183000000b0033e9c4c6a9esm5149828jah.82.2022.08.01.06.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 06:43:56 -0700 (PDT)
Received: (nullmailer pid 914821 invoked by uid 1000);
	Mon, 01 Aug 2022 13:43:53 -0000
From: Rob Herring <robh@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will@kernel.org>, Chris Healy <cphealy@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>
In-Reply-To: <20220801060049.1655177-4-jiucheng.xu@amlogic.com>
References: <20220801060049.1655177-1-jiucheng.xu@amlogic.com> <20220801060049.1655177-4-jiucheng.xu@amlogic.com>
Subject: Re: [PATCH v3 4/4] dt-binding: perf: Add Amlogic DDR PMU
Date: Mon, 01 Aug 2022 07:43:53 -0600
Message-Id: <1659361433.078688.914820.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_064402_178427_2AE74CDA 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, 01 Aug 2022 14:00:49 +0800, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v2 -> v3:
>   - Remove oneOf
>   - Add descriptions
>   - Fix compiling warning
> 
> Changes v1 -> v2:
>   - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
>   - Delete "model", "dmc_nr", "chann_nr" new properties
>   - Fix compiling error
> ---
>  .../bindings/perf/amlogic,g12_ddr_pmu.yaml    | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/perf/amlogic,g12_ddr_pmu.yaml#

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
