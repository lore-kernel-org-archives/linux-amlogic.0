Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4175C25B50
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PDQQ+5pw+j/7Jo+KKdxyFg+aTrckAt7iguJPGny6ak=; b=Avzg8PoF0WTQoYT8sQDBfhLfaj
	BYSbdiHcjfMGV9qnGB6x94vIex/OVcvEvbQbOPWRexc7jCu3BKp6vYRHvQwyrTiz6PTIeqoiF/MoD
	Zh5kyDs5hngtG/kJmjzUykKFC1dBQOt4dzxZ9vZfH8G4vpzSePErCt088TP4BP6z77Kuf/WyelJWl
	V5RVDY8IWipY969Q4Igk/1+htwmQfHn0KaVsUEhxrpKJ5qUCDZq6tLHXXmm+QN6hd2NVZtne51v3o
	7kafoKV39rRBZEj7i7NAnPz1rIciWG1Ny9iXp3z4cEH76n+qO8L9sV//V13DeITcrIKPrD4BGTDiQ
	+F8zE2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtQn-00GZqM-MB; Mon, 23 Jan 2023 09:48:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtQl-00GZpd-IY
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 09:48:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id o17-20020a05600c511100b003db021ef437so8062304wms.4
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 01:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iIfSs1QU1y62hh19vUyf32vrywpZMGQTYBDrvO1iiAw=;
        b=SgDrQSwGjXxTU2UClar2sLKGiAclP9O53rWoeJS/htmHdHmj221R1PfCZvV6sxhIoM
         scZnK8u5Fdu++gqz0qBCFSrK8mAAy5IlNSbApeKcNbbBtydSs8h0XPMlMdR2wQ9fc327
         smRhFO1m+aKBuYbA6906CKaewlaoExJxuRrJazRjmq9evys+5Hx+KZchZKGmuP4zZfJs
         BhHGYp3fXsjvdZiCRuOrLUYAOdC4UHUtnpmCoknonMdD7vDSaYQnxYWTegPJ0bA+xSNN
         BQjVmTifXvQoK6mmzJFGaRTQS79LcU0U8KO7DZW0pfEYqd5MCg/Wz4tjHkO1bVkQMiO5
         bCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIfSs1QU1y62hh19vUyf32vrywpZMGQTYBDrvO1iiAw=;
        b=IJlNgUsXIyrCdNX5NNVwtTUo2t+7xqYSYoUMVPrrBVwB8L7axxv647sPjWrWAwRWVQ
         mzqLok77rTSghcMGANj2Oz8WdjkEs5b5TXcvGn/gCJGv7+STo2zPvnxgflOPxp3X9I7p
         QlyXClYWnMGmRfXwngSpWCAne7rkvoZ/ZrQYV8rOxwcfM9B/3pF9kry4kBrQv8w9cIbn
         ziSKdASMuJCAovKDdwnQF0Nm43ezqxfLhPn9bCCctJ2iPMuVKf5SI3DQ1eO/QpL7y84y
         TvhzWFjGkZ0XclnSQfkwZh1rIOrkNGxjF1demSrA9nhPVBcrz3T5D5DszuAg/BONwtOF
         eD3w==
X-Gm-Message-State: AFqh2kpsQooe3TDc/dzkTYYQ8262dQKqN/kFtPIeG7fiSO/wghvy3c7v
	X23MnL3tq0ukOxMQ27DXP41SdA==
X-Google-Smtp-Source: AMrXdXstCCqiov4SnLO9YPRF6ilbaVnOwBM7iOZselENPe8gfNIr7OzYice+0ciH9jM+ocDeKZ2tgA==
X-Received: by 2002:a05:600c:21c4:b0:3da:fcf1:d4cc with SMTP id x4-20020a05600c21c400b003dafcf1d4ccmr23134268wmj.30.1674467278075;
        Mon, 23 Jan 2023 01:47:58 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id ba9-20020a0560001c0900b002b57bae7174sm4078111wrb.5.2023.01.23.01.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:47:57 -0800 (PST)
Message-ID: <3a3d9fc5-0f61-8da7-dc4c-7b57b0272230@linaro.org>
Date: Mon, 23 Jan 2023 10:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] media: meson: vdec: esparser: check parsing state with
 hardware write pointer
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
References: <20230123094300.2816812-1-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230123094300.2816812-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_014759_661567_C4A823B1 
X-CRM114-Status: GOOD (  15.73  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 23/01/2023 10:43, Christian Hewitt wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> Also check the hardware write pointer to check if ES Parser has stalled.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/staging/media/meson/vdec/esparser.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
> index df5956c6141d..41b705f999b2 100644
> --- a/drivers/staging/media/meson/vdec/esparser.c
> +++ b/drivers/staging/media/meson/vdec/esparser.c
> @@ -300,6 +300,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>   	u32 num_dst_bufs = 0;
>   	u32 offset;
>   	u32 pad_size;
> +	u32 wp, wp2;
>   
>   	/*
>   	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
> @@ -354,15 +355,21 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>   	}
>   
>   	pad_size = esparser_pad_start_code(core, vb, payload_size);
> +	wp = amvdec_read_parser(core, PARSER_VIDEO_WP);
>   	ret = esparser_write_data(core, phy, payload_size + pad_size);
> +	wp2 = amvdec_read_parser(core, PARSER_VIDEO_WP);
>   
>   	if (ret <= 0) {
> -		dev_warn(core->dev, "esparser: input parsing error\n");
> -		amvdec_remove_ts(sess, vb->timestamp);
> -		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>   		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
>   
> -		return 0;
> +		if (ret < 0 || wp2 == wp) {
> +			dev_err(core->dev, "esparser: input parsing error ret %d (%x <=> %x)\n",
> +				ret, wp, wp2);
> +			amvdec_remove_ts(sess, vb->timestamp);
> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +
> +			return 0;
> +		}
>   	}
>   
>   	atomic_inc(&sess->esparser_queued_bufs);

It's weird, but:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks Christian for handling those changes

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
