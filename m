Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67265C64EC3
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIc4OpKD4VRUpM8Ky4ekysG3hjhR6avFV4d/3Xd+NeM=; b=aB4EyhT6te03Ir
	R1Es+DlSziULhoQEo/atqDcXP+czGBxQYzDgyZu22LGcPGm13guCpCvMKci577tNfESiyjWxDHq+w
	fvtP7mwRe5vc+pyICZcquaLiyLJiCZWfK01S6d0AACCESvp7H2zUnrXT+rP2g9m45nzBQ/owtzjxS
	8kTQU8mdEgi24vwomu1lQdskr/k/dA7ta7jBLMpqQxEjQGl27OdU19ApaX+691xYqAPnFZxmW2p0z
	1KzmYVMAzaM15pDwGHmO9jQB0vCdFFpUpM3T8iw4HsvIsAN8uhWFroea0FXMqRotFHyxFXb4JPxyv
	gxI2X3CQqWMc5ziFZo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsYf-001DpX-3V; Fri, 03 Feb 2023 09:40:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsYc-001DnW-8r
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 09:40:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so1305097wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=BcOFFh4ezLvd92fNkjmz7wpV7RsvIbDnXNZc1TtGyfE=;
        b=eXU3zeOvIS/sTiVvmDUhiTLRt6DYkGsjsFI1AX0qQb+Lg0yPfNg7WquyWULEMsAqc2
         ZIZeFSJ5CAoW5nL5Ft/UIgrcUry9QB797rFehtOyLalYzeVP4IEAGrV4/J62yuAiaH0O
         YK9kygwBhv/t9PBzbSUkC/vyoBgGtrNmJGhUVLspgxAy4lvs0EYULgVMcZsSXLDzLmfz
         J5R5FAIleJ+jEyDEWvgt5njPch6JHQNk+xmyerW3JV7jPlHeiMiiyCGXtY7My8Nz96YP
         3t3OZy2zPAyn0fO7zC8NAl4yePwNNZt5O8RcWhyeDaSYHqMHtlM+fg4jynGcBI+oflZa
         K2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcOFFh4ezLvd92fNkjmz7wpV7RsvIbDnXNZc1TtGyfE=;
        b=01YJhrPtiJ32tg2YPZ9CM40jX+b9lGDwfeZMqXsIOssl46yp1v7RAY/mNhee+Bu/rF
         i4yBdCdm9k5B8EcySM2vCXOAJLPDn2mBK6rkW9h9VOygf6yZ+7jtpfVgvCI/A9AJA9dc
         hnTxI/LFXBgNjAyOtY9Ukmoc30WI6uEDQpEEp3NHB1Z6mbHMcTf+IBW6ONV0yw14cDwQ
         QaisuA8cSTUpCrfkSS+hPkLjsExVG9sXmHJkws5ov0Pk83wYg2Iy5mdRweAXEf74Pf5j
         9hsz+Cvj3AXzn3cFWsYznI+sx9+uoqPFX6n+b6BHAq8RpqNS0XFyeWukOn5WOSchAy4J
         E/Gw==
X-Gm-Message-State: AO0yUKWTi4wJEa/PB9HS3W8ILtkEvgkNtVu0dnya45auz4mu5m3dWZ1c
	B//yXHzoBAMdCEStNqNnEprgHg==
X-Google-Smtp-Source: AK7set9EIfUGCgZ5uGTG32ryzvXSU83lqMxBe2h4wXPjYKidwJ8U3BQjmte0UPJpZ9LnkSIAYZKdnA==
X-Received: by 2002:a7b:cb07:0:b0:3d9:719a:8f7d with SMTP id u7-20020a7bcb07000000b003d9719a8f7dmr8813045wmj.35.1675417231027;
        Fri, 03 Feb 2023 01:40:31 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003dc49e0132asm7027471wmj.1.2023.02.03.01.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 01:40:30 -0800 (PST)
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-6-jbrunet@baylibre.com>
 <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] ASoC: dt-bindings: meson: convert axg pdm to schema
Date: Fri, 03 Feb 2023 10:37:51 +0100
In-reply-to: <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
Message-ID: <1jtu03m6ia.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_014034_572766_9EFA1086 
X-CRM114-Status: GOOD (  10.48  )
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


On Fri 03 Feb 2023 at 09:01, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 02/02/2023 19:36, Jerome Brunet wrote:

[...]

>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#sound-dai-cells"
>> +  - clocks
>> +  - clock-names
>> +
>> +if:
>
> Keep in allOf here (need to move ref from top to here)
>

I'm not sure I get it. As it is, it seems to have the effect I had in
mind while trying with dt_bindings_check.

What does it do when putting the conditional under the AllOf section ?

>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - amlogic,g12a-pdm
>> +          - amlogic,sm1-pdm
>> +then:
>> +  properties:
>> +    resets:
>> +      items:
>> +        - description: Dedicated device reset line
>
> Define properties in top level properties.
>
>> +
>> +  required:
>> +    - resets
>> +
>> +unevaluatedProperties: false
>
>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
