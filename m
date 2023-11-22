Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F075BC61D97
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qofC9gZriGNFOo+ZQwcVHcL+b5MabneQr53HnyTrcfc=; b=NBFrcE+HzWWFFF
	WrFRnv7JXCs0xR8eIUJx5kCWPKpIH08zoHVmcrwUNgMDOusKdzTIXAMGsp3u29msUmQKLHHvr5Rol
	ZDatrtX6RFX2qbigC6vO6P3Quc+mXJJqd10gUplIm/mBu1wXkWJMr/at8FVnJle6ZRAp5q8BIYauk
	VSflaQcF2iEdc2D55YGbyymwTCR0qBISAptoUTyF1R2CB6WF9XIBapVDMOxas/kzjtY1P0Dw2jY/w
	99ArM9pI2s6bOxGkNKTSLfl2EZ5ezqg5ShJW+khEz/R9csS1IZ1qEY8b3qXVZ+s7mI/zMbPu1Rm3X
	t4a1g+rnbFcj+94VU1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5obA-0029dj-0y;
	Wed, 22 Nov 2023 14:53:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ob6-0029cB-20
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Nov 2023 14:53:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40790b0a224so31948155e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Nov 2023 06:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700664774; x=1701269574; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=YU9HkHadrfyg4mO0a1y/iuf4m6/K/aPcwo6FIp9aTrU=;
        b=3BaiybHPxlwhVk4uKmmofdSo/1ZMYbNc5LvRYMCXzdQAXR6qfhnqUZKCMpyVhyzYp3
         KzrVTjLaMdq3jk8fCyzxegWbwcx3egiL46134rU3pIqJrzCSZBz7YOgE3BgEf6ZChnJC
         ToK6c4iDF0GM+xN1GwXzdM/SFOuWGJxWrhFvgV0mWU3rPlGEZN5ovs4eqBZJxll7bhT9
         ymRhNhm1EHlrN4y3jOVsKolmR/XzZOHH0k6MnpWiNUJuJ9Xd6JCwrl9btVtjNpmm/MDM
         6NQAn46Si5i7TWD0B+Px/V+oFdYJAuP9IzDybLJwQ7mgCIHSdeang0m71QFXs0cEqdYV
         yKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700664774; x=1701269574;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU9HkHadrfyg4mO0a1y/iuf4m6/K/aPcwo6FIp9aTrU=;
        b=lBMUrjSpTqv/OvqWJ14WAzGkDr9qFElt2E1Qg+5iEFnIwytAJBabekquKPxp25OgN2
         SVd81GlhMPJ42xO58rQzzlcPPFE9qH5HURolmeO8wNwIQ+3CVVU6wE2oyvJ0hkdpwoIE
         0lZeClBahTi1mkQ4FV/7Lqj2xas0NI6aDRudPxxk4dDSUmBLIDPWW/fkejUjBi1b6Gnp
         qfvTPq0rSsAZShezudZHPBBBNbeKRgIaptMjW/BTXUcg0NkV9Qv2hvAsXxMfzBEjkseX
         pNK0eprhLxLMsTAzNjPO74890LogAPpogRrpLWx0D7vr9vvHZeND+5SlU2KR1HwtKsnN
         3nBA==
X-Gm-Message-State: AOJu0YyCPqAl9o22yLSGApkT7maqGVDaE04ZKmu8mLXEqQsxoozr/UWO
	ZLaKrRVpvqn2+7Ow8hpMw8jnPHUj4du7bJKeUtA=
X-Google-Smtp-Source: AGHT+IHx6cb/GfkvDHyM6YwX74rQfXlRrRm6+GoJfSrfbdtc0H2GN2fNm9xMYK5e6rHT+aM/JJHyLQ==
X-Received: by 2002:a05:600c:5492:b0:40b:3369:d797 with SMTP id iv18-20020a05600c549200b0040b3369d797mr1244407wmb.21.1700664773964;
        Wed, 22 Nov 2023 06:52:53 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d0a1:9a3c:4f4b:fa20])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c320500b0040a4cc876e0sm2406529wmp.40.2023.11.22.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 06:52:53 -0800 (PST)
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-3-jbrunet@baylibre.com>
 <170040994064.269288.960284011884896046.robh@kernel.org>
 <4608012c-059f-4d6a-914b-e85ad0c32ff0@linaro.org>
 <1j5y1wg3sb.fsf@starbuckisacylon.baylibre.com>
 <2e7a65da-5c1d-4dd4-ac69-7559a53afdf3@linaro.org>
 <1j1qckg21u.fsf@starbuckisacylon.baylibre.com>
 <94e69281-93e1-41cd-9cf5-81cbbc15572c@linaro.org>
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org, Rob
 Herring <robh@kernel.org>, JunYi Zhao <junyi.zhao@amlogic.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible
 for meson8 pwm type
Date: Wed, 22 Nov 2023 15:34:41 +0100
In-reply-to: <94e69281-93e1-41cd-9cf5-81cbbc15572c@linaro.org>
Message-ID: <1jwmu9et6j.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_065300_843329_B7BA6943 
X-CRM114-Status: GOOD (  32.73  )
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


On Wed 22 Nov 2023 at 09:37, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 20/11/2023 11:04, Jerome Brunet wrote:
>>>>>>>    .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 36 +++++++++++++++++--
>>>>>>>    1 file changed, 34 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>
>>>>>
>>>>> I'm puzzled, isn't it recommended to have a per-soc compatible now ?
>
> Yes, it is.
>
>>>> I have specifically addressed this matter in the description,
>>>> haven't I ? What good would it do in this case ?
>
> There is nothing about compatible naming in commit msg.

Krzysztof, the whole commit desciption is explanation about why a new
compatible is introduced. I don't understand this comment.

>
>>>
>>> Yes you did but I was asked for the last year+ that all new compatible
>>> should be soc specific (while imprecise, in our care soc family should be ok),
>>> with a possible semi-generic callback with an IP version or a first soc
>>> implementing the IP.
>>>
>>>> Plus the definition of a SoC is very vague. One could argue that
>>>> the content of the list bellow are vaguely defined families. Should we
>>>> add meson8b, gxl, gxm, sm1 ? ... or even the actual SoC reference ?
>>>> This list gets huge for no reason.
>>>
>>> I think in our case soc family is reasonable since they share same silicon
>>> design.
>>>
>>>> We know all existing PWM of this type are the same. We have been using
>>>> them for years. It is not a new support we know nothing about.
>>>>
>>>>>
>>>>> I thought something like:
>>>>> - items:
>>>>>      - enum:
>>>>>          - amlogic,gxbb-pwm
>>>>>          - amlogic,axg-pwm
>>>>>          - amlogic,g12a-pwm
>>>>>      - const: amlogic,pwm-v1
>>>> I'm not sure I understand what you are suggesting here.
>>>> Adding a "amlogic,pwm-v1" for the obsolete compatible ? No amlogic DT
>>>> has that and I'm working to remove this type, so I don't get the point.
>>>>
>>>>>
>>>>> should be preferred instead of a single amlogic,meson8-pwm-v2 ?
>>>> This is named after the first SoC supporting the type.
>>>> Naming it amlogic,pwm-v2 would feel weird with the s4 coming after.
>>>> Plus the doc specifically advise against this type of names.
>>>
>>> The -v2 refers to a pure software/dt implementation versioning and not
>>> an HW version, so I'm puzzled and I requires DT maintainers advice here.
>>>
>>> Yes meson8b is the first "known" platform, even if I'm pretty sure meson6 has
>
> Yes, this should be SoC-based compatible, unless you have clear
> versioning scheme by SoC/IP block vendor. You named it not a HW version,
> which kind of answers to the "unless" case - that's not hardware version.
>

This is specifically the point of the comment in commit description.
We know all the PWMs compatible are the same HW (version) as one found
in the meson8b.

It is certain that adding more compatible, listing all the SoC, will be
useless. I can do it if you insist.

>> 
>> This is not my point. I picked this name because I have to pick a
>> specific device based one. Not because it is actually the first or
>> not. I don't see a problem with meson6 being compatible with
>> meson8-pwm-v2, if that ever comes along.
>
> No, the point is not to use "v2". Use SoC compatibles.

It is a SoC compatible. The second one.

The first one, as explained in the description was describing the driver
more that the HW.

Changing the way clock are passed from DT to the driver would be break
user of the old compatible. So a new compatible is introduced. I believe
this is recommended way to introduce incompatible binding changes.

v2 here denote a new interface version, nothing to do with HW
versioning. I happy to pick something else to denote this.

>
>> 
>> I think the binding here satisfy the rule that it should be specific,
>> and the intent that goes with it:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=v6.7-rc2#n42
>> 
>>> the same pwm architecture, this is why "amlogic,pwm-v1" as fallback seems more
>>> reasonable and s4 and later pwm could use the "amlogic,pwm-v2"
>>> fallback.
>> 
>> That is not how understand this:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=v6.7-rc2#n82
>> 
>
> Again, where the "v2" is defined? Where is any document explaining the
> mapping between version blocks and SoC parts? Why do you list here only
> major version? Blocks almost always have also minor (e.g. v2.0).

Again, v2 does has nothing to do with the HW. Never wrote it was.
The HW remains the same.


>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
