Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F843C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmuYF0lGDoEM5FG4Cfsj0rb59oHiUvHu7zmhuPiMqa8=; b=o5VJYNipaSk6eI
	qyeu6xOMluwJhP2rckcrYyGYN4nhKigcsZBFYc1xo/GUMxyhQCFBtgUlPVSx/TRlDf31shDRl1DGm
	NduDPHdPy3gkIXPhTiDMDg3HSeVw1GLhS/79Dsy9ddqBePiBTXl6biFzOcErbVs9VBPc8MTVqH72X
	t/EzlkMZ13num8rVMYhadFoK3czOYK8odi5qDh3xXuem9KcgvEONGNHAd2WVwYYFjoC567kuFXrON
	LUwvQGpvJLv1F7I+N7e9+DcRd6g29l5v2FRoKaanzUYVOfyCH5PVMqWlgCjrJ7NT4sPkp/iNEShbv
	HpBdsva+PasYd0Y7WExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13SI-00FdAz-0e; Fri, 02 Dec 2022 10:39:42 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13S6-00Fd4t-EN
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:39:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id p8so6751574lfu.11
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 02:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ef557i72aMQlngP0CR0TyvH/ZX7gYwQJNFizHVtrS8s=;
        b=ek+L0K7Nla/F75a0wpr2UxYvBlS35TOSE8Y4aOZSPRGN+orKx3eaQmegEynNl4VcZc
         rQ8hj2UGt2g+Nd2cUGE5/A9iur4qvaD58k9HH0c85RQ38SpLWG190z/TfK+OB5CB28XE
         6Ob8d3L7p+39h8slyCLdErS2iDCLPk0DvJBMvVO8sj5XfZtOcrQ0eaUueB0S2HErbJsh
         greR/NkPNQEjF5eTng5Na28Rn765Kz0qPJPk0BDWr3DpXxThA8iClKOsotMR5x6WXPf2
         EJE8QX0vt5BCeAScVGIzjA9cuOsmysGD8Vd/Jsjnf8MoU3Jq1UtS8FMrQzF7oPvvZ8Yx
         EQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ef557i72aMQlngP0CR0TyvH/ZX7gYwQJNFizHVtrS8s=;
        b=Kk6cbi9IrwyVKqFlchgaAoIvzVz+T9N7ecWgZZmjP2jsJeIrcmUQSGoSJ1VSh2/wS2
         5FgrbAKViJ72cEuY6SvvVRCtnoJSPa+EMBK06q3VFAtnLBMKMyJxNom7A/cMqTe+PfWj
         Me8T7IB4bQBLR7D4sLpxlBM9ecYiI38B1I4cMdDQDPLC6AmZP6ejM+XbRNLGWp6vjlEn
         rjmunOmh7BTeVJ6iVvt8IUevF5qcAIQmcbZIklzFkSR8JZ63lQsHnehkQVLBdxA9vUo5
         yG62c/Ak7zqs90lgd+JhmdS04O3uT6/rw/M5AL/OCVrmlb0BD+OZF2pFqdmJx4sLR+9f
         Biww==
X-Gm-Message-State: ANoB5pnZpHCWntomIQyL0mrfj2gPHkqKkiJXXNd8JN8bSJYA0DxwU+9m
	EOjAoqJQeW9oR0de/JJI624H8w==
X-Google-Smtp-Source: AA0mqf5CiqJzkOnZgB2HygNfmbp7IoLeH7ChCoKN+8ZqGkL7yeYNWcM7WmVgmTfPsS+E7EtfU93Idg==
X-Received: by 2002:a19:dc08:0:b0:4b4:6460:24d with SMTP id t8-20020a19dc08000000b004b46460024dmr22964505lfg.386.1669977564984;
        Fri, 02 Dec 2022 02:39:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v5-20020ac258e5000000b00492ea54beeasm972470lfo.306.2022.12.02.02.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:39:23 -0800 (PST)
Message-ID: <cea3cdd4-3d36-1439-b211-047091c05a0f@linaro.org>
Date: Fri, 2 Dec 2022 11:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, khilman@baylibre.com,
 kernel@sberdevices.ru, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org,
 jian.hu@amlogic.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, rockosov@gmail.com, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, neil.armstrong@linaro.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
 <166995398251.2089685.16059995540663317860.robh@kernel.org>
 <20221202095124.4ecpfqhtzf34lwbf@CAB-WSD-L081021>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202095124.4ecpfqhtzf34lwbf@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_023930_493065_EE9B49A2 
X-CRM114-Status: GOOD (  17.35  )
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

On 02/12/2022 10:51, Dmitry Rokosov wrote:
> On Thu, Dec 01, 2022 at 10:10:04PM -0600, Rob Herring wrote:
>>
>> On Fri, 02 Dec 2022 01:56:53 +0300, Dmitry Rokosov wrote:
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the documentation to support Amlogic A1 PLL clock driver,
>>> and add A1 PLL clock controller bindings.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>> ---
>>>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
>>>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>>>  2 files changed, 68 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml:26:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
>>
>> dtschema/dtc warnings/errors:
>> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
>> 	expected: http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dtb: pll-clock-controller@7c80: reg: [[0, 31872], [0, 396]] is too long
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-2-ddrokosov@sberdevices.ru
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
> 
> Please find all fixes of above warnings and errors in the my patch
> located at the link:
> 
> https://lore.kernel.org/linux-amlogic/20221201225703.6507-9-ddrokosov@sberdevices.ru/

Why? This patch here is broken and it should be fixed. Don't apply
broken patches...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
