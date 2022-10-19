Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4995C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ul8AXtfca4bgilsdMB+TYvSsv0+6j286MhBsGhEtCNs=; b=wnwh+Us8k0U+5j
	/6LI5MynhYUgwadBnohxbS2V/v8YELZ3l4PhYyYqP+NlI0nn2jnMj9Z+CwvyfpZfFEBsqkSdfABEH
	c+HeUO5PG8aSPlqLQxfuRZWclnS6/zRsAIRNpM5KmYP6ectL26xTSfwBiuX0e29mCxSY3UEP+ateE
	/pRnRwaApfj9V8F9nYjMuAYhsCNdnnBbcRYFm3NeVt+UQZWCpWPmUtKTnsWgOzWeByMjKk614uSve
	4VIyNo7rb/+6WcE0ToSsBK43IDHdJVeJHtg7jd/U7piPsjRVMYG/cRgrN7shI+j34MOQXuUY5CCQI
	jSbm7O3bfgtOMm7XHWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olIXb-005qay-3N; Wed, 19 Oct 2022 23:32:03 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olIXX-005qWI-9f; Wed, 19 Oct 2022 23:32:00 +0000
Received: by mail-ot1-f51.google.com with SMTP id t4-20020a9d7f84000000b00661c3d864f9so10429468otp.10;
        Wed, 19 Oct 2022 16:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MS0VPgDd6DBW5Ti7Tsf3pJIozjZqn06guICmD2Kp4sM=;
        b=dNQJKqMOh1DBoL/xFxQ6UqJMbRpqOJzr6GS9f9tymY60/EFaYsvk4oP7eTyeWzzAY1
         CB78PajzpEcoIY4Z6Nybwhh8DT8qPGlqgNcXkedIHubMTjyjV3qZMS2cvmqn/upXYHsT
         SNlZedFXDeJwVibPtJzPOx9RMAIP5l+R/g3nIOFSgfRab5CdVM7wlvT0Ad/5cORenUAI
         ZjD8Pa3F4c5g7S4kWmlkRcagS4WpFkXYA2H42TNRfL8ID/KtUP/xWta14coeCh+bwdch
         IalfrecUmiQBQTg+UfIm7WcOS7t3txfxRYWrjkQy7pLkJM5K/1IVTsPbUGt84RgjFo+z
         s/lw==
X-Gm-Message-State: ACrzQf3i+V12fNflQAwG2LQrdE7MlNM8Jd8jC/YtENg7WVxSnGMzEbfe
	5STfOzpUg4MAyYWDQdg08A==
X-Google-Smtp-Source: AMsMyM6licy+56vLBx+iqqslzytNI3UKFyi0/zd2kw7rkpCogv5TjVOaifRFEOt+ifDYFE23dsBvIA==
X-Received: by 2002:a9d:6f02:0:b0:661:d432:fb52 with SMTP id n2-20020a9d6f02000000b00661d432fb52mr5498021otq.153.1666222317217;
        Wed, 19 Oct 2022 16:31:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s17-20020a4ac811000000b00480dccc0c2asm2117891ooq.14.2022.10.19.16.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 16:31:56 -0700 (PDT)
Received: (nullmailer pid 19942 invoked by uid 1000);
	Wed, 19 Oct 2022 23:31:53 -0000
From: Rob Herring <robh@kernel.org>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Da Xue <da@libre.computer>
In-Reply-To: <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com> <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
Message-Id: <166622204954.13100.10317615531856688163.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI signal states
Date: Wed, 19 Oct 2022 18:31:53 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_163159_391480_9F3C5B3F 
X-CRM114-Status: GOOD (  12.80  )
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

On Wed, 19 Oct 2022 16:01:03 +0200, Amjad Ouled-Ameur wrote:
> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
> pin biais when idle. Therefore define three pinctrl names:
> - default: SPI pins are controlled by spi function.
> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
> by spi function.
> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
> by spi function.
> 
> Reported-by: Da Xue <da@libre.computer>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml       | 67 ++++++++++++++--------
>  1 file changed, 42 insertions(+), 25 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml:46:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml:46:1: found duplicate key "allOf" with value "[]" (original value: "[]")
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml: ignoring, error parsing file
make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.example.dts'
Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml:46:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

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
