Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D7DC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jan 2022 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6pI+iEUqDqaxoJw/bwXodxR51fGHF7pNHN9RtfYBsI=; b=n2ucS8NAF5Qse+
	LKnkIykaxtk9bNoW8+CPIO/B5L0n6QlEcIZRnF1r9Bqh4Z0fm64ySOlQIM38yohx/JxECIMKvUhjK
	0CXiqFw/xGmi/eY5ImPwflojUMUnEYZS9Crb5m6P6yIEpzFl5WqZDJGBOmy6s+thw+klg8/PZxARc
	3T7/J1btSHd/BXrp2/MKmiWflz3YoR/A9hiW6wFgEpSUrH3ZBckXiyjxssgK0Yv5CYEpE/3RXGVwp
	i/qdtrA78V0bMJpVEcFCs4NbWH0mc0UvH8CefQFT+eT3tJgnXdph+tBrt2zBTEIcI/evVas7lW1Nt
	hOM2GMnlD5Gr9nc3WeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC7Sl-005PiD-MH; Mon, 24 Jan 2022 22:05:23 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC7Sh-005PhQ-Jv
 for linux-amlogic@lists.infradead.org; Mon, 24 Jan 2022 22:05:21 +0000
Received: by mail-pf1-x434.google.com with SMTP id a8so12053225pfa.6
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jan 2022 14:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=t2/pVCkMGUvGOAzHtcsjzXK8+5zE14NO4NddvkDqj9w=;
 b=zgQsj3L6OSg50dgEyhI8VbLJQG2U1v8YozGt0iCNFUM1VD44MdEEHw1TSHFiiFusYm
 KDxrEiMMuxae+sOtjt1EAf0QRiHYPBqrWfrqeoKDDcS9C6HEE8Yc+eiMecOXPMVj7yBn
 vR6x7/Nxu9rUwbIaPs6BeMj7O0HmKhccqmGffa7QrvZQpq6IeST+8ublmUmvRAE0oJYn
 AdMckgD861YXcZiqZQjGz7k0XtXBU9eYrbKNJx0axcLK9lsZTYS39AsDHHQjpRxksUAV
 NzMsZ/b68MBEQWFupMhFjbLnuTikjDakneYKyipvasoYBv/IYV2UBa0nLqwjNKUeungZ
 2D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=t2/pVCkMGUvGOAzHtcsjzXK8+5zE14NO4NddvkDqj9w=;
 b=4AJihxEyfc/p1nbId7GF29w11pUzH7OtoE91Q5IjjvHAt6SstT7FbcDm+CPh/jnJJu
 w/ZDTo2s8XnTqulqBsj1sK5ydo+YdgXrE79b15UfhZ8AZRaeGjtvpB/bLP7HE66ENcVI
 JL3h9wAuQhKIBV8JNz76NAtZ6ahfFMff7dVJUug8Hd+3hRa+IksFG98WSCLEha+PkaIm
 fLobJYArQnqrzDm9Bf3MiztiNw9L2/P87UPbUNW12FAO2Efd5vC66QB7KqhUbB1/SE4r
 kSbxnjaIaFV2fE6vgIejRe8eSkGi2skYuV+jxYCMuSEQCYrl8f338cfwaM+ePddEeZWV
 ht8Q==
X-Gm-Message-State: AOAM532UY13H2fhNVJVIPpR/bUQFnQ/VIsp+1NQmqV+8TPQnn3LnO7CE
 vL1o4h5zo5SFHjfsOTJjKvA0+Q==
X-Google-Smtp-Source: ABdhPJxjC87yai3OmklySQg2guTsUaM+Gp8LsOyFaNfbg6oSqG4pZdEJrXLL3UYim1KqqbXZDdEcOw==
X-Received: by 2002:a05:6a00:114f:b0:4c5:72f6:d0b5 with SMTP id
 b15-20020a056a00114f00b004c572f6d0b5mr15521818pfm.61.1643061918766; 
 Mon, 24 Jan 2022 14:05:18 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id g12sm16231227pfm.119.2022.01.24.14.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:05:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rong Chen <rong.chen@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, 1131046452@qq.com,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: 45581586@qq.com, Rong Chen <rong.chen@amlogic.com>
Subject: Re: [PATCH] mmc: meson: Fix usage of meson_mmc_post_req()
In-Reply-To: <20220106105453.3875119-1-rong.chen@amlogic.com>
References: <20220106105453.3875119-1-rong.chen@amlogic.com>
Date: Mon, 24 Jan 2022 14:05:17 -0800
Message-ID: <7htudsx00y.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_140519_693085_8B214BEA 
X-CRM114-Status: GOOD (  18.35  )
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

Hello Rong,

First, thank you finding the issue and for submitting a fix!

Rong Chen <rong.chen@amlogic.com> writes:

> To ensure the DMA moves data correctly from memory to
> peripherals, DMA unmapping when the MMC request done
> with calls meson_mmc_post_req().
>
> Signed-off-by: Rong Chen <rong.chen@amlogic.com>

The patch looks correct, but I think I think the changelog could be
improved.  If I understand the code correctly, I think what you're doing
is:

"""
Currently meson_mmc_post_req() is called in meson_mmc_request() right
after _start_cmd().  This could lead to DMA unmapping before the request
is actually finished.

To fix, ton't call meson_mmc_post_req() until _request_done().
"""

Kevin

> ---
>  drivers/mmc/host/meson-gx-mmc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 8f36536cb1b6..6a9554ae4b1c 100644
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
> @@ -663,6 +664,8 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
>  	struct meson_host *host = mmc_priv(mmc);
>  
>  	host->cmd = NULL;
> +	if (host->needs_pre_post_req)
> +		meson_mmc_post_req(mmc, mrq, 0);
>  	mmc_request_done(host->mmc, mrq);
>  }
>  
> @@ -880,7 +883,7 @@ static int meson_mmc_validate_dram_access(struct mmc_host *mmc, struct mmc_data
>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  {
>  	struct meson_host *host = mmc_priv(mmc);
> -	bool needs_pre_post_req = mrq->data &&
> +	host->needs_pre_post_req = mrq->data &&
>  			!(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
>  
>  	/*
> @@ -896,22 +899,19 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  		}
>  	}
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
>
> base-commit: 356f3f2c5756bbb67a515760966a40fc7043cdda
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
