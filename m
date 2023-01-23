Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0D7C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPL38yQg+zsg711yIDor+Kvkyix06Ca6D7KV3Tvo8d0=; b=0W3hfkRMgjhhqrCCWWG9jj2HBC
	yU+6r3sRz7Uf+NxqcOim05PjZQsheLTjd6kg5ezoBZOP05MJsYMcv+xeVZaMJ0zBU3johtHY8atr+
	8rxE+Nu1dairX7N89V6w091FTnxZpG1MrFuOEjPFkehKQiF8S4lG5VoRxUIfSOvuS/s7PF8hIVYw9
	prn7fwopiVMgar3iHfHYM5Q2hkBvGuBx73DqVN9WlyuFbziI6afq8ukWw+JjVc+d2fagZgs2lfxf1
	CP3ukX3gnrNtrTzjyfQvBr3faI8vduulrewiwwsGUcPYUEYYgW284uXz4b85te8JLOzYDNf3y3d9B
	V9jS4ZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsWJ-00GPIl-4s; Mon, 23 Jan 2023 08:49:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsWA-00GPGz-Pw
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 08:49:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso8542111wmn.5
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 00:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=soja83e34c2eLz9845rol6k2LZ7cLCXqZuSiTiSx964=;
        b=SkRILWqFbm/CTcnfDATfLaDF5BJtzFA1CI607stoaDCCGOpOypRFQjEhH30g/INtaZ
         yyt8orlvR+kuPJQObM77e1o7AKF+IGdiPjQ5XAyqJqeyBJk/wr+2gbampd3Ekng3GNqr
         zt2wQ4Xr+mCyFehQdMguU/qA5p/N/wy7bcBs2kQ4NRrKwG1Skb2PmCJ8inlia+QZo0YB
         AafwA0QDa9PsoFhszpYa7aOiWAxDGgWrqv0jS1a+dZn0szQG0FVKyWNxP3PrhX0+31KU
         V41yWdPzLVE4labU5tdeOdb9SYajAJ1BIk57aQe1sDRQXtULIgSi9ZInbvDBxaUA7+Op
         mDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soja83e34c2eLz9845rol6k2LZ7cLCXqZuSiTiSx964=;
        b=Bt6CRAR/IGcRFa8MWaTLKIPB4/YV0XIocPRPzWYiCjTk4bbuzLhVOAgGebAuGu5oM7
         LnF/06RcNbMIpn2R6pDLbXICQtN053wZUdyXyGb+CPW1Wv4sTWc9rA2yjSFFCTNHss6c
         /i5jL5tKRoivGrXEJLJmWJ6QkY7alINJ/cdrqcTTBpnlnrt7KoZbXvWDLeDokL9/WD/9
         ZDugq2uWAyyhYMKSH1oAy9Nqs4UXlE7Gj/e/L1zfBgbQGolwsat5w/aP73JJ5EBwsz96
         uz7Xjj+DijMYpQf0GYvnUTqRf3ksdEiWIYql3kcySvtiP5D81JIdHB2YSMRIAJ4gWZ7U
         1SXg==
X-Gm-Message-State: AFqh2koX9Nn15LOXenKkIIFjEmQwKEcm9DTF3HrtXC67xltSWNiQrzcK
	ELFqSvuh2lCr8/tK1Fhwk/lV0Q==
X-Google-Smtp-Source: AMrXdXvwi8oXyhzxtSXMDorQp5ZuNfEJhKBQoqpgabUgwuOh93L8qUifFWtwT3ydPwQM1NZM2ssqCg==
X-Received: by 2002:a1c:cc11:0:b0:3da:1d52:26b5 with SMTP id h17-20020a1ccc11000000b003da1d5226b5mr31095778wmb.14.1674463767626;
        Mon, 23 Jan 2023 00:49:27 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b003cf71b1f66csm11144887wmq.0.2023.01.23.00.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:49:27 -0800 (PST)
Message-ID: <6b4df841-6f8f-4c32-767c-8b8c34108272@linaro.org>
Date: Mon, 23 Jan 2023 09:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] media: meson: vdec: remove redundant if statement
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Benjamin Roszak <benjamin545@gmail.com>
References: <20230123071708.2670751-1-christianshewitt@gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230123071708.2670751-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_004930_866544_57B4563C 
X-CRM114-Status: GOOD (  12.73  )
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

On 23/01/2023 08:17, Christian Hewitt wrote:
> From: Benjamin Roszak <benjamin545@gmail.com>
> 
> Checking if sess->fmt_out->pixfmt is V4L2_PIX_FMT_VP9 was already done as a
> condition to enter the if statement where this additional check is made.
> 
> Signed-off-by: Benjamin Roszak <benjamin545@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/staging/media/meson/vdec/esparser.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
> index 86ccc8937afc..7b15fc54efe4 100644
> --- a/drivers/staging/media/meson/vdec/esparser.c
> +++ b/drivers/staging/media/meson/vdec/esparser.c
> @@ -314,8 +314,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>   			num_dst_bufs = codec_ops->num_pending_bufs(sess);
>   
>   		num_dst_bufs += v4l2_m2m_num_dst_bufs_ready(sess->m2m_ctx);
> -		if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9)
> -			num_dst_bufs -= 3;
> +		num_dst_bufs -= 3;
>   
>   		if (esparser_vififo_get_free_space(sess) < payload_size ||
>   		    atomic_read(&sess->esparser_queued_bufs) >= num_dst_bufs)


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
