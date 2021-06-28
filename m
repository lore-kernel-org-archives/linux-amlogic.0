Return-Path: <SRS0=+Jf1=LW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF01C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 13:44:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895D06128C
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 13:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895D06128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2Qp+5Ay7kF1gmDDqCXGJZI+R7Nv/Gvn7W1ckirQVQg=; b=Q9FsvHk9dlhQve3G8nQmjwvm9x
	+N+X+W+WRBezRa4X3bnrEe4V7McU66HJe+GDh1W+/NGTTPxHVlP7y6gF7vMpOysyGngw7APtN8JiY
	cF5RFFcZo2NhcVXWDeZ9OVEkYbSHlhLFLgUbVthwBuJ/szjgR+Dd7f4glTdWmoyBZ7MxJK5lWGbrJ
	tKs1ln++ufLBTC1dXEDo8NnK07+GDKi5iCCb5oKg0fWYiClnqR6lW4Oep/DYV0yDmA4Ya+vE5pQ23
	VgVAtdU3tmQslAOjKe6R/8CivnC8EHHoL6JuTd5v4Q6T2FFWor2+1n3kIaKc8lhuzlJYcOQ/+NiQS
	3xC76GmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxrYu-008Eop-Gb; Mon, 28 Jun 2021 13:44:32 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxrYr-008Enc-TJ; Mon, 28 Jun 2021 13:44:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5CD21042;
 Mon, 28 Jun 2021 06:44:26 -0700 (PDT)
Received: from [10.57.8.89] (unknown [10.57.8.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF6D3F718;
 Mon, 28 Jun 2021 06:44:24 -0700 (PDT)
Subject: Re: [PATCH RFC 2/2] mmc: meson-gx: use sg_copy_to/from_io instead of
 local version
To: Neil Armstrong <narmstrong@baylibre.com>, jgg@ziepe.ca, leon@kernel.org,
 m.szyprowski@samsung.com, ulf.hansson@linaro.org
Cc: torvalds@linux-foundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210628123411.119778-1-narmstrong@baylibre.com>
 <20210628123411.119778-3-narmstrong@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <cfd6c96a-b5eb-bc0b-1861-c409f0a7e4f0@arm.com>
Date: Mon, 28 Jun 2021 14:44:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628123411.119778-3-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_064430_193134_02FA626E 
X-CRM114-Status: GOOD (  19.05  )
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

On 2021-06-28 13:34, Neil Armstrong wrote:
> Use the proper sg_copy_to_io & sg_copy_from_io instead of having a local
> sg_copy_buffer variant to handle the I/O mapped buffer case.
> 
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 53 +++++++--------------------------
>   1 file changed, 10 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 3f28eb4d17fe..c13436efb414 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -746,47 +746,6 @@ static void meson_mmc_desc_chain_transfer(struct mmc_host *mmc, u32 cmd_cfg)
>   	writel(start, host->regs + SD_EMMC_START);
>   }
>   
> -/* local sg copy to buffer version with _to/fromio usage for dram_access_quirk */
> -static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data,
> -				  size_t buflen, bool to_buffer)
> -{
> -	unsigned int sg_flags = SG_MITER_ATOMIC;
> -	struct scatterlist *sgl = data->sg;
> -	unsigned int nents = data->sg_len;
> -	struct sg_mapping_iter miter;
> -	unsigned int offset = 0;
> -
> -	if (to_buffer)
> -		sg_flags |= SG_MITER_FROM_SG;
> -	else
> -		sg_flags |= SG_MITER_TO_SG;
> -
> -	sg_miter_start(&miter, sgl, nents, sg_flags);
> -
> -	while ((offset < buflen) && sg_miter_next(&miter)) {
> -		unsigned int len;
> -
> -		len = min(miter.length, buflen - offset);
> -
> -		/* When dram_access_quirk, the bounce buffer is a iomem mapping */
> -		if (host->dram_access_quirk) {
> -			if (to_buffer)
> -				memcpy_toio(host->bounce_iomem_buf + offset, miter.addr, len);
> -			else
> -				memcpy_fromio(miter.addr, host->bounce_iomem_buf + offset, len);
> -		} else {
> -			if (to_buffer)
> -				memcpy(host->bounce_buf + offset, miter.addr, len);
> -			else
> -				memcpy(miter.addr, host->bounce_buf + offset, len);
> -		}
> -
> -		offset += len;
> -	}
> -
> -	sg_miter_stop(&miter);
> -}
> -
>   static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>   {
>   	struct meson_host *host = mmc_priv(mmc);
> @@ -830,7 +789,12 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>   		if (data->flags & MMC_DATA_WRITE) {
>   			cmd_cfg |= CMD_CFG_DATA_WR;
>   			WARN_ON(xfer_bytes > host->bounce_buf_size);
> -			meson_mmc_copy_buffer(host, data, xfer_bytes, true);
> +			if (host->dram_access_quirk)
> +				sg_copy_to_io(data->sg, data->sg_len,
> +					      host->bounce_iomem_buf, xfer_bytes);

Maybe you could just use host->regs + SD_EMMC_SRAM_DATA_BUF_OFF directly 
here (and below) and save carrying host->bounce_iomem_buf around?

Robin.

> +			else
> +				sg_copy_to_buffer(data->sg, data->sg_len,
> +						  host->bounce_buf, xfer_bytes);
>   			dma_wmb();
>   		}
>   
> @@ -999,7 +963,10 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>   	if (meson_mmc_bounce_buf_read(data)) {
>   		xfer_bytes = data->blksz * data->blocks;
>   		WARN_ON(xfer_bytes > host->bounce_buf_size);
> -		meson_mmc_copy_buffer(host, data, xfer_bytes, false);
> +		if (host->dram_access_quirk)
> +			sg_copy_from_io(data->sg, data->sg_len, host->bounce_iomem_buf, xfer_bytes);
> +		else
> +			sg_copy_from_buffer(data->sg, data->sg_len, host->bounce_buf, xfer_bytes);
>   	}
>   
>   	next_cmd = meson_mmc_get_next_command(cmd);
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
