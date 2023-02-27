Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09B8C64ED8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7IXqJTtGF/gChOR/5VDNYla06bnIsdcYe/ZApoSlso=; b=3qKN8+1PIZcu5sg2x7Xn6DyNH+
	NSCdKG5ONusxYbOqDwXr9fxXNFRvFUFLXROblepTADwVclEw3sZr1XYr+EeC9VxyZnFT+TzhfHzop
	hvWysowEoGiP0o7jU/WiofMtm60vmdfETId0OQfeCNb2sEXyMLFJZxv2m6pNRTWndaN9I9xbduYyd
	d9ISDb1vlESsVJOAuo0ZhTLEFTinHztsHek9t0SwByzzKquvZEB/cLC/VdHnXptUl1xGqKU35K+dy
	wcHWGTwh5BNKhQNgvWp0gWmiq7nWFPl8tQ6ePZyJMxVLCSoVvoy8loCcBAjq115P83ija1fUXevFY
	44wCFm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgWn-00AO0u-Nh; Mon, 27 Feb 2023 16:39:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgWd-00ANxq-3K
	for linux-amlogic@lists.infradead.org; Mon, 27 Feb 2023 16:38:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t15so6888424wrz.7
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Feb 2023 08:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uD+EVkesVVVN/pvsUFcEHGAqIsHef4wQ6GACIqmb4ZM=;
        b=NVNN6qlXc+YgTK+z5Mnw6Yn54DtLfWOrdeVVO5RKW8X77jsHwVfiZnFgfeOQlyyp9v
         6hjmAa7S8GOyS1XRjreKpsIEFI/xGesT6iaVxTwN6Ort+D+EXXmtOHpbnMJOGZKWxJZq
         eZiQi7PqS1MR3uNHLSe6sacGNsIhNAJW/a4AN4s2EG3Xo1rPDt07U1WzPUFs/pMjGGHn
         TlfP4lmfRpZRabrMoBNDeL5qMGtMJFqonHe685PJklR5AfNwmGdLkCTHTXRTYWaxt1X6
         r0Dkz//I/XLYyIGpnZ53vVicp4dBzLaVWxaG+TVknkBoJm44sAzxftv/2v6FZUW0NSVL
         Ucmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uD+EVkesVVVN/pvsUFcEHGAqIsHef4wQ6GACIqmb4ZM=;
        b=u8NCsWSKOv/VJIgU1A7Ch5E46cuUyOaoqiMkWRiOqT99Yq98wEvYtPSO7HRrmnEi41
         C/E++b1ocUr40eYTYpMjutAtmFLrcnlyD1khuYl58YHt1grBn0bjqFuCb9aiKTaltuuw
         1cJ0qDs5Ophch8n0HVxoQnqyGbIB4V3KmzuboRCg4TYFP4P+jn4qdPpBWIC2AQY0Ag7m
         +RaRzeXFD/RCwYqbjQsKU7CaIEX6nTbHoJ0nzDk7nnOJ6ecMeRSpZX5yU8SfF9OoZG2e
         bnTQQmMaeo/z1KBDRJjMwEZXNdtSwMq+VTi/mfwwx2mLiTKOQGjTOb0aTE2YQWtuS062
         fg/A==
X-Gm-Message-State: AO0yUKVIEqRfAGo+9u+ZwFzKSDb7rH3HTg832xeauEwEmTVfOuchLVOD
	j05MYic4xKfE+P3tSN1IYJqhPg==
X-Google-Smtp-Source: AK7set8XTUCW4q+OH9DNHxx8x1vJLWfp3/yPovpuchhX38xMzhKKCnkqecloNAwpJv/urlKt0Px2bA==
X-Received: by 2002:a5d:408e:0:b0:2c7:deb:c61 with SMTP id o14-20020a5d408e000000b002c70deb0c61mr14227353wrp.39.1677515931493;
        Mon, 27 Feb 2023 08:38:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fbee:23cf:fdf3:bad4? ([2a01:e0a:982:cbb0:fbee:23cf:fdf3:bad4])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4850000000b002c6e8cb612fsm7354785wrs.92.2023.02.27.08.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 08:38:50 -0800 (PST)
Message-ID: <33b58877-5167-c453-e686-1d10cdca66c0@linaro.org>
Date: Mon, 27 Feb 2023 17:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
To: Arnd Bergmann <arnd@arndb.de>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Alexey Romanov <avromanov@sberdevices.ru>,
 Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 Kevin Hilman <khilman@baylibre.com>, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, Linus Walleij
 <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
 <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
 <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_083855_147588_53A7DA44 
X-CRM114-Status: GOOD (  18.93  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/02/2023 17:15, Arnd Bergmann wrote:
> On Mon, Feb 27, 2023, at 16:51, Dmitry Rokosov wrote:
>> On Mon, Feb 27, 2023 at 03:58:50PM +0100, Arnd Bergmann wrote:
>>>
>>> I would argue that is a problem with buildroot, and using a 32-bit
>>> kernel is not something we should encourage over fixing buildroot
>>> to do it right, or building the kernel separately from the rootfs.
>>>
>>> We do allow building support for a couple of ARMv8 SoCs in 32-bit
>>> mode, but that is usually because they ship with a 32-bit bootrom
>>> and cannot actually run a 64-bit kernel.
>>
>> To be honest, I didn't know about this principle. It looks like a very
>> rational approach "start from max supported bitness".
>> Based on overall maintainers opinion, we have to prepare a patch for
>> buildroot to support compat mode :)
> 
> That would be great, thanks a lot!
> 
> For what it's worth, the main arguments in favor of running a 64-bit
> kernel with compat user space over a 32-bit kernel are support for:
> 
> - larger RAM sizes without highmem (most 32-bit kernels only
>    support 768MB of lowmem, and highmem sucks)
> - larger virtual address space (4GB vs 3GB or less)
> - CPU specific errata workarounds (arch/arm/ only has those for 32-bit cpus)
> - mitigations for common attacks such as spectre
> - security hardening that depends on larger address space
>    (KASLR, BTI, ptrauth, PAN, ...)
> - emulating instructions that were removed in Armv8 (setend, swp, ...)
> 
> Most of these don't apply in userspace, so the incentive to
> run smaller 32-bit userland on systems with less than 1GB of
> RAM usually outweighs the benefits of 64-bit userspace.

Thanks for the details!

Neil

> 
>        Arnd


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
