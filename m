Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48983C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNzAUpOGzv71RUR7S08sdHB3cu9C0p/ayTK0D1sDzrE=; b=DwzoN/TChXiziX
	BnfBauEOt3E9jAdXuwBedQc5SrZlG/TLmLqislzkhmnuEwcIi6o9gJEY2uyfK59vB+SFo8cNTePVK
	I6uGYzfPU9rz0dGX/+hxBhHwyQ56y7UkCmR/CmpuvQvmYvkevrtzBcQRg9+uhYIOoBL6LN/yrA0Ih
	bBWwIu5J5gbcqA3aHztYaY+8SsmkE9ebG0Afx2GtkVbHIHU8HVdkTkXWZIg6IWvSsL85MuY+ov0lV
	VKz3Khq01jJrjyhudaU3M9Pmmd+egk09lsZQyhN9cUU6wh9VN5IhjPtDF0mxOb2yKbmJbf07rX1JZ
	Uiz2tSqlmT/aEodLNwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvZS-00H1kN-81; Mon, 23 Jan 2023 12:05:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvZQ-00H1j6-0X; Mon, 23 Jan 2023 12:05:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id l8so8813073wms.3;
        Mon, 23 Jan 2023 04:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMBmfoYya5PgXn4YZDfYUMtggySAK/HwKMtRK6plYP8=;
        b=aCU33KhsnXFUu/IDemepIQPPaq2LWevf+0j8EsEsDOKcPezA+2LRMTWVj6e7OhCTof
         74UbpHP/JGepMFB624HIud3lHqIYZ7ZTbcZ2rbBSRWQnegNZO8yeHwuSr99YMeyeHVJr
         EyObPon+WO0wm2A7JXtjbdr7TZnPYK9oO3MARvQzG8g4982t7Vwt+KYNKduRnoCFfrng
         RKugvQXK2NgH85j1FR1B8+7gDZYIKLI5mw25/eIwiaMR37J4PjB06vKn7+MNVR+Sr1BM
         P3Gdj+KFebm4nRw40LsUcpmUdktHz/xwmbTxbAaTpmgB+Mg01XaT7FpXBTWfQAw74EzU
         N/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMBmfoYya5PgXn4YZDfYUMtggySAK/HwKMtRK6plYP8=;
        b=0UYuxz5T9Eqj4GUEWxzn+n+N3yTJYVD5hjaGEfRIdOAdJvS6uEnTgXh28p8HOOmF3d
         lqpYpg727vozr851KB1Z+v+xQo2hQXydnUFPZfbSEuLBCPOHcOA8ezg2aoCyMjRiCd9C
         AT1txzbG00xo0vnzG/I2ERXWeGvYw5kAtirjo4c+JAbpbOwe4aiecx+Qr4PxAMzcHMSF
         vnZ4GfNEy9+1YEDFYMIqVbMdeThlYjqZZAiQJWOwnJz08a/ggN3+PPLtD/P5jpK/4w7J
         CtvBkNj9VzedmFI8Yv1+8u03GTmxuIvBfXc4oKzZvyc8cnpeOHumEh0wsqfLQ0AxZUTo
         GlRA==
X-Gm-Message-State: AFqh2krcNEdpRN4Srvuip1B+rjgMaROZpfdMQroz8qgCNCbd/qe8zYQR
	Bsa5KBSFcdEbQx4w1mUVxDM=
X-Google-Smtp-Source: AMrXdXtxDoap+d7zX3hP2ldTumD2iqOsEVcDveuuO4JcRCXk81Ogw0HNRqLo4TXJHw9H9gLnIDeBwg==
X-Received: by 2002:a05:600c:4e4b:b0:3db:2e6d:9f79 with SMTP id e11-20020a05600c4e4b00b003db2e6d9f79mr12360642wmq.39.1674475500256;
        Mon, 23 Jan 2023 04:05:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b003c6f8d30e40sm11642757wmq.31.2023.01.23.04.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:04:59 -0800 (PST)
Date: Mon, 23 Jan 2023 15:04:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] media: meson: vdec: esparser: check parsing state with
 hardware write pointer
Message-ID: <Y8536BzbbghJt0G2@kadam>
References: <20230123094300.2816812-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230123094300.2816812-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_040504_098663_52F508AD 
X-CRM114-Status: GOOD (  25.20  )
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

On Mon, Jan 23, 2023 at 09:43:00AM +0000, Christian Hewitt wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> Also check the hardware write pointer to check if ES Parser has stalled.
> 

Presumably this is something which has happens in real life?  Say a user
has this hardware and is wondering if this patch fixes their bug, what
does this bug look like to them?

Please add a Fixes tag.

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/esparser.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
> index df5956c6141d..41b705f999b2 100644
> --- a/drivers/staging/media/meson/vdec/esparser.c
> +++ b/drivers/staging/media/meson/vdec/esparser.c
> @@ -300,6 +300,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>  	u32 num_dst_bufs = 0;
>  	u32 offset;
>  	u32 pad_size;
> +	u32 wp, wp2;
>  
>  	/*
>  	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
> @@ -354,15 +355,21 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>  	}
>  
>  	pad_size = esparser_pad_start_code(core, vb, payload_size);
> +	wp = amvdec_read_parser(core, PARSER_VIDEO_WP);
>  	ret = esparser_write_data(core, phy, payload_size + pad_size);
> +	wp2 = amvdec_read_parser(core, PARSER_VIDEO_WP);
>  

Why is check not done inside the esparser_write_data() function?  It
really feels like doing a write where nothing happens should be a bug
for both callers...

The esparser_write_data() function returns > 0 on success, 0 on timeout
(I guess timeout is an error-ish) and negative if the user presses
CTR-C.  There are no comments to explain the unusual returns.  Could we
clean this up so it just returns negatives on error and zero on success
or if not then let's add a comment explaining what's going on?

>  	if (ret <= 0) {
> -		dev_warn(core->dev, "esparser: input parsing error\n");
> -		amvdec_remove_ts(sess, vb->timestamp);
> -		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>  		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
>  
> -		return 0;
> +		if (ret < 0 || wp2 == wp) {

So in this patch if there is a timeout but something was written then
that's kind of a success path?

regards,
dan carpenter

> +			dev_err(core->dev, "esparser: input parsing error ret %d (%x <=> %x)\n",
> +				ret, wp, wp2);
> +			amvdec_remove_ts(sess, vb->timestamp);
> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +
> +			return 0;
> +		}
>  	}
>  
>  	atomic_inc(&sess->esparser_queued_bufs);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
