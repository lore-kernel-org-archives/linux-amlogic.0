Return-Path: <SRS0=E9O4=YL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25BBCA9EA0
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 16:17:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15B7205C9
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 16:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKSbLfnk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LJ3VYJOW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B15B7205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M11+p24mpGiz+gX+yiItZDiyYgWDDGKOY4/DzxV0XFU=; b=UKSbLfnkqRZDxbB+RMSpwcdpfx
	+Bl9KYAmypGh8imf7FlFGl6fec/2CYJvINL+JVdo3bfbSDmwsRjc8cTsZr4XvFcUULDJGMySpRbMb
	Q0wdj6kQJ0j8fvxnvTloBM7PfcqLesNHzJ/SqP/zbAX+9lVMarb2zRSxCWZcEpK2pg/nxX8kTVtWe
	qJkO9FLJa5YC3Jijn1dmAxQUwM05rRZPzYYqSOvuU4RJVyb9xDi4eum2Te7OIm9qFNtnKcXdHvIE0
	8F622xAQC5zYK6+FIA+EaOI7xi/nhqdHvES2LM6jfbxUvgNP3uzdhEpHouFdvsx0h1YKc72UgIQpT
	bm1UxpJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLUwm-0000aE-Pu; Fri, 18 Oct 2019 16:17:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLUuc-0007AA-6s
 for linux-amlogic@lists.infradead.org; Fri, 18 Oct 2019 16:15:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id b24so6647805wmj.5
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Oct 2019 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=NiPnnXybYfsCEoSCgSQ6VkI98y5AUTMUbQ2sEfUh8lM=;
 b=LJ3VYJOWqENNeg46QP9EUkyyoZpR3YjGZPsjYq4Ja8jvNdAIgR3+F/71fH0Omf3eJh
 /U0rpku9ScDIwQFscwzHngVX7QNE7yJkRqaMaj80QmZVgYT6mO32dHzZiUy/pSTqPLnL
 QiEOvZJI2dhrgBG+DmnrmZVe6Y+1YZ1rs+XPatSiiubP4xHvauVIk5Q+PQAijWcwsMjn
 JFBZKRyEbymUsXSVNoRfH4xMTuVPgtJ/Too1ONx/p+TYKecOqfRAzFsdy4hxu5UPyTy1
 arvjFs/yI2gXxqOJ5g0MBTcrdLzbDt9o/4ibDY8tLIC9VCuyBapDxMnEoMiVvSNcQ5jS
 ShNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=NiPnnXybYfsCEoSCgSQ6VkI98y5AUTMUbQ2sEfUh8lM=;
 b=Ml7G6QjEG5FMUSPBh33/a6J5H8g+oH9oOec72xLePVA1zCuP0bFnncMtkbYuXGZ9Xk
 SmAVhd2BFr4MSKm4qO8dDDzA9JWL5TCwMTBswAVb22tUiBH62fNAkp3ZrB58rQjM3jWh
 szYzwzLOCuJ23boTIc58gagPKK+kCTy8vtEUpX6Ve+xIlOnkt7AVVrny9nEKdl0TfjLw
 772kR84z+MoOuEPUcWUYoGP3HsoXs3nWamzQjaRva/rQXbjG5Rs1y3eRo1NIOXF5uDMP
 cw3A2iDchtttMmVZuQmvzlW6OH16IHYtLu7dxVOjuf1etRL0mh9RyQ3JmgK746nFwNKE
 KkKA==
X-Gm-Message-State: APjAAAVrobz193GZEPA3NzS4rUJnTLfW3ktWOEr2N+YPbHbDn4SnObvO
 +gopvaDkfIpHknPtoD7dC/1Hzw==
X-Google-Smtp-Source: APXvYqwVNEtt08u0F9IheP0GbcIL5/IMCNWStusFtmWS4tmcB8YxFZjDBcaMwAOipydLI72D7t6IGQ==
X-Received: by 2002:a7b:c4c6:: with SMTP id g6mr8379512wmk.126.1571415332059; 
 Fri, 18 Oct 2019 09:15:32 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f6sm3023324wrm.61.2019.10.18.09.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 09:15:31 -0700 (PDT)
References: <20191018140216.4257-1-narmstrong@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson-g12b-khadas-vim3: add missing frddr_a
 status property
In-reply-to: <20191018140216.4257-1-narmstrong@baylibre.com>
Date: Fri, 18 Oct 2019 18:15:30 +0200
Message-ID: <1jbluef2sd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_091534_342726_FD35F53E 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 18 Oct 2019 at 16:02, Neil Armstrong <narmstrong@baylibre.com> wrote:

> In the process of moving the VIM3 audio nodes to a G12B specific dtsi
> for enabling the SM1 based VIM3L, the frddr_a status = "okay" property
> got dropped.
> This re-enables the frddr_a node to fix audio support.
>
> Fixes: 4f26cc1c96c9 ("arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> index 554863429aa6..e2094575f528 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> @@ -152,6 +152,10 @@
>  	clock-latency = <50000>;
>  };
>  
> +&frddr_a {
> +	status = "okay";
> +};
> +
>  &frddr_b {
>  	status = "okay";
>  };

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
