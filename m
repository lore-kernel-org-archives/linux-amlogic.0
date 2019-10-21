Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52B6CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 15:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6ED220B7C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 15:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cs9/gl+a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vZKXjgAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6ED220B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jXAD5nepfzV6BsquZu/TAPKZCJ6f91htt6oSSYs4EYQ=; b=cs9/gl+atsYjxjHsApNQJSIhWO
	ajfijpOZtmy0CI/0uc6i4FgKBV4Zi36P7SjhRNOyACHBpjHF3OfZGhm55im8n24WmwQah2gOfCsVL
	LEk1xtgjlHaJ1KNddYaZlU2jI/4LXhe8NwfUaa6WPtFgvpmg+EPRDESkYgiV6t+zAXOCrBSyskDzA
	ax7F3jQU0aSNBpqU+4x9dW/LkKqjjc4XOc+z0nnRz7gXWd6WFVkOMPOpl7ZrjSYH9D+tPEF0UrsXM
	WYwJd+jTOsGr8OtLUT2ZF+xLegwHqFlFBtpGAYaASEoinOcgPjQVFvCZ0D26VazKvb4p2f4mNAwcX
	b4XMN1Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMZjf-0002Ay-BQ; Mon, 21 Oct 2019 15:36:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMZja-00029t-Sj
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 15:36:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id c6so2319646wrm.6
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=dNJmxPlS7rbEDbw9OFNpKCFj/rI6Bli5TiuJbGODHi8=;
 b=vZKXjgAWvlCbcUUcFgP8yRK42f19FhF4eEf1VRRhpKIxcRYDA6jrVTwLTEP6rYKCaO
 1Koqa9mHjiS50ZYqzUqkUXkUj7+7pEkYU5RIMggBBa2u0aXJEpT9n6cvYCPCRq+595pS
 SPn6Hf5KI88ypFdzo0lQ2fRYQnY9MPeLaj8+MzkStoJLdauMhUq0VmA42tbaTw7wGv4k
 owh8sTI8FqRG9m4BqRxcF5ili3/EMUK4AeO7gAEcWG51kAd7+IE4gPPC6beqjxWFSXIU
 /XLny2nmQ47n6ntcP57ifMvXpE8jH6qt5mo3RRiA0nnRU+PKXbN8ElY0KG2TEiH2pmO4
 pM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=dNJmxPlS7rbEDbw9OFNpKCFj/rI6Bli5TiuJbGODHi8=;
 b=mlItI4RFXyztn16y4cgrg22+MIakFBGvdbMGUcvPs1JlxdNIF46ER3X+hIxvutwy3a
 epSdeFvXBlwVokdEq3hdGYlbtOqlMg3qWbGjTiwzUNdDvatiFeYv4PXq58EKaWnOU245
 PTBsMrSUnw4m2IsDGpDL2fbRXqKNAQsUm1Y7GFnhm/7fyrgOMhzVKRC/OvNbYCC5g3sT
 B6Wochep+FBjJbCt1CCR4heJwiJ/OAsfZlFEM+XqIQzegy8mJHZPpJbWE3+5NwlO3X95
 Kxk4LnnDbhNd7R8a4cSNI+BvEY0aXZcWBPIta6xNaRqUDv4Rtu7otRhBKQDhOsb3EhiT
 Qktw==
X-Gm-Message-State: APjAAAXgVK6chkjchZaV07BVMWi2PReKMnjgN/h+k/q0hhisxrh8e4GG
 +6zWCYmJjrbjFzn6U7PT3c0AYQ==
X-Google-Smtp-Source: APXvYqykqfD7nlSlbiHzaBMYXj1CdZefUvx3QG0SGzaxiJ37fYY/PtPcmN0GFNuQBCaoudhb5VhSpw==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr5601740wrp.84.1571672195495; 
 Mon, 21 Oct 2019 08:36:35 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d199sm5937609wmd.35.2019.10.21.08.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:36:34 -0700 (PDT)
References: <1571637541-119016-1-git-send-email-jianxin.pan@amlogic.com>
 <fc1f61e1-b156-11e6-3f21-c498d2f0a8c6@baylibre.com>
 <1jwocybgpw.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFq_YAB0tycE2ypdJp8gckfeiFRv=A120ZedyDDhu3K17w@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: fix mmc dma operation
In-reply-to: <CAPDyKFq_YAB0tycE2ypdJp8gckfeiFRv=A120ZedyDDhu3K17w@mail.gmail.com>
Date: Mon, 21 Oct 2019 17:36:33 +0200
Message-ID: <1jr236az5q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_083638_992376_05040535 
X-CRM114-Status: GOOD (  27.91  )
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
Cc: Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Nan Li <nan.li@amlogic.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 21 Oct 2019 at 16:48, Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On Mon, 21 Oct 2019 at 11:17, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Mon 21 Oct 2019 at 09:57, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> > Hi,
>> >
>> > Thanks for the fix.
>> >
>> > First, you should add "mmc: meson-gx:" in the subject.
>> >
>> > On 21/10/2019 07:59, Jianxin Pan wrote:
>> >> From: Nan Li <nan.li@amlogic.com>
>> >>
>> >> In MMC dma transfer, the region requested by dma_map_sg() may be released
>> >> by dma_unmap_sg() before the transfer is completed.
>> >>
>> >> Put the unmap operation in front of mmc_request_done() to avoid this.
>> >
>>
>> Since we have seen this problem (yet), could you briefly how you've
>> triggered it ?
>>
>> >
>> > You should add a "Fixes:" tag so it can be backported on stable kernels.
>> >
>> >>
>> >> Signed-off-by: Nan Li <nan.li@amlogic.com>
>> >> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> >> ---
>> >>  drivers/mmc/host/meson-gx-mmc.c | 15 ++++++++-------
>> >>  1 file changed, 8 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>> >> index e712315..7667e8a 100644
>> >> --- a/drivers/mmc/host/meson-gx-mmc.c
>> >> +++ b/drivers/mmc/host/meson-gx-mmc.c
>> >> @@ -173,6 +173,7 @@ struct meson_host {
>> >>      int irq;
>> >>
>> >>      bool vqmmc_enabled;
>> >> +    bool needs_pre_post_req;
>> >>  };
>> >>
>> >>  #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
>> >> @@ -654,6 +655,8 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
>> >>      struct meson_host *host = mmc_priv(mmc);
>> >>
>> >>      host->cmd = NULL;
>> >> +    if (host->needs_pre_post_req)
>> >> +            meson_mmc_post_req(mmc, mrq, 0);
>> >>      mmc_request_done(host->mmc, mrq);
>> >>  }
>> >>
>> >> @@ -803,25 +806,23 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>> >>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>> >>  {
>> >>      struct meson_host *host = mmc_priv(mmc);
>> >> -    bool needs_pre_post_req = mrq->data &&
>> >> +
>> >> +    host->needs_pre_post_req = mrq->data &&
>> >>                      !(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
>> >>
>> >> -    if (needs_pre_post_req) {
>> >> +    if (host->needs_pre_post_req) {
>> >>              meson_mmc_get_transfer_mode(mmc, mrq);
>> >>              if (!meson_mmc_desc_chain_mode(mrq->data))
>> >> -                    needs_pre_post_req = false;
>> >> +                    host->needs_pre_post_req = false;
>> >>      }
>> >>
>> >> -    if (needs_pre_post_req)
>> >> +    if (host->needs_pre_post_req)
>> >>              meson_mmc_pre_req(mmc, mrq);
>> >>
>> >>      /* Stop execution */
>> >>      writel(0, host->regs + SD_EMMC_START);
>> >>
>> >>      meson_mmc_start_cmd(mmc, mrq->sbc ?: mrq->cmd);
>> >> -
>> >> -    if (needs_pre_post_req)
>> >> -            meson_mmc_post_req(mmc, mrq, 0);
>> >>  }
>>
>> The code around all this is getting quite difficult to follow eventhough
>> it does not actually do much
>>
>> The root of the problem seems be that meson_mmc_pre_req() and
>> meson_mmc_post_req() are passed to framework but also called manually
>> from meson_mmc_request().
>>
>> Because of this, some code is added to make sure we don't do things twice.
>> Maybe I'm missing something but it look weird ? Ulf, could you give us
>> your view ?
>
> This is tricky, unfortunately.
>
> The main problem boils done to that, there is no guarantee that the
> ->pre|post_request() host callbacks is called at all, as that depends
> on if the mmc block layer has more than one requests in the pipe to
> send. Additionally, that of course varies dynamically on a running
> system.
>
>>
>> As far as I can tell:
>>  * pre_req : determine if we use CHAIN_MODE or not AND
>>              dma_map_sg() if we do
>>  * post_req : dma_unmap_sg() if previously allocated
>>
>> Do we really need to do all this meson_mmc_request() ? Shouldn't we let the
>> framework do the calls to pre/post_req for us ?
>
> Whether we theoretically could simplify the path, by for example
> always calling the ->pre|post_request() callbacks if those exists, is
> probably too late to change. Well, unless we can change all host
> drivers implementing them as well... so it's probably just easier to
> accept this as is.

Don't worry, I was not suggesting to change the framework. I was
questionning our driver implementation.

If I understand, the framework will call pre/post_req only if it has
more than one request ?

Our driver only enable "chained mode" (and the related dma mapping) in
these callback. I don't think it worth enabling "chained mode" if there
is only one request (nothing to chain)

According to you:

* Is it a good idea to enable chained mode only when framework calls
  pre/post req ? (AFAICT, this is what the dw_mmc.c driver is doing)

There is a pretty interresting comment in jz4740_mmc.c about that:

/*
 * The MMC core allows to prepare a mmc_request while another mmc_request
 * is in-flight. This is used via the pre_req/post_req hooks.
 * This driver uses the pre_req/post_req hooks to map/unmap the mmc_request.
 * Following what other drivers do (sdhci, dw_mmc) we use the following cookie
 * flags to keep track of the mmc_request mapping state.
 *
 * COOKIE_UNMAPPED: the request is not mapped.
 * COOKIE_PREMAPPED: the request was mapped in pre_req,
 * and should be unmapped in post_req.
 * COOKIE_MAPPED: the request was mapped in the irq handler,
 * and should be unmapped before mmc_request_done is called..
 */

 Should we try to follow that ?

* OR, we should keep enabling it whenever we can ? In this case, it is
  probably better to not provide pre/post_req to the framework and
  manage things directly in the .request() callback ?

At the moment, we are doing both so it is difficult to figure out what
is doing what ...

>
> One thing though, make sure you have a nice self descriptive naming of
> variables and functions, to deal with this. That helps a lot.
>
> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
