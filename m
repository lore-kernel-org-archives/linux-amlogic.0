Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36CECA9EB5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:19:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07FF20659
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3aSih4G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p4S4M34g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07FF20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I8GNSw+XdC60QrNw/cgTBRnIancXuBwaPlnXhxq6VcY=; b=p3aSih4G/Uz81DonXU6/XdnTyo
	pdsoZzVa8aey6OAHF8I83CYjIjlWwpNB8E5+PChx/2R3C/7jWxlsi1a5pGj3ekvZqC7MRs87++AtI
	fXG6xBH0utKtjxXoO6AAdhKrgZ7UdUyM130e0M0wZGB67ROloK34vCf/mKua/wqlmqqoCp32ZPn1M
	Jra6BxZoRPhcpN6pX/U5gC8pEwgo/l5C4QyfD3XL52rKzfIDiE2AsA028Ezf+dy+a0KqDIidREmwO
	MNRmSjL+L1eqBXFHTAu/bBaN2w6UcF3lk5cAmgXcUXqhRbREb/zMGU8Mg/Z1yZmo81k0oHQ8wMy8e
	tz62rlkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTqs-00068P-9S; Mon, 21 Oct 2019 09:19:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMToW-0004A6-VL
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 09:17:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id f22so11953657wmc.2
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=fyXVzNh3bAaYBk42fBdJzICclG09jxX+kSBbHAatABk=;
 b=p4S4M34gvq7oiAB7J7289QTGzutBGVytHXmZcMwYdJALNOpROj/preCC22gLSwW5TA
 SZs3A+KB5ZLSMPlDwl+QqnbvsdWVWFULUMjp9tYBU0MwSYNvYf9UUTMNbRmzMM1EnayT
 578LwJ+f5/z6e/UV0xFr1Tgnd3uik7trySc2j5I4N0yn8wCA9nzqA/oR4CQk7UXXjaTP
 +VKoQ4TUgX0iNs0XTVtH+X7HcNzxcButh2wy1rSmARSZmcuZm14bzgbx8Vq7CvY2qMMX
 f/lEMkuP1Evq6gn2STPlsSqrhq3BURnK3x9rCVJ2tO/KCFF3HQ/jv3lr8L34ooUyPPHi
 u5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=fyXVzNh3bAaYBk42fBdJzICclG09jxX+kSBbHAatABk=;
 b=jzjV7fdit+9AQHvrzX+liDQ4G1UB3aKvy6DYjXIzas5gPbidGPnS9N3BUCFNpksXLl
 kHaQaGLh+9KgaUf7ddhu9IGTwsmTgx7onSyMdBBhXZ9mwL4zGCKcqjVMk4AZ4LDV3lFo
 GIzns6sm0toX8rvqGcmM1a2TPqBaAyJfthRZEFAUCOi8uNvsLcYqYxKgLpQbee03F33M
 G5f6epWs4N8ecSYPrfiiHpryqYVwfIej6PJyihy8M4YYkqzj3/F0tj3ZTeLyGsqgRlFH
 7fXQ4AaowtbzRWvNDfGvx++m5+R2HemEj+Romw38nYbOv4smRjBZPi4WrHCQ5Xix+50n
 r20A==
X-Gm-Message-State: APjAAAUknSR4FJv/PpzeeB/YdMbaZB+8e8kIyvrmPZx6FzOrg3XZc74R
 oEKppd7o7qEVTwNYyVlZ8NDGZQ==
X-Google-Smtp-Source: APXvYqw+pd4xa5lgOL/v6WOYLZfNpXm5PjaGaVCXIE4K2rWe5kR78a5m76bsxJwfBU9kEbLI6J5SiA==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr19199540wmh.116.1571649437343; 
 Mon, 21 Oct 2019 02:17:17 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f6sm13170666wrm.61.2019.10.21.02.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:17:16 -0700 (PDT)
References: <1571637541-119016-1-git-send-email-jianxin.pan@amlogic.com>
 <fc1f61e1-b156-11e6-3f21-c498d2f0a8c6@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] mmc: fix mmc dma operation
In-reply-to: <fc1f61e1-b156-11e6-3f21-c498d2f0a8c6@baylibre.com>
Date: Mon, 21 Oct 2019 11:17:15 +0200
Message-ID: <1jwocybgpw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_021721_200855_3115EC14 
X-CRM114-Status: GOOD (  18.18  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 Nan Li <nan.li@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 21 Oct 2019 at 09:57, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> Thanks for the fix.
>
> First, you should add "mmc: meson-gx:" in the subject.
>
> On 21/10/2019 07:59, Jianxin Pan wrote:
>> From: Nan Li <nan.li@amlogic.com>
>> 
>> In MMC dma transfer, the region requested by dma_map_sg() may be released
>> by dma_unmap_sg() before the transfer is completed.
>> 
>> Put the unmap operation in front of mmc_request_done() to avoid this.
>

Since we have seen this problem (yet), could you briefly how you've
triggered it ?

>
> You should add a "Fixes:" tag so it can be backported on stable kernels.
>
>> 
>> Signed-off-by: Nan Li <nan.li@amlogic.com>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> ---
>>  drivers/mmc/host/meson-gx-mmc.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>> index e712315..7667e8a 100644
>> --- a/drivers/mmc/host/meson-gx-mmc.c
>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>> @@ -173,6 +173,7 @@ struct meson_host {
>>  	int irq;
>>  
>>  	bool vqmmc_enabled;
>> +	bool needs_pre_post_req;
>>  };
>>  
>>  #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
>> @@ -654,6 +655,8 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
>>  	struct meson_host *host = mmc_priv(mmc);
>>  
>>  	host->cmd = NULL;
>> +	if (host->needs_pre_post_req)
>> +		meson_mmc_post_req(mmc, mrq, 0);
>>  	mmc_request_done(host->mmc, mrq);
>>  }
>>  
>> @@ -803,25 +806,23 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>>  {
>>  	struct meson_host *host = mmc_priv(mmc);
>> -	bool needs_pre_post_req = mrq->data &&
>> +
>> +	host->needs_pre_post_req = mrq->data &&
>>  			!(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
>>  
>> -	if (needs_pre_post_req) {
>> +	if (host->needs_pre_post_req) {
>>  		meson_mmc_get_transfer_mode(mmc, mrq);
>>  		if (!meson_mmc_desc_chain_mode(mrq->data))
>> -			needs_pre_post_req = false;
>> +			host->needs_pre_post_req = false;
>>  	}
>>  
>> -	if (needs_pre_post_req)
>> +	if (host->needs_pre_post_req)
>>  		meson_mmc_pre_req(mmc, mrq);
>>  
>>  	/* Stop execution */
>>  	writel(0, host->regs + SD_EMMC_START);
>>  
>>  	meson_mmc_start_cmd(mmc, mrq->sbc ?: mrq->cmd);
>> -
>> -	if (needs_pre_post_req)
>> -		meson_mmc_post_req(mmc, mrq, 0);
>>  }

The code around all this is getting quite difficult to follow eventhough
it does not actually do much

The root of the problem seems be that meson_mmc_pre_req() and
meson_mmc_post_req() are passed to framework but also called manually
from meson_mmc_request().

Because of this, some code is added to make sure we don't do things twice.
Maybe I'm missing something but it look weird ? Ulf, could you give us
your view ?

As far as I can tell:
 * pre_req : determine if we use CHAIN_MODE or not AND
             dma_map_sg() if we do
 * post_req : dma_unmap_sg() if previously allocated

Do we really need to do all this meson_mmc_request() ? Shouldn't we let the
framework do the calls to pre/post_req for us ?

>>  
>>  static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
>>
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
