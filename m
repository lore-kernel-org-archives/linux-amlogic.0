Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5970FC7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jz0Vk1OAvlmGIVqkOpHvkxple/6brAq7fQM6KrhQAL4=; b=N3rkoIIGCvpF7F
	2tVgPyAPaKiwQd1yPMnSLl+g9Xh5uayvlaRTtLAVoJBilXeD/ryRfLVscH2TniGexvkAtE/tNqug3
	ysZ8PdPPLJNKIWuK7oN2Fk5hZodt1K+51EvKOA8UTuDV1SLVBZ8oQtpvgJ6wjW0jSP4dXihbe8QEj
	CHEDj/sZmjYqdmw0qAGhxlQNiA/CBRpz0Vbdy2CnhmHdbofPi4ICkkDHOlroKRrCvDagsPu+kTtwy
	91T+/Vsf8RAt1JDgxTyxXnF5/6Ke0qiqQIlKRcPelXG2gcmveGskLSxXulq/ZD/AEkjyB9VlprDpj
	y+XfYD5q7e011pXIaUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSQc-00HKLB-3Y; Wed, 01 Mar 2023 19:47:54 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSQZ-00HKKO-FE; Wed, 01 Mar 2023 19:47:52 +0000
Received: by mail-oi1-f181.google.com with SMTP id r40so10711559oiw.0;
        Wed, 01 Mar 2023 11:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bp2PGCxGuMgOJ8cORfOtpk4XODU0Ny1bCo8g3l2fvo0=;
        b=dQRCaWrX1I1YJ/hGsqnXMso51z7cTwO783NP8nT73jheSzBSN/H04zZ8oHd8lvrvzZ
         1zn4Hjs9kPvCggCVaqcR33ByUmqH9nD+C/W5jXKlZID6pqY19PB2P4mGGyEQVpOX/Uuo
         R5Ka7h351GX0k9qcGArQW9Fy1Gilew2TtYi6HOwGqUb9FBNPlgxzl/L8nD/9USWUBAvM
         ZXxlB6YjYt+uB46J2bdxAXpkZOszjA6wn7J7qrzqJUH2zfMvXDoqVYZhmSrFW6UZEBFh
         9PC3BETFJZTqQeWJCo6hSW2FYzmDYcHlkmmnCRXMu2ZN3WsQSSOIc3Vnvk22FsdnvTi4
         qOZA==
X-Gm-Message-State: AO0yUKXy97oTX0iB90JkcA+EGAedqVFhlsaPFqFQU8xnpMIpccKs+Ccc
	yQZXUl06cA9R1DF5kGCeIw==
X-Google-Smtp-Source: AK7set//WZpJLFD2TfIqVNwVy65QznG09dAJ6oEmCVH3aAhJpxFT6+d2dZsCAvYjXd/LCdpVVdQm9g==
X-Received: by 2002:a05:6808:8d:b0:384:4621:a3e7 with SMTP id s13-20020a056808008d00b003844621a3e7mr3949011oic.38.1677700067221;
        Wed, 01 Mar 2023 11:47:47 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e4:92a3:b465:3c5a:901b:f4f7])
        by smtp.gmail.com with ESMTPSA id i5-20020acaea05000000b00383b8084203sm6173577oih.26.2023.03.01.11.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 11:47:46 -0800 (PST)
Received: (nullmailer pid 9115 invoked by uid 1000);
	Wed, 01 Mar 2023 19:47:42 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: rockosov@gmail.com, mturquette@baylibre.com, martin.blumenstingl@googlemail.com, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, kernel@sberdevices.ru, khilman@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, jian.hu@amlogic.com
In-Reply-To: <20230301183759.16163-4-ddrokosov@sberdevices.ru>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-4-ddrokosov@sberdevices.ru>
Message-Id: <167769997208.7087.5344356236212731922.robh@kernel.org>
Subject: Re: [PATCH v9 3/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Date: Wed, 01 Mar 2023 13:47:42 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_114751_554167_23E932CB 
X-CRM114-Status: GOOD (  14.11  )
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


On Wed, 01 Mar 2023 21:37:57 +0300, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 PLL clock driver, and A1 PLL
> clock controller bindings.
> Also include new A1 clock controller dt bindings to MAINTAINERS.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  include/dt-bindings/clock/a1-pll-clkc.h       | 20 +++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dts:18:18: fatal error: dt-bindings/clock/a1-clkc.h: No such file or directory
   18 |         #include <dt-bindings/clock/a1-clkc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230301183759.16163-4-ddrokosov@sberdevices.ru

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
