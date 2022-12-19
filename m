Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339CCC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Dec 2022 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mwneh0sLcSpVQqmECAan6FmD1xmKxsPRoXPVKrP7HQ=; b=EDMtZFnkRmeyNt
	o3+9Ze6LvZelMWagZos1X31RLdcy2Q7sUg+6rWFcyMvfzv2raLMD46vJyvjjTsFjDGexRbWNXh2Nw
	AlJHIBM3ixQZTX0ie3F6naO8GW3ynD+/nrvgqMink1xp3i+J9NC6/iZn7aSxyvO6W783A/dlGfykh
	mysRqdT8qOezMfPhKh1iO5DEq2DROARMd7xxDh8EV69kI99QCrLZmeTHFT2cvgUsFYwINNZYeDVl+
	9lR7N9lgLWKOQNErjsbAbgy9iLjrzBb53d77SMEN+xqAZN9QRzmdSZQ0WLRizBmp2w4gkQdY2fXFw
	zU7FEO92SqPReLYT6Z+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Dsp-00CHCC-7a; Mon, 19 Dec 2022 11:00:35 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Dsm-00CH64-9H; Mon, 19 Dec 2022 11:00:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id r26so12259215edc.10;
        Mon, 19 Dec 2022 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iuCRAFVT/WKlH/y5prSBpJD3SqynK7xQGXEcEcRTyec=;
        b=Bl+FBOtkl3TIJreEdb1w5tp9wF7vjZAEZN2mCn8qBr6bOR7eYJSh7G/1tL/e5C757l
         +By4uVqs9vRPMrTwxcKs6clHXPr4H53i4ILsMV2qdduSiJrp5gCN8V3cNTYQNOFaEsr0
         aA5oveWy4U2XBiqyEhtfUfGGOKm2lc4gWTVkk0FKWHxy7nKtsjFWb8on+rH/oxlGP6Uv
         nHei7CBOJKphzTStw2wi2vT+E/+11Sin7ItVJfjS1kA8ZR/1RGl2ilPeI8zZzmw+3aNR
         R3HYK6/iX9sYWHOYWElZLiy/m0HvAR9qPPQ8K7W1pus0ETAKy+Qsi14txsICXBMfuDMl
         ceXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuCRAFVT/WKlH/y5prSBpJD3SqynK7xQGXEcEcRTyec=;
        b=YP76MffmIHa5nmaX0Vur9ynd9QNlL5IoFoh3UN7oHqPphNEbq1391TGOQyy0DEY7OR
         YTyqkRm9WQhDMK7DaBmO5I7lZP8LqBpBoFoP7Ho0tUm7dsyUz2W5uk6vFCSrXHaHQ/ym
         9tnOhrM8Z31yZf1b4VroPxnTWGu/9ehNhDxypwoCdeT0PHkbnlze33skIgqoiITBUsWq
         13/hXIZhmN+FKdtdzkyNk1toPk5+Lm6jg9uULGRrGTAlOxw1FxCoS8/LyDeMeMywHPoj
         Y4SL0QdVDAhsx8ngkJvtEqWP/1wbSMc/bG5+j+6HWZ2IQorCxjCE5HzzgeIVtG2sIdlz
         guJA==
X-Gm-Message-State: ANoB5plMYoxQEs8OvAJukpUCm0OVp0fXqiSKszyR1IPhjN8Xjn8uSJUw
	eJg0Ac0BcvFt/nySXGr6clQ/texD4Ey5rilKcL0=
X-Google-Smtp-Source: AA0mqf4PgOFZhk8kk0KOvHCW2ZZP8Y019U4xA8Etf86NHLJZ6BISof2bR97ocHW80jvc1aiWRPU+HPdZW+4EhHZeqmY=
X-Received: by 2002:aa7:c38d:0:b0:46c:fa25:f03d with SMTP id
 k13-20020aa7c38d000000b0046cfa25f03dmr16124267edq.291.1671447626791; Mon, 19
 Dec 2022 03:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
In-Reply-To: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Dec 2022 12:00:15 +0100
Message-ID: <CAFBinCAfF-=776E3k=NnhaG+rMCp3b=WbjkN=RKGG8vM3Cn-3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Reduce the FIFO lines held when AFBC is not used
To: Carlo Caione <ccaione@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_030032_404625_61ACF076 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Carlo,

On Mon, Dec 19, 2022 at 9:43 AM Carlo Caione <ccaione@baylibre.com> wrote:
>
> Having a bigger number of FIFO lines held after vsync is only useful to
> SoCs using AFBC to give time to the AFBC decoder to be reset, configured
> and enabled again.
>
> For SoCs not using AFBC this, on the contrary, is causing on some
> displays issues and a few pixels vertical offset in the displayed image.
On the 32-bit SoCs (for which VPU support is not upstream yet) it has
caused screen tearing instead of shifting the image.

> Conditionally increase the number of lines held after vsync only for
> SoCs using AFBC, leaving the default value for all the others.
That was also my approach (for a not-yet-upstream patch).
Since it's affecting already supported SoCs I suggest adding
"Fixed-by: 24e0d4058eff ..." (maybe Neil can do so when he agrees and
is applying the patch).

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
