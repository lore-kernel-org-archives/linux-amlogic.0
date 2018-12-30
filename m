Return-Path: <SRS0=Om+1=PH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F054C43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 19:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1F22084A
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 19:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aq64zwwM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="ChY3j0BQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF1F22084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqPXsrIZ1Rh9okBfwdBuAlthFHoKyoIRAAs0k/g0kRQ=; b=Aq64zwwM0IYeBY
	BHSViYmsNgeCTeRhIKyX7NxP4BRt/S7LrelkuhdAak2s2EUcg6N6GGKTeFcN0BRPD8bcsk/kFgpiz
	wtDkA1pZzf1BuFxdV0v8BNkOCoboamjW+L0YgqLN9GJPHnh8h6xgiQv+x1vlpUStQysYWZjO5j82M
	U0BJTwk/ZX/uIxJ1O7d/+Qjr/gpSWf7TPxt/30AUE+HnHSjLJ/YcQPnpV3Z9FaKnHhmJpgcIG/mQa
	9/1B3P+Xen/EdIWYormn1mEe5zyVkmDbKh0cHbkDaakerfMR3TFFlomnxZoqFWzpVe5szCOt/N/Su
	mzAmx443UvHDoFZbqwRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdhDT-0001m7-DQ; Sun, 30 Dec 2018 19:57:43 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdhDI-0001bq-4p
 for linux-amlogic@lists.infradead.org; Sun, 30 Dec 2018 19:57:33 +0000
Received: by mail-lj1-x244.google.com with SMTP id x85-v6so22493679ljb.2
 for <linux-amlogic@lists.infradead.org>; Sun, 30 Dec 2018 11:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmgKMH/6SSwEWvcl740PYkio2N+gHv5BllaSeQo0U0I=;
 b=ChY3j0BQdrPdzaxnuybk6xo1+C+CcSKjtCTQo2cVRYPykvarLdzi7QFmEQDQuM5Vj/
 IjF6wTv8zWkMeeH0vM03Q4jZqMatSuTSiXjTAy89ccuui/D5EVE/lCa5dtGaDMcHHW/X
 MjyvFlgUwKqYa1wVvPWzwedPzoZn5iTXJgfHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmgKMH/6SSwEWvcl740PYkio2N+gHv5BllaSeQo0U0I=;
 b=aPcE8maUMul9l3v3wJ6T4sjBTB44bvll6C9eVc5tE4M2Q3kVsovHnaBWt7dVIHK/bz
 sH/1IE27nK5b22Hu92C0hU0yPEfPjT3rkhNpfVI7rrNU5kXYz5SwRh32yz4zFgrKI0gA
 Atn2w34m8CdgMcuaFaV6njHhYuXDnP6hoAWPITxTyls4wpMQW5sHqQh6gCQheUXUbRUd
 cmm3eKvmf7mBqfEPk331dSSjcGeS9BjoiXE+rFfH1A2F1FdXnw1ZM2g87lKmqSFrVdg0
 /QC3iltE3ACX1mTF1pEkrqn9K/caKiGD6INtZZ+UWsqNDPNZf3dyEyIBKLYRFRaMLylL
 L5AQ==
X-Gm-Message-State: AJcUukft5rCip2sfiSbZVU+3qyyEFkj5Yr9QckHVDhU2RlvZuRsduC7Q
 GBfHcj/HevUy3GyEQbNpRUn0danlNb+dOflcbOHTuA==
X-Google-Smtp-Source: ALg8bN4DktsSDeBHgs3znZZF2kBU6pjNNcwSEUfjjtbNj0rG8/tUt8w6LnfocG9v/ZnCos6E0E78pqPJBIK/uNaOKeE=
X-Received: by 2002:a2e:9c7:: with SMTP id
 190-v6mr14322408ljj.120.1546199840102; 
 Sun, 30 Dec 2018 11:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20181229125711.5205-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20181229125711.5205-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Dec 2018 20:57:08 +0100
Message-ID: <CACRpkdZ4bex+wm4vGWhDLSAsXnaVeHWEp6Rf4g8NQZmXnFfneQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: meson: fix SD card cd-gpio (pre v4.21-rc)
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181230_115732_248965_22E65B05 
X-CRM114-Status: GOOD (  11.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linus.luessing@c0d3.blue, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 balbes-150@yandex.ru, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Dec 29, 2018 at 1:57 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> However, while reviewing the .dts files for the 32-bit Amlogic Meson
> boards I found that the cd-gpios are specified incorrectly in the .dts.
> Documentation/devicetree/bindings/mmc/mmc.txt states: "[...] using the
> "cd-inverted" property means, that the CD line is active high, i.e. it
> is high, when a card is inserted".
> This is not the case on all currently supported 32-bit Meson boards, so
> this switches the cd-gpios
> - from GPIO_ACTIVE_HIGH with the "cd-inverted" property being set
> - to GPIO_ACTIVE_LOW with the "cd-inverted" property being absent
>
> This fix also works even if the following two commits are reverted:
> - 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device tree")
> - 81c85ec15a1946 ("gpio: OF: Parse MMC-specific CD and WP properties")

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for looking into this, I think fixing the device trees is
orthogonal to fixing the issue I created, let's fix both!

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
