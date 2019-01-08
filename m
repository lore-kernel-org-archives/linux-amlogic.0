Return-Path: <SRS0=m30L=PQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C87BC43387
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 22:20:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE19C20883
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 22:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sG3hEqHe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eSElZoQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE19C20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3Zgu6ZsM+CQIAEpjt5k5q4HhlL7VcjvcSJEP6bDW9c=; b=sG3hEqHe6eXs7H
	4YEZ2+Cc2CSLQGGMGO6xN46Dio2DTbhGsr9YhnB5ig80ATjvUQPQixtGTASr5/Q5MkUEdTJTF7NUK
	UV8TdW+y07aDPDjxAcRCkVc5+MP+OcIgsFp4exLtGMLkKLyi94NTh3aSXOrY+iaL+Q8V4QUmTi8VL
	/AmP9XR1leRF6z16/gY9pAcEvJ8haMa7RvPSqK4p2dABJXcPx9VRTgkQI7h6zIemGg9dVX+xwEGUX
	a6mCnmXHVHcxvES4T7WUY52u6EAz9ET+ousbpWdkCKs/VEpeTACAAZlSEO96rHC3iMatmV+isWylK
	TbNvkJAcpZg/1eC7KSLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggzjW-0000LF-NK; Tue, 08 Jan 2019 22:20:26 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggzjT-0000Kb-HY
 for linux-amlogic@lists.infradead.org; Tue, 08 Jan 2019 22:20:25 +0000
Received: by mail-ot1-x342.google.com with SMTP id 81so5000107otj.2
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Jan 2019 14:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3FszoKRoii4/tLSRpYfFx7gzdLe873cr0aXmZDyBbvM=;
 b=eSElZoQn2DIH72z1EWOtHQjqzOkOhH5QnFfqy7b9Hhs3Ok5QLq26EFK7TQXK9PIeNc
 dRkbSaZRdX31zO07z4sYC53kT2ixhtlWrUrK/6qXWo0pGq74ijj9KxcsHSl3CAX+dzqr
 HcTPexMTO25vmu0T1YzJU2W+lHmnlQOiML/fXxEeo5VnCsUMFO6x2cho4XNJN/fDrf19
 kle0rtYJ/UzUtk6TD2E+brpt86zSh0i2LipeHeexFeB1rl+9tvD9Ta8uVraqWz82b6Fn
 Z6BUBkv0WiMgf7Ix1kZqlmFmV6Y+Q0OI7mDhbRQyy4ln3DR9gbXBHfHssCq6ni2dTUq/
 PORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3FszoKRoii4/tLSRpYfFx7gzdLe873cr0aXmZDyBbvM=;
 b=C8+THW1h1DK+ElbFNfmUc1+S0Y/+0XHXCJeOXfAy5CITXcirY0viiSmp4DP8CBRvpq
 RNRCNgXX+ZadZiSSEtrtWAE6jhjiawYAIqPbwXoHWR/wo/RyWEnlSEeC079xDOLX1IAn
 c+o++llVeuJEaZsj45FnluAawy3EBCZ/L9aj7eoqQFnMwbDkCQ+DinkLOTNL10IoxaPP
 xSy3ajbNoMmR3sezPtQELAVy7QPPIFLboMPHRsfPO2qYVgCjvvADNy1QRKsS0Eg5GTPj
 gcK5uWJND1fFrKhnwWdOPh+kg0y7HEXsQvs5UrFxOYvJSYmQSGeH7MfBrerYQasbQKUr
 +jrw==
X-Gm-Message-State: AJcUukd/2aAPafCyYTDQj9qzmM29xv5sTEUbz7D01AgcnnySl3cor2Bj
 TUryt70y6qm0ggbuwhLce2nqCXb4WZ3aig7W0Ko=
X-Google-Smtp-Source: ALg8bN69o9Zg29FBhXVFYmT+twlXqMLAu0kW630fZwzdzoS2zn+fub1h/543Z5T3yGcYcFHhyySw1fLgxs1GKQQL230=
X-Received: by 2002:a9d:a48:: with SMTP id 66mr2392346otg.308.1546986022444;
 Tue, 08 Jan 2019 14:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
 <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
 <CACRpkda8cSt7J8+2P1xpOn13KkS_xmeO1MBRR9dXZcWXgzpQwQ@mail.gmail.com>
In-Reply-To: <CACRpkda8cSt7J8+2P1xpOn13KkS_xmeO1MBRR9dXZcWXgzpQwQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Jan 2019 23:20:11 +0100
Message-ID: <CAFBinCDj-CpaQb2wfreJOCkFVj6ysV7943mqTs3xSvMfhy3yGw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: core: don't override the CD GPIO level when
 "cd-inverted" is set
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_142023_605836_4F5C8547 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Thu, Jan 3, 2019 at 11:06 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jan 1, 2019 at 8:44 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>
> > Since commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
> > tree") gpiolib-of parses the "cd-gpios" property and flips the polarity
> > if "cd-inverted" is also set. This results in the "cd-inverted" property
> > being evaluated twice, which effectively makes it a no-op:
> > - first in drivers/gpio/gpiolib-of.c (of_xlate_and_get_gpiod_flags) when
> >   setting up the CD GPIO
> > - then again in drivers/mmc/core/slot-gpio.c (mmc_gpio_get_cd) when
> >   reading the CD GPIO value at runtime
> >
> > On boards which are using device-tree with the "cd-inverted" property
> > being set any inserted card are not detected anymore. This is due to the
> > MMC core treating the CD GPIO with the wrong polarity.
> >
> > Disable "override_cd_active_level" for the card detection GPIO which is
> > parsed using mmc_of_parse. This fixes SD card detection on the boards
> > which are currently using the "cd-inverted" device-tree property (tested
> > on Meson8b Odroid-C1 and Meson8b EC-100).
> >
> > This does not remove the CD GPIO inversion logic from the MMC core
> > because there's at least one driver (sdhci-pci-core for Intel BayTrail
> > based boards) which still passes "override_cd_active_level = true" to
> > mmc_gpiod_request_cd(). Due to lack of hardware for testing this is left
> > untouched.
> > In the future the GPIO inversion logic for both, card and read-only
> > detection can be removed once no driver is using it anymore.
> >
> > Fixes: 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device tree")
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> OK two steps forward, one step back, that's a good fix for now, I
> can fix it properly for v4.22.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
great, thanks for reviewing this!

feel free to keep me CC'ed on the "cleanup patches". I can review them
if you don't mind that I usually need a few days to do that


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
