Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A13DC2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D252464F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uccsaXjR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmGXMlWX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D252464F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yowmOlluyzd4vbXgVK90bjoen/Bqpbh8RNf8vIibXPw=; b=uccsaXjR2v7+sv
	ogx8PLYGy4A/1sQWSMBSjiujUBzoklYxsiN3ssSXCbPwtplFWjiWIt0LAhQo+Lko00WLdkLLYFznV
	14gFu3atL4qGVXZsqP9VvZShIi8oCLMBuf/Hc5/furFeQx4YlpAbq5ROkGMcbzI4gSQadgluLRm4F
	+4/zckc9P8cyZ6fGfLM+FuzaaxQM+KDfkjGSqmn2yccdsJnGySPZ8iOFpbQUZOrvqWMPXoDnuYY4S
	NSO50QqN8TBAnGTLSLOKsQbU8bAlTpiyXpvKFPJZqvQ40phUD5+e0rMJG82Kl2thA8gPN/Z09rKIO
	jT9Lo92x0ll64oMS1WnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icm9S-0003oH-Ls; Thu, 05 Dec 2019 08:06:18 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icm9P-0003nI-P9; Thu, 05 Dec 2019 08:06:17 +0000
Received: by mail-pg1-x544.google.com with SMTP id k3so588213pgc.3;
 Thu, 05 Dec 2019 00:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sbOWUl/LYyug4BpNjD/sLnbb5ya8VzzTl8Cu9V2yvRY=;
 b=nmGXMlWXu2JCqHKwG7oK8kS1mCgH+HBN4/eM/NOEeCk2in3RGF5oWu656B48kWYzV4
 mY3bSWyZ30MR/SPNmvS/GgUUll2YMsfMQo4qX+RVLHY0NPjYtazSfiBM5ugleCHjtKdG
 /Pbz/f5x5rYSo2Hy4VnzwlqqGlLPdKzWeC6AtTnUUMau3dNCpKjv7aAy3QyOCwm8dRb9
 s41ylI9rrYu3yOGBb4X3BRQLyBLwUu77hjkAhn3AKb1ti3c9OPbwoPdLzlc1yuCbLZrO
 P8A/jaKiNBktktPIGGLu3Ewlo84+vLm4GxiQksazqDrPb7d4VxWAHjyWP95q5eFbVCuR
 KDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sbOWUl/LYyug4BpNjD/sLnbb5ya8VzzTl8Cu9V2yvRY=;
 b=q3+IxsjLU2HZHTisIutDuFleuRC+FCAx+0LWTVNKFgzGTGMtnd44zwsXf8vNRg7PrH
 7G078XjthGe1VIVg7ksA5BEqABRwuzOyxtnXoQhm8TYaPXrffZzpJguSP4izvY83/HYa
 MWel0bdOb02UydeYLOnqyRxjY9Y8fFSz+b3oX8K/WxGMGP0a0NpRDdd2SI48Lz/8KgXh
 OowlRjWL/3Uj+GTVnCJbvgvn0ZNm4ze2krbnx2iUV7jM9LJUmZKz0dgI/TB+LSTe5dlI
 sP1bGEHJQMbfSRf7Ff+82bEPZ4ZIBtMov7QsiJsK8dQW8yAj+ch2Fxvl4nwRsh8Ft0mA
 RuUA==
X-Gm-Message-State: APjAAAWAy9cD5VHlXqnTaX7fJnv0BdNgNyPL0yLko5PXgsCnxlYq7SDV
 FSXASeYkgQWlVyi51e8fpCk=
X-Google-Smtp-Source: APXvYqyk7FdG4hnofsNwSjWrXOupDwiMK/1MsIp6Jp00Uhte+xvNi4jEmcD2YJExVKTWuST0cGuFFg==
X-Received: by 2002:a63:3cb:: with SMTP id 194mr8219400pgd.123.1575533173934; 
 Thu, 05 Dec 2019 00:06:13 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id w4sm8996292pjt.21.2019.12.05.00.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 00:06:12 -0800 (PST)
Date: Thu, 5 Dec 2019 17:06:11 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] media: meson: add missing allocation failure check on
 new_buf
Message-ID: <20191205080611.GY93017@google.com>
References: <20191204141159.1432387-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204141159.1432387-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_000615_819623_FB9E29B0 
X-CRM114-Status: GOOD (  10.07  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On (19/12/04 14:11), Colin King wrote:
[..]
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 0a1a04fd5d13..8dd1396909d7 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -133,6 +133,8 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
>  	struct amvdec_buffer *new_buf;
>
>  	new_buf = kmalloc(sizeof(*new_buf), GFP_KERNEL);
> +	if (!new_buf)
> +		return;
>  	new_buf->vb = vb;

So the buffer is not getting recycled? IOW is leaked?

	-ss

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
