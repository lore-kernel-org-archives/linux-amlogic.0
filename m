Return-Path: <SRS0=2Oki=JQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6DCC433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 18:22:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 216F1611F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 18:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 216F1611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ErGOJPOV1P07rJAbNM1kNc+GAy6MOxn8iBr93qb6QOA=; b=n3ht6HsJOu3hc4SFfTn+SxmlC
	OkRlMjVcVWoj56I6Dn20aA0sNsZFBemowKyF6FNfE3sVqAC0AxiiaPVIYU8sGbq3EroiZiE4dythP
	xM3jNqIq8kYs2grv4tPD+8I53kHjF/fUZgxk6PAmDC43sSDEcitNG5VOaFXOrEjdi3zpixTjSVWxB
	w1vL2F/h6moUp5Qi41VesnnbaGA6UebG4G5IZikTV6aSY1ti1MjD/ucInPJeZGWPfeAVnuAFl2Q23
	GR8GrXXkSXP3CDwPmUJIA3XhiGkxk04foqpTyjXHquhW0EZTmDzriykWODr3lcQBHPQRd8knxFUfS
	6EfPrHGvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYYX2-00AQUz-AT; Mon, 19 Apr 2021 18:22:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYYX0-00AQUk-Lz
 for linux-amlogic@desiato.infradead.org; Mon, 19 Apr 2021 18:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DKBt0bp0TTUgQvWPxoeal8fGy3PXdZiGA8cPBtHBn2U=; b=HzsEWz6RMrDcxt7EYud/+NIREE
 jUhTMCkLktU2SOJypbiC2DDpLSd0eJOd2q9T9l9OVr9fg6T4MA183GcMgJayHB1XrZ6P/db4Khkk7
 reEqGZmLF8hdUrjMHg6GxKZSvrjmup6xa1R76wGybxFVejIQ6glsolyOZ9PFqrpZ2Zjq/zT0dWsAS
 qXRX7O388oWE27fXm/4wH0+LKfX0f/mj/k6629oQiwpCRL0T0CCxbyKQXwO6KRoUa44+Mis80myGW
 gRPeCOGiNzk/c7etOtuwqykosVPS9yiVdqbjfGCNllFizPTM/Zrdp0byljtJmsvYjMLfOAhwrGkob
 o5yv67eA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYYWx-00BaQu-GX
 for linux-amlogic@lists.infradead.org; Mon, 19 Apr 2021 18:21:57 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso6283313pjb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Apr 2021 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DKBt0bp0TTUgQvWPxoeal8fGy3PXdZiGA8cPBtHBn2U=;
 b=IDPh+v7Nlj5LhsRlTw3r13uDJHgp7ZoeNXF689zP+Jx/mhY0EMgT6B4RFBPpENQBs1
 pvFpZ3FT4+m74+Zna3vdjvvi44xLqs9JqR6Ob3blEJOlFXF5luVSq1IwRmGVayZG9hoP
 H8Wc+TCBmdTru7S/n9qTN0hR2XRUjzvw2zKsyq4jLySVNQXDZDQUXiNdBhw7e8iUKsr0
 Kx3a9CEqgL68OnwzDa1D6gNK0YEnSW2OK0P7ALk9yxRDITzaB80REEMOfHrgfJa2bNP8
 gdwKuxEtlxj4xnNYrpIsJvkdFAyYMN/9zBbqQEsFN7pUvIwShRRs3SE/WohQ5GdSNeU6
 xBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DKBt0bp0TTUgQvWPxoeal8fGy3PXdZiGA8cPBtHBn2U=;
 b=Ma6hcqNt+y87L5yPjv9pRlHAWLh1B+MW2CjzrCEq93G2sykRqfTgcDQPOmIqRCE5QB
 ZhecabecFF/NCKznlxpm5sH+WpJkO21pfvh6AekKnffuZKQi9QwrQgmvhPXhPK675eHp
 hbABmJ7zcyp43J7RFK/+NTYBxELoXRw8K3Kj+aBPJ6zGmdG5weEKX99ck1LNS8yPAthn
 IYCix8O40yhaxDkIMsETgpsiI7jj0Lcj8SRgla/ndcXKl6Jnu2g3tK26r/aNpGSWytMQ
 wqIjfAzI7FwHeXOkLXr9jOrX9x+yIZeHoJd26dl27SxMNposyg07whzfXYiT0Qtf/ObG
 P5JA==
X-Gm-Message-State: AOAM532bGTlE2jS2lcahTPTcmcU8+H9/l6G7pzwMkU9m39Yolj/42GMR
 B1iFPNLBCF5+Y/ynRuMLMnN1qQ==
X-Google-Smtp-Source: ABdhPJySTiB62+fr1hP716taw9mSevM+JdM2Cz6AlKimXZ/yP3GxW7LcSVLAYU9+u/SZ9eGusKkFTg==
X-Received: by 2002:a17:90a:bb94:: with SMTP id
 v20mr419834pjr.144.1618856514155; 
 Mon, 19 Apr 2021 11:21:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b7sm12900585pfi.42.2021.04.19.11.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 11:21:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil
 Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] media: meson-ge2d: fix rotation parameters
In-Reply-To: <20210412134833.3467694-1-narmstrong@baylibre.com>
References: <20210412134833.3467694-1-narmstrong@baylibre.com>
Date: Mon, 19 Apr 2021 11:21:53 -0700
Message-ID: <7hh7k2xhha.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_112155_621750_BCFDB3B8 
X-CRM114-Status: GOOD (  14.15  )
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

Neil Armstrong <narmstrong@baylibre.com> writes:

> With these settings, 90deg and 270deg rotation leads to inverted
> vertical, fix them to have correct rotation.
>
> Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/media/platform/meson/ge2d/ge2d.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
> index 153612ca96fc..a1393fefa8ae 100644
> --- a/drivers/media/platform/meson/ge2d/ge2d.c
> +++ b/drivers/media/platform/meson/ge2d/ge2d.c
> @@ -757,7 +757,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		if (ctrl->val == 90) {
>  			ctx->hflip = 0;
> -			ctx->vflip = 0;
> +			ctx->vflip = 1;
>  			ctx->xy_swap = 1;
>  		} else if (ctrl->val == 180) {
>  			ctx->hflip = 1;
> @@ -765,7 +765,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>  			ctx->xy_swap = 0;
>  		} else if (ctrl->val == 270) {
>  			ctx->hflip = 1;
> -			ctx->vflip = 1;
> +			ctx->vflip = 0;
>  			ctx->xy_swap = 1;
>  		} else {
>  			ctx->hflip = 0;
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
