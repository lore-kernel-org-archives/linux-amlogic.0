Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB85FC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Dec 2021 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WLrBbx7RmYvTueG2I4bxNUgrBJ/Y3HnYyv1Dr0Lts8=; b=A9/FXuv41XujFJ
	OKZlAR4RTSNvfwpgs3KlG/bMmkbmW3O2AiWOgz3rGak4DU3HvO3w1EUMtVeEbRWSRQQuHKUsBBmzk
	qVkagdrwZJDBLZjXcqMVfV7k5xVZryvlU+blRNSk0DjRvm0klP5QquA+RjZlWGFlBg3W+STjMLHRL
	Eu9N1LlSu0tWoOZdaBKk9tHuIGtD002lCFX13amrIv89v0ihrBh+X5NEPpBmOQs1rfdF0Lbsycsry
	1yxwO8leuZf3VOCV6U5gLS+nKx8k4uCvsEqjImlBYbCbdSXvtK14IxhTX58pIza+bnD19zTm+pk8y
	eV7hnQKHmsopLsSuNnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvI4d-00Frci-8d; Thu, 09 Dec 2021 11:58:55 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvI4Z-00FrbB-BX
 for linux-amlogic@lists.infradead.org; Thu, 09 Dec 2021 11:58:53 +0000
X-KPN-MessageId: 3e3a5016-58e7-11ec-8a6e-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 3e3a5016-58e7-11ec-8a6e-005056ab378f;
 Thu, 09 Dec 2021 12:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=9Aq23Wv7tHnCYMpmE5PBJb/8V6Y6YS0/22bQYvWZfms=;
 b=h6WH+9bq26ytYVkLgO+BBRA9djM7TpYc/rglyUJnk7c9magrntvpC9H2y74mkOpN5KvEeVBoTkN+U
 KXLTJ/wW66zpcBt0uaGD2QBZfzeiFS2HBZiy+wQhayLPkx/6OBxrBoaw1yE+tNn1eqoSBYFGpmZjgs
 2bXz04YcB+tV+V9ISpUlymC4Da7OKpIH5BkXw2uFKRUSdPLo8l+D2jp2YNTTjFrjDoj04XIN8qx/Cr
 croH5uYLmc+v1KIk0yTkiGoWWliYK+pdfIW+jC2RFVB4dRaOR59m0eBGr9yfJ2YlHFKOtorRzRu6A3
 ap8U0SM0g8LomM6O4B3VwETxZ1xjNKQ==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|DDmaztRJmOtayoxqgJybbogxaHcYGuAH/2JQ1k//iXKfxwhLEuAMhU/xDzQBJLy
 fS7hu1KsqPsf0t5psDYTCSA==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id 5ce29b6c-58e7-11ec-83ab-005056ab1411;
 Thu, 09 Dec 2021 12:58:46 +0100 (CET)
Message-ID: <bfd1801c-9d1e-0574-a237-711d3d5ae755@xs4all.nl>
Date: Thu, 9 Dec 2021 12:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] media: meson: vdec: potential dereference of null pointer
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, narmstrong@baylibre.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211209085840.2081024-1-jiasheng@iscas.ac.cn>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20211209085840.2081024-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_035851_622047_3F7E4339 
X-CRM114-Status: GOOD (  14.77  )
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

On 09/12/2021 09:58, Jiasheng Jiang wrote:
> he return value of kzalloc() needs to be checked.
> To avoid use of null pointer in case of the failure of alloc.
> 
> Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index 7f07a9175815..025885fcfec6 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -234,6 +234,8 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>  	unsigned long flags;
>  
>  	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
> +	if (!new_ts)
> +		return;

While this avoids dereferencing a NULL pointer, this error isn't propagated to the
caller. And I'm not sure if that's right.

Neil, what should be done in this case?

Regards,

	Hans

>  	new_ts->ts = ts;
>  	new_ts->tc = tc;
>  	new_ts->offset = offset;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
