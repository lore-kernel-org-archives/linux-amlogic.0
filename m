Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439DEC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 20:21:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1D26109F
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 20:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA1D26109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AUG300eDxtDWXlDXhw4N9tEx2Dt6eMdHKaD3a5NHOWQ=; b=MnAaiRVTvIkjwy68g7dHFOpMr
	H9sWkG86XAcOL6jzsjqvthrCjOCr2WkGkVG7WRVfZm9J/2h42I6VMiaGFVq2yDcsIrt7mH1Q3Yheo
	h0Ur/cW0SWct4aqP+PTDeOMKuoVMG+D8yBxSdeB/agazzn/4orv8VRldECmD5d1hGi5FfQTGbT1yT
	aq6n11OtPAwqps04dqEjQ/wK8lH2/MOaIGZZjEYJTdRSIXDFZgStBB2hZiD/d2uED6OHAQEJDASIv
	CkMd3x1d/MfBDZBuAnhh2o8oYDS0G7BAgiITGquhfNiyxKjcEMLrJGoMHVyfsFLBmqmOxETGRZpJR
	kQvk+YAlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj6DN-001oNr-1g; Tue, 18 May 2021 20:21:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj6DI-001oNF-DF; Tue, 18 May 2021 20:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DVNv5/TDmW8eM40E1W+6CajDOqer3LA7KeZK68HD9Zs=; b=YZjWJJORLesmN+WgO7fYM+/9ac
 8qGJleLATgONPLrz26PbDjnqdR7Rn2UlYiKEsxwWABZiRFK6O5kA6jTv0vx2nP/ErKnpQoGrsYnF5
 zIy5lQI8h8njrPczsxj4JNkZLg4ToHLV6vgG0/S8kTwSOsqvj/Xl3qeNUqU27oUhKxKUNq/pCp3qv
 zuqhvkm2zzKzTjGpbiINwIXHO1B3bNb2Wi743E/BKBw0UdpbWgG+ucWR5vkz5pQ+1KQ5aroUwyRXi
 BgyVsALwkT92ocRBxmycvrCYfVqM4O3hLLGFriqv5h93mxqrogUBQKLXduLncs8k/f+cKheM6WVQx
 4okqbzWA==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj6DF-00EwWc-MQ; Tue, 18 May 2021 20:21:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id l1so16565004ejb.6;
 Tue, 18 May 2021 13:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVNv5/TDmW8eM40E1W+6CajDOqer3LA7KeZK68HD9Zs=;
 b=JwZWuXuCe98MYT7W12V96e3b9dep79J9PWj4LM1kbhWhl2+dQdFvEBqO7vVCgH/zmd
 bbBdLLKAFhxgtHYT0wU+RUdWvDlnARir3FUtsdIVLStHZFtDq7nCJVWfSfB86APhvu1O
 ONx6f1F1ToiX5fNUpJhuI8CwPzYd0OXMuvEOwxDGBBA+t22b+bprk8Es+Eub55S1f5lE
 dok3qBiZS8sDbmSgswdCGxq6L+rJKZC5pjI1+brMAbg8nToe+TQYOn4RdEJ/kD561E4K
 n2qZj++K1Z7WclksBofNU5+jcFYzzIqO6rhBFSZWtv3rypEDac6vbBw+X4QelFjWBZ5Q
 XMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVNv5/TDmW8eM40E1W+6CajDOqer3LA7KeZK68HD9Zs=;
 b=KFDnc89g5kOht50Zmc5eAWPTHuvMf3k3E+3hStlG59QcKOJ46fk54fWeQ0Oq5g4G9q
 5qQZre+I2UjE1xJQKKMzXubjS8c6FeNE/d6t+52u8T0DpPMxDpIkAiGEGY0W67CnV3dm
 fhlHB6JlRVruFu/ZvlvmYJmFQKv9TkGC9KXoQHfk47Ue/ckzMFCs8zm0PItKdgmNYGWL
 Lvr0ifXrQ9erCvlK5Go1mJ5z71pHYwibC374g8vqKI8oj1rw3N0U7NA0yF6Y9ZEQU7gi
 J5HfkSVMwP/c9HH9i4LDr0sancJ7YWGAjlRCHBC8BjwjvLE5GENY7k/awvrAYOpjTBCX
 01eg==
X-Gm-Message-State: AOAM533Emgd6Fo2I00E23R7k3eh/3QCKZr3ds1NrAYHVfiUX29o2sDaR
 shW1Xj5c4zBKCoZ8wP9g1Gu1EovE3l74hX9xP+38ktfg
X-Google-Smtp-Source: ABdhPJy2AsTEVS+ozAIFEFGVHQL0XNARwMZwotEQDopeDSzuLKKsBAyTLvSfx6+POAaeZiVm0mr8VeVo42xbAy/nVAw=
X-Received: by 2002:a17:906:fcb4:: with SMTP id
 qw20mr7996726ejb.216.1621369268217; 
 Tue, 18 May 2021 13:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <1jwnrw1ohh.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jwnrw1ohh.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 May 2021 22:20:57 +0200
Message-ID: <CAFBinCCnEXNLL0rvi1XNYKb0xY1+3KMwB=xz24kPgN2H97yzOg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/3] clk: meson: rounding for fast clocks on 32-bit
 SoCs
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_132109_771332_D7EE5245 
X-CRM114-Status: GOOD (  21.21  )
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

Hi Jerome,

On Tue, May 18, 2021 at 9:37 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
> > fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
> > up to approx. 3GHz.
> > This however causes a problem, because these rates require BIT(31) to
> > be usable. Unfortunately this is not the case with clk_ops.round_rate
> > on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
> >
> > clk_ops.determine_rate does not suffer from this limitation. It uses
> > an int to signal any errors and can then take all availble 32 bits for
> > the clock rate.
> >
> > I am sending this as RFC to start a discussion whether:
> > - this is a good way to solve it?
>
> .determine_rate() was meant to replace .round_rate() so I guess it is
> good to do it :)
ah, now things make more sense.
thanks for the background info

> > - what are the alternatives?
>
> I don't see any ATM. Even with determine_rate(), 4.29GHz limitation
> seems a bit low nowadays. In AML SoC, most PLLs should be able to reach
> 6GHz ... hopefully we won't need that on the 32bits variant ;)
according to the public datasheet the maximum PLL frequency is at around 3GHz
so I also hope that we're safe with this


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
