Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A3C636CC
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Feb 2023 00:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT7BGoVNCfSD4h50NytUKS+zZT1ATRWxn/JMIKzR21A=; b=MkQ1hFjQLmjZrv
	EDjwCOnmoY+aoBUIouU7akB/sM+aKIXK3nBv4aPCeoYKdYiMKL2PppcHcMq/iogtemjO9e3q5tLqA
	0tNV3n/7ZUMvsLXQcbsIj7ng0wHrJUORuN8wYPMKXRI5vqszduG18zV8uETjLTmhsZMt1lkHoMKeI
	J0p7NiTEaD4ioJHnZWoY60fakX1P80ct/wFQxrCL5nuOgai8oiU5gZYVRVyVEB0OM7+rqjorZYhhh
	Ir5vzrCwo32v4rzm6HTXAHUSdASDEaKC+Jt+tR/4wdWb1BVPRmOFNlkAma8HO4VFlwm/hTqtrDU9M
	Zml85aX1XttCkINu3hSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOSXG-005jR7-5n; Sun, 05 Feb 2023 00:05:34 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOSX5-005jPb-4z; Sun, 05 Feb 2023 00:05:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id p26so24860081ejx.13;
        Sat, 04 Feb 2023 16:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6QYB1GxIjCOW+mbyYRI2vElkNJsL0ngRmZW+x6+Des=;
        b=AeJivRsjQ9zt55JJLi7EIMtRHNWSnZkdUTCOQDnatE7kfqHZO+bJkCwcdOQ1j1/LAD
         aCuKV447LxpE81qndhmRHfc1lbLaxIn6ku/jCiOrAEZhVN8FOIK7IlL3jjs2YBMNLFoI
         3ad8/m8ckJF5+NvbJJFDMI9vkR/QTD8/91FT6F5x4gQrmKIvBp8OecfEX6yKoFDljFrM
         UiV0vJ3BO5zUx6pqBGmj4H5Xz3g4x+4PS50n8iMKMFRKBDI0jGoUgQrA496vxmDnvDo1
         cTQmMbfpTs8hrrJFVJxGfR9ssRdZsqE5pBxMUUop2UqTLfiHoFnloMzxc0ZF5mfPJedy
         W0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6QYB1GxIjCOW+mbyYRI2vElkNJsL0ngRmZW+x6+Des=;
        b=UXYvCOzjX3JHgnKyOk81nIoTm5jyhXbg8YJUWAZ4iID9BZQycjyhY1orL4gOl3X2IB
         cYErt/9gn5lHPoP/GBCFN3hLcXhsD9NidhRuo05Y3XLLJwQXVjNYNmYspTAJqjQANumn
         TRwdEVftXlxo3jbz8jjnXYO0Uye1bxRuIcVLhrQEkHzwFmrNBazgF5gQkSdQ1y/zTCCk
         +F+B7f/J3lFYSU0lDhhvKhBx0AraD+7P+Ploqptl+Qf5N7+SgllyowQaFt2cy38C0UkP
         jUxcFz1+/LaL1drgCLxN9IqZczMZJKsLxyUVS4dbYUbetLTH8K4B7fnyzRYVwk6hqnMo
         OcIA==
X-Gm-Message-State: AO0yUKW0BKFLLs/pmlylneLllLkUwDvfqMFFsN7CdgV4yL00Lo1+88+m
	gzkcjsTUgW8IGittNB6nZnA=
X-Google-Smtp-Source: AK7set9zwKOuDewSoqVnZJcWohgp7ntr54p3bPf3EaoM451F8ymXN9zIoIROUbhbTTwLO3Yu4KUHPQ==
X-Received: by 2002:a17:907:3e82:b0:84d:47e3:fe49 with SMTP id hs2-20020a1709073e8200b0084d47e3fe49mr20617255ejc.39.1675555519850;
        Sat, 04 Feb 2023 16:05:19 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af5:0:2c30:a880:5f2f:348a? (dynamic-2a01-0c22-7af5-0000-2c30-a880-5f2f-348a.c22.pool.telefonica.de. [2a01:c22:7af5:0:2c30:a880:5f2f:348a])
        by smtp.googlemail.com with ESMTPSA id de48-20020a1709069bf000b0088cf92eb0e1sm3391695ejc.150.2023.02.04.16.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 16:05:19 -0800 (PST)
Message-ID: <6dcf6333-f75a-f7ec-8ce9-fbbfb81d1a60@gmail.com>
Date: Sun, 5 Feb 2023 01:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
 <20230201020647.GA2318275-robh@kernel.org>
 <b0e502fa-ef11-df82-ad45-9367ff7c75b3@gmail.com>
 <CAFBinCDHtX2W=Sh4ffUbugn+XVH2UcXWKH2Q63W9G074x6o7zw@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
In-Reply-To: <CAFBinCDHtX2W=Sh4ffUbugn+XVH2UcXWKH2Q63W9G074x6o7zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_160523_243249_8B74F35E 
X-CRM114-Status: GOOD (  17.41  )
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

On 04.02.2023 23:56, Martin Blumenstingl wrote:
> Hi Heiner,
> 
> On Wed, Feb 1, 2023 at 11:13 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> [...]
>>>> +      - items:
>>>> +          - const: amlogic,meson8m2-aobus-pinctrl
>>>> +          - const: amlogic,meson8-aobus-pinctrl
>>>> +      - items:
>>>> +          - const: amlogic,meson8m2-cbus-pinctrl
>>>> +          - const: amlogic,meson8-cbus-pinctrl
>>>
>>> Again, can't have both with and without the fallback allowed.
>>>
>> Hi Martin,
>>
>> meson8m2 is the only chip version having a fallback for the
>> pinctrl compatible. Is this fallback really needed?
>> Looking at the driver it seems that both compatibles
>> are handled identically.
> Back in the day we decided to duplicate the Meson8 driver code just to
> add four new pin functions that are added by the Meson8m2 SoC
> generation:
> "eth_rxd2", "eth_rxd3", "eth_txd2", "eth_txd3"
> 
> The compatible string was defined with a similar approach: since
> Meson8m2 just adds a few bits to the Meson8 pin controller it's
> backwards compatible.
> 
> If the fallback has to be removed then I'm okay with that but I would
> like to understand it first.
> So far I thought that Rob basically asked to remove the following two
> compatible strings from the enum (as they're listed separately with
> their fallbacks):
> - amlogic,meson8m2-cbus-pinctrl
> - amlogic,meson8m2-aobus-pinctrl
> 
Right, this should be sufficient. There's no place where the 8m2 pinctrl
compatibles are used w/o fallback.

Then the hopefully final version of the binding is almost ready.
I'm just still checking whether there's any way in yaml to specify
a reg-names list with mandatory and optional names. Doesn't seem so.

> 
> Best regards,
> Martin

Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
