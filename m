Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CC0C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 23:30:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796EF2173E
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 23:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdLGEPnN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WG+kAyWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 796EF2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyP4ZQcHRb8USIo908AiElVlBtUnurb9aI1Fb5NcabU=; b=WdLGEPnNYd7VXX
	zGNrYWYpEfxRp/x4M4RikyM+M1V/uLiiFLz0g2A4LTvt2aAXEF42590buOSPQ0M/v7sTMFirYzkHu
	lqZswdvD1dpLM2IKwUztAS1XPlkKPDOvaLng0XKFpc/yZQSnZ+VVCJcrxZsDmdVQDvNMZTi+2YD76
	n8H9aV4O44/poWSonOIHJptNEWXCTfC5zjL/kEa0b8HqH8uMEF2l4BnFttfpJwFX320U7I4c63Xn7
	+OqOxl6AXyfShP6LpMSZU4pbjFfQjt9B0dBAm2sR8UmTbhqTXZoL0dArzAkYx3ps4+1kX5ij/jFfJ
	CF/ZNsQ1NmVtI8azBQnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifBRA-0001um-3F; Wed, 11 Dec 2019 23:30:32 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifBR7-0001tz-6L; Wed, 11 Dec 2019 23:30:30 +0000
Received: by mail-ot1-x344.google.com with SMTP id 66so409297otd.9;
 Wed, 11 Dec 2019 15:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wo2DrsPScaqWz/406hvbFYY2i2G774jt9t2caPRqht4=;
 b=WG+kAyWhgZduGDz1I263pCUNhTioDwTPtlcDogpt0fuuEj02mg9GbRaLUG8M4vXrSX
 SKkS3h22vI1lmaWEoLEuyUXFPktrN4xG7YYgD/MmOOGH83jZnr+pjK8jfI8ustPyGiLJ
 y3jVqAjYVrIS+knqYk67SKk3/IaX2uyo6w1QojI8p/fo0AZ7VHuauWc+1WxQeKeg1VUf
 Rzf59N4VMLshrcp1q1Ru4s3tBw10XBtx9tRvJREq7uCaLtLw5F96DHJU3V0+hrIJkRth
 cl2ttp+xaQB0bsPFhZD+ACO8GDU10cFazN/xsB2R7MS6NDaHA30YUdoRAMYHMM5VRSrU
 dXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wo2DrsPScaqWz/406hvbFYY2i2G774jt9t2caPRqht4=;
 b=m+CMB5hyzL/vCW148bfAdpxtDQGQEu31xDtInASvdd3LXj0nkCWU32j9W7nMsv0yxz
 AbYluUTqVjOtHcH/CadQvtq29tSt3y6TC5FdXdIOW5CEUASLSEAJG4TNnldmYKFlJ93D
 UBcwvskXnyM0ZjhaQckJKjI9CMTIgKE5tdr83Uv7mgw4MY091dcXj7iYqUDJueoKo8TJ
 HCq0ZB+OGaE+b4oPObix8baFEv9mGU55AXaabPmo0y9/IzCZmXvb8LNNvNJLH1fae15M
 cxUYV6ecotYWTmUCA1E5DkiqjZad3RsN+DTzsXfYpH5BztBMbOynayE8XWSUYoBUM6fq
 9gzQ==
X-Gm-Message-State: APjAAAXenSJL5byYWTQpZLsFKepgMyFM+/LhN8EzUAvmOEbEQMD50sY1
 zQ2fFpGjEhuJY+HX8Kj3/Kf3ZFeeyt/q8WSZfF4=
X-Google-Smtp-Source: APXvYqySbfqFjtZckmVvrGyt+TLd55uZV4QCvovifobxpRMKv6OFRut/+vfst3rusYBBQhpUVUpr7xggySRPe8lIiLY=
X-Received: by 2002:a05:6830:2087:: with SMTP id
 y7mr4371038otq.96.1576107027197; 
 Wed, 11 Dec 2019 15:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20191211084112.971-1-linux.amoon@gmail.com>
 <a4610efc-844a-2d43-5db1-cf813102e701@baylibre.com>
 <CANAwSgQOTA0mSvFW5otaCzFPHidhY7VFcrXZHjCD-1XkQpcx3w@mail.gmail.com>
 <20191211095043.3kngq7wh77xvadge@gondor.apana.org.au>
 <CANAwSgR-fT21uBSP747MVkXf2GYqm_6kcne059pX-OegftLSZA@mail.gmail.com>
 <CAKv+Gu8HQ7RY9WSYZrLUR7tNjuybF5sp7xe94VLQpJrDSRg4NA@mail.gmail.com>
 <1229236701.11947072.1576070229564@mail.yahoo.com>
In-Reply-To: <1229236701.11947072.1576070229564@mail.yahoo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 Dec 2019 00:30:15 +0100
Message-ID: <CAFBinCAxq-uW+gsmb-8wqxHGXt2W+4w9iD++2fL=FQ7S-RsAkw@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Enable crypto module on Amlogic GXBB SoC platform
To: Anand Moon <moon.linux@yahoo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_153029_264662_C1FE9625 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Wed, Dec 11, 2019 at 2:17 PM Anand Moon <moon.linux@yahoo.com> wrote:
[...]
> Sorry once again I send my logs too early.
> I still having some issue with the Hardware glx cryto module.
I'm surprised to see that you managed to get the GXL crypto driver to
load at all on GXBB
as far as I know GXBB uses an older crypto IP block (BLKMV) than GXL
(and newer SoCs, called "DMA"): [0]

so my understanding is that a new crypto driver is needed for GXBB
(BLKMV registers) support.
the 32-bit SoCs use the same BLKMV IP block as far as I can tell, so
these would also benefit from this other driver.
(I don't know if anyone is working on a BLKMV crypto driver - all I
can tell is that I'm not working on one)


Martin


[0] https://github.com/khadas/linux/blob/195ea69f96d9bddc1386737e89769ff350762aea/drivers/amlogic/crypto/Kconfig

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
