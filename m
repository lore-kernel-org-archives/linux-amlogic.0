Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8156BC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USFWngRdhgOUrH/HozYatNdkphAloJwRsOsLEXx5w0A=; b=gwTPfUtxF8iEIy
	dZmyyNNQA5gFjSSsIndu69/3JZlGSuZxLOKBTv18dNHPmuQqgBh4Ip/+A10FOoWOhyQzuEpVfbEkq
	WdX7Kyd/YYPsXHMmdjOLyQu4WMnc9p2sydcnRkB+dhjF1O4IIhFmwjio64PwsR0QQZ644BjPSdiOE
	BLvSl6rAvaBJpIRy5mE4Xiik9SaJ5+PLX+T/3VpyWYxeH8mIDVl784DtZ4EDyBczQRG37cicnAd3o
	pNd+NJNxb4SYz/uWkvQYxwVcmEXIEZ2dB0oUbUfJQolMRHE7e7qoXb5uOlab3sIGOiO9CnjGBKsJX
	uriupEvk7vEzcyDKlalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DM0-00FXez-IR; Tue, 11 Jan 2022 09:22:08 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.167])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7DLx-00FXcH-Hj
 for linux-amlogic@lists.infradead.org; Tue, 11 Jan 2022 09:22:07 +0000
X-KPN-MessageId: d8a489b8-72bf-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id d8a489b8-72bf-11ec-9a2e-005056abbe64;
 Tue, 11 Jan 2022 10:21:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=5Sh28daInKdSrTtTbo1IllF4LAspOVNfmE0WTw8SsuY=;
 b=k8Hwk2yhwyDOfys9oOd7vUMlstyMIPld0IcBSbmMe7hV0UWUtf8JKGDLFKCR17KQ88/J5MBZtvk5a
 E8swFAcCwZ+iFGUDgrkF96S2WOQY6rcwR8xm/4OMttImPezRrj+NoAYaMhBnZL8B+G939SE43kjgux
 t+cn0Nwh9WDCuCGR1fOm0BgrN6gY8yRfBZm1cLzYkBSq7eeTFYeyg7YM7uvI363HZThnEPodO87m0u
 86oGj0+OE6CJCjd0MAuH++/sLVhmjOTHbMCXaAMmTAtmzUI8pVJfhTqhjlloFnpbYaSqqe33MD0fbf
 Hr0FXllOnvg9DKcjtZ+fdwNpe6K9Klg==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|U8cdX9RsavCbkQ3kMX9Mu2MjmqZw1w5tLJ0A3sY+zAvKFHwpE0XEEUuu7hzPmlg
 TYwqXS0jv+xJ2qM2JRoT2ng==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id ee04d578-72bf-11ec-83ab-005056ab1411;
 Tue, 11 Jan 2022 10:22:00 +0100 (CET)
Message-ID: <03dbdbe8-ea08-ef62-c09d-67b3baab6401@xs4all.nl>
Date: Tue, 11 Jan 2022 10:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v2] media: meson: vdec: potential dereference of null
 pointer
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, narmstrong@baylibre.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 p.zabel@pengutronix.de
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211210015620.2143555-1-jiasheng@iscas.ac.cn>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20211210015620.2143555-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_012205_907450_BCDCCB38 
X-CRM114-Status: GOOD (  19.00  )
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

On 10/12/2021 02:56, Jiasheng Jiang wrote:
> The return value of kzalloc() needs to be checked.
> To avoid use of null pointer in case of the failure of alloc.

Same issue as with Zhou's patch: this is almost identical to Neil's patch,
but without any mention of his name.

I very much prefer it if Neil just posts his patch so I can pick that up.

Regards,

	Hans

> 
> Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v1 -> v2
> 
> *Change 1. Change the return type of amvdec_add_ts from void to int.
> *Change 2. Return -ENOMEN if alloc fail and return 0 if not.
> *Change 3. Modify the caller to deal with the error.
> ---
>  drivers/staging/media/meson/vdec/esparser.c     | 6 +++++-
>  drivers/staging/media/meson/vdec/vdec_helpers.c | 5 ++++-
>  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
> index db7022707ff8..7e78288cc551 100644
> --- a/drivers/staging/media/meson/vdec/esparser.c
> +++ b/drivers/staging/media/meson/vdec/esparser.c
> @@ -328,9 +328,13 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>  
>  	offset = esparser_get_offset(sess);
>  
> -	amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
> +	ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
>  	dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
>  		vb->timestamp, payload_size, offset, vbuf->flags);
> +	if (ret) {
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		return ret;
> +	}
>  
>  	vbuf->flags = 0;
>  	vbuf->field = V4L2_FIELD_NONE;
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index 7f07a9175815..972a1d1a12a5 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -227,13 +227,15 @@ int amvdec_set_canvases(struct amvdec_session *sess,
>  }
>  EXPORT_SYMBOL_GPL(amvdec_set_canvases);
>  
> -void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> +int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> +		  struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
>  {
>  	struct amvdec_timestamp *new_ts;
>  	unsigned long flags;
>  
>  	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
> +	if (!new_ts)
> +		return -ENOMEM;
>  	new_ts->ts = ts;
>  	new_ts->tc = tc;
>  	new_ts->offset = offset;
> @@ -242,6 +244,7 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>  	spin_lock_irqsave(&sess->ts_spinlock, flags);
>  	list_add_tail(&new_ts->list, &sess->timestamps);
>  	spin_unlock_irqrestore(&sess->ts_spinlock, flags);
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(amvdec_add_ts);
>  
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
> index cfaed52ab526..1bcb697290de 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> @@ -55,7 +55,7 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
>   * @offset: offset in the VIFIFO where the associated packet was written
>   * @flags the vb2_v4l2_buffer flags
>   */
> -void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> +int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> +		  struct v4l2_timecode tc, u32 offset, u32 flags);
>  void amvdec_remove_ts(struct amvdec_session *sess, u64 ts);
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
