Return-Path: <SRS0=Om+1=PH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AC5C43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 19:54:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A592070D
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 19:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R+uhhFEE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWbPIWCQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A592070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfIcWy8/nFn9Delgjp69kNg/JFfwfaZyW0yeIm3wHrE=; b=R+uhhFEEduzbRF
	8A/CqsMP+WWGItql9aewTymKB5XxqCBpzDODoSG6aqOwKynikIfBe3Cnm7jrnml4Fa0grqrUK4OwO
	k0PWirh4m+fuNrsjY5Lxr4rHz0NubAb5MwYYhlh83JI+zUNGGcVLYG7xpRpl0cxcMcq3KzlHnxO5r
	01Zt4zrMvMzqcAIRpnensMEdiuYqOmZ0bN9Pooq2ZoV9qnWpe3MPy+Mf3Aq9r7r2QmC8mbnoz9oWJ
	2eXz6I33//iiHSTbhSjkJlkTras3kI6rmzAQwVGy6g0ykxbAmtzKKzv3G6VXJpXAtAmZQdVRceRMm
	7DU4D/NKEtG7QfCq4kzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdhAN-00079M-GU; Sun, 30 Dec 2018 19:54:31 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdhAL-00077u-58
 for linux-amlogic@lists.infradead.org; Sun, 30 Dec 2018 19:54:30 +0000
Received: by mail-lj1-x242.google.com with SMTP id k19-v6so22450930lji.11
 for <linux-amlogic@lists.infradead.org>; Sun, 30 Dec 2018 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jy4/5yrHPJtEJmXUsMTQxDmn+vHkQZe+Dia4snuwG2w=;
 b=cWbPIWCQ490AX3haqlE0HKdco7UZdUfHipXeAAdGHjQOTIjtDlIwxWJNha7w+cq9ok
 Ui0FafiwutdhPXTd7BBnEbJAqo54w2wHLBaog+8myu1tIkM0ufUFtyxD5OI+deiOwZ4y
 +q1DYWplQzjz3hUYjox6Y0z1bDM3FmRalIeBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jy4/5yrHPJtEJmXUsMTQxDmn+vHkQZe+Dia4snuwG2w=;
 b=W5g7vHxmWkco9IuUwVbDx7sQls3Ba3OLBEgzuPOsX7fiOIgWZyBIy11sdixGPtVjDZ
 SJDqPDflSHOYIrE7M6luUYNxHlLdXqRd13oDHtzSjZlyhAfsGcLKVycQGPJh+5CRmIim
 vxOCKsZfyVRWvEHPwwGw29IgBE3jQKZIrdzbW1tLgJCvhW9ENA4DFUDOoIzT7Uzmu361
 I1/6OkAWFSze/p9azjOIFF1JdGig42IDLppAo/d99N828MPkxVv92oYJEYWnTb4EqTQf
 WqJMehNKdDems0oXm+ond82sQkwpkCI2twdNDIeqO3KXPaVUJX26thZkRJEyZssLbIo7
 G1GA==
X-Gm-Message-State: AJcUukfAWA5tI7YZzVT5lEMeRvDgCNVuaL2Xuf/v8iuUxVNRkP3qc0GR
 8CIzq1LdwxBo+4HT7ZRMyxRTR5hWoDveHB067emwCw==
X-Google-Smtp-Source: ALg8bN5sGcB0WtqdFpe2OtYA8PDjQMDXuOdAa5LhLNkk9SGLDwQ8TVj6mdTIu0NdAMbjBhBsVvVO7CZlR/03qFM5da0=
X-Received: by 2002:a2e:9849:: with SMTP id e9-v6mr20269606ljj.9.1546199654826; 
 Sun, 30 Dec 2018 11:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20181229125711.5205-1-martin.blumenstingl@googlemail.com>
 <20181229125711.5205-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20181229125711.5205-2-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Dec 2018 20:54:03 +0100
Message-ID: <CACRpkdY89oiTn1XRu5Dx8+HQBcUysVQ=LpjvKA_Mx2hbmGXdiw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: meson8b: odroidc1: mark the SD card
 detection GPIO active-low
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181230_115429_199750_90C5A8E4 
X-CRM114-Status: GOOD (  11.10  )
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

> After commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
> tree") SD cards are not detected anymore.
>
> The CD GPIO is "active low" on Odroid-C1. The MMC dt-bindings specify:
> "[...] using the "cd-inverted" property means, that the CD line is active
> high, i.e. it is high, when a card is inserted".
>
> Fix the description of the SD card by marking it as GPIO_ACTIVE_LOW and
> drop the "cd-inverted" property. This makes the definition consistent
> with the existing dt-bindings and fixes the check whether an SD card is
> inserted.
>
> Fixes: e03efbce6bebf5 ("ARM: dts: meson8b-odroidc1: add microSD support")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This is definately a better way to do it (we should insert some text into the
nindings about doing it this way).

We also need to fix it for existing device trees using "cd-inverted"
though.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
