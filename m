Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ADBC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 04:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hj0rirV2cVtLn5deqWMLp6Y+hmsPapKDeU/Gc1WSBDg=; b=xGLl967azoYNK9
	v/2KJiqtkTfjHqa86kHRiESGj3Nja5DPQ07sSLwnmhgEYOfXn1kmdLrUiupqNFrlcsr7/VabgOBFR
	Xfe+GyizX174QuP05YyvfHcFpDXJ9izO8KAVuxBooPfFTIWQ0Pby3iZNBmiLTnAhpBsbpiNoRQvlq
	mgK53/Fbsv32lHMVbJt0pZXIiBQjEqEO8Q8sJ/LXKaXzVQetmH/YsG0xiC9FSDgBaPltEYMiBH5ux
	hBwQjEC80jcQ7LrF3ZNViLFcxnTWKXt0MbrzRLE7vNSNNMNR/8QkUzUNGsnk1FiTA6z8dlV1ShxfD
	uT6CeHmhgKaD4w4pZwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0xNe-00D6b0-Ni; Fri, 02 Dec 2022 04:10:30 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0xNM-00D6U2-AO; Fri, 02 Dec 2022 04:10:14 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1432a5f6468so4398078fac.12;
        Thu, 01 Dec 2022 20:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tztRLB6mzSF4TXzBNH2EqTDisdRWShlDqP2hXZ6ZShA=;
        b=eOPRLXpwND9Ci0WDN4i8w26ByWpjMblqslegcaJIWweGdODfnSpbzyBg2qlw+jSPGY
         PkxvC33pNdxWTp258GsHZVMbWw9T76QLduCbfhVJNORHRZPM/UYRKXWu6IlBD9N4i9ui
         CRCoS8+O89U6D6yGf4pL4FZP58/PsSjq43tBYPMUn5Yoayof6Y6VhI4mcbSzS8EcjFmv
         cq7+ASKKDL8l1ekM0yHc5VUCgw2tJ/4itWRV2RZLnL0mCzy1u2dIIFdhFGTgEKaQ01RF
         iFNLakwy9mU2dqVhec/v/nEVRpFg4k61kWvklHgj1CqBUNGlpSECRA/3v+ZolexKyUor
         falg==
X-Gm-Message-State: ANoB5pnvFS7LKxgUV031sTtQ2L8P5wc6LUsYvnpt4JYT8jeIvlCU/U3v
	/13mztDySlkgRGwiQyGLnQ==
X-Google-Smtp-Source: AA0mqf6gG6R8BWacHtluarpNJ8HkJUosCxyDgCp9hbhu6ftL/iTTIfVwtgs6UTN5W3nPfjPGq686bQ==
X-Received: by 2002:a05:6870:9a18:b0:142:efc1:1394 with SMTP id fo24-20020a0568709a1800b00142efc11394mr27456427oab.11.1669954207422;
        Thu, 01 Dec 2022 20:10:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o126-20020aca4184000000b003544822f725sm2605035oia.8.2022.12.01.20.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 20:10:06 -0800 (PST)
Received: (nullmailer pid 2118014 invoked by uid 1000);
	Fri, 02 Dec 2022 04:10:04 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com, jian.hu@amlogic.com, jbrunet@baylibre.com, mturquette@baylibre.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rockosov@gmail.com, kernel@sberdevices.ru, neil.armstrong@linaro.org, robh+dt@kernel.org, sboyd@kernel.org
In-Reply-To: <20221201225703.6507-4-ddrokosov@sberdevices.ru>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-4-ddrokosov@sberdevices.ru>
Message-Id: <166995398331.2089708.18189499743713568568.robh@kernel.org>
Subject: Re: [PATCH v8 03/11] dt-bindings: clock: meson: add A1 peripheral
 clock controller bindings
Date: Thu, 01 Dec 2022 22:10:04 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_201012_405192_161BC8B3 
X-CRM114-Status: GOOD (  11.50  )
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


On Fri, 02 Dec 2022 01:56:55 +0300, Dmitry Rokosov wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the documentation to support Amlogic A1 peripheral clock driver,
> and add A1 peripheral clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       | 65 ++++++++++++
>  include/dt-bindings/clock/a1-clkc.h           | 98 +++++++++++++++++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#
Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts:18.48-30.11: Warning (unit_address_vs_reg): /example-0/periphs-clock-controller: node has a reg or ranges property, but no unit name
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dtb: periphs-clock-controller: reg: [[0, 2048], [0, 260]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-4-ddrokosov@sberdevices.ru

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
