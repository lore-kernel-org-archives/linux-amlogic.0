Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A8BC197A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Nov 2023 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ie/5Z1S93I0UFn53Klp5JJ/1efqAPaGzNJSpO5e+mMw=; b=kKeIRba0v4sBkD
	OSTmCchDnTkgSpqvq8Ri1mTWXP/U2A8VSBuWe5s1oZIOxxwz320ClfOkjRzOyjTXYfiOPBC+yuUHJ
	vmZiawFvmzLGGqF6Ox5py4ovSuLOzmk/+EU47hv73NRZ5l0xyHIW5FHNBJPS0S2NeXUzF8/XySqSE
	YTugLATBXGvN4SsHrFCJFGspZShftkW+yCPVCWwaNPhQ3UGAXWkCVe2/GQcsZr46NcTdv012XWtA6
	RiipphzbsEXaG2JjOLfQIZTIyENGP/Yn/kAoibXXDMAtmjqKkxGRIH3qcyCL3pTcrvyYzWkjhfvn9
	zFcaVXgzKkbHNzWWLTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51NH-00Bkxc-1x;
	Mon, 20 Nov 2023 10:19:27 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51N4-00Bkw3-2z
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Nov 2023 10:19:25 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so50882441fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Nov 2023 02:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700475551; x=1701080351; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=m3PqdGd3hzZKCAL9p199LXfBSoxwo8nMT5FPvyOoA9c=;
        b=GkZwhUir72vnDxJXnyHbXOTfTaHthF0LBbTP5qJMCcdv9svNiR/3ACMPM5RgeQ8pOw
         cwIK8pYY/ZAm4erTFLF97NC4EBJf78Cu0isTvPbbVB2oQZ0rDYcShH1qrfVw3LgpEiev
         YLauXC4fKN4Gn4ZfS0bMhNyvZ0XjiGopEczcj4VCImRCN1M02r9Ojwhk75ZFnhG0ntAW
         rgqLjSki5omJoUqODKPLLcg6Kdb/Zt10vXZvAaadnGxShLJEzRYiFFJcPwj7SkKzpnfj
         rOKxDuuDP6+NPHqOyflB4VSLQqihVBK3GBwVqHHX5OuODGLXeyCHDuRM2wzYTVvRTWNL
         BlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700475551; x=1701080351;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3PqdGd3hzZKCAL9p199LXfBSoxwo8nMT5FPvyOoA9c=;
        b=iIHmaTHQJZdrT8zElNVGgOR9CtjrnepcuNE+urp94bXFt8krlb/Ohd2PrSrb6ysrw1
         UvypUsdecAq1LY2sME7APNgy6P07i8ndUwm/GqqP/W855oF2gnOOS8RZ0UsEdyhkUFrX
         v5qBOYjdigM28Vuwl1fW6e17ltPuC3562kbC4m9BGcroldhmVeCIz71Rf+P9rT28eeZD
         OkrOolS8jyWEEzvRfAulNedhMKIFuEVpBpeSaZw6we62N2o6bhY0BzD72tZQneKpgRji
         9PqBeceV7kyRYDnjFpw2Ah/+G7uCdFlZh5/pwVu8ktZz2NiyAFwbITDdPhAED/7TtsUx
         4++g==
X-Gm-Message-State: AOJu0Yy0KeXNd55eSjxNQossjPx+Vo1snCcJMDokoj9wufEKmGHHMujN
	7wC2DMWHkdbGfNRIYZpojB2Qqg==
X-Google-Smtp-Source: AGHT+IEPX2G5aclVwRbVdhdVk6Qz+Wvs9j7cq77cqcIy9GhSHMtNLsN6GkXktc/8rAKZlPKJNJuIYw==
X-Received: by 2002:a2e:a162:0:b0:2bb:b01a:9226 with SMTP id u2-20020a2ea162000000b002bbb01a9226mr4153302ljl.7.1700475550839;
        Mon, 20 Nov 2023 02:19:10 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:36e8:9c14:4901:7aca])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b004094c5d929asm13027434wms.10.2023.11.20.02.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 02:19:10 -0800 (PST)
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-3-jbrunet@baylibre.com>
 <170040994064.269288.960284011884896046.robh@kernel.org>
 <4608012c-059f-4d6a-914b-e85ad0c32ff0@linaro.org>
 <1j5y1wg3sb.fsf@starbuckisacylon.baylibre.com>
 <2e7a65da-5c1d-4dd4-ac69-7559a53afdf3@linaro.org>
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 JunYi Zhao <junyi.zhao@amlogic.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible
 for meson8 pwm type
Date: Mon, 20 Nov 2023 11:04:48 +0100
In-reply-to: <2e7a65da-5c1d-4dd4-ac69-7559a53afdf3@linaro.org>
Message-ID: <1j1qckg21u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_021914_971068_422F35DB 
X-CRM114-Status: GOOD (  32.80  )
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


On Mon 20 Nov 2023 at 10:55, neil.armstrong@linaro.org wrote:

> Hi Jerome,
>
> On 20/11/2023 10:18, Jerome Brunet wrote:
>> On Mon 20 Nov 2023 at 09:27, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>>> Hi Rob,
>>>
>>> On 19/11/2023 17:05, Rob Herring wrote:
>>>> On Fri, 17 Nov 2023 13:59:12 +0100, Jerome Brunet wrote:
>>>>> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
>>>>>
>>>>> The previous clock bindings for these SoCs described the driver and not the
>>>>> HW itself. The clock provided was used to set the parent of the input clock
>>>>> mux among the possible parents hard-coded in the driver.
>>>>>
>>>>> The new bindings allows to describe the actual clock inputs of the PWM in
>>>>> DT, like most bindings do, instead of relying of hard-coded data.
>>>>>
>>>>> The new bindings make the old one deprecated.
>>>>>
>>>>> There is enough experience on this HW to know that the PWM is exactly the
>>>>> same all the supported SoCs. There is no need for a per-SoC compatible.
>>>>>
>>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>>> ---
>>>>>    .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 36 +++++++++++++++++--
>>>>>    1 file changed, 34 insertions(+), 2 deletions(-)
>>>>>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>
>>>
>>> I'm puzzled, isn't it recommended to have a per-soc compatible now ?
>> I have specifically addressed this matter in the description,
>> haven't I ? What good would it do in this case ?
>
> Yes you did but I was asked for the last year+ that all new compatible
> should be soc specific (while imprecise, in our care soc family should be ok),
> with a possible semi-generic callback with an IP version or a first soc
> implementing the IP.
>
>> Plus the definition of a SoC is very vague. One could argue that
>> the content of the list bellow are vaguely defined families. Should we
>> add meson8b, gxl, gxm, sm1 ? ... or even the actual SoC reference ?
>> This list gets huge for no reason.
>
> I think in our case soc family is reasonable since they share same silicon
> design.
>
>> We know all existing PWM of this type are the same. We have been using
>> them for years. It is not a new support we know nothing about.
>> 
>>>
>>> I thought something like:
>>> - items:
>>>      - enum:
>>>          - amlogic,gxbb-pwm
>>>          - amlogic,axg-pwm
>>>          - amlogic,g12a-pwm
>>>      - const: amlogic,pwm-v1
>> I'm not sure I understand what you are suggesting here.
>> Adding a "amlogic,pwm-v1" for the obsolete compatible ? No amlogic DT
>> has that and I'm working to remove this type, so I don't get the point.
>> 
>>>
>>> should be preferred instead of a single amlogic,meson8-pwm-v2 ?
>> This is named after the first SoC supporting the type.
>> Naming it amlogic,pwm-v2 would feel weird with the s4 coming after.
>> Plus the doc specifically advise against this type of names.
>
> The -v2 refers to a pure software/dt implementation versioning and not
> an HW version, so I'm puzzled and I requires DT maintainers advice here.
>
> Yes meson8b is the first "known" platform, even if I'm pretty sure meson6 has

This is not my point. I picked this name because I have to pick a
specific device based one. Not because it is actually the first or
not. I don't see a problem with meson6 being compatible with
meson8-pwm-v2, if that ever comes along.

I think the binding here satisfy the rule that it should be specific,
and the intent that goes with it:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=v6.7-rc2#n42

> the same pwm architecture, this is why "amlogic,pwm-v1" as fallback seems more
> reasonable and s4 and later pwm could use the "amlogic,pwm-v2"
> fallback.

That is not how understand this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=v6.7-rc2#n82

>
> Neil
>> 
>>>
>>> Neil
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
