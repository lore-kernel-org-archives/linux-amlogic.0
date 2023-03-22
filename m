Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB64C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjJYinhBSccWuyQof4dPw5fbq//lSIRpUzEPMfLJgkE=; b=SLo4j4ziNPxTGS
	UqheuhB3UM9JiPT/7q0VxZOUpXtW8xTMZLFmxEuyq6mtINDUlIkBNMWrfHMSWCadDvkrWuj6qVBLV
	aFdO+pz83eOl40vMyqISzXZbSAT9tN+M5SzmDhE8LJrNB9+ySANib5GUkyOlFlW65uXqjmy/pwGgS
	oiNZEmt1xbi8C5FB/KHTWhPJuFJl5z8S1GpdrxXTjsRfMbjSZ5pkoDX35tO0wlur594Hav5Irg13j
	MNC8kuO7JyPvmw0HW8XNjGxa2AHbAr2eFKQarnHa8w2icPGhVk2bT6ZIy8QYaDWPeEdMZHEH1/cpm
	j8HJRZROWu9iV9iXVX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1oB-00Gka3-0O;
	Wed, 22 Mar 2023 16:59:31 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1o7-00GkZ4-1U;
	Wed, 22 Mar 2023 16:59:29 +0000
Received: by mail-ot1-f46.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso10708467oti.8;
        Wed, 22 Mar 2023 09:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679504366;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NWqyrfUQQCISr39NkQZ5Ma1o6AYL1xyxzggPNypbXQk=;
        b=KoEsZOW1dbE69VDOiCAWPrG17Lx+Or/7xBKp8sGhvG+sKh0DlTdoGdZtHBx5kSMeO/
         w9HaNjwPo6jJn/y61SSADpjWuyPbp6bm9AjyES2jVFa8a3CImoom93iRNkShjWlIH6tf
         bdCZZcRgucD7o+K+TQEMD3cmtbO2jo7/INciUmGKKKg7rAw/tH2THjkMnZTLY6LLnwqL
         AxB5NRWVhjqbW8O8qGJ5d4mzB9n0NJg636tL3adVDp5akXBxTNJnQkZb3xdwSJy8CxyE
         eRjT7INovJPgt4rwuFo9uL8v6Za06IgqmldLCyyoQlTnqvCru0C0dhdC0Ez/9V43+hrt
         lzEg==
X-Gm-Message-State: AO0yUKXwrtWAHT1c3MOcrNr2yhxhqkgscHMgj48dyhkZZ95qbw2XQEkI
	Fw8s8ju+8FYiN5RqsPa7fw==
X-Google-Smtp-Source: AK7set9pHTty/88AsdcNbe/96VYXZqDeFXpGdlF3m0B/sOmCD6PE7StmwAMdHsnvOsbVvW2GQIarqg==
X-Received: by 2002:a9d:7544:0:b0:699:896e:c9e1 with SMTP id b4-20020a9d7544000000b00699896ec9e1mr1605607otl.34.1679504365842;
        Wed, 22 Mar 2023 09:59:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a7-20020a056830008700b0069417e65acasm6669680oto.45.2023.03.22.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 09:59:25 -0700 (PDT)
Received: (nullmailer pid 3916336 invoked by uid 1000);
	Wed, 22 Mar 2023 16:59:24 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Mark Brown <broonie@kernel.org>, kernel@sberdevices.ru, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
In-Reply-To: <20230322150458.783901-2-mmkurbanov@sberdevices.ru>
References: <20230322150458.783901-1-mmkurbanov@sberdevices.ru>
 <20230322150458.783901-2-mmkurbanov@sberdevices.ru>
Message-Id: <167950430158.3915000.3991863797525882649.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: spi: add binding for
 meson-spifc-a1
Date: Wed, 22 Mar 2023 11:59:24 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_095927_500264_DE459E26 
X-CRM114-Status: GOOD (  12.65  )
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


On Wed, 22 Mar 2023 18:04:57 +0300, Martin Kurbanov wrote:
> Add YAML devicetree binding for Amlogic Meson A113L (A1 family)
> SPIFC Driver.
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230322150458.783901-2-mmkurbanov@sberdevices.ru

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
