Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810F1C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Dec 2021 23:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mN/wqUmjvTA8sap+HZVM5COFZm1qIl8sPsccMLJgBgI=; b=vz+R9rQpBpTg27
	+J6dLcvFaixQteM53r3J6I5baR/22R+ITajSJDjjRFdGSZ71RQG/6Ju/Su308BDT8XeWHCWm0c/eV
	nYyH0z+fezty0sXjSQJTTqkupTyeoBHwTRtkTB8RYj1WQrzQP45IF4t5NYM1wfZs9njHIdd1DB1Tq
	5CVk2iry99E57Xve22gyIutwwDoXgPLPJN4Y1OLrz0AJbOUFKNRjoFpPOQUXfaSv/89VzyxI5ZOh5
	TsGTo/AEdYTchecs6Wj58O5gIICdw5TMxAK3Pl9NVG2wZRYdut4Cam8xWS8sMupfo2GXbMgCriBtq
	cj7AN/RMhdKb2Br8cW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myj1p-00EyW4-Vb; Sat, 18 Dec 2021 23:22:14 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myj1d-00EyTf-S6; Sat, 18 Dec 2021 23:22:03 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z29so22462006edl.7;
 Sat, 18 Dec 2021 15:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jy0Ga3DpjlJg+/LuCD6N3Bii634vakq81RRGU8kR/lo=;
 b=GXaYs/dYmFjCL9Hqi/k90Nn+qo8+Hm4uwztzbrnvz9onhQmw8FTTWvdc00sWatsuhK
 cjVG2KCOOcw/tgJcPBYRpuBop4582yKmBYlDkGwHIG+6B6TuaPT7iq09g2imQHw/e39R
 aQc6Lm1DHWFhnL9EYnSLDVTd9NUKBAWw7nupAuyrwQVxLvEq3cNFLMB42I5Hl5+smyTB
 teLuwkg3eqrHdhAM7KOneTOrkfoOgzUwBWwutaIMRaYXgTOA+rRbEvk+lPzFEMXVs4Xu
 y5rj4wV0BiXyQ663os0Nb5Hil1isgTnLGt3iyN0r9Fz0rHnMbaODtxvUuOcFRHyyWN7x
 JrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jy0Ga3DpjlJg+/LuCD6N3Bii634vakq81RRGU8kR/lo=;
 b=hysCqb5Ky/LSLrefj9JA5c4EpVUH49EZd+ar76bOOVbXLrxp2Uzp7yOn5X74Jbrq8n
 hAFjOfhCmaTIogEAS+NceDrgZIdma1HN4/RZNiAHfYkP4H61xS3v0pGZ8yWIy1tV4qPt
 +lJWmotuIZ0F/3LLmrbw1ApWf4GQN81kJhl15SrTe75ZUhfCJvcJXP/pJxe95OBsaXbt
 vIBcjcmc2+LOKDJI+qGmR/Vs6HVjwhW5qAr8NuNHlitsRkBoQFUN3QA9cVAJq6qaJ8Xw
 T4SWM4M5MKoOxWJxTbfPcqOjIXG0bFtvxDX1hDZQLvquV6W+YJAr1MLVCHgHE5T0uZO/
 SsNQ==
X-Gm-Message-State: AOAM532DerS0GHcAf3eEAErs6TJhQxK7rJl0osYlUfu+1Jr1VOq5PFUa
 VJ/dPoe8+YpwMwdwDKqy+8JheA1/0AoPoo2ColI=
X-Google-Smtp-Source: ABdhPJx/41M8w6QBX2nmKkkxnJ3pPd76IxUAUOmOiFQNl7SjjagIfd78bF2mSnVEepR76ZLv/E14js2hM6hUuPCyLrk=
X-Received: by 2002:a17:906:341a:: with SMTP id
 c26mr7617881ejb.302.1639869719365; 
 Sat, 18 Dec 2021 15:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20211217202717.10041-1-s.shtylyov@omp.ru>
 <20211217202717.10041-3-s.shtylyov@omp.ru>
In-Reply-To: <20211217202717.10041-3-s.shtylyov@omp.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Dec 2021 00:21:48 +0100
Message-ID: <CAFBinCCKokhAK=mK0WqVbNYqjB3iHDM1nm9QLEWtmUCFMfjK+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: meson-mx-sdio: add IRQ check
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_152201_932030_D0591008 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On Fri, Dec 17, 2021 at 9:27 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_threaded_irq()
> (which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
> an original error code. Stop calling devm_request_threaded_irq() with the
> invalid IRQ #s.
>
> Fixes: ed80a13bb4c4 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoC")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for catching this and for submitting a fix!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
