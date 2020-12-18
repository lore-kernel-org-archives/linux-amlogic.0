Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21548C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:09:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B941423A5B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B941423A5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v7HgUEYcHan10bXJN85If/MTOOM6/A07FvH811DmE9M=; b=GbbdB58fYU6qSr5td6E1cwG/2
	tGutLL7M1xibip1rK5TyDsvRNGkNDG26H3fokgpueG5XzMWviOALwlIEx0CR6P9f2mtFLOzCoU4F1
	9FI/LTtYd9xPqUuOBfgTvGIl1scCvujjzt57GCsVZY7dS0G/2WO62zIoQ+O/kJQE6J0aQR/dXjBDV
	ZuVjRTm4sW6y1BTSzGH8WqQBmf4f0zRNEuorDTIbk/vXRjtigksPG2uHHBDvUxxG8dkYa0+YrgYhC
	X9PmtQjMijlwWHjNNRA4MQ6ybMIYe7nCMzsXrA+wblqsFaL/mg5CCuhjLfgSlr0NiOX+R0Ipg2DLD
	XILl4E/CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqBl8-0000BT-F5; Fri, 18 Dec 2020 09:09:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqBl5-0000Aw-PM
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 09:09:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id m5so1300884wrx.9
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=KJrDC06cZ0SpABxvrfpFdiN11jLrtZ0nLH/aYVW+QaQ=;
 b=KIvu4XctqG3iWAW1rMqin4vw90x6wDijOFhioi9BfBT2GaaTEc+JAQgpBjULRGj4Bh
 rbf0YAHdWMk7fsBltrgz48AJR1wSSnCHyo+C6ZQ2FZQuW2bXQJ+0Rdm5ncO6D7FUDihs
 tOUNlbWYkOUOcnpySOo6GQyXPFkdOHyx7OMKqXhKK45surAFbN2YSs9NijollyKpyT4c
 NVEc/eHQLgjtRU9wEVP9G2Id9G9/fsz5pZQfk2LPvTHmTnGEZ5NmBvlxGZe6AGDJ5Ua0
 EOVSuj6QzBU9oIIqCsFn05tfAtzzfBXfPC0hkDeOqjD6/0OuoRS/Zzqd+V9JP5XzEsX4
 KOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=KJrDC06cZ0SpABxvrfpFdiN11jLrtZ0nLH/aYVW+QaQ=;
 b=Jq/29oqgO58ZJD3+BRSDct1RXqDHgSbDe38CyTFivDZaEiEvWNoh3dM90i0XJeCLfp
 wo1CFSG1NBsvowns9Ehl6MxTBbH4316yNr/wTBDa0VpzDr5GXXNiUUQXq2fcZOEU+idB
 Zs5duvxB3cNNgeqTS7oK8NZsketSq59j+xhP3oER3OiAXI98nQSxBMqH+lp1Jy9pby7b
 BFRHYHQ+jle+rC6t6bIaRP+julcyHNWuviqk5I3Fbp7P7t+9eF+uPTAx7VLehpsjiOWg
 y7pkXPoZPlA4bTre9fyiaZnwRACarqVNE2Sb+WZvZgycmNvmsV+5sPLhP6rJO8rzilo8
 bCTQ==
X-Gm-Message-State: AOAM53379+ykcT8cT1GfNJOmWMlVS9YxYXCNO9TWZ8nNfEK6ppZ7WJAX
 zzaVIz4Tg1dJsDZmlQSGoPE=
X-Google-Smtp-Source: ABdhPJzxwU1zdZDWToSWLG1H9Tb8Dcht4DsqJlZQ+QYBJSeQMabp0NVOXBBSwyJ9GVy0ZGjaAE1gqg==
X-Received: by 2002:a5d:47cc:: with SMTP id o12mr1944215wrc.236.1608282545045; 
 Fri, 18 Dec 2020 01:09:05 -0800 (PST)
Received: from ?IPv6:2003:ea:8f06:5500:4c80:78d4:f61b:d5eb?
 (p200300ea8f0655004c8078d4f61bd5eb.dip0.t-ipconnect.de.
 [2003:ea:8f06:5500:4c80:78d4:f61b:d5eb])
 by smtp.googlemail.com with ESMTPSA id l8sm11488894wmf.35.2020.12.18.01.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 01:09:04 -0800 (PST)
Subject: Re: [PATCH] mmc: meson-gx: check for scatterlist size alignment in
 block mode
To: Dmitry Lebed <lebed.dmitry@gmail.com>, linux-amlogic@lists.infradead.org
References: <20201218075312.67338-1-lebed.dmitry@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <b52f9e34-5170-59a0-fede-96cf2f999600@gmail.com>
Date: Fri, 18 Dec 2020 10:08:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201218075312.67338-1-lebed.dmitry@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_040907_864657_32CD08BE 
X-CRM114-Status: GOOD (  22.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am 18.12.2020 um 08:53 schrieb Dmitry Lebed:
> Enable SGDMA support for SD_IO_RW_EXTENDED and add proper check
> for scatterlist size alignment in block mode.
> 
> According to documentation, in SDIO block mode meson-gx DMA could
> only handle buffers with sizes that are multiples of SDIO block size.
> 
> Some SDIO drivers like brcmfmac use scatterlist API, but do not enforce
> proper scatterlist buffer size alignemnt, this looks like a root cause
> of non-working CMD53.
> 
It's been too long ago that I worked on this to provide real feedback.
Just one comment: Your commit description sounds like there's a problem
in drivers like brcmfmac. Wouldn't it be better then to first fix these
drivers?

> Some minor style fixes.
> 
> Signed-off-by: Dmitry Lebed <lebed.dmitry@gmail.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 37 ++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 13f6a2c0ed04..eb6c02bc4a02 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -227,7 +227,6 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>  	struct mmc_data *data = mrq->data;
>  	struct scatterlist *sg;
>  	int i;
> -	bool use_desc_chain_mode = true;
>  
>  	/*
>  	 * When Controller DMA cannot directly access DDR memory, disable
> @@ -237,25 +236,33 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>  	if (host->dram_access_quirk)
>  		return;
>  
> -	/*
> -	 * Broken SDIO with AP6255-based WiFi on Khadas VIM Pro has been
> -	 * reported. For some strange reason this occurs in descriptor
> -	 * chain mode only. So let's fall back to bounce buffer mode
> -	 * for command SD_IO_RW_EXTENDED.
> -	 */
> -	if (mrq->cmd->opcode == SD_IO_RW_EXTENDED)
> -		return;
> +	if (data->blocks > 1) {
> +		/*
> +		 * In block mode DMA descriptor format, "length" field indicates
> +		 * number of blocks and there is no way to pass DMA size that
> +		 * is not multiple of SDIO block size, making it impossible to
> +		 * tie more than one memory buffer with single SDIO block.
> +		 * Block mode sg buffer size should be aligned with SDIO block
> +		 * size, otherwise chain mode could not be used.
> +		 */
> +		for_each_sg(data->sg, sg, data->sg_len, i) {
> +			if (sg->length % data->blksz) {
> +				WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
> +					  sg->length, data->blksz);
> +				return;
> +			}
> +		}
> +	}
>  
> -	for_each_sg(data->sg, sg, data->sg_len, i)
> +	for_each_sg(data->sg, sg, data->sg_len, i) {
>  		/* check for 8 byte alignment */
> -		if (sg->offset & 7) {
> +		if (sg->offset % 8) {
>  			WARN_ONCE(1, "unaligned scatterlist buffer\n");
> -			use_desc_chain_mode = false;
> -			break;
> +			return;
>  		}
> +	}
>  
> -	if (use_desc_chain_mode)
> -		data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
> +	data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
>  }
>  
>  static inline bool meson_mmc_desc_chain_mode(const struct mmc_data *data)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
