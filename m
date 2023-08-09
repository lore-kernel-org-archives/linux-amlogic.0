Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C66C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCKn206z57T0D29gqoeYEQ9meZ7N0KNtG2kqbbD/N7w=; b=LzOFr2TM36RnEI
	M+RGjorF8xOMjudLHGL6aQI++ArcMtSUBW2B4gLzoQ/D2/6o8ueidtVX6J6udc0KWDyT1rEHO9h96
	XvK/YyA7JqvVbc9+v762TKZaDrz8faMaQrDfFbVWqoIdx/YjKKJ7P3fgJ64p15pG6GqUAb6kSyg68
	MIwAXpeNiULgsfiWBw1fDaBwoMylz7pCDxUGi4g+q2mS44SsKleEDw83M5KyDwuRp2LEdz1/xXSbJ
	+68vAtp3tPeXFrvEYl68HVrBoPhSZB5gDLeIy+wGO1VG7yRt7gQf93aBF5lB+abfb0XNsPs0sLlX+
	fpzSkk9JXQSaUw2N1Nyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjX6-0054TF-0X;
	Wed, 09 Aug 2023 13:47:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjX2-0054Sf-0M
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 13:47:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso5754745f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Aug 2023 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691588841; x=1692193641;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=PE5cJzvntX1qIl6Z53C3/b2JXH5RY4FZGtDgaWloFqA=;
        b=fkx/JwZPfS0BAH2aVLs/mI7AhmfMoMPWUzRIZWS1Uri7+pwvP8BjWK7CEkOU/1ggKe
         9N3uGSMwEPgkSsc4hOkYDgoiDvocZGt0KHArjCjknDPTd1+1Lu7nJWVuw6cvko/gCqQ8
         xGn2deiABWf7HUPR+q1Rl77LtFJK1RONdiQfp6NBOCwyx2KVp8DGVBKZ5Ma/juCBAR7K
         RKGYMcnjpyFGO8TRZxiw6tQxELTj8PPW0XUgEcsoZqszU841/7sOpjiVHTvnUH+GyLLO
         C8B1p91Ohp62Hy27Rv1Kt95MMupD6kcpjX/MTKd8/rr9H4B/ENOokWfZeEdBcDGlYBYj
         QoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691588841; x=1692193641;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE5cJzvntX1qIl6Z53C3/b2JXH5RY4FZGtDgaWloFqA=;
        b=Wl474gp74aqHVRr0mw8tbkuNEsaA/5Dok1AHnbsrOodbnmqYwHOkqZAl31W+me7DnM
         y6Xhdgg1SOX42PBjWVFdQuD1kbLRZ40M0D5wNfPNaV5zIg1QAXdyvdZk4Cur9UFmv062
         hpoqn8OkmClz7+hlTCZDd08sw2aGWLF+pEG7mok7USWJbh30ha3gNAVI3ICsHh4IooBh
         xajE0FLI3RCJf33u4g30vLog3rmKbMaHhtMYmVYo/ihMM4o/UfSIim3n3jfzSJrHj7gA
         i8VpqngRJVZUXYjPIxQfcjhwdL/+VLKWD8jp5H4DAB98D7YS8eXkKvqm5euVTuexpPbX
         acpQ==
X-Gm-Message-State: AOJu0YybIiYYrwDlkvzYwmDE0atQu873jAObwPIh1QyWd8ZvgO7FnHEb
	yqHc+Cwkc4ioQvzQe8Ad95DmzQ==
X-Google-Smtp-Source: AGHT+IGDoLFaQy+WmBagoOTGH8xLuZ2hKnQLCQUA91JqHrtZq4wtyGXz7CjCYNJSikZpVukGoMVVqw==
X-Received: by 2002:adf:f8cb:0:b0:317:9537:d741 with SMTP id f11-20020adff8cb000000b003179537d741mr1900502wrq.54.1691588841370;
        Wed, 09 Aug 2023 06:47:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a0f:2daa:ffb5:cc02])
        by smtp.gmail.com with ESMTPSA id i12-20020a5d55cc000000b00314427091a2sm16850870wrw.98.2023.08.09.06.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 06:47:20 -0700 (PDT)
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexander Stein
 <alexander.stein@mailbox.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc
 to YAML format
Date: Wed, 09 Aug 2023 15:46:33 +0200
In-reply-to: <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
Message-ID: <1j1qgcba54.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_064724_382351_C4161AD4 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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


On Wed 09 Aug 2023 at 15:02, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 09/08/2023 08:58, Jerome Brunet wrote:
>>>> +      required:
>>>> +        - '#reset-cells'
>>>
>>> else:
>>>   properties:
>>>     '#reset-cells': false
>>> ???
>>>
>>>
>>> You need to constrain the clocks per variant. Probably names are also
>>> specific to each one, so the list of names can be moved here and you
>>> keep just min/maxItems in the top level property.
>>>
>> 
>> input clock names and constraints are the same for all 3 variants.
>
> Then why do you have this huge, apparently unnecessary, oneOf? If it's
> the same, then drop the oneOf and make number of clocks fixed.
>

As I pointed out, this section is wrong.

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
