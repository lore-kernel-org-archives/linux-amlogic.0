Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B724C43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 11:23:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B30B20684
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 11:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXes/UfJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOioGQ5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B30B20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=flOESaDMaCKrGImMQRB+3TgOnIv3F0qQDU/gvT9KLcI=; b=FXes/UfJTYPTeMPtiv0rPMtHF
	YZpDZuwowm06J9M0eBk+iU2C+qj3t5ffAFQqIMGNYTGNmjPVPW8YSU3MSpWuJNvwDUeG2eQH7pGv9
	roz2w3P4fLJe1TMgylPb+0gvOtC8Of2Kx83/LzX8PGczD7ipFuDphv045EjaJ0w4t/Kovd/Cf6Eng
	hKWG4Zvb3qItO7rdZN6XccivJHvEVGtpS05QPFDPP4RvIEW/j8I+A9wCenlIFT9nTKDRBdWoNhwse
	UnTW+3fxKkzusVZvoIgenQZ/hbOMzbqTnRhWND4zcchTTmSMNelC1kxftL6VzTNkPkW9Zr2b8H3lX
	MmOe9PS/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGKfu-0005UM-5J; Thu, 10 Sep 2020 11:23:34 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGKfq-0005Tc-96; Thu, 10 Sep 2020 11:23:30 +0000
Received: by mail-pg1-x544.google.com with SMTP id m5so4065612pgj.9;
 Thu, 10 Sep 2020 04:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T1jU/BIULwBFdkoPS5XoMOevUkSDj3Vui3wyMh4knhM=;
 b=kOioGQ5evJcV7vpyJ2QT+b8KV74xlfj4V9gz+Gi9EJKijWhwcOR2jiYEUVAY3td3LW
 Y08bH84CTpx8e1jVbrmjV040DNvqg3GLneTw00f6P/lqlxejHGjOK+XxxAmKjlnNDMUH
 1CL7nWgoCi8F9/LMTe4G7vr7hXTULJuAKlEwrpISSp9qOTNqMRqGI9sibilZLgXT+U+x
 2S9vALT5XO91HHsPu7PAVi5LsQ35l8W0H5GMW5/W5UKQpM5mlE55S8I4sHH4fIZRCb4C
 elah9RPrcRcUVGWbTbX8KVhKd0AbE/DLcWiRSNsdVPZ47jX+2LBSaOScguSScmKG/Vhc
 cwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T1jU/BIULwBFdkoPS5XoMOevUkSDj3Vui3wyMh4knhM=;
 b=SEo7GMmsSQ8J5lud7P257jmNO6szVCIg1H4Qux+JqKtLoNmgQAgwCl+iVhH81gNHh1
 +Qo0R5bZgUqpLAZq+Go+ghTZHBctb5u0rA3EbBfKRftdxPPVFY3FSqxqgoSKT4pFMWq0
 WbKC5rfSvj7mNm6mifuwJKA/1YA8R9C5de+zLkrTq41PXzMRFPct0/YV4sfBwGHEPn3k
 J/HYnFb+21+eqQnfWgxYHoxvxeiNs9swI17vnHVe0Al4aHJAZIQmO76AxSse2maIJksH
 wmjmbmrTxr7kKkdqfrPibwJIXwKrqcO2DR6Sab4AZGAnZmIeXIbcj6JlolOJdm2ljD3c
 FM1g==
X-Gm-Message-State: AOAM531xfxqtcVdm1bN/vjbJsxtKSABgenbC9oUfPJDx5H17SeXz3dzA
 68HJJXFYdVsQB3feRNyuXKakuvLLE9Yr6kmcMtg=
X-Google-Smtp-Source: ABdhPJyCj6CWd0QanAzErE/ynm5jwINoiczRiB4v/uRCuGY6oPJwHWMmLybWkZiYlUewNxugqJLfl5R3W8ptoe7SDh4=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr4011616pgj.74.1599737008099; 
 Thu, 10 Sep 2020 04:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
 <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
 <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
In-Reply-To: <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Sep 2020 14:23:10 +0300
Message-ID: <CAHp75Vc4VdfNeaLH_7MOGLsJLnbyYB+DnSpsyoDx2GDFV2N5Dg@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] iio: adc: stm32: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_072330_349730_D7CE4D6C 
X-CRM114-Status: GOOD (  18.78  )
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

On Thu, Sep 10, 2020 at 9:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, 10 Sep 2020 at 08:52, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:
> >> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:
> >> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
> >> >> On Sat, 29 Aug 2020 08:47:16 +0200
> >> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:

...

> >> >>> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> >> >>>               priv->booster = devm_regulator_get_optional(dev, "booster");
> >> >>>               if (IS_ERR(priv->booster)) {
> >> >>>                       ret = PTR_ERR(priv->booster);
> >> >>> -                     if (ret != -ENODEV) {
> >> >>> -                             if (ret != -EPROBE_DEFER)
> >> >>> -                                     dev_err(dev, "can't get booster %d\n",
> >> >>> -                                             ret);
> >> >>> -                             return ret;
> >> >>> -                     }
> >> >>> +                     if (ret != -ENODEV)
> >> >>> +                             dev_err_probe(dev, ret, "can't get booster\n");
> >> >>
> >> >> This tripped a warning and got the patch dropped because we no longer
> >> >> return on error.
> >>
> >> As Jonathan already said, we no longer return in this hunk. I.e., you have
> >> clobbered the error path.
> >
> >
> > Exactly my point why I proposed _must_check in the first place.
>
> That was not exactly that point as you did not mention possible errors
> but only "miss the opportunity to optimize". Optimization is different
> things than a mistake.

Yes, and that's what happened here. You missed optimization which led
to an error.

And this is a good showcase to see how dev_err_probe() may be misused
because of overlooking subtle details.
Perhaps we can do

static inline __must_check dev_err_probe_ret(...)
{
  return dev_err_probe(...);
}

(or other way around, introduce dev_err_probe_noret(), yes, name sucks)

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
