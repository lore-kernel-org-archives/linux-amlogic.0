Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE455C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 01:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yChWK+7H9Lz1kkM2M2pyd4y6EdeBiBdfBVVywbNMiMg=; b=dV/JeDJcKF9RAp
	nW0nma2UIoL0ADaCMua1qp+BUxVOGZVw5SNuU+DdqtqX49F7V4FwR8lJybZNdCjnGogY20VNvKlsE
	MLi+FMJCfmxuCC8dx6W/khJ62YK63kSR6z5rQ2Jr8cQoa2nqnMvkJqdXml+NDb8v2U/PIgP44Iq2l
	qIOtppT3Fu2EWDxROewQ9Xcsl6X4Mg9IyuX4LTIAiXtZGAuHgqi36PqJByc3PyCljiz4Y+CQN8wyl
	yRfD/e2s3bgtA9mHrbaIu4T0QpmczPh/J4ZmmOgLRVaNckZK4GjY6euIyL5C5SM3vJ013olaJ28Ty
	jmfnW+Yf+mncPZVZkJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgyWo-00CpoM-1x;
	Tue, 28 Mar 2023 01:53:38 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgyWl-00Cpmh-1t;
	Tue, 28 Mar 2023 01:53:36 +0000
Received: by mail-oi1-f170.google.com with SMTP id s8so7905264ois.2;
        Mon, 27 Mar 2023 18:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679968412;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYTrnhZDgTTeegxUWGeV8K3c6cyl+HkrWWPDkDux9pU=;
        b=RzCcx/U9H21VpTHtK4HYm/wCT9RVA7NoDVFJQmwFTj8TORsN+5p6jdN2D+wztlopXT
         NRJGz7jiQayBQJOx+XFAvl4OgIDlNwrBYlVfDJXgU8IGjatacKU9iCCAMrgX8ewKh8DC
         ZuWXzN/99krJyHi7GDzuxLZ/lnEFyh7LwdzppVQzXQkkOGWDJhyDU1bE8HHXEyK8B/hq
         88D7BR2q/MldKbED6rZpCpWhkdoSe4eZtSCcaS25SQ6SglNe64AcgTRrl3LuR8o4QtR4
         JS8CQYq+TtAGac6vlk0D00uMkpAcxAOwKGKu0nO/DDdmVKoRFPdyKx2mXuTq9s86xZpJ
         14IQ==
X-Gm-Message-State: AAQBX9e56bviSvzP1k/pGEij3pkwk3Fi3eKzRY2bSdpDKy0QTycmu+Tr
	ZW6Y967FU3sEnYohR15wbA==
X-Google-Smtp-Source: AKy350bkl4fqTt6QpZi7WIWnPrZc4ldPQfRH8qICoYIokHV33sGARNUQ+fGNzFRukXVsK+zOdQwpgA==
X-Received: by 2002:aca:d9d4:0:b0:389:14bd:8246 with SMTP id q203-20020acad9d4000000b0038914bd8246mr3887280oig.13.1679968411696;
        Mon, 27 Mar 2023 18:53:31 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l20-20020a544114000000b0038413a012dasm7270451oic.4.2023.03.27.18.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 18:53:31 -0700 (PDT)
Received: (nullmailer pid 1306392 invoked by uid 1000);
	Tue, 28 Mar 2023 01:53:28 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@sberdevices.ru, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20230327211351.686831-2-mmkurbanov@sberdevices.ru>
References: <20230327211351.686831-1-mmkurbanov@sberdevices.ru>
 <20230327211351.686831-2-mmkurbanov@sberdevices.ru>
Message-Id: <167996718827.1276101.10705861652259578341.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: add Amlogic Meson A1 SPI
 controller
Date: Mon, 27 Mar 2023 20:53:28 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_185335_627726_3CC964E0 
X-CRM114-Status: GOOD (  14.01  )
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


On Tue, 28 Mar 2023 00:13:50 +0300, Martin Kurbanov wrote:
> Add YAML devicetree Amlogic Meson A113L (A1 family) SPIFC Driver.
> 
> This patch has dependencies on the A1 clock series which is still under
> review - https://lore.kernel.org/all/20230321193014.26349-1-ddrokosov@sberdevices.ru/
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>  .../bindings/spi/amlogic,meson-a1-spifc.yaml  | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.example.dts:18:18: fatal error: dt-bindings/clock/amlogic,a1-clkc.h: No such file or directory
   18 |         #include <dt-bindings/clock/amlogic,a1-clkc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230327211351.686831-2-mmkurbanov@sberdevices.ru

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
