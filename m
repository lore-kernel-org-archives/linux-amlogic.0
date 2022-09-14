Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDBDC6FA82
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Sep 2022 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QTGfeqdwPd7b4S0FQ63lJl8fxB4G4eGNne6/yReNVk=; b=hVAy7stfMuKtBC
	ZbPaH+K42JKKR4QwF1+HQlAABvBb5tCBojE5CIUZDPCw88V2T0eipahSI6nyBYmypAe/KXQ4gqm4z
	UWUkWumZ5ew7zNuW1VzBREQJ42+XBkxaWuqJv7H8JNRB1r09ybPQ3XsY7NNJawpk0FJ2BazhYZ6we
	vufzdEKFg465dzxjFOe7prVuM2h/HxIa9/fLkrlCCbeoLzkEFqJssAUgUOYE6hyZi3OoDGaeN5M2s
	jhE2AmlZ7IXSlXqa/z3ccRqpwE9bBv+6SxONcNRIqh7RNIFd0liXNMYP0j2APfiM0GUt36SLGlo1D
	MTMrFToramMnxAlzC6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSgJ-0018Si-NM; Wed, 14 Sep 2022 13:43:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSg5-0018CK-Un
	for linux-amlogic@lists.infradead.org; Wed, 14 Sep 2022 13:43:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id l8so6235517wmi.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Sep 2022 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=W8Z5kpkd0SkrtJbwd2sn9XnWAgVawbNE74OWYqDPa98=;
        b=zDxi5YU9rpc/P4/4ACTVR03sZ78dlhXoiEg34DwutUm6Y7Znn6dc16XF+EHNHNq9KX
         SHExzteZmUcTl6QI5k6gjsCgZ40uZsg4XLKS5VwAv37R3e71UcrscZUPrlHw3mHwy3FV
         iawvf2u0uXqAQ/eNNa5mA25uWha04CPctgcf0GjHgdR5GckSbrsmFgM6WU+UArRyRnMZ
         dGEqY1uh35f0s9J9IvqYGKlUxdKYNVImopoNfYbK+bTzANY9djadDB5F764DsnSVBlPM
         iTAvh4Dkh475zFWTNpsxO3rU0YUWMdRrD+rYrGIhW54xzzosDOAc+57RtNZlwTE/icJb
         XkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=W8Z5kpkd0SkrtJbwd2sn9XnWAgVawbNE74OWYqDPa98=;
        b=zzLMFPuhZGO+x7j59qugPMp+SaRxJKzicy7shGuwfOf74hddI/QN6nf6RIcvj020wO
         KHcxesfQhgbQd8aAOMltWiSfKKszV7urQszaV8+MVr1DotMSZRqpagqIR5rgXMTtrwuQ
         zTm7QWRZ3T1OPc3NhFLaurC6f26bBSF0aVludyLY25CDvk0pUEa/3S9krnTe/QhQj3U8
         UHcnnoXbM4T9z+il92c5/wbLcNFFFrvQNxxIlf6GMOIourmHN6DOshXXtQmHPhfP892s
         JhmcNJP8I7XWvrOtlYXi0jnJV5Hxrjbk44r32yowTQOIuXuMejqOX5baIO8VYEOMlON4
         2nDQ==
X-Gm-Message-State: ACgBeo1tmgRzZdKS/W/soHBrcPu0WEDRGrp1XFazmPb+UzezoafosIMu
	UYGokX2DrvFDtyX2EgIgDNPoLA==
X-Google-Smtp-Source: AA6agR7a984bJVGvmq0/C97vtjeKUz6al+EhhC8nG4zQvtRSp6gdWlbRjqVgKOQbzZYDdWgdu7P1eQ==
X-Received: by 2002:a05:600c:3483:b0:3b4:99f4:1191 with SMTP id a3-20020a05600c348300b003b499f41191mr3091710wmq.147.1663163023407;
        Wed, 14 Sep 2022 06:43:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:375e:b940:b903:7792? ([2a01:e0a:982:cbb0:375e:b940:b903:7792])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6786000000b00228cbac7a25sm13527031wru.64.2022.09.14.06.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 06:43:42 -0700 (PDT)
Message-ID: <b2b9284d-0e18-0f4b-a41c-bb251f9de591@baylibre.com>
Date: Wed, 14 Sep 2022 15:43:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] spi: meson-spicc: add support for DMA
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220913140303.437994-1-narmstrong@baylibre.com>
 <667da463-1edc-4a99-9ac1-85303d9187c6@www.fastmail.com>
 <499f0940-3d7f-0ed5-e469-5c0979e6f761@baylibre.com>
 <28501fbf-3508-4afe-804d-fa5a3ccd4291@www.fastmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <28501fbf-3508-4afe-804d-fa5a3ccd4291@www.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_064345_998960_3A83441E 
X-CRM114-Status: GOOD (  20.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 14/09/2022 15:17, Arnd Bergmann wrote:
> On Wed, Sep 14, 2022, at 2:35 PM, Neil Armstrong wrote:
>> On 14/09/2022 13:19, Arnd Bergmann wrote:
>>> On Tue, Sep 13, 2022, at 4:03 PM, Neil Armstrong wrote:
>>>
>>>> + /* Sometimes, TC gets triggered while the RX fifo isn't fully flushed *
>>>> + if (spicc->using_dma) {
>>>> +          unsigned int rxfifo_count = FIELD_GET(SPICC_RXCNT_MASK,
>>>> +                       readl_relaxed(spicc->base + SPICC_TESTREG));
>>>
>>> Same here in the interrupt controller, I don't see anything enforcing
>>> the DMA to actually complete before the readl_relaxed().
>>
>> I don't see the relathionship between a register relaxed read and the
>> DMA not finishing
>> writing the data in uncached memory, for me it's 2 unrelated things.
> 
> The race is between the readl_relaxed() and a subsequent access
> to the data that is being transferred. On Arm processors you
> need a "dmb(oshld)" instruction to ensure that the CPU cannot
> prefetch data from the DMA buffer while it is waiting for the
> MMIO to complete.
> 
> The __io_ar() in readl() exists specifically there for this race, and
> this is the reason that readl_relaxed() exists for drivers that
> do not do any DMA.

Acked, thx for for expliciting, will do the fix.

> 
> Note that this prefetching can happen for uncached memory, but
> spe-meson-spicc uses cached memory.
> 
>       Arnd


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
