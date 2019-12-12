Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83514C2D0C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 19:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595F12073B
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 19:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fH6kR/dy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TD7g7jwn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 595F12073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtmIPt5/c4ft5YCiImG0uVAEpBaXuG28fafrrCxgswg=; b=fH6kR/dyQ7AgWF
	FZYW/h5FrBDTBJ/lTh+0KMhTnqo+946GyrPJI0dLwLQXU4YQZ02udfWWJlfd0YSlGhGMYVqZBKFoU
	pXMoVYG9auGL28MHR1KtOcdoRq1KdsUOE+R/fMFGAURewlhYkaLgrFJeIKidqku75vDbIzd2OiiVo
	+ZGC1tSvAMpZmXqiwxhmAlFAFQrTpEFZceESTnF4UC15esqOi8CCNU+f1GGSpC1qYMKC82sczDvOJ
	RELEcxfae/SC5CVjtSQcK/czsne3jiDRb5F8C0W2HI4urWRydtcwsgNb67C8uS36RFxPo+qHe4/l/
	k6vohYaGqJWHhcjEUu5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifUbD-0004uH-3r; Thu, 12 Dec 2019 19:58:11 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifUbA-0004ta-Jm; Thu, 12 Dec 2019 19:58:09 +0000
Received: by mail-ot1-x344.google.com with SMTP id i15so3246459oto.7;
 Thu, 12 Dec 2019 11:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DFLlahyHI5CWddupsVreSqNy/vA0cEJats5492jOSIs=;
 b=TD7g7jwnUfDkDTZXvxve3OJXxK3GHfe5bBkdC7pt5OmvM0NMo9LVvJUmtVK+yMpQgy
 vQgMoNCRNgIPGk6R5mhXxZWioE7nsHSI6ypVusSjEl7CjyUu3EgqXGSybzS7OkzpOsSb
 mcmhXX1vYjnkVSefiLRylfhtoyJ9Vy39jDMVZLuZYqVTpzRQWrobagHQbcOPc1HsXqqF
 y/kSNaw3ZaaGT3WDFKb/HmEQ8tHXojg9ICTqbAEDBP/HnjJ5Rbzd8E4ODkxLXWOHxQgZ
 kjs1aVUkYxcYB1+tQil4sFBJqJe4E+3ubKfq45Cxfg8dyMV0PoAWKl+Ix78PTZOq33op
 TL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFLlahyHI5CWddupsVreSqNy/vA0cEJats5492jOSIs=;
 b=MzMeY/SDViOW6Oq8ieA+501EG7LIBvWFUwhjJoZXUO7KrtouoMK9pxb0KjPwmQr2lZ
 uC8j//c6mv1677dUfjU5e/neF0PmbznmKe9djLKNRo7b2qKkuCbt+9ANCghu0OmQDebQ
 wxhMgWcQO7zPBGLLHMd/EhB03BgJ9W/BNtei2sLpiFmy2hpZm0GC5YJ++HgEopvJp0rm
 T6luFMY2RD+rgQym3J4x9q+yxH7qUZ30LbSgtb3kXX0pG4o1NczfXODA1y96KapeIDaw
 a9hXDRkvtSTRiWWRjAhuYwtZYRSrZUVP49RWoJPwdJnIHuFJ++Qk0ysTCfHoHWlLtAal
 lUjw==
X-Gm-Message-State: APjAAAWRGIPQnu+sSUyGeinI2nwCx9HwrIooiDjoLDhVgY9xst1vaMhC
 cJ6bHWxL1DUwuH7vxaPMolq9qQfzrfpieG9z2po=
X-Google-Smtp-Source: APXvYqzBv7wgx408g13iewCw+znrFEZiUL++7s01qX7XO3cSWn27p9E1tGYyz8Gwyf9GVrZPOlySmA8XV5OfmM/myAQ=
X-Received: by 2002:a9d:6a4c:: with SMTP id h12mr10313165otn.81.1576180687595; 
 Thu, 12 Dec 2019 11:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20191212145925.32123-1-glaroque@baylibre.com>
 <20191212145925.32123-4-glaroque@baylibre.com>
In-Reply-To: <20191212145925.32123-4-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 Dec 2019 20:57:56 +0100
Message-ID: <CAFBinCDjfzQX=ZG=cgTYo=icGNU-t4Kqnu0Bu5qRLsRk_s6S_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: platform: meson-ao-cec-g12a: add wakeup support
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_115808_649021_1950A888 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

(I don't know the specifics of this hardware but I have two general
comments below)

On Thu, Dec 12, 2019 at 4:00 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
> +#define CECB_FUNC_CFG_REG              0xA0
> +#define CECB_FUNC_CFG_MASK             GENMASK(6, 0)
> +#define CECB_FUNC_CFG_CEC_ON           0x01
> +#define CECB_FUNC_CFG_OTP_ON           0x02
> +#define CECB_FUNC_CFG_AUTO_STANDBY     0x04
> +#define CECB_FUNC_CFG_AUTO_POWER_ON    0x08
> +#define CECB_FUNC_CFG_ALL              0x2f
> +#define CECB_FUNC_CFG_NONE             0x0
> +
> +#define CECB_LOG_ADDR_REG      0xA4
> +#define CECB_LOG_ADDR_MASK     GENMASK(22, 16)
do these registers have some RTI_* prefix in the datasheet?
that would make it easier to spot that these registers belong to AO /
RTI (while all other registers belong to the CEC controller)

[...]
> +       if (ao_cec->regmap_ao_sysctrl)
> +               ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
> +                                        CECB_LOG_ADDR_REG,
> +                                         CECB_FUNC_CFG_MASK,
why do we need to mask CECB_FUNC_CFG_MASK (from register 0xa0) in the
CECB_LOG_ADDR_REG register (0xa4)?

> +                                         logical_addr << CECB_LOG_ADDR_SHIFT);
FIELD_PREP(CECB_FUNC_CFG_MASK, logical_addr) would make it consistent
with the rest of the driver
then you can also drop the #define CECB_LOG_ADDR_SHIFT


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
