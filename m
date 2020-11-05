Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABF1C4741F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 07:54:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1FE52071A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 07:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0/VAoXy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJEtMmMP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1FE52071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oMY4csfBoRmVs31PqoNrm2jJxBYtyqSlr6n5IB1zYYs=; b=U0/VAoXyw1lCz5EYQ6cAcQtct
	vjLa6F3/oE7VQDxqQ2MjUgAPuVI7cZtlFZtXiYy3mibZvKv883FNmSwsw0RQUXI+1GwIiHdCMd1qT
	PZLEiZ5gUctnE5FvkWnCNpVa3en2315EKYXuIPsLDEVbZLU7ujEAg+vG0BDw0vMYSIk7HrUYIz+az
	6eajRRrRDJ0DGhLoPTWN12VuhcKUZqhOaY79rE1YF+MeNqUNe6ZLptO9B9WhqtIpBxpa9DYIZPRou
	u4wIDltX5dnR3rpV3VS08nOfdBfCVe2qZuIDVVPgNVIDzCJFE9xYyKn9QeO53/DdvHW5j+jQxOcco
	bdgR+ylUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaa5j-0006gg-12; Thu, 05 Nov 2020 07:53:55 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaa5g-0006fX-8R
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 07:53:53 +0000
Received: by mail-lj1-x243.google.com with SMTP id o13so537159ljj.11
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2020 23:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWxXaFjaX2JSFXvoISaJ2nJGcPKFBfvWFO1ioi84K5o=;
 b=LJEtMmMPnPNPuMOUjflAShtf/tGL+Srg3vIXk+Lh9SsAUj7yk2rRC4aN2nBaIEeBaH
 7srSBNMaaQU4FOWJVKx5aYqjKLliAMLz9fH3ilnVAdUb8Aw4B2moCRMuzCCkF9X2ZKR7
 idPu03npS0S+dIGpYKBd1q5mep93sRahA0zoeHLrMJpedNtAyosrk4IeNLEFVhV84rRi
 YMtdyjACyWB3SkSjjAC+T4HWDmo+63ag4qIcV9tlCSWgI4nUnkUPHHXQ9LQNoh5P1xK1
 X5oXHgtp+BLLQj0ouYR5zkyglNR0i1dk6IyQB642/q+WU6l+tApxCj0NZaZpp3Ktyd5X
 zHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWxXaFjaX2JSFXvoISaJ2nJGcPKFBfvWFO1ioi84K5o=;
 b=oswJ4bkf8esSEQmn00Wx4Pjd8ju8qJ3rXzfhY3CrvGZEey3r0yaceLb6mWFosR0eeM
 MsNel/QGxQ+jjQsDQe/mjNeGhcRJOx2q949fYrY1CsFLqKE55VvivuQiIPd1elJMFuRN
 SqkdKbnryI1YYeKDrmPV3fXxSZcIR6PCoLXcPoUyGXn8gRwH8VdkqQayA8fCFS1so9xW
 bAZvv6NFkQyl35Y9lkvK2WP/+HadAAwjbvPU0AsrKKAfUdy8Ghh8CnCHYs+VyGKKpW2A
 hkYyJtqrrDuEjofw34teziFqmyiKlYr19oh+FUdxsKqfQ1cUznS+oZvYXAFEG72zmHNY
 Czng==
X-Gm-Message-State: AOAM533UHMZOzD0qrr4Dww2OVB4TJuonprEkIH/dOhwuCIe1QSZ4N+L5
 hk3z3O4xJNdIr/Mh0PY550UOpDGxm3f6gVLNbb7VFw==
X-Google-Smtp-Source: ABdhPJxm7yZCg2+JWcvzDpHbnsyXEVmR6Ak6pvhrNxzGAq4WPHDY8br8g2VKo+Vo2nD1GExdkdG3YDlede23s3WS2do=
X-Received: by 2002:a05:651c:1205:: with SMTP id
 i5mr449252lja.283.1604562830673; 
 Wed, 04 Nov 2020 23:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20201030143715.577641-1-narmstrong@baylibre.com>
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 08:53:39 +0100
Message-ID: <CACRpkdZnpjas-WYuXhJ_mwCTqTP5DpWHcnNmGpdCQjrr3xGnYg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
To: Neil Armstrong <narmstrong@baylibre.com>, Todd Kjos <tkjos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_025352_409710_683000F4 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, John Stultz <john.stultz@linaro.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

this is just a drive-by question and I'm looping in Todd in the hopes for
a discussion or clarification.

On Fri, Oct 30, 2020 at 3:37 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

> The GE2D is a 2D accelerator with various features like configurable blitter
> with alpha blending, frame rotation, scaling, format conversion and colorspace
> conversion.
>
> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
> - 0, 90, 180, 270deg rotation
> - horizontal/vertical flipping
> - source cropping
> - destination compositing
> - 32bit/24bit/16bit format conversion
>
> This adds the support for the GE2D version found in the AXG SoCs Family.

We are starting to see a bunch of these really nicely abstracted blitters
and other 2D-accelerators now.

Is stuff like Android going to pick up and use this to blit and blend
generic buffers?

Or is this in essence a camera and/or video out accelerator thing?

The placement of this driver in drivers/media makes me think that
it is for cameras or video output, but the functionality is actually
quite generic.

I've been half-guessing that userspace like Android actually mostly
use GPUs to composit their graphics, but IIUC this can sometimes be
used for 2D compositing, and when used will often be quicker and/or
more energy efficient than using a GPU for the same task.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
