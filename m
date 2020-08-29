Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4379BC433E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 14:48:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC5920791
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 14:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yL4FiGqr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hHbur1rs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC5920791
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qe0S21iT0fsvaN1950VHZTmOS4CZaKZ8aSgAq4argUQ=; b=yL4FiGqrKs1YthsDbUTZC/v71
	Y5lRJOmB6Taq+C7EzTdFZvToIGanuvG6AI8IEGamZmEEIqa59kZCBG38SLkdUPSrxjo+r8fkHBT5G
	BBN5QHqpmBd+mL7tbc5y0tOdu+wUSkPxdjVoAq0DBOMAGgx1UCZzaoJeq1y5TS1WEpPdE7uZfWrk7
	Og8XZ1okxVXNmOv05whvQXdSOSIrrH3GsYd5FOjdGcoZsMIIFokPbT7E67U3c2vRpkP2WAcJA2YI3
	/+CgH2ZV1k67ZsvD4qGKCPUyyI9peEzwYfWIrO4XUy6I37OM7vSBAn6n/Y3Xtf6Omh8NepzdWgqhb
	Y+YOK0gNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kC29y-0007VS-Fd; Sat, 29 Aug 2020 14:48:50 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC29u-0007Uq-Vw; Sat, 29 Aug 2020 14:48:48 +0000
Received: by mail-ed1-x541.google.com with SMTP id q21so1683047edv.1;
 Sat, 29 Aug 2020 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/qCN7j8tb2VUbSrI7tBTv/xuxn0AqjD1uWSjfTSjT4=;
 b=hHbur1rsCmRq/5XRl3unzdV1tt10cWSYSErINzv3YotSrO4cpzSxPBIZJ2F8a/p32y
 EbtjHtBuQMT/xnw1bnaezOZ1tZ1Y9WFE9e6+e3Gf8QQSqDHzcBWhyDMXhaBBzEOtJCJU
 dqIIYRY1M1LPLrByw0nz0/WJmEAEMMTHuU3scdguAfue9jBMtfmdRg+szVvVqmjfcc/T
 dtYopwsHvM5tIAyofaF/KHVMrxQEyw8Vw3BB3mONHh1jgQSMvvFUzz3zh8ZAwQk88kVq
 BlIgeLZ5FoZJGig/TL19ACCrjD9laRdwz9auEmT5qN2ItBU+IlMD/NOdsLSTkEu/AAJN
 VIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/qCN7j8tb2VUbSrI7tBTv/xuxn0AqjD1uWSjfTSjT4=;
 b=si0a2VfkC5tfKPPjQ1n/9LpURc2zlBIyd2LKnq5UCMFTQdvZ7WYa7ZVHjn+FynW7qo
 Megs6Z2YZ1DnwyeQ2Q0jDsX3/do+9fFK9O2I3+Sx9eHTC/BxSUn5ydxiNF8TkZBzI9uH
 4CTi8MToh7QToSl3fdrXKHqXbmsexgYe1OrYGd28CniVtiKX/u6ia2k4CI2ok+gdcqyw
 oWCl2K9soiOzL6TkFIZEZGedpc0veTdiWUI/virI2zr8g7+I2J6pSt/+cd30aPtk1TJh
 zpdwno53E4gHQLzlJRMTBoaOcM09lJeSzwCRBTPqp9w9+kc1s0c7GDe/2zR79wVPimOn
 tWZw==
X-Gm-Message-State: AOAM5324lrqgqEapEZvaNmoZO9ju3OAPFYKrvpQA02PCOh9ohNSd4nVi
 3ryizk8PeMEAOMZ93/oixDA8SsCUJy+x9N/FobM=
X-Google-Smtp-Source: ABdhPJxMlnl1Lp/VRHMrdqqkFtqSaK4C9u1G2u7BpHPiLA9TpJhoMPjyU5seldtykzBb1BcV6pduKOwjgdRUKlBblPA=
X-Received: by 2002:a50:fb98:: with SMTP id e24mr3048905edq.130.1598712524689; 
 Sat, 29 Aug 2020 07:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-6-krzk@kernel.org>
In-Reply-To: <20200829064726.26268-6-krzk@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Aug 2020 16:48:33 +0200
Message-ID: <CAFBinCCDvnT2HUuAF3J4FCWXKGpo-Wp-VxBuVFZSAovjeV04=g@mail.gmail.com>
Subject: Re: [PATCH v3 06/18] iio: adc: meson_saradc: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_104847_138074_3594B404 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-amlogic@lists.infradead.org,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Aug 29, 2020 at 8:49 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
