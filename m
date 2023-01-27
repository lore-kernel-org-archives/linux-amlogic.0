Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5697AC54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgPtkgr5ejnVZFUeSs5O94wGjXIsXtxwS4d46hlknKM=; b=Tp0Ha1/gl35YpU
	IeZE9niH4qF0hLKf8bakGmq0c2N/tdWp4NbeqyxEXt9Hdjf/k8xCVl2I78fs+1WhrM+YjiMUFuudk
	OsAkcL0PNtjOGR2lVtjglOXmHjn6ffhSXnzaYqK32rRgxbvzDyYj5bfBVfzj9WgBAHHCEYnFfvzF+
	Rkn0TOh71omijArU6+fa3RgHWWGHhGv6yOYlmCZqXGqlHgQOV2A/alEMmQnhZqjuopy7jVCnmuHR1
	7QLX9vNH0CHl8Moyffdnr3xVXKZOPS0H4f1WGQ1nBknm9Fqwx37rG1zDmWHceEeo0AKeLahqpmJI0
	kbzxxPv42eOi75Ac65gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQMc-00FPOp-Jq; Fri, 27 Jan 2023 15:10:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQMS-00FPLQ-7d
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 15:09:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id q8so3662327wmo.5
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 07:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=j0jUJd/CQgzPDX6Ls8mFyzSk5wGnBIKAgAJn2GoiB5c=;
        b=EsG1Yau5s86uf5Ulabx6P3CgJcroBj5L1+yXU2rOTX6T6obuNJVyO3mLuOcPgRzwRI
         Xn4IPKbxm9rSE6EWFu1zJK9LynxTkTCIQUqbrFIFNFZFP0zHQE3lJ3rFcZqsyBby1nPg
         v+ihsEYBHXY0S2pZ2UTj41bQeV/JqXfziJ249veltvl42p3QhwRbKwlFWfq8Ec79GdxI
         VJU4w1yegGnYKrYeQoYkCtCQKL87/H7JzN3XND6acqj/R4C666EHVBJFUxv6PHr7nVHB
         K04vZvrCqNeubA7MkGrOeiurIOA1U/pEDqQ9AJ3/UWdsCbwpceilCKcBHRx1ECh5T3MO
         X2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0jUJd/CQgzPDX6Ls8mFyzSk5wGnBIKAgAJn2GoiB5c=;
        b=Pw7ykxzXzwuNzLvMm7CfVHUo4zmdP3qJ6dASFUsiNbWk5ynRrrNUeN+UXPo39qtSLl
         GFo1z2a2G8SvwtAWlWbIN7MosDMQLkLkWpIcLtiCzf9PcAv0fi0cdTXddHIHhN28MEti
         SpJWX8X3ze9QddxMWYfDq7bFzkifAP2oNyZw6EgDfKXXJPYoYD3L3cfHUaJLWSs3Q8NC
         G6J6a/Ynd45PXZ6EE+t4mpc07Q/5sPQAJWXywAP1EE3H1jL+5FImloR2amIYmY5JKiUp
         gwM8RHbPPvnidxgOQphy52T0GfyPr4IKoCtm4SeZ9NTgxmcUnikCpWVKnHAmADEQ++xP
         05WA==
X-Gm-Message-State: AFqh2kpwBvTjYqDol8LcptevY5nUYNWxdvmKSEHo0WhJDpIJTZPHI2rw
	R7VQ8MtEOb7qj9pnrUT7MGO/ZA==
X-Google-Smtp-Source: AMrXdXvkozPcTq7K2B7cKlRZyJSMVi1PkLFesIeEaZ9HL9hfOA6tXuYja9JC6RtWsDqBbTpWHfSg7g==
X-Received: by 2002:a05:600c:684:b0:3cf:5d41:b748 with SMTP id a4-20020a05600c068400b003cf5d41b748mr47180244wmn.36.1674832187400;
        Fri, 27 Jan 2023 07:09:47 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id hg6-20020a05600c538600b003dafbd859a6sm8012395wmb.43.2023.01.27.07.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:09:46 -0800 (PST)
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
 <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org>
 <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, neil.armstrong@linaro.org, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Date: Fri, 27 Jan 2023 16:04:29 +0100
In-reply-to: <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
Message-ID: <1jedrg6mkl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_070952_285520_5139FE58 
X-CRM114-Status: GOOD (  15.84  )
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


On Fri 27 Jan 2023 at 14:02, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On 27.01.2023 08:59, Neil Armstrong wrote:
>> Hi,
>> 
>> On 26/01/2023 15:03, Heiner Kallweit wrote:
>>> The usage of edge-triggered interrupts lead to lost interrupts under load,
>>> see [0]. This was confirmed to be fixed by using level-triggered
>>> interrupts.
>>> The report was about SDIO. However, as the host controller is the same
>>> for SD and MMC, apply the change to all mmc controller instances.
>> 
>> Thanks, I applied it in for-next so it runs on the CI tests.
>> 
>>>
>>> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
>>>
>>> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
>> 
>> I think we should find a better Fixes or perhaps split in 3 so it targets the
>> right commit adding the nodes for each family.
>> 
> This would be the cleanest option, right. Practically it shouldn't make
> much of a difference. The chosen commit is from 2019, SDIO interrupt
> support has been added just recently, and regarding MMC/SD it seems no
> problems caused by edge-triggered interrupts are known.

... Well, I wonder is this might be linked to instabilities seen with
very high speed mode (such as SDR104) and DDR modes. We have seen quite
a lot of those over the years. In any case, if it helps stabilize the
MMC on amlogic, it would be great if it can be picked up by stable.

>
>> If the test doesn't report any breakage, I'll probably ask you that.
>> 
> Sure.
>
>> Neil
>> 
> Heiner


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
