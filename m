Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86C0C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 04:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A4kiPiF4cnXmS10T/Ga5Ji8pnYV4wDOBV6RZ6SYwog=; b=BjeTqrF2kyKTxW
	UpWUPMC/L2Cgt/aHxZDiJMC8+cwYafF7+fqq09v/vL38d0wWIP4+bOKkBknQk7u7803MkKqY0SY5x
	jyf+6DP6SAy97wCEdOqcmaYg0ov3Zn8zKU6pUj1aQSDPKppDIJFJGwtvhbOiSNiHLG/QNwWh5otx3
	PC8Aq1z9Sef/eNl/RmsFD8NHlsSWNpjJ40WpY1oN4w8Q9i05GU1pDn9mjYUaBH48ZN4miG3H6E9IH
	anFjQZxPRLtXZvVNK+wRAPYJ1xKrjq2fxqZljxdtlfgYNF6DfLeiILBZDCruIOuOcnf1jzxR0pqRh
	KooTBnj58QOw7KNlJORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0xNW-00D6Ym-Gh; Fri, 02 Dec 2022 04:10:22 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0xNL-00D6Tm-L7; Fri, 02 Dec 2022 04:10:13 +0000
Received: by mail-ot1-f43.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so2262243otl.3;
        Thu, 01 Dec 2022 20:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwpvofZtZWOvE931Uob1EiKUjPOMVVWCH9lqebLD3Vk=;
        b=KGSlPdtkd72wS4FXxs09ImLid124UEauxj00bVFGceOPlBASlwXHqnAtClxshBd1n3
         4WgIX7CgVb9MJGncgQQM4o/m/lTYotbLcZiSQB0o2+lVQ7rayHmUsOMo6zxWeLOE/CoG
         B6eIHgQoMSKoyAQPoYfjyjAiCPFXY3cMmQ1vhISYVj37OqZfTuCZzVpoq8+fCjJsT7kE
         4hc7N0G2u0ElEh0c+YxFvQbQppS3w6qaVAOKBbInraz0SEWINmrqEbgFC4EkFSGF/Iuj
         UuVeQA/lSn5Ej3paQ4lHv8e3wGrraCddRCPNJ/foJGyOV1PwGBtkrcfbzel1gByCUOsp
         yMoQ==
X-Gm-Message-State: ANoB5plPVnWVVfK0iJhxGn7C8OliKBc4LoG2fA7qvpFSIjEY0FhUrCuM
	Jj3Qq3OmsE1V6iwiQHCJNg==
X-Google-Smtp-Source: AA0mqf5SsmaLvP52A2IYGBATobGjnwZZWGFa6BSCWZ/mMkz+D/PfdCTzcv4CbYGr+v+4OHkszkFltg==
X-Received: by 2002:a9d:7dca:0:b0:66c:6cf1:7967 with SMTP id k10-20020a9d7dca000000b0066c6cf17967mr34701459otn.139.1669954205964;
        Thu, 01 Dec 2022 20:10:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o35-20020a056870912300b0014185b2b3d5sm3581893oae.18.2022.12.01.20.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 20:10:05 -0800 (PST)
Received: (nullmailer pid 2118010 invoked by uid 1000);
	Fri, 02 Dec 2022 04:10:04 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, khilman@baylibre.com, kernel@sberdevices.ru, robh+dt@kernel.org, martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org, jian.hu@amlogic.com, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, rockosov@gmail.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20221201225703.6507-2-ddrokosov@sberdevices.ru>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
Message-Id: <166995398251.2089685.16059995540663317860.robh@kernel.org>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Date: Thu, 01 Dec 2022 22:10:04 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_201011_713918_71C4698D 
X-CRM114-Status: GOOD (  11.56  )
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


On Fri, 02 Dec 2022 01:56:53 +0300, Dmitry Rokosov wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the documentation to support Amlogic A1 PLL clock driver,
> and add A1 PLL clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml:26:6: [warning] wrong indentation: expected 6 but found 5 (indentation)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dtb: pll-clock-controller@7c80: reg: [[0, 31872], [0, 396]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-2-ddrokosov@sberdevices.ru

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
