Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96267C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:36:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE46206BB
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kF0JxssM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YUw1qnx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE46206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fgEjr5exYzFCf+2o3ldPagGfM5+4PzafpVtOPC6LiI=; b=kF0JxssMFkHUCz
	POXaRucB2qedgsEQpPbLglsVeluE7FcjUap9ylKo10QlwqVzSQlTBJjy2varw8djjci/XotF7mo6e
	/JmBksdWEUEhfgZkxlEz/rJbx3nMELvsUtCe2YjT6D6wB0i3BFq7uaKWDEWA0yy8WZFGmTrhYnwWs
	4C3B08bEM6csCj3Wzyhii7Cyxu70ItctbI9r0OsSrU70HH7XSavMatR1QvVDLkJfvyUthyixDXBY8
	+f5lEO89ytbPOZ7rVwzyhx9cWNt3TliXchPmQ4iE9DpRzmTR5/PSgSTbGZm4mrvJ/A5iS4/p8yD13
	qxC67f5DMuwCqi6mP93w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha5UW-0002Rr-GS; Sun, 09 Jun 2019 21:36:40 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha5US-0002RD-Mb; Sun, 09 Jun 2019 21:36:38 +0000
Received: by mail-ot1-x342.google.com with SMTP id z24so6577599oto.1;
 Sun, 09 Jun 2019 14:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZiIIarVNYc+IPXqi3ZtMcJmmvmMmviVgkK+GA+EHbhA=;
 b=YUw1qnx0j9Q6GWh+yYTbdK8KRLJ8DYZRAv2/6rqS18LKK2PYUFJNNBBxVO310T59MS
 Q0i8zJFB3HY8cV5PD1VOHDjD/z+NFcnqah+3Q/zqm73sHRlLC1ASFZw0cX0VlhoshrKv
 2NdoPU57kcsbbb6cyiu31yotsMdoiKtyqUlk+oz0TSs2h3o9jxAedd8Wjh+6kd3N5Wg+
 GNrG2ug/7KcCS8BCPGMHaK19XFYSvObeanbptGVJ6SWzWds4XUFordT+2Nw3RJbmbgoy
 ZUyWpNRCOWJjFXG7qRElzCAT2CD5fnSwCiKEdSjLcMg4+7makbLxk9rKUHqbu6H2Bfo7
 kFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZiIIarVNYc+IPXqi3ZtMcJmmvmMmviVgkK+GA+EHbhA=;
 b=uQWF849kJ6wC3VJ790J85JEoPHZXofSACM4SWtTJPDdUIoekZct9qx2y9xY8JITOkt
 xxFhZK/s4AZrvWSUs2PXNzbodgpnHnY/BP0igOhtfHkqFDlGrgZeURWQ0QcOJ8Bq2sHg
 JavThx0updjYVlks9EdJNqG0NGEQvZwqQdIHFY21LFdUx90zUhGLB5aEf+k9hcKwShsj
 oO1nqtMTWl5QpvoKeCEhpviOVrM4pVKwMKoNU606Prv7jDP/BejYG00RLadFgdxRP0Ap
 wz6WLXzmxVLyy6yj4WvwHpKiIJ0syG+NPojRrBRa1iLPU4AKlwXYhMtYS3unEVBFi+ER
 rNoQ==
X-Gm-Message-State: APjAAAVTxr2CKiPrAKLZFPO3xj7bfR25XJRhNr0SSVtdamyKzRFQPYt+
 /Q+X8CV+gwU9ldDXgDsUhfJT4F5Wy4OaRe29nDE=
X-Google-Smtp-Source: APXvYqyj9+ZRfTdLuN0mjg8NPOB46WOVRAt5cAu/Bhj4I4pqwq7IzgkWyjvVj6FI5s4pm42EnCqsEyqY25k+7COMUw8=
X-Received: by 2002:a9d:6405:: with SMTP id h5mr16586195otl.42.1560116195631; 
 Sun, 09 Jun 2019 14:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
 <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com>
In-Reply-To: <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 9 Jun 2019 23:36:24 +0200
Message-ID: <CAFBinCBgoLb+Hfdo-sZ_0H6ct=UJm7j6wD_C6udbA6BTRvFOWQ@mail.gmail.com>
Subject: Re: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the
 Ethernet PHY reset line
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_143636_765710_5CA54794 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Sun, Jun 9, 2019 at 11:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jun 9, 2019 at 8:06 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>
> > The PHY reset line and interrupt line are swapped on the X96 Max
> > compared to the Odroid-N2 schematics. This means:
> > - GPIOZ_14 is the interrupt line (on the Odroid-N2 it's the reset line)
> > - GPIOZ_15 is the reset line (on the Odroid-N2 it's the interrupt line)
> >
> > Also the GPIOZ_14 and GPIOZ_15 pins are special. The datasheet describes
> > that they are "3.3V input tolerant open drain (OD) output pins". This
> > means the GPIO controller can drive the output LOW to reset the PHY. To
> > release the reset it can only switch the pin to input mode. The output
> > cannot be driven HIGH for these pins.
> > This requires configuring the reset line as GPIO_OPEN_SOURCE because
> > otherwise the PHY will be stuck in "reset" state (because driving the
> > pin HIGH seeems to result in the same signal as driving it LOW).
>
> This far it seems all right.
...except the "seeems" typo which I just noticed.
thank you for sanity-checking this so far!

> > Switch to GPIOZ_15 for the reset GPIO with the correct flags and drop
> > the "snps,reset-active-low" property as this is now encoded in the
> > GPIO_OPEN_SOURCE flag.
>
> Open source doesn't imply active low.
>
> We have this in stmmac_mdio_reset():
>
>                 gpio_direction_output(data->reset_gpio,
>                                       data->active_low ? 1 : 0);
>                 if (data->delays[0])
>                         msleep(DIV_ROUND_UP(data->delays[0], 1000));
>
>                 gpio_set_value(data->reset_gpio, data->active_low ? 0 : 1);
>                 if (data->delays[1])
>                         msleep(DIV_ROUND_UP(data->delays[1], 1000));
>
>                 gpio_set_value(data->reset_gpio, data->active_low ? 1 : 0);
>                 if (data->delays[2])
>                         msleep(DIV_ROUND_UP(data->delays[2], 1000));
>
> If "snps,reset-active-low" was set it results in the sequence 1, 0, 1
> if it is not set it results in the sequence 0, 1, 0.
I'm changing this logic with earlier patches of this series.
can you please look at these as well because GPIO_OPEN_SOURCE doesn't
work with the old version of stmmac_mdio_reset() that you are showing.

> The high (reset) is asserted by switching the pin into high-z open drain
> mode, which happens by switching the line into input mode in some
> cases.
>
> I think the real reason it works now is that reset is actually active high.
let me write down what I definitely know so far

the RTL8211F PHY wants the reset line to be LOW for a few milliseconds
to put it into reset mode.
driving the reset line HIGH again takes it out of reset.

Odroid-N2's schematics [0] (page 30) shows that there's a pull-up for
the PHYRSTB pin, which is also connected to the NRST signal which is
GPIOZ_15

> It makes a lot of sense, since if it resets the device when set as input
> (open drain) it holds all devices on that line in reset, which is likely
> what you want as most GPIOs come up as inputs (open drain).
> A pull-up resistor will ascertain that the devices are in reset.
my understanding is that the pull-up resistor holds it out of reset
driving GPIOZ_15's (open drain) output LOW pulls the signal to ground
and asserts the reset

> Other than the commit message:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
thank you for looking into this!


Martin


[0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.4_20190307.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
