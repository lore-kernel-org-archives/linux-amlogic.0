Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02388C25B4E
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Jan 2023 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCplpA7O33+c6YTNiYaggY3Hn2niuC/ABgsbehNT/uM=; b=kSCQ76QenhB4cc
	48NK18c4Nej3dRksBb9R3B1Wb2fRYBQt5cI+3AllXTlAxuWGCCm93MJ3qDy8/RPDobVeI8QerGyPo
	79Di5saZo6sO3vb7EfffPj8ANAKpMtamhFuGsXNJ4vsOeGdlCxyN0+21QAyzCtIRDU+AFroIkRl7u
	pbiruvxMAYgdM9rsivopU1+n1hU5qMB6mSGLJLoobJdzlHBW/8f3mYTC1jW0/8PdBrXSKpQvF5WAR
	7KbSlvclYJ+5UFF4bvwtrlkoMrM25kT5WRyIH4Pja9dkXAC4ftgi10eEwAV7MsnnudERJ1083GJ/L
	GY24OdQ6aNm06g+kcSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJWmX-00F59C-2R; Sun, 22 Jan 2023 09:36:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJWmU-00F58V-6P
	for linux-amlogic@lists.infradead.org; Sun, 22 Jan 2023 09:36:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id g10so6983013wmo.1
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Jan 2023 01:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpxZop004lAiKqyB5tDsS8TgVaCDtVZHtlMKxmTjC0g=;
        b=ECgPRWWCsy9NToHICzR2kX6HSwQWLtqjk0hUPwSUnXp7BbMafWTGTbDh4bWHQX5+HK
         5NCXN0o+5LrU1+yn6VoBH6eLxLdefhX0uQhbbghH/hxBv4i3PHrtMuVlx0D5Ww+vfWcN
         tGLlKwRQlCRJB0xtgLUilAKp6pRbrcbSEEbOa57RQvfjuHbf6GQ+V2uFGwlhapFDj8fl
         Oin1rIuEMVzaPPWAuMzujhb6hNCwgfBguKuQQoq58KOzr1bzruv0OyUSDWTlNYEskN7o
         9COOOvQWLvDU+RgGhHr2QQz57uZztka0mqwwr6vs9R8ZAhT9W7qada8ZSCYmkRAAgyht
         /fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpxZop004lAiKqyB5tDsS8TgVaCDtVZHtlMKxmTjC0g=;
        b=hwin6EZoZ78hgQuM79GLq7v3XI7nhb4RJLgppZpd5xd7Y3rzQcHIsZ7TfG5VI3RAv5
         sjO7lUhmZMh7qSLnS6BpvDNNpzVCVQJgr3gzWMI9dtqQtCrglOXRE0GfTxIB/BIsrJXf
         VT2QWg6Bi3s4FV0X+86ZwA3S4iVxjZGtIuRj4cTPbC0YCZTXtuS3O7BKScF2ssEXVE8S
         qU6GNL9JDW5TF9TjnAT3ulvdNrBnAM8+/Ovqvr1o0/DK16izcdKrkrvyvKZkCL26xVCD
         8QAgs6l2YCAKeS/+GjQjEX1BCcwicc/vROF9vE0ybbgj8Iy5/gkq/sbaUoxNQ+RsxZxH
         S1hA==
X-Gm-Message-State: AFqh2kqTpJF9zicu2+QKJALi+aTExaisdcRgBUMmrlhEgIM3pqQNAUBP
	NQj0bXPrKCD8IHNtY1DgpVDdFQ==
X-Google-Smtp-Source: AMrXdXuzS6IDyC+K25N0DkOt4MKy8IOR4GrMzqYb0s85tX7fURVExIEukvDBl8Jd5pVgK92NWlbYlw==
X-Received: by 2002:a05:600c:35d6:b0:3db:2ad:e344 with SMTP id r22-20020a05600c35d600b003db02ade344mr16706207wmq.13.1674380210417;
        Sun, 22 Jan 2023 01:36:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b003daff80f16esm10367065wmg.27.2023.01.22.01.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 01:36:50 -0800 (PST)
Message-ID: <07ce1655-d84b-e4f1-02d4-b69568830175@linaro.org>
Date: Sun, 22 Jan 2023 10:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 5/9] vendor-prefixes: Add VIA Labs, Inc.
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-6-linux.amoon@gmail.com>
 <d0bdc8f9-5ea8-5c77-3193-a2932c87156a@linaro.org>
 <CANAwSgT4P544a2MeybV_hXkDfc_HXiO4Rnxt4qG3RM1-X-KCEQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CANAwSgT4P544a2MeybV_hXkDfc_HXiO4Rnxt4qG3RM1-X-KCEQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_013654_281454_DE44EA32 
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

On 22/01/2023 08:04, Anand Moon wrote:
> Hi Krzysztof,
> 
> On Sun, 22 Jan 2023 at 00:21, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 21/01/2023 18:56, Anand Moon wrote:
>>> Add the vendor prefix for VIA Labs, Inc. (VLI) is a supplier
>>> of USB and USB Power Delivery controllers for multi-functional devices
>>> and platforms.
>>>
>>> Website: https://www.via-labs.com/
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>> v3: - None
>>> V2: - drop Drop marketing, so without "leading".
>>
>> Wasn't this merged? Didn't you get email?
>>
> 
> Yes, it was merged into USB testing branch.
> I have rebased it on Linux master 6.2-rc5,
> I hope this series picks up again.

No, that's not how it works. If patch was picked up, you must drop it.
Otherwise you might mislead maintainers (e.g. other maintainer) to pick
it up again.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
