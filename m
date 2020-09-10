Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9072C433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 06:59:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F29220732
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 06:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WImlVEeA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXL+ijTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F29220732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t5gjuIacE3oA9WDPlTA5OCAIvJR2xqi3j6YHYQUcF3g=; b=WImlVEeAEoK0IlIgsRYpRSKz6
	LJxoQwKSt5hhe1+NlM2AK/ALXuEIMxZgXUx9Injg3nPi9MaXJPh+JgvF+gNizTnStk8bcQFXMKPzk
	ypr/ie6M/rPK6D5uzSKDH8cyFWxN1ZUMyg+JUyRg8JwdpR57frPLBAI17q6A31ayusHlBeYNI/Hop
	YEvLYETQ9h/0ryu74riQujO1vpRAe5z4ptehi0kcFLtPR45XXbBEwQdqWExJlIxfWNHagUs0vR1p5
	qrWQDypLci+7zpoDHwuijSgkeeSrEbYH8CIRyeIVRF8rBGNJxT/tWX9YNYZVo1LwIBEsQH8a00jnv
	LKyD9my/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGGY6-0000I8-N3; Thu, 10 Sep 2020 06:59:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGGY4-0000Hh-2V; Thu, 10 Sep 2020 06:59:13 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB7A021D7E;
 Thu, 10 Sep 2020 06:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599721151;
 bh=xOzDDEuhcg0+WXu//QXZGuTvH72fhH7NrPswesxiZA8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gXL+ijTBw11FfLjLqyYUZfKHTa4Zvs2N1LU7JLoiGcBQ7DNHaV/PzX6MCoDp00EAp
 wlCG83HzbzCGx6nVtzWC2pIby9quHCEjEIqQec3QmfPoutTorFkcOj+v+bXRg2MhHa
 jwCRShpKk3NeYVaSR0bdXRVGBByi3LEGRCE3M3wI=
Received: by mail-ej1-f49.google.com with SMTP id q13so7095491ejo.9;
 Wed, 09 Sep 2020 23:59:10 -0700 (PDT)
X-Gm-Message-State: AOAM533zS6V8mMXLwFBshC1WhjiPxenmYQggiVEauMu19TwheDnDOrxC
 1rZMukdV0mAs9kmB+j8VjWkRxLw32Y3MhnJiOOA=
X-Google-Smtp-Source: ABdhPJyaVrBohjZL8QO712q55aVYmvP/Im4PscZba1DFwlJPfAPVYEdWgkk0QsgOlmQCRth1GWIRcKjY7V63cmwrs/Y=
X-Received: by 2002:a17:907:724f:: with SMTP id
 ds15mr7191226ejc.119.1599721149291; 
 Wed, 09 Sep 2020 23:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
 <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
In-Reply-To: <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 08:58:57 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
Message-ID: <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] iio: adc: stm32: Simplify with dev_err_probe()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_025912_243103_E5C7D1F4 
X-CRM114-Status: GOOD (  22.32  )
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
 Michael Hennerich <Michael.Hennerich@analog.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 at 08:52, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
>
>
> On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:
>>
>> Hi!
>>
>> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:
>> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
>> >>
>> >> On Sat, 29 Aug 2020 08:47:16 +0200
>> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> >>
>> >>> Common pattern of handling deferred probe can be simplified with
>> >>> dev_err_probe().  Less code and also it prints the error value.
>> >>>
>> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> >>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> >>>
>> >> I don't have the thread to hand, but this tripped a warning next
>> >> and the patch was dropped as a result. See below.
>> >
>> > Thanks for letting me know. If you mean the warning caused by:
>> > https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
>> > then the driver-core patch was dropped, not the iio one:
>> > https://lore.kernel.org/linux-next/20200909074130.GB561485@kroah.com/T/#t
>> >
>> > So we are good here :)
>>
>> No, we are definitely not good. See below. That means "See below", and
>> not "Please take a guess at what is being talking about".
>
>
>
>>
>> >>> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>> >>>               priv->booster = devm_regulator_get_optional(dev, "booster");
>> >>>               if (IS_ERR(priv->booster)) {
>> >>>                       ret = PTR_ERR(priv->booster);
>> >>> -                     if (ret != -ENODEV) {
>> >>> -                             if (ret != -EPROBE_DEFER)
>> >>> -                                     dev_err(dev, "can't get booster %d\n",
>> >>> -                                             ret);
>> >>> -                             return ret;
>> >>> -                     }
>> >>> +                     if (ret != -ENODEV)
>> >>> +                             dev_err_probe(dev, ret, "can't get booster\n");
>> >>
>> >> This tripped a warning and got the patch dropped because we no longer
>> >> return on error.
>>
>> As Jonathan already said, we no longer return in this hunk. I.e., you have
>> clobbered the error path.
>
>
> Exactly my point why I proposed _must_check in the first place.

That was not exactly that point as you did not mention possible errors
but only "miss the opportunity to optimize". Optimization is different
things than a mistake.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
