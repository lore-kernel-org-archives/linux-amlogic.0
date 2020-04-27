Return-Path: <SRS0=4IOV=6L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D27C54FCB
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 16:24:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 556F9206E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 16:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkM0WOpa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="C/UeX3V2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 556F9206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTAZUc87tINxOKrrRhi3utvoSsn7wJBWVAaE7HlOXpA=; b=EkM0WOpaGy4C/C
	rGG2lBPFdJP5Az8w6OB2xB0+dUwAmzY8JtLfdZO/aXZATgB1o4bhEDBFyrXrdMo9YG35AgaCs47LO
	7jv1LjRhJu6NmnHIDycHHpDZNsYvnELfnPoD7FF5+qaM5BYOe67kgH/OmdQrFs1sZPmzMS2NRsT2G
	YLcdqw/Uyl1Tht92nCvOCGXnQ2hFEfifjUUiKxlcqOr48HL7zM2onPu9d50S/fY0tlRUnXeNNHGWv
	8ofqpCzHjaIeA4pvo0fAlcB5ha0hIajUli7Zf4wqUnOYGK9zuXkbwDeQVBloIPsbbs+TFVLnqmMFK
	v7/azzdykMLvSbOOhRiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT6YB-0003Wy-P2; Mon, 27 Apr 2020 16:24:07 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT6Y6-0003NK-R1; Mon, 27 Apr 2020 16:24:04 +0000
Received: by mail-ej1-x642.google.com with SMTP id k8so14617335ejv.3;
 Mon, 27 Apr 2020 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWPoYwJEl9V5YJAC4WNuwBg/dxHA3IxOpuyKiILxznU=;
 b=C/UeX3V22n4clKX0lidBg1wfTgyte141RHR4D/yMWPz4MmLO9VSKjxOGhfZUMvSxh5
 lahhhGC1BnRLcRys8vkijyNhoC3ZriRyC34w1IELDASTlvq2yV7ZfrwIiYS72NBDmLDu
 yaZl3kzdt+u9A/quzE5wJf2u6aJQ4ktAIJa87cuf1+MfjEeICkqJ44WBRN47Iy3Uswx6
 ahFVmC+2xRhc80opYNR1EgJrlmOVOA3wuePis6UkUONHFv//rO7Cuqf3X12VTLz7xU0p
 GkNxzuyjfUzFaHe7y1wNaVWkmcegsxROdx7l1tBryU73TvdBcHVdr/yKY9XSL8hzj0cR
 Hyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWPoYwJEl9V5YJAC4WNuwBg/dxHA3IxOpuyKiILxznU=;
 b=RQAFqYsc4cFBDj7QN8uk9CuTh5c05uUpvvouMmZ2sM7LlEnbKF4PFYsWrnU6Q39WIb
 1dcpbD/ErrGkEuhhLbh2mnUHiXwpFaSvSaRi7LosRUxOwBZ4MdS1Gbosya5e6NVu8+Zr
 eqh1x4ejIL5ElVp3yEAYhtUWlrxHUTdBQ1x8hrDt3xS3kiVDB1CcLXJ8DpwZZCMqOJUj
 QALl9KNOZfbEN8UDvXjYkdm3nyMROz+gAA0M6cIm6B04c5TxrjLVN26437EeYL/rHZzw
 Btuw0zglFfR21R+9p1wxIG53QutvqLr5fUiK76RIsrwzlJqbbKtGZdzeZekmoWknQ8kF
 5pzg==
X-Gm-Message-State: AGi0Pub6WsVrj5BOPIIrF0UBbgE++zL5e0O03xlmmSmHyJNA0q0v+xmo
 zfh6T6g5t81ewTZj5yCLL5Nevv+aBFHGpPcrX6A=
X-Google-Smtp-Source: APiQypLMHO3pnC6/d3Uf/T8HCEFOxHwcaSjxBATefEkEjE6SvjUvYOMC854uurowtQ2fXp3sQqiBg2bcmRKVKa8jO68=
X-Received: by 2002:a17:906:1a06:: with SMTP id
 i6mr19961325ejf.90.1588004640687; 
 Mon, 27 Apr 2020 09:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
 <1jblnd2tp3.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jblnd2tp3.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Apr 2020 18:23:49 +0200
Message-ID: <CAFBinCDzNw6nV3oBJs6C0sssW61GERBXq39DCM22BT9zS8M31A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Amlogic 32-bit Meson SoC SDHC MMC controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_092402_955448_E0FFCCD4 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 jianxin.pan@amlogic.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Mon, Apr 27, 2020 at 10:56 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > Changes since v3 at [3]:
> > - split the clock bits into a separate clock controller driver because
> >   of two reasons: 1) it keeps the MMC controller driver mostly clean of
> >   the clock bits
>
> If the register is in the MMC controller register space and the MMC
> driver is the driver using these clocks, it is where the clocks belong.
> I don't get why it could be an issue ?
>
> Is the clock block is shared with another device, like on the Gx family ?
no, it is not shared with another device (to my knowledge).

> > 2) the pure clock controller can use
> >   devm_clk_hw_register() (instead of devm_clk_register(), which is
> >   deprecated) and the MMC controller can act as a pure clock consumer.
>
> Why can't you use devm_clk_hw_register in an MMC driver ?
> Unless I missed something, it is provided by clk-provider.h, which can be
> included by any driver.
indeed, I could use devm_clk_hw_register in the MMC driver.
Ulfs concern was that a lot of code was needed for managing the clocks
and I agree with him. so this is my way of keeping those details away
from the MMC driver and have two separate drivers which are better to
understand overall.


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
