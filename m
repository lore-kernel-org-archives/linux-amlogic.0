Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD81C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAxdPWLIJn033pwuCiG1fvwDiSXrzw6zcNez5+ATggc=; b=rkHC6yRQY4Ji0H
	xOys6llyv5o8P/X8F3RVJGHh0+XlUyoTlOXjaC8203XsmBXwh30JWy9nYsgmHPiWYKCDeMCjV0bSu
	7hvQ4b3JYvJ/vpcNRxtnBTbGHk35BfVJsTl7xAEhVQ78oQ3YpFhiv9c6IC0DjTTN4n1IwGEx9xJLa
	AUxeE+bkxHdqzcCgCNVZ1LEhiD04ec5hdc5qtOHd7JtLqkprX0WZznjdVEpdIhWmWJbRHx8Z1VoMv
	0iPmJufrUV/V2IcAH7cPN6tiEY1/85VvBii/WEd6CoL1a+g148dUYZdtD1cdUCBgK0TUxtQqDOt9e
	+wLnWU38BrfeYddWkY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nciuh-00FUBf-Hn; Fri, 08 Apr 2022 07:20:11 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nciuD-00FTwq-Ao; Fri, 08 Apr 2022 07:19:42 +0000
Received: by mail-vs1-f41.google.com with SMTP id c1so363671vsv.8;
 Fri, 08 Apr 2022 00:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=DMeNt3olG0Wp2du+dxBX3Q71fHxom9k/adJcwm0QXDo=;
 b=5CPNJdGOTMSG9YhFdUtA4iMZ6R6lfLiW6Bk0yzwJtV77XT3PJxxIhlJWAtxFqMDB9B
 1VApGV4rFQF/Tq6k9KilAHU9L7rCRwQYeO/wyNOiseeCOdItotlx4K4FjesCnxtKWnsQ
 RJJ0UaeE+pCbijCZWsepbOB+QVDr39NnYGJRFb0eeYGYcylE7mSHmHuER6MLffXqb/0o
 kz2KoRtDHAqoA5mMUYMBiy5vF/pI2iZyU96liwm7L9KcWxsXaPbONmpyoJoqMtrsqQPF
 7GBBseSVy1RIIQ36EUSXJbSetQ4I/q0k0aeYjab7v20+zjbz67N22OvwZBfo8M8jfKsc
 jSUA==
X-Gm-Message-State: AOAM531Surlj/95iHKZRKCCTH4PxB4WbjgjaJ1ePNstKKYsnBZEHbsh5
 fzMh3yAeyQNEqwscjPB1E3XPSH2Kllz+uw==
X-Google-Smtp-Source: ABdhPJx7gemsCieRRx1fsOrh99O9iMR9g101nEuCZea33mdd4RzEH5Y9K6fOmu9IwBCRv3FiRSRqVg==
X-Received: by 2002:a05:6102:38ca:b0:325:a464:4f13 with SMTP id
 k10-20020a05610238ca00b00325a4644f13mr6137150vst.39.1649402379810; 
 Fri, 08 Apr 2022 00:19:39 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51]) by smtp.gmail.com with ESMTPSA id
 o27-20020a1f5a1b000000b003437b48e0edsm3307641vkb.9.2022.04.08.00.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 00:19:39 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id i26so4282568uap.6;
 Fri, 08 Apr 2022 00:19:39 -0700 (PDT)
X-Received: by 2002:ab0:21d5:0:b0:35d:1f9:3481 with SMTP id
 u21-20020ab021d5000000b0035d01f93481mr3129410uan.48.1649402379387; Fri, 08
 Apr 2022 00:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1Y5pO_AGaFSXfo-J3EdGQeM2XYXzvsUtjtAFEXdwKEdQ@mail.gmail.com>
 <a27da359-3922-e4ee-16d2-b4cb6fc06ca8@baylibre.com>
In-Reply-To: <a27da359-3922-e4ee-16d2-b4cb6fc06ca8@baylibre.com>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 8 Apr 2022 08:19:28 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2F_b+1Q_qAi6ZLkT=EoW+JjoT-cyONSnoehd5mkfUdsg@mail.gmail.com>
Message-ID: <CAJX_Q+2F_b+1Q_qAi6ZLkT=EoW+JjoT-cyONSnoehd5mkfUdsg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_001941_398593_90051A0C 
X-CRM114-Status: GOOD (  23.37  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 5, 2022 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 28/03/2022 23:51, Lucas Tanure wrote:
> >
> >
> > On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com <mailto:khilman@baylibre.com>> wrote:
> >
> >     Hi Lucas,
> >
> >     Lucas Tanure <tanure@linux.com <mailto:tanure@linux.com>> writes:
> >
> >      > The default duty cycle of 33% is less than the required
> >      > by the I2C specs for the LOW period of the SCL clock.
> >      >
> >      > So, for 100Khz or less, use 50%H/50%L duty cycle, and
> >      > for the clock above 100Khz, use 40%H/60%L duty cycle.
> >      > That ensures the low period of SCL is always more than
> >      > the minimum required by the specs at any given frequency.
> >
> >     Thanks for the fixes!
> >
> >     This is going to affect all SoCs, so ould you please summarize how your
> >     changes were tested, and on which SoCs & boards?
> >
> >     Thanks,
> >
> >     Kevin
> >
> >
> > Hi,
> >
> > I only tested against vim3 board, measured the bus with an saleae logic pro 16.
> > The measurements were with 100k, 400k and a few in between frequencies.
> >
> > Is that enough?
>
> I did a few measures on the Libre Computer Le Potato S905X board:
>
> i2c_AO:
>
> Before the patchset, I got:
> - 100KHz: 1.66uS HIGH, 6.75uS LOW, 20%/80%, Freq 118KHz /!\
> - 400KHz: Unable to decode, clock line is invalid, Data line is also invalid
>
> With the patchset
> - 100KHz: 4.25uS HIGH, 6.58uS LOW, 40%/60%, Freq 92KHz
> - 400KHz: 0.33uS HIGH, 3.00uS LOW, 10%/90%, Freq 300KHz
>
> i2c_B:
>
> Before the patchset, I got:
> - 100KHz: 2.25uS HIGH, 5.41uS LOW, 29%/71%, Freq 130KHz /!\
> - 400KHz: 0.42uS HIGH, 1.66uS LOW, 20%/80%, Freq 480KHz /!\
>
> With the patchset
> - 100KHz: 4.75uS HIGH, 5.42uS LOW, 46%/54%, Freq 98KHz
> - 400KHz: 0.66uS HIGH, 2.00uS LOW, 24%/75%, Freq 375KHz
>
>
> So this fixes the frequency, before they were invalid.
> And it fixes 400KHz on i2c_AO...
>
> I do not understand why behavior is different between i2c_AO & i2c_B, they
> are feed with the same clock so it should be the same.
>
> Did you check on both i2c interfaces ? can you share your results ?

I only checked I2C interfaces i2c3 and i2c_ao.
I will submit a new patch chain with more results.

>
> Neil
>
> >
> > Thanks
> > Lucas
> >
> >
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
