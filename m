Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBF1C7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 19:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+96dSlAUlq8uNQKcJOyHha4h5mzBLMnRp2bPrZqxgMA=; b=x6JDmCdOe+C80q
	mLsHagaqz9NSQN7V8m6zGHrmcHw5ISI/5QShpvMMhIMGXUFvEm/Rn9FrxtzTGWMBmdx0nJV4JmAZE
	tsm+AI6RculDaveYM1MUudM3rRudvdm9u0e9yNBsUgC1SfO77Th4CJxsM0F4tS05j0vXK28XDcydb
	s6R6W9WXXSMTOak+7QiJR+zVbzXvY6pAj6T/PkjhSz5y/33oDGwOYLokJj97fwwl3uMc7DiX+D3KY
	ZSVpYp5WRXbxBzF/hBstxMmkbTMaoMYQtADEho+p9ehw2vPXThpwe941SK9710RW3BEljM3THzj78
	lMHpBDQ/0ksFBiOqpjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSQr-00HKQs-KR; Wed, 01 Mar 2023 19:48:09 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSQd-00HKL5-BJ; Wed, 01 Mar 2023 19:47:56 +0000
Received: by mail-oi1-f179.google.com with SMTP id bm20so11740016oib.7;
        Wed, 01 Mar 2023 11:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=clNbV4Ko4NJT19I6+Oqtc9INMNPkACGZh64+Ou/afM8=;
        b=wwSwwclzh9kuhF5aMJ5kkj/k1iVJkAukA8fMGSRzGK6lQoOV/hQsfRpcYd4CR3mg0Z
         OzmwD4GV/mXl2zJcRy2skM4ff4+l8U/FbcwSpKvlUAznJmehv9FAcorY376E6zI36Gmv
         xJNmqShij2F8FN++jj5MByKpLHEYRmt1HwgSEC6rGMYR4+6l5qyJwXuBB0LFKiMnxw8R
         Vjsw0yXnNj+OogGIZmm5+dVVQHQWJsAOyfIbHD3Op4L48bd5ChaUK7eg8zRKYGzThuH6
         0ix9lmUH73+eJmyR10FUMhjr6qwTTp9eKKfFEUIfwtFGvx1y58TE0Q1IzMJiJy6/ukVN
         Qx0g==
X-Gm-Message-State: AO0yUKWs74OKXIBlvk6ZTTRIh5LHbUA9XwjKhZkByZ7dhbPnk4jL2Tvl
	4/voOQ011XB36qmbtlH9jA==
X-Google-Smtp-Source: AK7set+ft3p4hKKEupo3nob49fV+/K7cx5dQaiYNeim8LsnR8L3CFt08Zm+ZZ29rxbq12+CCWpeukA==
X-Received: by 2002:a05:6808:312:b0:384:32e0:e0b5 with SMTP id i18-20020a056808031200b0038432e0e0b5mr3400605oie.11.1677700071861;
        Wed, 01 Mar 2023 11:47:51 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e4:92a3:b465:3c5a:901b:f4f7])
        by smtp.gmail.com with ESMTPSA id a6-20020a056808120600b0037d59e90a07sm6243697oil.55.2023.03.01.11.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 11:47:51 -0800 (PST)
Received: (nullmailer pid 9118 invoked by uid 1000);
	Wed, 01 Mar 2023 19:47:42 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, mturquette@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, linux-clk@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org, rockosov@gmail.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, jbrunet@baylibre.com, linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, martin.blumenstingl@googlemail.com
In-Reply-To: <20230301183759.16163-6-ddrokosov@sberdevices.ru>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-6-ddrokosov@sberdevices.ru>
Message-Id: <167769997434.7177.16688490192170246531.robh@kernel.org>
Subject: Re: [PATCH v9 5/5] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Date: Wed, 01 Mar 2023 13:47:42 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_114755_429811_E46F4517 
X-CRM114-Status: GOOD (  12.99  )
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


On Wed, 01 Mar 2023 21:37:59 +0300, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 Peripherals clock driver,
> and A1 Peripherals clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++++
>  include/dt-bindings/clock/a1-clkc.h           | 102 ++++++++++++++++++
>  2 files changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts:18:18: fatal error: dt-bindings/clock/a1-pll-clkc.h: No such file or directory
   18 |         #include <dt-bindings/clock/a1-pll-clkc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230301183759.16163-6-ddrokosov@sberdevices.ru

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
