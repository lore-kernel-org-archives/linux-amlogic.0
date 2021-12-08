Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CFFC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Dec 2021 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=91cMMtiJjGX81I5PHS3xN6g0rfluL28kAE7hKWQ2y/k=; b=kwOkGic79s2drE1pYjuK6s1I1E
	ApOYTjB42UrFrmqz1ADpcOAGrc99iloCSOWfJ2tDAtKSzGjPweebcPkiyRnafprTukrxhQC2+szEt
	3xWKWyDxm0gjhbmQBjuqvHCt/0m+laqU7pfo9tF20OZ4LP0N+yETIavG3EElb7wgLIcHng2lPdh/v
	WrD/IQJyw/wa1Ut4uqGuFj2HULHDfFs0UyIAAcw7IZCgrUrN5VMI/FhwZQYb9OFv/H4w9wTUJVe4G
	BmHht5Dhw0Q+yvyVtW5+FAcxpVRgQBzgZtDZxzrMTP+kUmY0vDJ6SoqqfCQrZ0u5zlZDMgmXqlJG8
	CBb3r6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musBv-00BgVu-M6; Wed, 08 Dec 2021 08:20:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musBt-00BgV0-4Z
 for linux-amlogic@lists.infradead.org; Wed, 08 Dec 2021 08:20:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1204865wme.4
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Dec 2021 00:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1w3QG5L2wJSdawJv13n1fbqmjL3sgSHFT+7XbyAvU6U=;
 b=55DNvAYxUXa+yKMvFNkcwxQcyuMG4hyrlqdl8GCYFqXE/nvB5hzQFKynb0amMmXyPj
 gvr6FYs5uEqtTr3S1cxwe8elBx06xxnm+aXZmnSmTpE4iBiqlMFjwG+Li/AZafgjjQ/J
 kfVWr21Ir4haj+rGGcA+A6kC8FsP9DhwqqdIrnTSjtTK4yLGw15m+Fd/QX/zYcNaeN60
 jtM6G0eR3psmmQ/Vrui/nwb1ZCQ7eo7nG2CngnGrj5nFE7X5MYrE/QmSZM/j7QIf17OY
 st+lLoPx7tEWVC/AA0P3vn93dIiI37Cp8OTaqRFkScrNd9NRbxdAWoF5gSyjRXVXUDfE
 vffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1w3QG5L2wJSdawJv13n1fbqmjL3sgSHFT+7XbyAvU6U=;
 b=qxU7MDT4i3GKb055Llr/FZOaZFbwBjm4RUqiOWNqdwuxXkq+m4ZHON3i1P4vsMVFY3
 lP7G5AxpwxKNqN0cvqs/mhhpqT70l5SQcVAIpWsFOVVnRTKoB2YbWID3lYgL3Vd8B/7l
 Tr2CFq/ydiVMqWRVgob3hyNbFNiQ8N9ieEC2535/E8zDuVKD28btkBUDt1NmV8aUEEOO
 S+LUO0/PcNsC+54QLtY7YV0+W1IM0bujPwDviDSVkZ2/CGkGPuZSUHU3d4WrnNk2B1n+
 nC77OZVBCF8IKT07fKivE9RM/s0EL6yZfPYRtZJzK8+uu9RPvyNekZxU++dnTYF1lamq
 Wa3A==
X-Gm-Message-State: AOAM530bbBkJSH2H7whi0CRoDxBoWkLxoZQ59LRupW61ddpj2ZUjEgcZ
 gYMfMtJVJNO/Fur7IFpevNrMgQ==
X-Google-Smtp-Source: ABdhPJzG/TNg3Piyp5TseF8rLfJFvZTaZFXGKZz5otMT3tS+daO2oHy7ZCllGK9433G4TB+hyrdAQg==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr14015235wmj.166.1638951639255; 
 Wed, 08 Dec 2021 00:20:39 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:5245:80ea:cf46:35bb?
 ([2001:861:44c0:66c0:5245:80ea:cf46:35bb])
 by smtp.gmail.com with ESMTPSA id i7sm2022410wro.58.2021.12.08.00.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 00:20:38 -0800 (PST)
Subject: Re: [RFC PATCH 0/9] arm64: dts: meson: add support for aac2xx devices
To: Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Benoit Masson <yahoo@perenite.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <7hilw14nhx.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e3b404f8-758e-ba97-37c6-0178231119dd@baylibre.com>
Date: Wed, 8 Dec 2021 09:20:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7hilw14nhx.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_002041_208078_4760A668 
X-CRM114-Status: GOOD (  22.48  )
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

On 06/12/2021 19:06, Kevin Hilman wrote:
> Christian Hewitt <christianshewitt@gmail.com> writes:
> 
>> This series adds support for several popular Amlogic S905X3 (SM1) Android
>> Set-Top Box devices. Like most Android box devices, they ship in variants
>> with multiple RAM, eMMC, WiFi and BT configurations. RAM and eMMC are not
>> something we need to consider to get a working boot, but we do need to get
>> the correct connectivity spec.
> 
> The reason we don't need to care about RAM differences is because u-boot
> takes care of that, and updates the DT nodes accordingly.
> 
> In general, I'm not a fan of leaving these decisions up to u-boot,
> but...  as an option...

For now we always set "safe" values for RAM in DT so it could work
even if not the entire memory is configured.

Since there is no way to detect this from Linux on ARM64, we have no choice
but hoping U-boot sets the right value...

> 
> I'm pondering if we should do the same for the connectivity settings?  A
> properly configured u-boot already knows if it's an internal/external
> PHY, Mbit vs Gbit etc. so in a similar way could enable/disable the
> right nodes.
> 
> We could have a single DTS for each of these board families which
> has some reasonable defaults, then u-boot would enable/disable nodes
> accordingly.

Yes it's technically possible, but it puts a larger dependency on the bootloader.

Having a lower RAM value is not idea but the system will work, having the wrong
PHY setup simply doesn't work.

Neil

> 
> Kevin
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
