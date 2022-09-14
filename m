Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE947ECAAD8
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Sep 2022 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Do4UYxPp8Aqgh37IwtZ1PfbYCjCZ5RtTPDEzcyknqOA=; b=P0syyeoTusjbss
	Gm64dvm1QfZXuUBcFExMNNFANk2rcsb2AtI6GOAU2TkGC3i/hujOwVsockCIiH5H7yEEnd4Yl4txW
	ipcwVimzCfXE0+OwIZAWE99nGnscrMmkJMofLmmXCptSREzmIX9tFfdwhEkb9WAkqmcIMDQkLuT2c
	lSHQO2QBrc6o8TdPwt+FCF0XwWhKCV8RYbaS/JB3R8hPx9NqSmhSWEimI66O+Sz9t4OJVapjWJycz
	KVeRiKNspUpmA6FkOUTAprJ4rU6s+jPoWRvYNo0gzTOG95X1lcJEDQXJX9V/XiZk4WuVCOzwCiGi1
	ynNfrkYxwNm9FwE9BzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRcI-00HT7G-6N; Wed, 14 Sep 2022 12:35:46 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRcC-00HSyB-Fg
	for linux-amlogic@lists.infradead.org; Wed, 14 Sep 2022 12:35:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso10677237wma.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Sep 2022 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=DlDjCrRvT7ZrMqLsqbSeiQMfFP2pPcqVagrQi2zGg/0=;
        b=KusiwEWJadoy6YIDbf+gx4EHkzAewE+aqXzucSNysAhphF1v0JofMwtfZyViiOcLoX
         YS0oUVxNRN0XmqQ1PRCjYE7030kUVLOkje1IT+FZxsl88eMZ32iariaofRB7GxD/RI2T
         r9Xb2Q5r3ZbrwruiqXAY2a53lgfkcSgTdrf8hfKGFv7RrqoK4BCyPgVX/UQH0UMSgb+F
         vq8jo7VcyBdiDjmk/XFdRUoae0vq1axWm9dLH8VSGDSiqhZuoI6jOTKCm/PfA079r6QY
         oqn+zc5UIpysr5e6UwItxDS2ZjWncKhNY6/lcPDPRFwHLbnFuNb59MQGeUvGU2W5qXZ5
         BftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=DlDjCrRvT7ZrMqLsqbSeiQMfFP2pPcqVagrQi2zGg/0=;
        b=O9g1fVW5tmtXIAM0OEUfANMAPyES9H58dPStr4zL2XNucBcXGI1/7+FklUtlw54l8E
         234RncBVtwsU/UxCFdguULQFrt2xUzZoqdB4K08M95SX7Q/mUTsGcL0lVffhLbSH7gO3
         qUK11QfxS5hoxSW9R/ZzFdyWz0zUeZAMwwQcwGrFsBxEjfEm9fvbdBb4HtsDcZrmcEII
         wbtvHd2ZuKFebFkmjT+fkV4APUGqUqQzVbI5qK6T2eWnw6WzoIwWCScSddVv3Zw/JMP5
         k5y4j6ERC75MLy0OmwgAAep3dTxT9TzzxZ4McmFCWsBZ3oXPESEqKUnTTYvB1Vy0qtgY
         sAJw==
X-Gm-Message-State: ACgBeo1petFAIgW2WhcRjncVc/frChasR696kqdP+lFBKLJ7Wt7+Ze4+
	y99J8tvTHrT2HtU63MsoFAq0Cg==
X-Google-Smtp-Source: AA6agR6QJXG5hGSiJ1yl3xM9u1YtuXerHiYJTL/eyFMFKOjCQYcg4yYiXsh8ODbHUyIAfPVGYILQIw==
X-Received: by 2002:a1c:4b0d:0:b0:3b4:76ae:f7a5 with SMTP id y13-20020a1c4b0d000000b003b476aef7a5mr3137417wma.23.1663158938582;
        Wed, 14 Sep 2022 05:35:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:375e:b940:b903:7792? ([2a01:e0a:982:cbb0:375e:b940:b903:7792])
        by smtp.gmail.com with ESMTPSA id c19-20020a05600c4a1300b003a1980d55c4sm15471489wmp.47.2022.09.14.05.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 05:35:38 -0700 (PDT)
Message-ID: <499f0940-3d7f-0ed5-e469-5c0979e6f761@baylibre.com>
Date: Wed, 14 Sep 2022 14:35:36 +0200
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
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <667da463-1edc-4a99-9ac1-85303d9187c6@www.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_053540_798088_79127F6E 
X-CRM114-Status: GOOD (  23.64  )
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

On 14/09/2022 13:19, Arnd Bergmann wrote:
> On Tue, Sep 13, 2022, at 4:03 PM, Neil Armstrong wrote:
> 
>> +static void meson_spicc_setup_dma_burst(struct meson_spicc_device *spicc)
>> +{
> ...
>> +	/* Setup burst length */
>> +	writel_relaxed(ld_ctr1, spicc->base + SPICC_LD_CNTL1);
>> +
>> +	writel_relaxed(SPICC_DMA_ENABLE | SPICC_DMA_URGENT |
>> +		       FIELD_PREP(SPICC_TXFIFO_THRESHOLD_MASK, txfifo_thres) |
>> +		       FIELD_PREP(SPICC_READ_BURST_MASK, read_req) |
>> +		       FIELD_PREP(SPICC_RXFIFO_THRESHOLD_MASK, rxfifo_thres) |
>> +		       FIELD_PREP(SPICC_WRITE_BURST_MASK, write_req),
>> +		       spicc->base + SPICC_DMAREG);
>> +}
> 
> It looks like this last writel_relaxed() starts the DMA, but I don't
> see any barrier that serializes it against the memory access, which
> could still be in a store buffer.

You're right this one restarts a DMA, so yeah it should not have the relaxed accessor.

But the one starting the first DMA is in another place and aswell should not use relaxed.

> 
>> + /* Sometimes, TC gets triggered while the RX fifo isn't fully flushed *
>> + if (spicc->using_dma) {
>> +          unsigned int rxfifo_count = FIELD_GET(SPICC_RXCNT_MASK,
>> +                       readl_relaxed(spicc->base + SPICC_TESTREG));
> 
> Same here in the interrupt controller, I don't see anything enforcing
> the DMA to actually complete before the readl_relaxed().

I don't see the relathionship between a register relaxed read and the DMA not finishing
writing the data in uncached memory, for me it's 2 unrelated things.

> 
> At the very minimum, I think these two have to use non-relaxed
> accessors when adding DMA support, but an easier approach would
> be to use those consistently throughout the driver.

I'll do a check of those accessors for v2.

> 
>       Arnd
Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
