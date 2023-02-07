Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B062C636CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5vEpqejJL2gmblww537B0MfupdX46p97/3ZTbXsoco=; b=Co+3CpFm+NbG69
	7q4utz2ZPwVPxOcfnAuYHFo/PPTOfNPwjdQPjKlD3Fz8Jop/4ySDMOkf7igvWepJo2uBHmjIlX1O6
	158UjY2wUX4v/gaUQs599skPrepan3q0UkXelVS+iP0zqvkW/yacdabLKErCbnnnWvCVp6WUpgXJN
	NtOWDTdtlHN2IPfx2K2A7YPzsXaBDyJstV6nfWFwckojDk73CNt2Av8AGK1GAtWHROUq43y/auk3Y
	QQSRw/5QoJhY8egaAG9dZnTlXbG8xrQMCqjtJ/N+xsULyAV1jZYBTiqHYg5uoJBtSHxva61okSBWT
	Qh+ljg0uJteuySAc+tIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKML-00BVC8-4T; Tue, 07 Feb 2023 09:33:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKMF-00BVAG-JN
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 09:33:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so565493wmp.1
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 01:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=8PxGYDQ7050hUgTLYscGuzXllbJKzPjPKyLOB6Wlrjo=;
        b=nseoynKl6Jy2ScxAfRj0HrX7qUwIqGb7zjc0T/2N+jzmisGjIBhcZe8qX/r3oVew9m
         mgJL4de/kMuVjooR8M1HCLyjb/2XN8Q8rSyM5d8ZD/Zd1uBdBDXsdPvhGppXPdc2a9ad
         QH4TAJDrSM0nmaOc4bDruO2gCEe3gjaJNv/2dOik3H51S9XcFV2w+7gLFrQFpGX9Ypmk
         ahPzZsZyUToaSmcOF/lIPrU5fYksdDze985GVR4bEw0NVhHgfpr8GSAhqIvXBUWIeEnz
         ACl01bAYJz5NUWcKdW4XrxzPSkFvr8T8spCFCRcy5LufICxWpWBGq1Husqvlsu9b4TW3
         D85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PxGYDQ7050hUgTLYscGuzXllbJKzPjPKyLOB6Wlrjo=;
        b=2EooGbtMdznCbZf2v6DiESeTevTc2F8tPGWEZOF017NujYSTKH4+GX6ZJhT98XwIGC
         irf94n4ewZG0SVPFrxUlQyjD6tX8JUzSmdK9vOu8g+jcEkMFuL04g6rSgYp2fYTO5rGo
         9K3Xr5wVEXqQYtj3HSyEyFAypm2WQIkStE/NpPRF80fr5hB8Y/+BLMLvf7ou8RkkFL8v
         d4vPIAd/oD4WPniw1NEwsAShFB+0Tp75wkZlR8ltRackI1IQcjLzwu2CP/fg67HLGSJC
         2mHhxIE6I9gymyHGF2haULy8mGSHKVbiG/hyBDr2oSjRrTl1mOjvNAx5dx75uinuZ+hU
         IJyQ==
X-Gm-Message-State: AO0yUKUSzCYLKec3q7HuBd4xtMN52Sf8Gu/Lp9+Yct3+4UuOnkZdrXzP
	XEhA7ZI1onqNcU915t0RXfzAcw==
X-Google-Smtp-Source: AK7set9PZDReFALR1aMtqwOzve4hwOZf9PGErxwjDd/BKVseEzEILgyBlESqGUn3B5zmiP3nYCTErA==
X-Received: by 2002:a05:600c:1817:b0:3df:e54a:4ac5 with SMTP id n23-20020a05600c181700b003dfe54a4ac5mr2468276wmp.27.1675762423657;
        Tue, 07 Feb 2023 01:33:43 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b003dc433bb5e1sm14240200wmo.9.2023.02.07.01.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:33:43 -0800 (PST)
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-3-jbrunet@baylibre.com>
 <167571334291.1212116.1869881432057405431.robh@kernel.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
Date: Tue, 07 Feb 2023 10:29:51 +0100
In-reply-to: <167571334291.1212116.1869881432057405431.robh@kernel.org>
Message-ID: <1j7cwt3jm1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_013347_659599_6D887DAE 
X-CRM114-Status: GOOD (  18.62  )
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


On Mon 06 Feb 2023 at 13:59, Rob Herring <robh@kernel.org> wrote:

> On Mon, 06 Feb 2023 16:34:44 +0100, Jerome Brunet wrote:
>> Convert the DT binding documentation for the Amlogic tdm formatters to
>> schema.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>>  .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
>>  2 files changed, 88 insertions(+), 36 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
>> 
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml:
> Unable to find schema file matching $id:
> http://devicetree.org/schemas/sound/component-common.yaml

This is a false error because the bot does not have the patch applied
by Mark from v1 here [0]

[0]: https://lore.kernel.org/all/167543616131.928818.17902040818579023398.b4-ty@kernel.org/

> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.example.dtb:
> audio-controller@500: False schema does not allow {'compatible':
> ['amlogic,g12a-tdmout'], 'reg': [[1280, 64]], 'resets': [[4294967295, 12]],
> 'clocks': [[4294967295, 35], [4294967295, 127], [4294967295, 120],
> [4294967295, 134], [4294967295, 134]], 'clock-names': ['pclk', 'sclk',
> 'sclk_sel', 'lrclk', 'lrclk_sel'], '$nodename': ['audio-controller@500']}
> 	From schema:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230206153449.596326-3-jbrunet@baylibre.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
