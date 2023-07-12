Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD33EB64D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 05:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8D292yaQBYZMee+g2HbDIApqa8R09KEm9IZTvsyFOY=; b=FomJNVbCZZ5sEG
	C48CK62V//yGivP1HQJHxV1b5KvmYD8bSx+RJ6qY+73fj5xqRz8nON1vXd0UT13dFhmliJcPYqqhg
	VKh/xRnRo0Id8DWKz31gpvrrXS1E3wmguZaJD60LAUA0Lj8xZWsazC56DSyUx/tNtY6pOpSxNt8vj
	Wp1A3cHgZneBZDa1o5esPfbCm8S2dWeKpVxBXVO7qMWhEf4mSVuch9IGq/bv6AcnUZPgBZGTyfQjx
	gSWBIQtqR42UgYWCZBaCYVeGIzP2tlPj3kQ55ZHkB3ZkB2QrqT45T6rtt7iYPx26RNQotNFP6Lbuh
	tiMcvXiwb4Lp7t0cELmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJSq4-00Gcr7-0G;
	Wed, 12 Jul 2023 05:56:36 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJSpz-00Gcpu-1j
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jul 2023 05:56:32 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e5da79223so3294596a12.1
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jul 2023 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689141389; x=1691733389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1YbKiFqM090gUCnTTI+360ovt+fEPcs/XCL7R+ae5o=;
        b=RDCxFd9ZchsRaClrOnejBcepkfj7xzss8D126jJveGs/1pgb91WAKSVVdZMyrFFxUD
         /tNI5vspbCVmLxFIUcfZeNYvqqAuMKjm65jmBrZZWTCg/uvKhEwWq84Bh8Hlc+ah/ckh
         u9wtiNUIdEam5urofKU5UoBqPpvpsbpdFOHtEWSB2h3DHMhbybwMMLukQyUA9uVOBZhW
         LsJEVHrf24hwUJZ1ZFPadZyN5eah1h02Ue8JQBP/8xcN+EsuQgu5R1bsQyFy9f9axJ4c
         HOsGsGPl4G/SypDFBNchG3m9ujMCgg6uQbq9nhJEW7H4Mqown6n5ShBFPknpJhCN2fGK
         /EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689141389; x=1691733389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1YbKiFqM090gUCnTTI+360ovt+fEPcs/XCL7R+ae5o=;
        b=l0ubIlfBEHQbhDA2O52kqOhV6mCqwO5X2vJ3g/4Yw5LP1ML4V8MW1sOqThjNK3/vAN
         EP4gSSjz74m6+5t7Jkca37w3ocFHFy2LlePVhzj7L9fLx8ov78Nfk8Dg5HzvnKA1MXzu
         8ic8AV5qEFXM+RCmGX++/DjalILAC1iXY8aT7+D4lNWHkBfyrUfjRdGk8vGyAZYJZvWD
         gDocKNg5s86ttiAtAfEvVrO7Zx8lIJgbJ/LA5bJvh1cT4F36N8SEmTMSYznbeIwufGPq
         6MuTZs2jCjIlSdc+qy+Y4Mv3Cae8LMvOnPBRjOMZPI0PPTLe55O3NcVbt6lF3CGcirjC
         1plg==
X-Gm-Message-State: ABy/qLYesIMstmR91gKj9PV1XcbBGTauQOEXYnDQfk9ZdgHbF2HHuwNM
	PdsF7RJU5el+HoCUS+5RiKOYEA==
X-Google-Smtp-Source: APBJJlHv7pp920Fewie/WkiXbegNz0ErB7CfgQSjUAgUmIo1JGCMiDSiavEO+8RiVSbbpzgr+uFllg==
X-Received: by 2002:a50:ef07:0:b0:51e:2974:f471 with SMTP id m7-20020a50ef07000000b0051e2974f471mr13156566eds.42.1689141388970;
        Tue, 11 Jul 2023 22:56:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7d902000000b0051e0eba608bsm2214158edr.19.2023.07.11.22.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 22:56:28 -0700 (PDT)
Message-ID: <33bcb7c0-0bf9-e3fc-ec55-476c0cbd6105@linaro.org>
Date: Wed, 12 Jul 2023 07:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 1/2] dt-bindings: gpio: Add a header file for Amlogic
 C3 SoCs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com>
 <20230710042812.2007928-2-huqiang.qin@amlogic.com>
 <20230710-maybe-mantis-e647d94fd13a@spud>
 <424cb61a-9102-9a43-c999-36939e8d6cc0@amlogic.com>
 <20230711-monthly-return-8792ce346c26@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711-monthly-return-8792ce346c26@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_225631_572355_96C8E973 
X-CRM114-Status: GOOD (  13.73  )
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

On 11/07/2023 20:05, Conor Dooley wrote:
>>>> +++ b/include/dt-bindings/gpio/amlogic-c3-gpio.h
>>>> @@ -0,0 +1,72 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> Any reason to deviate from the usual license terms for bindings, which is
>>> "GPL-2.0-only OR BSD-2-Clause"?
>>
>> I initially used the license commonly used by Amlogic (reference: meson-s4-gpio.h):
>> ```
>> /* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> ```
>>
>> But when I checked the patch, some warnings appeared:
>> ```
>> WARNING: DT binding headers should be licensed (GPL-2.0-only OR .*)
>> #37: FILE: include/dt-bindings/gpio/amlogic-c3-gpio.h:1:
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> ```
>> So I followed the prompts and changed the license.
>>
>> Can I ignore this warning and use the (GPL-2.0+ OR MIT) license?
> 
> If the tools are happy then I suppose you are okay.. I'll leave that to
> Rob or Krzysztof, but if you have a reason for diverging that seems fine
> to me.

It is very weird that company wants GPLv3 and even weirder that it
agrees for GPLv4 and GPLv5 (GPLv5 might force Amlogic to do some
interesting things...). I am pretty sure company lawyers don't want it
and just do not understand licenses or someone forgot to actually check
it. Anyway, it's fine for Linux kernel, if you really need it.

However the argument was "meson-s4-gpio.h" has it, which is not really
correct argument or accurate. Is it derivative work that you need the
same license? If not, why presence of something causes you to do the
same without thinking?

If Amlogic requires GPLv3 or GPL4 or GPLv2000, please confirm it here
with your official email. Otherwise, if it is not a derivative work
confirm that. Otherwise just go with what checkpatch asks you.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
