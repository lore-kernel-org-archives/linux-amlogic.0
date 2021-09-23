Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96D8C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 13:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005F661164
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 13:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 005F661164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rsVShTdyBeZ6+Vbu/Gjm3fILBqoq0dmGF+2BTnKkf/s=; b=lVh33N3gSKFboA1clylGmTE7fm
	/xz6PuRhxRvtLFt7TfK3dulidXrH9PqJktwB227L1G4NpPk512NcueTAgn5i+0WjnMnu80j0iBE1P
	35zoCLREb/kgR0qENpGvrsuN+sGN7QrDEPhPP9CH5INN//jwX9CkalVhwRiELHKEaCY9KhhPnv+oS
	IO7UUvXLK8Su4KNuO66gB8M/AofJmT8OyoU1eCoexGReqedaoMR5ccxNAhAm3ls3XoHEtWJGA30VV
	7jHlp7VP8I+ywr5WRgVOgQUQengs2GM03VW01sDdS3MBaF6VD/vmEVf73LX8Kw9qdHUHpYioO+A/Y
	MWMd4P1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTOZ0-00BYAv-F8; Thu, 23 Sep 2021 13:14:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTOYw-00BY92-Q9
 for linux-amlogic@lists.infradead.org; Thu, 23 Sep 2021 13:14:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id u18so17114831wrg.5
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Sep 2021 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=80UxY1enuCFe58nmKjLrfwQyDKpTWbHut+n/Ngi6cTA=;
 b=rYYCki9whbjCiL3yMJdKiPtl2Tf04x+/AvhUX/HlXc/ADHeJ32ZjXZ23HMcsPFa4lC
 jNcDVfN5BGolzIBXUgHnSx0cb1rM+4MAhuL1WSmg/GvCc8xZ1f6ryVYfeD/mKextRhW9
 H8VRg/MSUZXq0XBMf3PAASiY8/5R9DivW58esMuPlzoFcPCnlHLc0HamLOKCV/vJ31Bh
 OtUWQGWM8GpFhoLb5vYP2B6JrtyGxWIuZsKgZ1/ttp3joGPUFJOUB4jDt5U3jpqbg4A2
 YGWW3PCqAXknOEmLrTVvhFxYq/u/DV4jBzFqvmyCcIK4TyetiQj5Eksfvj/yOF/buRRO
 CaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=80UxY1enuCFe58nmKjLrfwQyDKpTWbHut+n/Ngi6cTA=;
 b=rv5SrhgPtYyjYJHAG+7zXcgaBptwIvzynDlWA5rmfDoahtQbPVTB5U6GmNtC1mBgro
 4iKQGgGidLAPY9i7qxVdu/DX8Rkkgf8804os4rZ1fWvdxCDQ3Av9mrRf01o0KmcR5226
 j9Gwzb5DTBoBsUyBCN7cOlkWkOJoPm1aoTU1zSX+YtJYo2WG/mOdH/wg588wHSFB7Xl/
 6qpToOdi1YCJVDwJrFej40zK9YGE4ibxmeA971+fEofadJ0YUwJz79d09K5N6BmPHMwM
 XdFbpYF/NPTjlLKgrSWP+S9xdGmziYYAnrH1QOeCkZ044x2CP8f6XfMSjGjGU6HI6ctj
 pHig==
X-Gm-Message-State: AOAM5335ezAe36awFHy3mXhf5lhh9710IjnAk/xxhV7N6ljCGy5t9YRw
 WvaoMh6mHTRTX7aKswetSiVpaA==
X-Google-Smtp-Source: ABdhPJxYzpndfvjHaLbcMucSA4gcaPJqZy2NFTf+HQ5ihXpmilx7qhJrkNW6Sv5zfFrrzrIQ3Naqbg==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr4442195wmi.24.1632402891108;
 Thu, 23 Sep 2021 06:14:51 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:74cf:b054:76f4:7692?
 ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
 by smtp.gmail.com with ESMTPSA id u29sm5503073wru.34.2021.09.23.06.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 06:14:50 -0700 (PDT)
Subject: Re: [PATCH] mmc: meson-gx: do not use memcpy_to/fromio for
 dram-access-quirk
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20210913080504.832521-1-narmstrong@baylibre.com>
 <CAPDyKFqLvnAOAmk3PeNiBzwXTgwvG+zEO1b_pJNzSuUZ3Zamxg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <07dcfe81-c7cd-69d6-3f22-9f58cc2e1fb0@baylibre.com>
Date: Thu, 23 Sep 2021 15:14:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqLvnAOAmk3PeNiBzwXTgwvG+zEO1b_pJNzSuUZ3Zamxg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_061454_915347_CB832582 
X-CRM114-Status: GOOD (  30.44  )
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

Hi,

On 23/09/2021 12:51, Ulf Hansson wrote:
> On Mon, 13 Sept 2021 at 10:05, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The memory at the end of the controller only accepts 32bit read/write
>> accesses, but the arm64 memcpy_to/fromio implementation only uses 64bit
>> (which will be split into two 32bit access) and 8bit leading to incomplete
>> copies to/from this memory when the buffer is not multiple of 8bytes.
>>
>> Add a local copy using writel/readl accesses to make sure we use the right
>> memory access width.
>>
>> The switch to memcpy_to/fromio was done because of 285133040e6c
>> ("arm64: Import latest memcpy()/memmove() implementation"), but using memcpy
>> worked before since it mainly used 32bit memory acceses.
>>
>> Fixes: 103a5348c22c ("mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk")
>> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
>> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/mmc/host/meson-gx-mmc.c | 49 +++++++++++++++++++++++----------
>>  1 file changed, 35 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>> index 3f28eb4d17fe..08c0ff0bfa8b 100644
>> --- a/drivers/mmc/host/meson-gx-mmc.c
>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>> @@ -746,7 +746,7 @@ static void meson_mmc_desc_chain_transfer(struct mmc_host *mmc, u32 cmd_cfg)
>>         writel(start, host->regs + SD_EMMC_START);
>>  }
>>
>> -/* local sg copy to buffer version with _to/fromio usage for dram_access_quirk */
>> +/* local sg copy for dram_access_quirk */
>>  static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data,
>>                                   size_t buflen, bool to_buffer)
>>  {
>> @@ -764,21 +764,34 @@ static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data
>>         sg_miter_start(&miter, sgl, nents, sg_flags);
>>
>>         while ((offset < buflen) && sg_miter_next(&miter)) {
>> -               unsigned int len;
>> +               unsigned int buf_offset = 0;
>> +               unsigned int len, left;
>> +               u32 *buf = miter.addr;
>> +
>> +               if (((unsigned long int)miter.addr % 4))
>> +                       dev_err(host->dev, "non word aligned sg");
> 
> This looks weird. You print an error message, but continue to process
> data? If this is a case you can't handle, perhaps you should propagate
> an error code instead?
> 
> Additionally, you may want to use the IS_ALIGNED() macro.
> 
>>
>>                 len = min(miter.length, buflen - offset);
>>
>> -               /* When dram_access_quirk, the bounce buffer is a iomem mapping */
>> -               if (host->dram_access_quirk) {
>> -                       if (to_buffer)
>> -                               memcpy_toio(host->bounce_iomem_buf + offset, miter.addr, len);
>> -                       else
>> -                               memcpy_fromio(miter.addr, host->bounce_iomem_buf + offset, len);
>> +               if ((len % 4))
>> +                       dev_err(host->dev, "non word multiple sg");
> 
> Again, a dev_err() doesn't seem like the right thing to do. If you
> can't handle this, please return an error code instead.
> 
> Perhaps returning an error code isn't convenient at this point. An
> option could then be to pre-validate the sglist at the time of
> starting the request. We have other host drivers doing this, have a
> look at drivers/mmc/host/mmci*, for example.

Yep pre-validating the data at the request callback seems the best solution,

Thanks,
Neil

> 
>> +
>> +               left = len;
>> +
>> +               if (to_buffer) {
>> +                       do {
>> +                               writel(*buf++, host->bounce_iomem_buf + offset + buf_offset);
>> +
>> +                               buf_offset += 4;
>> +                               left -= 4;
>> +                       } while (left);
>>                 } else {
>> -                       if (to_buffer)
>> -                               memcpy(host->bounce_buf + offset, miter.addr, len);
>> -                       else
>> -                               memcpy(miter.addr, host->bounce_buf + offset, len);
>> +                       do {
>> +                               *buf++ = readl(host->bounce_iomem_buf + offset + buf_offset);
>> +
>> +                               buf_offset += 4;
>> +                               left -= 4;
>> +                       } while (left);
>>                 }
>>
>>                 offset += len;
>> @@ -830,7 +843,11 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>>                 if (data->flags & MMC_DATA_WRITE) {
>>                         cmd_cfg |= CMD_CFG_DATA_WR;
>>                         WARN_ON(xfer_bytes > host->bounce_buf_size);
>> -                       meson_mmc_copy_buffer(host, data, xfer_bytes, true);
>> +                       if (host->dram_access_quirk)
>> +                               meson_mmc_copy_buffer(host, data, xfer_bytes, true);
>> +                       else
>> +                               sg_copy_to_buffer(data->sg, data->sg_len,
>> +                                                 host->bounce_buf, xfer_bytes);
>>                         dma_wmb();
>>                 }
>>
>> @@ -999,7 +1016,11 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>>         if (meson_mmc_bounce_buf_read(data)) {
>>                 xfer_bytes = data->blksz * data->blocks;
>>                 WARN_ON(xfer_bytes > host->bounce_buf_size);
>> -               meson_mmc_copy_buffer(host, data, xfer_bytes, false);
>> +               if (host->dram_access_quirk)
>> +                       meson_mmc_copy_buffer(host, data, xfer_bytes, false);
>> +               else
>> +                       sg_copy_from_buffer(data->sg, data->sg_len,
>> +                                           host->bounce_buf, xfer_bytes);
>>         }
>>
>>         next_cmd = meson_mmc_get_next_command(cmd);
>> --
>> 2.25.1
>>
> 
> Kind regards
> Uffe
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
