Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E474C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+cOuzE0A5btoi7U0WK4BG3bCvVGgF4am12yKAv90lM=; b=F1TvNoIUrshhNx
	KCxKEFiY5DXCwc618YNr5U9Fr5O0lGxsjwjj1K3UTE83dEyzPki6qq0U3ODNjlM86ZF2WjvV/krqc
	uLfNuH+7XBMWoe1NS9DL/R7iYwaVtgUwH31YkOWbnWvFot2JrbNJTjAtPa06v1/NSTWd+6MSLqXYO
	1jjgsBog5D6dvdWLhcwChtH1xOJhwnNfXWg5Gi81zbnI8gbhpw9lQTacYNNqlr1TR2MqnXWil9Fhf
	NbpimZPDiKo0S3zpMMr6GRIwsshACFTet5eey4Y+gs+u0F/uQgt6ERNLLvggnsT3ruvGhcjHy7B4B
	8X4gzzVLMrxHjXLnR1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLQSr-00H34b-3X; Sat, 19 Feb 2022 14:11:57 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLQSf-00H335-4N; Sat, 19 Feb 2022 14:11:46 +0000
Received: by mail-io1-xd32.google.com with SMTP id s1so10878236iob.9;
 Sat, 19 Feb 2022 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=khEKiFmlxsxiqTtZYX/qTk1TpXtOYU/3OblqSoDUfW0=;
 b=ZObrfqYotJuDphjyiBMB/p7l1RjWwBi7KwVByx0fZsy5G7MwhhOgTKtBx1YSVnd36F
 wwKzz6FUpJ714wLF2d+DjM+j/DuyFrSoOf38xJAQ0r2AcC41mFdnU8M4YoRBQzw3e+oJ
 45f8OQ5pM7KJ3CiNhWqMlOKJSVfimH7yjaqq/aW4E9XGzvCgqr0vC7YspFQtAYt81jph
 Xi5+lcHwDA9scIGPe4j+BD8vLIR4cgKJJbITBBnShSx5eyiQQQwb3bSLt3AvNWma4Q50
 HvFnrE3DlEPXIYW0shbg/lZj38hziCQKP9T6h0by4YcguyQneSBEtK9oowyEp1BkbF0V
 5URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=khEKiFmlxsxiqTtZYX/qTk1TpXtOYU/3OblqSoDUfW0=;
 b=yvAJGXSQeedG/7DuMJupGSmNil9zlDQkkK+Wy68z7MNXJtrNv/OwPTJlSI2xqpcfig
 PsphxXGwEkbjgOFoQx4S5OLfGf4/uvetsLZY0e0D5aPZQNIAS2upfCkzXw1F1DmmrVCk
 HF0tG+F0pYlyDOLKEtBBmzIXJklGYy8HplONMKLxJPBT2FsdqnFAIyOSEsKE5x6Z/X0k
 bKdRAaARBHw2qU36dW1LIhEkr2pTmy2X8Dxq38xCtslG9on9nP+sWRGyMQA4WcdIjXi2
 nJK4bxz6R5pFmKnCg0/nL/3ycYmEDEPWy3JSgERfctj7qPWz5rJusYRRB8uom5Qvb5Lv
 m7aw==
X-Gm-Message-State: AOAM533F7cN79GteqPhurv8gEgUVpnTQ938NcBdN87HdlxC4O+eIzein
 A6xQide0ImcduGfZ52ZjdtyZ5prRkyhJSE4ixZCxAj0G
X-Google-Smtp-Source: ABdhPJx5eE3sAx403go1Z2XHoeZZ5Xc3sz8vW4aQ9/eP501nK+eXQOuYg1aMlzYNe9DLkA7BIIff8QBau4zCr9ehHag=
X-Received: by 2002:a02:6d5c:0:b0:30c:a4da:d47d with SMTP id
 e28-20020a026d5c000000b0030ca4dad47dmr8712134jaf.308.1645279900228; Sat, 19
 Feb 2022 06:11:40 -0800 (PST)
MIME-Version: 1.0
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
 <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
In-Reply-To: <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Feb 2022 15:11:29 +0100
Message-ID: <CANiq72=+richkEREEdxkgxfuosN1rUfzcg0=0Z6CzHSH28HnLw@mail.gmail.com>
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda <ojeda@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_061145_181406_CA42F92E 
X-CRM114-Status: GOOD (  10.08  )
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

On Sat, Feb 19, 2022 at 2:37 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> I didn't find an explicit reason, but I suppose Pavel sees this driver as
> one that makes use of the LED subsystem, but doesn't belong to it.
> In the following mail he's expressing his opinion that the driver should
> be best placed under auxdisplay.

Ah, OK -- thanks!

Cheers,
Miguel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
