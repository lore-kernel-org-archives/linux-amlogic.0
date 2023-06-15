Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5CFEB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBnicn4jdzQwaxjEC7MOFQwdq9w+9mYTOKIq+1l670Y=; b=YI0UXnRdB02p+j
	+tLTX3ku9AWTbz6KYUoBJK7AyAtRwQsIFXxZg7RA5j2ds6yiH1gbo6h7Liua18MjTIXNeVL3TyKAu
	v16Jh5gwgESRUVxMFjT6s6jYr5yAD3+NiTOCx2lA3im3S4iB1yqatE0L03S5O6kDcTBeEsN2LLN7w
	4571s22ah7u43tmzcW/JoeNClAEC8r2s8ugEJ7A2k/WGQuSS+DR4/wi4ggM3Qqbvarp3tlpV/fw9e
	1V7QfLL2oq/ckutXC62oN1ac4WxJ5opOVlnsky4N7buYZ8vbgaPQwhIh/AZbpmqSvPBvrXp3ACQPB
	R/DtlWotQ0c4CCCm26oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kKe-00ETBp-0Y;
	Thu, 15 Jun 2023 10:36:00 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kKa-00ETAK-0q
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jun 2023 10:35:58 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b3451b3ea9so25961631fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jun 2023 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686825354; x=1689417354;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=l/LIH/8tDobUxqCUyGA4SYSGQ0gjLDuFc8VDRXk4ph0=;
        b=t2KNv9IaUishhCD8drwNW62Rq/3a/FCloiSJhfAgiaUN2zs42Ens6DFX5ujvUnp9fq
         jomrw1GTw3Mnr0faUZFL5zHeQo6JYRmP9RdSbiFWVB4f7Jc7ql61P4Oz+N+yL5Ux4686
         gZZbnkPxyeDv+FIh6EiMuo/NDU4zvhJW4UU6GKIi67Xaj8x2VeitWnmw0ZmldN1z0JIX
         uZmqxWYpaqRfyMXaVzowx7ZUZf5gRVaFNSXdpao+GijdDSctsvaBkwML6x5Ub1CugnsF
         rmRkPIbbCHES0UfTtK+z+efg2XQ3E5bBMffX2LPC1bS+4y2eGzza8UYKUaLFCJ8Rkqzf
         yxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686825354; x=1689417354;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/LIH/8tDobUxqCUyGA4SYSGQ0gjLDuFc8VDRXk4ph0=;
        b=kIWavcZGZJYZmJ0pTRIHbX3JZkd3rGwZxoCLyb7iy0sPNY2Jhx3xIaXKdycJs3uMd2
         tO6xyqwFcXSgmDYPvxGcF+aZ5/Eze2dMRPBFTdRycZUobtnF/sPVz6qUvOlMOQnpdSYd
         CXB2Ehlw9f4sN7wZyofzSA3YAqMTb5HXrPyafEfaNrtkTz0An45bhF7jjUlh7iOdc4Hf
         WFesA1noIH8NJMdJs7HXuHuw7xQoBd8J24u/zBy+VRmeTGpp5NWaI86qc2j65v7J/M3C
         srBoClO0fN8eCLRlazL+/TLFdjRt1qk8Zq+upSn1/M3AOO9StarZrA4SppmPbk/TJopS
         ueOw==
X-Gm-Message-State: AC+VfDy6II0+ki9tGNjX50nykvs7OGThdok4ToHZSVy29da3zXxn8d94
	R2CY9vQMGEVWV5vQOgvsnFWzOw==
X-Google-Smtp-Source: ACHHUZ5tFwQzljs2BgS9NdfeGuMyF35ugJqAUUTzva7a1d/70Bld4c6jPztkOMTnsorkzGEn8fmP7Q==
X-Received: by 2002:a05:651c:10cc:b0:2af:1c62:c133 with SMTP id l12-20020a05651c10cc00b002af1c62c133mr7693715ljn.8.1686825353802;
        Thu, 15 Jun 2023 03:35:53 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c029a00b003f7298a32ccsm20107519wmk.41.2023.06.15.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:35:53 -0700 (PDT)
References: <20230614084212.1359-1-lukas.bulwahn@gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jian Hu <jian.hu@amlogic.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Neil Armstrong
 <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair pattern in ARM/Amlogic Meson SoC
 CLOCK FRAMEWORK
Date: Thu, 15 Jun 2023 12:33:52 +0200
In-reply-to: <20230614084212.1359-1-lukas.bulwahn@gmail.com>
Message-ID: <1jbkhh2et4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_033556_520321_05DC7846 
X-CRM114-Status: GOOD (  15.38  )
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


On Wed 14 Jun 2023 at 10:42, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit e6c6ddb397e2 ("dt-bindings: clock: meson: add A1 PLL clock
> controller bindings") adds a file entry with pattern
> "include/dt-bindings/clock/a1*" to the ARM/Amlogic Meson SoC CLOCK
> FRAMEWORK section. However, all header files added in the patch series to
> add Amlogic A1 clock controller drivers carry the prefix "amlogic,a1", and
> there are not header files matching "a1*".
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Adjust the pattern of this file entry to match the headers actually added.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Added fix tag:
Fixes: e6c6ddb397e2 ("dt-bindings: clock: meson: add A1 PLL clock controller bindings")

and applied through the amlogic clock tree.
Thx

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08c7efe271c3..08f7c69c67c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1887,7 +1887,7 @@ L:	linux-amlogic@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/amlogic*
>  F:	drivers/clk/meson/
> -F:	include/dt-bindings/clock/a1*
> +F:	include/dt-bindings/clock/amlogic,a1*
>  F:	include/dt-bindings/clock/gxbb*
>  F:	include/dt-bindings/clock/meson*


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
