Return-Path: <SRS0=HPE/=V3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF518C0650F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B253720644
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="noBxIweE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fEKj3pYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B253720644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGQYx5w6f2DhiMevsq+TBQjhOmKSD+TOLdRWi6ZdNgA=; b=noBxIweEM1dFsU
	xD0DMnK8LU2SFNjLf3bmqC5xup3p8seNV+HYxrzYOERC4EanAPo6IEelPFBCMXYyu+yFmKVxHD3h0
	p45vM+RZT0m6hSUxMjWU0UXI3K4e1hYuKXHXxJLz9iL7y/xr9GFNPHU5r7ZkSRl+fyKw/rUF+r+gJ
	32usyqrk4tbMGsxm/EH8dxkHbTqR7zDsDGf7zPv4x3HAuOG1BP8WQnC5F/2TQS+z6D2fVcsZbblkg
	GTRWDMDiy6xJ5Gdu5jq0cwM8+Z2nQ4nb4r02GFHYqX05Kkgvy2DZVn90mAr69BG3XKEaN4Hd9dKEX
	hcskLnNGV1Fk7oA+gthg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsO4R-0000mg-Ni; Tue, 30 Jul 2019 09:05:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsO4I-0000jg-5f
 for linux-amlogic@lists.infradead.org; Tue, 30 Jul 2019 09:05:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id g67so51786033wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2019 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qGr1BDi0c/2TdLi67wBjX5+c8yyhM7Ix8wxZtUpjo5g=;
 b=fEKj3pYgSNCVMZDZdtCMHO/oPs4i0a3ucUE9X2f6nEaNA0gJ6xnCUEYQqZ00SDkZAe
 qas/HbrLLEkz1D1pAtQ0eQ3wbYrSzEYtopSM0GOB8MIEy2HNTIgm8bZpUa0uQdrS+ry5
 Ne6PdJltp47jtCpLzC/hSV0txKprnYrdf7hcB9QJEoZuNd6bhX94afsdewA44zIui5Jq
 jYZ/6zgBV0UAJuGwJLXrq0OKWBPwWtsgz6mPLYohbxRL64rFDevg+IhYhSu0HYGtRu8D
 HUWYZlLszd41A+FTo3tYjcTk8Dnk0YVRQmW3qKsL6FJ6MAm1kwoq4DhoOxe89TiJszof
 qu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qGr1BDi0c/2TdLi67wBjX5+c8yyhM7Ix8wxZtUpjo5g=;
 b=EU5dta5Igdsiz2iJ7joNDups6Ivz6AJ0OAVht4PLawlB2R/FAD2I6Vo97/LfFXK3jn
 2C6CJXQeUf91j8kaOQVwQ0VGZmrhj81LfYtqqFoukCDLkE1AECYF2/yy7MXJukljVtl7
 v5zP3vKBXTuUrYJtRZlL0xFdiN7M7etkGIL3I8mwg82pD2AUva3IMHeCkQHI7ycT8tlL
 inn6Q5vettnHbn3iM1DbFuo7qeJCPI02QYWq0QN27kSsk8IQTaZXa6ePdUE4gTVYiqjJ
 XBcOMbf271nbXai9EevaMD2hI8w3yO9bo4xJfCfaY04cm4MDg8Ahw4yctkzc6AjJ0PRQ
 cesg==
X-Gm-Message-State: APjAAAX1c0nlYTyzkarOzGC4CcDm+BWE9jiMi5aYxhaBJNNJvzjSTqQ9
 s0aQS2GtR5RRKGGzGi1OtBk2kA==
X-Google-Smtp-Source: APXvYqwFlbUFxsYoSDxGSyZmNiW7VbV+zb0tbv/uEpdFegDVeNvxUOUn6FwGoEV4Xa9IoHuoN+8obg==
X-Received: by 2002:a1c:c188:: with SMTP id r130mr98830929wmf.73.1564477512141; 
 Tue, 30 Jul 2019 02:05:12 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id f12sm69804468wrg.5.2019.07.30.02.05.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 02:05:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, srinivas.kandagatla@linaro.org,
 khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] firmware: meson_sm: Mark chip struct as static const
In-Reply-To: <20190729183941.18164-3-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-3-ccaione@baylibre.com>
Date: Tue, 30 Jul 2019 11:05:10 +0200
Message-ID: <1jv9vj28qh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_020515_047994_1902F7E4 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:

> No need to be a global struct.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/firmware/meson/meson_sm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 8d908a8e0d20..772ca6726e7b 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -35,7 +35,7 @@ struct meson_sm_chip {
>  	struct meson_sm_cmd cmd[];
>  };
>  
> -struct meson_sm_chip gxbb_chip = {
> +static const struct meson_sm_chip gxbb_chip = {
>  	.shmem_size		= SZ_4K,
>  	.cmd_shmem_in_base	= 0x82000020,
>  	.cmd_shmem_out_base	= 0x82000021,
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
