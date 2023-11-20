Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E513C5B562
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Nov 2023 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acSkzdy0ZenIzRMvba2pQezDr6S+tBfsgPWgByWQ2oA=; b=BGp8/+6OQzzpGZ
	67b2wscp8RbjRWT4+YFJ6u0aAVPCDvA5sAZG1YeetNCh7y9SLhn20hERqJy/2/o5tMH3Al/CmBR8z
	W7bnA/sTxVwQQVKvio6A8AuYZ9TnK0MSV8F/ZteZDvmqCsl1fGK5O8XKEA6hArbk0qBzQ8L9P6TPn
	EBvBFg99ktJTI2zPhbcm3+sbrzgi9XGMWkJ7I6NVHK+0GyYBIsJJEJeTROvcHJ5g86VIf/r0oTOcc
	5/Rn1qhR3Ao6T2xL//3GHtYKEmSKJriOsKZXDBSSpg0GgEBMNsDbv9cZBNFvngtXep2a7yHkGzi7Y
	5A9nfvOllRZcAzv3anxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r50mt-00BfwG-0r;
	Mon, 20 Nov 2023 09:41:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r50mn-00Bfv9-1x
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Nov 2023 09:41:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4084de32db5so16950455e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Nov 2023 01:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700473301; x=1701078101; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=u4ulDi1zHXqoku3tvf/oqVF4mugJudCNC02l68RjBP8=;
        b=Kwuo0isyW0PIabePvlvuZ8fOCRi2nx+v8D7oxBHTUFpPOYiMKQq4+FBGvu4wtb6B/o
         S1VlQocE+l5Xtb7xTgl3TwwJ2LGH3eO0AAVzV/72NVNvqsulUdIcGyKQZ8FMRPacTXHv
         aqrSn2ziifzmK9U9xaNehD9S0acML7itcuB2nqMlGTAQqvTnC+kbg7km9ExyrERCHw02
         PrK4xr/9sVQGa9YRNFEsfMCQ55N3MU384SInp6LdzDvBZG8VPwic7T5X9y2nshJNUogt
         Y9iKlUfhjFgDGV/U2Q873nAnu8WjQQdxaYVRG3rPYRaNzhcEv//3HogfasJu/QMjx6b9
         dwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700473301; x=1701078101;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4ulDi1zHXqoku3tvf/oqVF4mugJudCNC02l68RjBP8=;
        b=SQk/cdhocASXPiYW90PmwecsW1SRdaiC8hCLHIyKV2vhgM8I322yWJpVgcGUNjfv3H
         bBzb3eJRr8Vtas/mVfMtNNGbJ8s2U6NtGeJhofC9kjnNSCz2APMEEulGoP0KnB9A+xw5
         18/9wKNovJk5RJjppleTOv6QAQy1eInqjFvpEqhIpRn2cl4Koz5S/ooGpxu4VIRoiu9o
         Gis4ZZeFWaTteVTd4wsqrn5VwU9XmkXBkJw8NvTIvm/UR7+IJwHjzSWEQWsD25F+idjh
         4vAHz9S6ECVY3LPA8v0ImpN8JwSq5hGwL3KUcLzdS6kJpORVc7vfmt9efFM/+Aa2hLM/
         QUbw==
X-Gm-Message-State: AOJu0Yysn46GuHCbgbpgem3PfBiaxwzTyH4WJoQtlf+6E8V7cSg496S0
	qWKdE28bgp2aAXLkRzrsvELF+Rr+K1nALaqHkSQ=
X-Google-Smtp-Source: AGHT+IFWBpYs1rdj5ektHnIdcJ0DTx5BglePzoH5Vl8iaEVmWHT4d5KBd0tVA9bREgg+XhAIPJFg/A==
X-Received: by 2002:a05:600c:a07:b0:405:3955:5872 with SMTP id z7-20020a05600c0a0700b0040539555872mr6074687wmp.18.1700473301399;
        Mon, 20 Nov 2023 01:41:41 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:36e8:9c14:4901:7aca])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00401e32b25adsm12979612wms.4.2023.11.20.01.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 01:41:40 -0800 (PST)
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-3-jbrunet@baylibre.com>
 <170040994064.269288.960284011884896046.robh@kernel.org>
 <4608012c-059f-4d6a-914b-e85ad0c32ff0@linaro.org>
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 JunYi Zhao <junyi.zhao@amlogic.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible
 for meson8 pwm type
Date: Mon, 20 Nov 2023 10:18:49 +0100
In-reply-to: <4608012c-059f-4d6a-914b-e85ad0c32ff0@linaro.org>
Message-ID: <1j5y1wg3sb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_014145_862234_449AF959 
X-CRM114-Status: GOOD (  20.73  )
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


On Mon 20 Nov 2023 at 09:27, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi Rob,
>
> On 19/11/2023 17:05, Rob Herring wrote:
>> On Fri, 17 Nov 2023 13:59:12 +0100, Jerome Brunet wrote:
>>> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
>>>
>>> The previous clock bindings for these SoCs described the driver and not the
>>> HW itself. The clock provided was used to set the parent of the input clock
>>> mux among the possible parents hard-coded in the driver.
>>>
>>> The new bindings allows to describe the actual clock inputs of the PWM in
>>> DT, like most bindings do, instead of relying of hard-coded data.
>>>
>>> The new bindings make the old one deprecated.
>>>
>>> There is enough experience on this HW to know that the PWM is exactly the
>>> same all the supported SoCs. There is no need for a per-SoC compatible.
>>>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>   .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 36 +++++++++++++++++--
>>>   1 file changed, 34 insertions(+), 2 deletions(-)
>>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> 
>
> I'm puzzled, isn't it recommended to have a per-soc compatible now ?

I have specifically addressed this matter in the description,
haven't I ? What good would it do in this case ?

Plus the definition of a SoC is very vague. One could argue that
the content of the list bellow are vaguely defined families. Should we
add meson8b, gxl, gxm, sm1 ? ... or even the actual SoC reference ?
This list gets huge for no reason.

We know all existing PWM of this type are the same. We have been using
them for years. It is not a new support we know nothing about.

>
> I thought something like:
> - items:
>     - enum:
>         - amlogic,gxbb-pwm
>         - amlogic,axg-pwm
>         - amlogic,g12a-pwm
>     - const: amlogic,pwm-v1

I'm not sure I understand what you are suggesting here.
Adding a "amlogic,pwm-v1" for the obsolete compatible ? No amlogic DT
has that and I'm working to remove this type, so I don't get the point.

>
> should be preferred instead of a single amlogic,meson8-pwm-v2 ?

This is named after the first SoC supporting the type.

Naming it amlogic,pwm-v2 would feel weird with the s4 coming after.
Plus the doc specifically advise against this type of names.

>
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
