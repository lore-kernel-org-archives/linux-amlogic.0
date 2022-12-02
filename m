Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13C6C4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYDWC27JObHlx/y4yQCdsMjCojvRs1T1SCgMydN2l6M=; b=PPaiMEZnVnXg4p
	i26Piwj5INAxXf/fB4XRjsIJoCOT/YpDPqTfgTGuHLjz9RXaRk1SG+OJLhtYW2BJziB0tWNf83eqQ
	O23eH+NcVuyi6iMbUErR3KxzNHgQch4+6ajmEoEAJvgckhcoEdKqsQebyYllMB7ZGNBf96GJQcQWY
	zjw11IJJC/z0y+joBNFODhc8lI5WxVcIM3/ARu5o025yeYy5/dZ5hX1mIT0VsfpJ31JoT1oNcezd2
	PBRQddoXelf+AtYTVS9OeqqGONMkchX3w+/0cHs5dIaQYTRd7ckYuvBYq9bN/tGSzhqBsAX1yUNJw
	ufsBnAuDFcM8Ri9rXmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13xS-00FtAr-TG; Fri, 02 Dec 2022 11:11:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13xG-00Ft5M-4U
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 11:11:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d1so7255044wrs.12
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zPFY6FywBKVj+Q58Yw/8slS+YqsfBvqMM52HPpLV7Yg=;
        b=PK8M1saJytpZlmaXb3XWJFyS5hZ3aAlrzHUwrN6PU6ZaeGcR7pPz4JuaiUSCVdPF6y
         PcAIYFZfibtHJZDGbvk3wIlQ1dKWdMMrlXlQ7DZQ+HTXVPCwSTc+RQUHp8Hj1RDgjGlZ
         On3vt7uwklxoeMeYWvOAjbpUGwmpMzFPPzX7oibG5vs5V3gQneg1WbQi+AZUpwuv0VPb
         3yIYyUI/Qm0upcz1kwIeZAbzZoLUmsyuLMQqAT7WjLaUpU55M8W82UHK8RixmCfbRDkT
         Jg+TxM//BNrTccnwgm5hD2KCkmSSr7ddCsMoCsvm/bkcAepwwVyBSOBE7w97k+btGteg
         vTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPFY6FywBKVj+Q58Yw/8slS+YqsfBvqMM52HPpLV7Yg=;
        b=4tOPn744L1ILvIXalCEQPdUJ1PmxAw/E7J5U6z+6JPfKdmqSF5JFluHGaHpimUb7co
         7K76Kgkyh5nJWHyDAJ7yyIMExwXPtUUl2emuAqcG0Qk4RtFw2PyNWN6ukEktyLMAPnC2
         oKLRSnHKs6M/WDjnxGxeKYqGFZfp5Ct0wh0c6K+3oVjsimofSZdg1Fs1akxx51Ve8VFT
         kEdWJgLgKnlIdV26pFw0mdgGUKGNLsOokALYbI68VLC/QRxvJsONw2cvSkaliV3KyHff
         soM0gTf9cU1+yaGpQCLZD/EJ811s2K096fInCEFCFC0Zb1ZvKS4OrRRORHpg9cIFjKfU
         Jt8Q==
X-Gm-Message-State: ANoB5pkYYtZgL5p4V3TLmQbLlTGo3cCxi1KJWS/gtJEuaZksxtvJB9J+
	Qp4Z3K+sXLS/ldePWpZqRkblpA==
X-Google-Smtp-Source: AA0mqf4ecV5sn0MU3WIXansYGgAefGMmGfieNqDEHYX8GlRHU+otVXVZ8ZQgQ62Qiq3SOe//i8WZ+Q==
X-Received: by 2002:a5d:58d5:0:b0:242:1ff2:eeb4 with SMTP id o21-20020a5d58d5000000b002421ff2eeb4mr11630176wrf.419.1669979498869;
        Fri, 02 Dec 2022 03:11:38 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4b90000000b002422202fa7fsm4038995wrt.39.2022.12.02.03.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:11:38 -0800 (PST)
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
 <166995398251.2089685.16059995540663317860.robh@kernel.org>
 <20221202095124.4ecpfqhtzf34lwbf@CAB-WSD-L081021>
 <cea3cdd4-3d36-1439-b211-047091c05a0f@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, khilman@baylibre.com,
 kernel@sberdevices.ru, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org,
 jian.hu@amlogic.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-amlogic@lists.infradead.org,
 rockosov@gmail.com, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 neil.armstrong@linaro.org
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Date: Fri, 02 Dec 2022 12:04:51 +0100
In-reply-to: <cea3cdd4-3d36-1439-b211-047091c05a0f@linaro.org>
Message-ID: <1jfsdy83h3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_031142_184752_1D0A0693 
X-CRM114-Status: GOOD (  15.22  )
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


On Fri 02 Dec 2022 at 11:39, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 02/12/2022 10:51, Dmitry Rokosov wrote:
>> On Thu, Dec 01, 2022 at 10:10:04PM -0600, Rob Herring wrote:
>>>
>>> On Fri, 02 Dec 2022 01:56:53 +0300, Dmitry Rokosov wrote:
>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>
>>>> Add the documentation to support Amlogic A1 PLL clock driver,
>>>> and add A1 PLL clock controller bindings.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>>> ---
>>>>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
>>>>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>>>>  2 files changed, 68 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
>>>>
>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml:26:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
>>>
>>> dtschema/dtc warnings/errors:
>>> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
>>> 	expected: http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#
>>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dtb: pll-clock-controller@7c80: reg: [[0, 31872], [0, 396]] is too long
>>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-2-ddrokosov@sberdevices.ru
>>>
>>> The base for the series is generally the latest rc1. A different dependency
>>> should be noted in *this* patch.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit after running the above command yourself. Note
>>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>>> your schema. However, it must be unset to test all examples with your schema.
>>>
>> 
>> Please find all fixes of above warnings and errors in the my patch
>> located at the link:
>> 
>> https://lore.kernel.org/linux-amlogic/20221201225703.6507-9-ddrokosov@sberdevices.ru/
>
> Why? This patch here is broken and it should be fixed. Don't apply
> broken patches...

Dmitry is ressurecting a series that is several years old and not his to
begin with.

He was unsure about take the code of somebody else.
To be fair, he even asked for advice on IRC about to proceed.

Dmitry, as you may have guessed, for next revision, please fix Jian Hu
original patches in place, not with fixup patches.

If your fixes are minor (not complete rewrite), please keep the original
author and add your SoB

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
