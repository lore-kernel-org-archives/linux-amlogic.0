Return-Path: <SRS0=Bf+g=TQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C01C04AB4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 09:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D6920848
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 09:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XSeBCByp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ljSbd2C8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D6920848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nht4svqocepgFe0ADLjnMOlxPolWBi1cCt98EV0WIY0=; b=XSeBCByp43hByZ
	KLF6NNy4tKOV+sr8ieA2oY8OlDepCy5Ik+lHxxd31pGWtzlaWJ5uo2PmriJ+6nd0MQxCp/EG6SZWk
	q2gNxtnFD8GGpFVE6iDOuc86BvVBWbAj/fguZv5FXrLctbzNDZwptQdHdV0cU8TTAsKUlpdjYnvIT
	7D7C0jZyM8pQYlic898WklNPRYJoBrNOeAZSGByGVodvgyO5IiY4db/n3QUIK1vFDsf9JwEp0YDa+
	Y3IPYHinXgOEoY+QiqHM2yMedLndC99Ca/v8htiCaqK+oQv1gIdwatzHiWhgECwLUOxcHHCiY7/aI
	/xvjfOHQ7SLIjkwNGHQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRCPF-0003m6-Uy; Thu, 16 May 2019 09:10:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRCOk-0001xY-ND
 for linux-amlogic@lists.infradead.org; Thu, 16 May 2019 09:10:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id g12so2193670wro.8
 for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2019 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=p6kdFIcAXlwCJee+4dm4i376dtq0zqZbqWN1rlHnda0=;
 b=ljSbd2C8ZQkeKBrPgLgB9WgLt7qN0EAcURtwu7kBsGcXA+JUOJbIjtLY9IZcGKt1iA
 XFh78n5k0UR/Oehw6ktimwGaI3S3gGABJYtNLr6zDj4KD8Up92kvCcz2kd4QMsKc5keI
 S4KA+OKXxSoZ/xaSNG9getVUtSacYk3meAdsrCTm3edpu1uazCT6us0a5ApPmPovn+71
 1LUs2pifAAdeHOU8Px2dDrI/GGNg7l+ZOCImglqZ+BjGR4FjK33M82H8nEFZHfqoU2JQ
 hvQwdWgXq6OBGOaqYb1QKVNW9l8WNtCGcYX7sahOWVbWLv8uvmlEA8XzhKn1fady6yg8
 hlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=p6kdFIcAXlwCJee+4dm4i376dtq0zqZbqWN1rlHnda0=;
 b=PHHJumLMoSwG9m0KeS7mDFiZQDd2mZhtBu5OWOjlxGtoAksGV6jHACYfZCNoyVHxza
 8eLm8x9Jv0EBMuUFbscKGsJBro0NdLp+zy/SRhHIlpkMT3n1301iMUm0qlOL12XssbOW
 ClbAvUTODjZt+bQMHULzitOLkUtciyQROkTMdX728Os5yfTWaPOg7NkkGu+yAi6xyXy0
 8mEql3IsUVNsme5hIPudFWZ3L/VAbBUokFkT8jXwpmXk2C21W7ZuYbjh6MWcX5hBp7g0
 xIDVKz8fo3DQ3jZlUx2osHqG/qfMYR81r59xfBxxzbBYIn3xeaAuXUnXf7qMwrkgG8BM
 SK9Q==
X-Gm-Message-State: APjAAAWQiOmSZviP513PC+mJ+1zlF/ibVioFGBsOUqqgBq81YWpd7kS4
 EtaEkmBqMq4gTN8LATSJ6mQl3A==
X-Google-Smtp-Source: APXvYqwqeRDg99An8xL0Uv2hAVMilwlW0MwE2mOPifQCB8/qDGI5gMhvHKbB1Cx8BFdyawk1EX/iJQ==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr13387498wru.91.1557997796550; 
 Thu, 16 May 2019 02:09:56 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j17sm3266617wrs.77.2019.05.16.02.09.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 02:09:55 -0700 (PDT)
Subject: Re: [PATCH 2/3] mmc: meson-gx: add ddr-access-quirk
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190513091548.16674-1-narmstrong@baylibre.com>
 <20190513091548.16674-3-narmstrong@baylibre.com>
 <CAFBinCAMoNDnxoQA9XHKy0Xo9MduxD1CvQXOeLZQ3zZ4ViWm7A@mail.gmail.com>
 <a54f7a4a-c280-6181-969f-4979dadb36b2@baylibre.com>
 <CAFBinCCtNQmKKL8yw07DKOfPK=eusgCuYeBmwgiHm0SSVmuFPQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <65c704a4-c4b7-ebdd-a869-353b1536410f@baylibre.com>
Date: Thu, 16 May 2019 11:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCCtNQmKKL8yw07DKOfPK=eusgCuYeBmwgiHm0SSVmuFPQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_020959_244749_A30BC294 
X-CRM114-Status: GOOD (  21.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: ulf.hansson@linaro.org, baylibre-upstreaming@groups.io,
 khilman@baylibre.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 15/05/2019 23:18, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Wed, May 15, 2019 at 2:45 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 14/05/2019 19:58, Martin Blumenstingl wrote:
>>> Hi Neil,
>>>
>>> On Mon, May 13, 2019 at 11:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>> [...]
>>>> @@ -1158,15 +1183,27 @@ static int meson_mmc_probe(struct platform_device *pdev)
>>>>          */
>>>>         mmc->caps2 &= ~MMC_CAP2_HS400;
>>>>
>>>> -       /* data bounce buffer */
>>>> -       host->bounce_buf_size = mmc->max_req_size;
>>>> -       host->bounce_buf =
>>>> -               dma_alloc_coherent(host->dev, host->bounce_buf_size,
>>>> -                                  &host->bounce_dma_addr, GFP_KERNEL);
>>>> -       if (host->bounce_buf == NULL) {
>>>> -               dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
>>>> -               ret = -ENOMEM;
>>>> -               goto err_free_irq;
>>>> +       if (host->ddr_access_quirk) {
>>>> +               /*
>>>> +                * The MMC Controller embeds 1,5KiB of internal SRAM
>>>> +                * that can be used to be used as bounce buffer.
>>>> +                * In the case of the G12A SDIO controller, use these
>>>> +                * instead of the DDR memory
>>>> +                */
>>>> +               host->bounce_buf_size = SD_EMMC_SRAM_DATA_BUF_LEN;
>>>> +               host->bounce_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
>>>> +               host->bounce_dma_addr = res->start + SD_EMMC_SRAM_DATA_BUF_OFF;
>>> I'm curious: why do you need to set bounce_dma_addr in this case?
>>
>> We still need the physical bounce buffer address since we write in the registers,
> so writing bounce_dma_addr to SD_EMMC_CMD_DAT is needed to make it work?
> 
>> and we need the logical address to memcpy() in the buffer.
> as far as I understand that is what we use the "bounce_buf" member
> for, but I don't see why we need "bounce_dma_addr"

Sorry I don't understand these questions, I haven't changed the
bounce buffer behavior here, I only make it use a local SRAM buffer
instead of an dma_alloc_coherent() allocated buffer.

Having bounce_buf_size/bounce_buf/bounce_dma_addr is still necessary like
an allocated buffer.

> 
>>>
>>>> +       } else {
>>>> +               /* data bounce buffer */
>>>> +               host->bounce_buf_size = mmc->max_req_size;
>>>> +               host->bounce_buf =
>>>> +                       dma_alloc_coherent(host->dev, host->bounce_buf_size,
>>>> +                                          &host->bounce_dma_addr, GFP_KERNEL);
>>>> +               if (host->bounce_buf == NULL) {
>>>> +                       dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
>>>> +                       ret = -ENOMEM;
>>>> +                       goto err_free_irq;
>>>> +               }
>>>>         }
>>>>
>>>>         host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
>>> if host->descs cannot be allocated then you need to conditionally skip
>>> dma_free_coherent for the bounce buffer in the goto err_bounce_buf
>>> case a few lines below (just like you did in meson_mmc_remove)
>>
>> It can be allocated, it's only useless. I can skip it but I don't want
>> to break any logic in the driver.
> I wasn't clear in my last email, I meant this error case:
>   err_bounce_buf:
>     dma_free_coherent(host->dev, host->bounce_buf_size, ...
> when host->ddr_access_quirk is true then you skip the
> dma_alloc_coherent call for bounce_buf

Oh, ok, yes, I'll add it.

Neil

> 
> 
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
