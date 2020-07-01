Return-Path: <SRS0=bxQo=AM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC77C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 08:31:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCC020722
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 08:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpXpGle+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com header.i=@endlessm-com.20150623.gappssmtp.com header.b="ZWY90c0e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DCC020722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=endlessm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BiHWkCRT0iELb5xuCv8ENM6CrALEaE58Af7AysXRQvQ=; b=OpXpGle+vI3z6GZgTpSH6PFhm
	pdMlM7Z6ae2ge6cw50L3skOoWFYeeIC9y8P3v9mgt5RdR4udb9z1tBwpASoJgbgETk/B9gKqdsYSV
	VK4pnXbxvdMSNTO6cUn71PXNpoRTnYc8i4YLr+cVIrh/5pU+s43AcLWltqHThM591Nj1lIMNMZ4x/
	nqSCuncwsMY1vYipTOJlB2tQRLmxfx/SbV2VGNgg556LBXMWC67fjNuNYtWeNz+EPPFCphOY64SQw
	XBYUfDqMSouPodlxhAkaaLjqor53oIMUkEPEWsErlkDqoCBkJIJF8nnf4PiuOnlmWeLN5QUbODPYM
	ey77UZXGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqY91-0000Xo-AC; Wed, 01 Jul 2020 08:31:03 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqY8y-0000X9-Ne
 for linux-amlogic@lists.infradead.org; Wed, 01 Jul 2020 08:31:01 +0000
Received: by mail-ua1-x941.google.com with SMTP id z47so7447592uad.5
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2020 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFmGIYk9cjEYMHaAH0rSKAwaBtnn7Fn+46RCVGWyC1Y=;
 b=ZWY90c0eYVL6HTLk7eurX/kIRALuUSWpFbo76Wko54kFVSHIMX8bkmOc9o1UYRT8Y0
 jiTMJUbwiu43IDbiT/ZQd0kTV565FJIBrgyL2neNKcNtaFaCQYNplknz8Ymf/wBJ5QQV
 bJYwQNgm4HmWFxoER+ssUN8o4FQr4ICJ5IAZHEhCyYybtG4goRWOcVthLd3U7HLaUUYq
 ZOnKL6lY1bviWKZ80zDhhpjq6lxXD+5gqxK/3DcHvNHr5hHluHXxO5izq6fWL+dQ4R+c
 3XU5Gc84yZncuwNmhxEy7Hz6Sjg2VMN7WbdtIWRCwYAj2tZx5fdKjdqGpxzIL00CwNTS
 QQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFmGIYk9cjEYMHaAH0rSKAwaBtnn7Fn+46RCVGWyC1Y=;
 b=QB6IU3HOdEwUtxCoiEff82byKcHDg0j4n8ZybPHAXQwTq6BY25+hEFb6KR9BVw95u/
 Otwr1MXle9WIUScubtFvsLZ9aIQvFMhMu750zH6G5I7YSkGGe3Azh6kVZDtOIpXhMSZ7
 SI9BF6hohFj4UF6CcQW7gz9TNuXdl1f/DblvA4i4QhDUubP7Rywv1AVl6h250ADoyGC3
 Wz9H6szRTLBHw3jtO78lFW+IEMAISt4K/8gGXqYUYv5LBFmmev39bk7hny1lvrLAFO9P
 QqdXTYIIZVSUNz5oYGBq9totvG9ELr+PhORyJn56hleo5H/PsP92msR4xuTzBBoyt7JF
 a1yg==
X-Gm-Message-State: AOAM5308n6dkfQBmGpQ1f0widM0WRJsaVoumu2uFzcXX09GMpWYPu9bx
 kNb8MobhXMq38WkOoNMoSVB1OEDW9wCeDvXYYsCTAg==
X-Google-Smtp-Source: ABdhPJw7lwMrvQwrNfzPBSBN1eNIgscYwWwnQldXfBmD55TAaKnKyfE6ly9t/4XL81mSDkG5rkbfZheMYK0zNjBRkiE=
X-Received: by 2002:ab0:6c4b:: with SMTP id q11mr14538144uas.94.1593592257128; 
 Wed, 01 Jul 2020 01:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpJ_edjh-31dPixzvZU+mzvKfOB_g58eJ29EWak+1Ru-A83zw@mail.gmail.com>
 <cbc065b5-35f8-c6ba-561a-396a80838702@baylibre.com>
In-Reply-To: <cbc065b5-35f8-c6ba-561a-396a80838702@baylibre.com>
From: Jian-Hong Pan <jian-hong@endlessm.com>
Date: Wed, 1 Jul 2020 16:29:53 +0800
Message-ID: <CAPpJ_edWWzgGdWU-b=BAqNtKXn8RfSA00ffhnAxZwD2Jp1CzXA@mail.gmail.com>
Subject: Re: Power-up/reset code for Mali-T820 in Amlogic S912
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_043100_882195_C4EB442E 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: linux-amlogic@lists.infradead.org,
 Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> You can find the code I adapted to panfrost at [1].
>
> I'm not sure it's the right code at all since we are awaiting for a reply from
> Amlogic to help us fixup the power-up.
>
> Is suspect the internal mali-t820 power management HW to be broken, so the
> internal soft reset doesn't work. But Amlogic did other tricks in their kbase
> I was unable to port on panfrost.
>
> [1] https://gitlab.freedesktop.org/tomeu/linux/-/commit/7ddb208352d4a8387e14e0744dbb48ed8ee48d0c

Thanks for quick response!

I just tried to take the only one commit [1] and applied it upon
kernel 5.8-rc2.  However, the issue [2] still persists.

[1] https://gitlab.freedesktop.org/tomeu/linux/-/commit/7ddb208352d4a8387e14e0744dbb48ed8ee48d0c
[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143

Jain-Hong Pan

> On 01/07/2020 09:28, Jian-Hong Pan wrote:
> > Hi Neil,
> >
> > Thanks for your information on IRC #Panfrost for Mali-T820 [1]
> > mentioned in the ticket [2]
> > If I understand correctly, that means there is still no power-up/reset
> > code for Mali-T820 in mainline kernel yet, right?
> > Is there any patch worked in progress for it?  If there is the patch,
> > we are willing to help to test!
> >
> > [1]: https://freenode.irclog.whitequark.org/panfrost/2020-06-29#27374880
> > [2]: https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143
> >
> > Thanks,
> > Jian-Hong Pan
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
