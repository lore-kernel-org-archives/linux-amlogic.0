Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AE3C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 09:19:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F1E21D79
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 09:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F1E21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O0gPRDyhhT86COoKOsYTWEec/0Ht7DRecEJ4DMiME+E=; b=iFZb4nEhs0j9ELjhZEpEXWNSa
	9/AEpYP9NQC67LPL2OnNO3hXCVs2WAU7/okFQgDAl4OHr2nHBJi+zKDPdDfSN5QAURWbrYWQHNnD1
	q+a5J3h6myHAVYFyDWpldH13KcOC8/bjHIz8+wQGmHrXX1fA3kh4OEPq9xKy1c2vZgJBGMPW4rlEp
	GmZuxViAzZuRzv0GShzpUlClAJaGwbPFGR8qXBQkqRHVjWYszJAA5aD5Ug/4/dh6m4d2QdAnLPGku
	ws7dRWYP5K62qaLNO/FTz0JB06XtfTlrtftwEVHQ+MSz7EokqyiuHhh491RBCs2ftfL0hfCjxG72Y
	aWCzBRuIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwM1H-0003Qx-SC; Mon, 04 Jan 2021 09:19:19 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwM1F-0003PC-DX
 for linux-amlogic@lists.infradead.org; Mon, 04 Jan 2021 09:19:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id b9so35956134ejy.0
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Jan 2021 01:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=DueC5htyr1VhszUpmTm/tUVLrShThCg3h0/N3NarSwU=;
 b=A61zspJyVrET5bTumm0JSaxaUCSMDw0g8u6TZ1yADrWhPPWSaJ/nVlpBnHERM1nizQ
 hOYhIy51OyR2Vj6Um/wAlqOHnt2n2/ET2pdwf/0ovKJ0OXz+BLsoDYZYoQqUHFJDbqWF
 UmL+PUhQIT/qnQ7L2ye3fRa57+ajmccN3wqO+sXE71HGXN+nrpaYlEpazLl1svL4qSXd
 wAhOL8V9HQA7piUP2IJLwG1yGrQsP7M+RjwQ3BOy2mg+Nxj575ms9e9kSBdL4lZx8J7w
 FAfuFlVs+kQVe5VPkMaEyBa1APIvRpooat7UCOWO3juQsCRovne1wVwMsQqRBID4ss5z
 qi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=DueC5htyr1VhszUpmTm/tUVLrShThCg3h0/N3NarSwU=;
 b=geHkE+myUtD828GvtSS5QhO9OfEobXAdx4lShkVhhBgLHEssON2n2cvTbHqjK2SIBo
 KzYiaeeZu9FgwanUfuU3jmOwGUpdPGs/QO0EEn7Q1JYcqu6+RiLlTn0l7Ea1rcXnxGtt
 aZYsGZ54MDayAunuuDymLt+rb4Fl2kho3aOHdL9qAY4RsW9znUmdX5c/CCbvDfQl+npB
 jxU/Hh2lRG+0vYdHFRew4Nfc3xIhksct87B+7CAWA6e1VVDuuGqkCCUiFpxH0FoMOHBO
 UUFYU4R9aVyHYleXi+0yw6Vji7yMMwnueGN7f61hP+UzDmV0kq2iKO+N5+Q+z98+nOyS
 bEcA==
X-Gm-Message-State: AOAM530ZSXXYnc4hFQhXm8UATQqvt75qdzEtYkcDgKK1TqW5A3CPqULo
 DT/vHR2FxObWh5M8QnsZXDPh0A9bejwiXKBG
X-Google-Smtp-Source: ABdhPJxqFryCMELbN8WJJJjZ5a7Uk1KXymyUk57FkCsFhIM+ZX2JhMxlKrqs3m4qRgYb1qqMpb7ogA==
X-Received: by 2002:a17:906:56ca:: with SMTP id
 an10mr66060606ejc.498.1609751954834; 
 Mon, 04 Jan 2021 01:19:14 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id e21sm43094575edv.96.2021.01.04.01.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 01:19:14 -0800 (PST)
References: <20201218075312.67338-1-lebed.dmitry@gmail.com>
 <b52f9e34-5170-59a0-fede-96cf2f999600@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Dmitry Lebed
 <lebed.dmitry@gmail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] mmc: meson-gx: check for scatterlist size alignment in
 block mode
In-reply-to: <b52f9e34-5170-59a0-fede-96cf2f999600@gmail.com>
Message-ID: <1j8s99xdny.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 04 Jan 2021 10:19:13 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_041917_600817_1397400E 
X-CRM114-Status: GOOD (  19.29  )
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


On Fri 18 Dec 2020 at 10:08, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Am 18.12.2020 um 08:53 schrieb Dmitry Lebed:
>> Enable SGDMA support for SD_IO_RW_EXTENDED and add proper check
>> for scatterlist size alignment in block mode.
>> 
>> According to documentation, in SDIO block mode meson-gx DMA could
>> only handle buffers with sizes that are multiples of SDIO block size.
>> 
>> Some SDIO drivers like brcmfmac use scatterlist API, but do not enforce
>> proper scatterlist buffer size alignemnt, this looks like a root cause
>> of non-working CMD53.
>> 
> It's been too long ago that I worked on this to provide real feedback.
> Just one comment: Your commit description sounds like there's a problem
> in drivers like brcmfmac. Wouldn't it be better then to first fix these
> drivers?

While this may be true, I think the proposed change is better than the
device/command specific work around we had so far.

>
>> Some minor style fixes.
>> 
>> Signed-off-by: Dmitry Lebed <lebed.dmitry@gmail.com>

Thx.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>> ---
>>  drivers/mmc/host/meson-gx-mmc.c | 37 ++++++++++++++++++++-------------
>>  1 file changed, 22 insertions(+), 15 deletions(-)
>> 
>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>> index 13f6a2c0ed04..eb6c02bc4a02 100644
>> --- a/drivers/mmc/host/meson-gx-mmc.c
>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>> @@ -227,7 +227,6 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>>  	struct mmc_data *data = mrq->data;
>>  	struct scatterlist *sg;
>>  	int i;
>> -	bool use_desc_chain_mode = true;
>>  
>>  	/*
>>  	 * When Controller DMA cannot directly access DDR memory, disable
>> @@ -237,25 +236,33 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>>  	if (host->dram_access_quirk)
>>  		return;
>>  
>> -	/*
>> -	 * Broken SDIO with AP6255-based WiFi on Khadas VIM Pro has been
>> -	 * reported. For some strange reason this occurs in descriptor
>> -	 * chain mode only. So let's fall back to bounce buffer mode
>> -	 * for command SD_IO_RW_EXTENDED.
>> -	 */
>> -	if (mrq->cmd->opcode == SD_IO_RW_EXTENDED)
>> -		return;
>> +	if (data->blocks > 1) {
>> +		/*
>> +		 * In block mode DMA descriptor format, "length" field indicates
>> +		 * number of blocks and there is no way to pass DMA size that
>> +		 * is not multiple of SDIO block size, making it impossible to
>> +		 * tie more than one memory buffer with single SDIO block.
>> +		 * Block mode sg buffer size should be aligned with SDIO block
>> +		 * size, otherwise chain mode could not be used.
>> +		 */
>> +		for_each_sg(data->sg, sg, data->sg_len, i) {
>> +			if (sg->length % data->blksz) {
>> +				WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
>> +					  sg->length, data->blksz);
>> +				return;
>> +			}
>> +		}
>> +	}
>>  
>> -	for_each_sg(data->sg, sg, data->sg_len, i)
>> +	for_each_sg(data->sg, sg, data->sg_len, i) {
>>  		/* check for 8 byte alignment */
>> -		if (sg->offset & 7) {
>> +		if (sg->offset % 8) {
>>  			WARN_ONCE(1, "unaligned scatterlist buffer\n");
>> -			use_desc_chain_mode = false;
>> -			break;
>> +			return;
>>  		}
>> +	}
>>  
>> -	if (use_desc_chain_mode)
>> -		data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
>> +	data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
>>  }
>>  
>>  static inline bool meson_mmc_desc_chain_mode(const struct mmc_data *data)
>> 
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
