Return-Path: <SRS0=GwWn=Y4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A59CA9EB5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Nov 2019 16:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2FBE20650
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Nov 2019 16:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbeAZL89";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zaGsSIhE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2FBE20650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j8QrMBg2yzDhKk+PnXA6YN3/yXAnnLmyz6Unt21XDp0=; b=fbeAZL89BJoSOJsronfH+VuoB/
	rItzCWYSHdLRiUWpBh4VhxJLsOlyR2M+oczYbEpUuGgtPI3VNyhTbsK0TVRHVWaNBItQqFpHo2aQd
	WoWNBg4FLc97S5OwEktSt9BGR25ted6HKDm4RM/OwIFnfrIZR5loUoEoFI06a1FfToMAeEnWPfZbS
	omIYBPmrYca3+47JM+C/wwX+9b9iS/8bGT0u4ordLdRPQeNoexWlXGs2M5KQXspfqKeVSRazkAsxE
	KaQxvHOFRRuhtHxUF8nGM1rLg/Hqj7kttG69I8J2mVmLhEwRnOyjHzvF57rOkIlSyyx1BI0S5cK8k
	RZ3jG9MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRfUy-0003jy-Am; Mon, 04 Nov 2019 16:46:36 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRfUv-0003jG-9D
 for linux-amlogic@lists.infradead.org; Mon, 04 Nov 2019 16:46:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so17888884wrf.9
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Nov 2019 08:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=yYqCq8KhOX1XfK+4my7gRFLEElNBe7VMFAXF/vowPJU=;
 b=zaGsSIhEQJNli0xTl6p2gaxhcRnC0CeRxYnx8/folWOcBW0KnPgmwxUa1sTvuv2+ml
 Tm+gwngevn4bGV3HFC0ftCV2eLmFgsOFhyKilnqEzUpM3cdPjFp5PfrYo7W3Wsyni+U0
 CzMKT53+/ymQi7GUFT2teuz42fm0IhuKz8Z3GHU1pvpLj88tckih7ne1f2CG40kpEbLJ
 6OhXbabxb7DZwroauWzVZwSnMjE1KoSMo16cNF1pzAqmfGg6m9NYvCtuNJeh/U4xRayA
 8wLLxpq+bs4udOGFWbsGZBo8HUsxfOYE2YovROhs13GBbKbIBXCbhkUKRgMQigvTaeBS
 JS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=yYqCq8KhOX1XfK+4my7gRFLEElNBe7VMFAXF/vowPJU=;
 b=cS1DuMBFIkPz6U1zz50TCPrRABkO7ExHDd1pxze0pEUwvK4stNj6i5noJroaVaP9J0
 rW6Nb6eh6N4L/PpzatAifQzn159f1d8fA5aMtSSv55w3ZTZJ67g04UJEf+KQ2Zovpk+D
 ZYDyiYk9RSCy8s2IwOFJkHPgixJDocwqsQI3k0pYvwyGntLRxoVFmF2dVhdPWnNFDdXq
 QetCxR3ULa1iJsCvV8goTHOWcAmZcoHA0uTIhkexf5zc8Qg4HTBOcxb5NDbBMhTD52iN
 nPgnNPP1dcW1ihpIf7FA15cz8Fh1E4gWwcldxMtEZV+IS49UCO6YPQGmLiddiRY7nYPb
 sjzQ==
X-Gm-Message-State: APjAAAW4kJYethe9dJvcRC9xJltatpwlo1sb3hv9qsr+k11/eteeayLc
 sOpCHD+kncnHb4ZgtJONNMyrgepwVKg=
X-Google-Smtp-Source: APXvYqwtTkntsyrCVChFM/qW78NBMKri8/Pi6x4pYvlGHeSR9ysRFCfTGUvMr3mLkX6O/kklkRqvpQ==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr24013158wrv.5.1572885991569;
 Mon, 04 Nov 2019 08:46:31 -0800 (PST)
Received: from localhost (uluru.liltaz.com. [163.172.81.188])
 by smtp.gmail.com with ESMTPSA id t5sm6411032wro.76.2019.11.04.08.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 08:46:30 -0800 (PST)
References: <1572868495-84816-1-git-send-email-jianxin.pan@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2] mmc: meson-gx: fix mmc dma operation
In-reply-to: <1572868495-84816-1-git-send-email-jianxin.pan@amlogic.com>
Date: Mon, 04 Nov 2019 17:46:29 +0100
Message-ID: <1ja79b4mje.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_084633_463128_6EEC0DF5 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: Victor Wan <victor.wan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-mmc@vger.kernel.org,
 Nan Li <nan.li@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 04 Nov 2019 at 12:54, Jianxin Pan <jianxin.pan@amlogic.com> wrote:

> From: Nan Li <nan.li@amlogic.com>
>
> In MMC dma transfer, the region requested by dma_map_sg() may be released
> by dma_unmap_sg() before the transfer is completed.
>
> Put the unmap operation in front of mmc_request_done() to avoid this.

In the previous thread, you have described what was the issue you found.
It would be nice to have this information here

>
> Fixes: 79ed05e329c3 ("mmc: meson-gx: add support for descriptor chain mode")
> Signed-off-by: Nan Li <nan.li@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Based on Uffe comment I tried something else.

Basically, it enables chained mode in the driver only when the framework
calls pre/post_req callback. As far as understood, the framework calls
this when there is more than one request pending ... which seems to be
when chained mode actually make sense

----8<-----
diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index e712315c7e8d..399604b4124d 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -126,8 +126,7 @@
 #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
 #define SD_EMMC_DESC_BUF_LEN PAGE_SIZE
 
-#define SD_EMMC_PRE_REQ_DONE BIT(0)
-#define SD_EMMC_DESC_CHAIN_MODE BIT(1)
+#define SD_EMMC_DESC_CHAIN_MODE BIT(0)
 
 #define MUX_CLK_NUM_PARENTS 2
 
@@ -228,7 +227,6 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 	struct mmc_data *data = mrq->data;
 	struct scatterlist *sg;
 	int i;
-	bool use_desc_chain_mode = true;
 
 	/*
 	 * When Controller DMA cannot directly access DDR memory, disable
@@ -251,12 +249,11 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 		/* check for 8 byte alignment */
 		if (sg->offset & 7) {
 			WARN_ONCE(1, "unaligned scatterlist buffer\n");
-			use_desc_chain_mode = false;
-			break;
+			return;
 		}
 
-	if (use_desc_chain_mode)
-		data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
+	/* The planets are aligned, let's chain them up */
+	data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
 }
 
 static inline bool meson_mmc_desc_chain_mode(const struct mmc_data *data)
@@ -278,7 +275,6 @@ static void meson_mmc_pre_req(struct mmc_host *mmc, struct mmc_request *mrq)
 		return;
 
 	meson_mmc_get_transfer_mode(mmc, mrq);
-	data->host_cookie |= SD_EMMC_PRE_REQ_DONE;
 
 	if (!meson_mmc_desc_chain_mode(data))
 		return;
@@ -803,25 +799,11 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 {
 	struct meson_host *host = mmc_priv(mmc);
-	bool needs_pre_post_req = mrq->data &&
-			!(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
-
-	if (needs_pre_post_req) {
-		meson_mmc_get_transfer_mode(mmc, mrq);
-		if (!meson_mmc_desc_chain_mode(mrq->data))
-			needs_pre_post_req = false;
-	}
-
-	if (needs_pre_post_req)
-		meson_mmc_pre_req(mmc, mrq);
 
 	/* Stop execution */
 	writel(0, host->regs + SD_EMMC_START);
 
 	meson_mmc_start_cmd(mmc, mrq->sbc ?: mrq->cmd);
-
-	if (needs_pre_post_req)
-		meson_mmc_post_req(mmc, mrq, 0);
 }
 
 static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
---->8-----

No performance hit AFAICT.
From your description, it should address your problem too.

>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index e712315..7667e8a 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -173,6 +173,7 @@ struct meson_host {
>  	int irq;
>  
>  	bool vqmmc_enabled;
> +	bool needs_pre_post_req;
>  };
>  
>  #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
> @@ -654,6 +655,8 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
>  	struct meson_host *host = mmc_priv(mmc);
>  
>  	host->cmd = NULL;
> +	if (host->needs_pre_post_req)
> +		meson_mmc_post_req(mmc, mrq, 0);
>  	mmc_request_done(host->mmc, mrq);
>  }
>  
> @@ -803,25 +806,23 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  {
>  	struct meson_host *host = mmc_priv(mmc);
> -	bool needs_pre_post_req = mrq->data &&
> +
> +	host->needs_pre_post_req = mrq->data &&
>  			!(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
>  
> -	if (needs_pre_post_req) {
> +	if (host->needs_pre_post_req) {
>  		meson_mmc_get_transfer_mode(mmc, mrq);
>  		if (!meson_mmc_desc_chain_mode(mrq->data))
> -			needs_pre_post_req = false;
> +			host->needs_pre_post_req = false;
>  	}
>  
> -	if (needs_pre_post_req)
> +	if (host->needs_pre_post_req)
>  		meson_mmc_pre_req(mmc, mrq);
>  
>  	/* Stop execution */
>  	writel(0, host->regs + SD_EMMC_START);
>  
>  	meson_mmc_start_cmd(mmc, mrq->sbc ?: mrq->cmd);
> -
> -	if (needs_pre_post_req)
> -		meson_mmc_post_req(mmc, mrq, 0);
>  }
>  
>  static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
