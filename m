Return-Path: <SRS0=/omC=2T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42147C2D0C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Dec 2019 23:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150A420748
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Dec 2019 23:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AN3Tpun7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qEqcxGvr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150A420748
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iL23XBlqjCwCiFQHq4+O00GNhkPZyE3gU2FQaYm/Wgs=; b=AN3Tpun7Exmq7m
	kfAGcPQA+4jftLUfV8yPZvfZCO1La3fDPX8lAk/czTcHScdMU+vRwJUrG09foUmz4kzla2KeyYhnS
	qeo+OwPxgnqP5Gqw1sZ672FEXwxdh/LXm/X2qHWDjQZ20AEuEfHLW2HC1kV2Roy9sX0yFpFqqbZ2z
	6s+qbiqLjQjM2/EUmvWMeoKbRE/H5HgBUcH+XgIEMiMBQ4VsMxVvOEywjtJ4eZeDlP9Enfw4j96dA
	CM2ufG1ppZ1d5ZEAQtsSJgl7kagVvnw+lwSb8gP5UD2ShlFVFyOkkLddZ4MWY+pDDMWGGw2PZUc+a
	/bn4mnll15XW62IPzQWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilhqM-0005Ew-8H; Sun, 29 Dec 2019 23:19:30 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilhqI-0005Dn-EI; Sun, 29 Dec 2019 23:19:27 +0000
Received: by mail-ed1-x544.google.com with SMTP id f8so31284915edv.2;
 Sun, 29 Dec 2019 15:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XxSZstiEaMg+m65lDkW2E8KdL5f2Kpio4F4xfu4/sKE=;
 b=qEqcxGvrL6Xx0mQ/8Z3GHtEKOGcTeVvqVgOM2yp8DAnAgG0eVY8UHkYkhMS07BxKzY
 WqQXGPhS2yeWl3144e7q6YMX/2OJQ9VDtqy2K16OhSEm8Cx0elYHZlEEeJL060DazFvT
 vskiCsMN0M1sPeQSpUPBZNb/LILTYVqOKdfmj/3wCIXX6bcsFHh7fQicz3v4/CUVoAeM
 QjiDh5N+scPktd1DVSvLqHyyYn2nNMr9YZRXPnbQ+9JFpbj3LVgXrGntEW0846Qb28ex
 NU1dwyNKr4E/RoF919Qr3QM6N0DQvEA3nByGuaBvSldBPXa+StlqqGTxCTXW8mwpfLwO
 ec3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxSZstiEaMg+m65lDkW2E8KdL5f2Kpio4F4xfu4/sKE=;
 b=H6XtyeJep5LsRNgpz+z29z9s6TCSGXGnFubsCHST0UQMvJalV+8U7azuRz7zVj/KZ2
 BLog9imkpVOYZApfv0R89OiZ6g5UCA2FxDuoOjBbaUMvTqnYakEdFWWzHczTdwMkiSAc
 kGMset8ll3kO2czvma8FJRORZ9C7w9EEn6CtyKBCvZRlOVfWOBagTT38jHLe4EGf7OQv
 0RQhAEOukgp/6mvcfAd01IEm+AE2spw82yEVNCYhJFHGs4VwvpP6PaMzW/+bRdYInE5w
 0feal/opffTtndUhdIEefdsQj4m/agcpRA1PF/QaMx8g2ChSAUXy0sE2+Yaz253heif+
 Pjeg==
X-Gm-Message-State: APjAAAUB0G9xDNV51p03kMOoEIU8INhbGNiozXun9a8BuzHhj9eHmFgI
 SZVP4s0RfpkPyUVLarOZ9dKdXrsU2amTHLflMc0=
X-Google-Smtp-Source: APXvYqx5hpszRc1esYWuJMYLxjiI1twZUv4Oyfi4w8d8PUEWWIYhTywMgOhwl9CLM8r56NOREovBKjh3zWBx5AgNoQ4=
X-Received: by 2002:a17:906:cc8b:: with SMTP id
 oq11mr67972062ejb.193.1577661561171; 
 Sun, 29 Dec 2019 15:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
 <dd38ff5c-6a14-bb6a-4df5-d706f99234e9@arm.com>
In-Reply-To: <dd38ff5c-6a14-bb6a-4df5-d706f99234e9@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Dec 2019 00:19:10 +0100
Message-ID: <CAFBinCDs3a8TJcQKgHUkDvssMR6Y2Kys38p50P0q=2KOiDTNHg@mail.gmail.com>
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_151926_509001_5D34BCD6 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 yuq825@gmail.com, daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 alyssa.rosenzweig@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Robin,

On Sun, Dec 29, 2019 at 11:58 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Hi Martin,
>
> On 2019-12-27 5:37 pm, Martin Blumenstingl wrote:
> > Most platforms with a Mali-400 or Mali-450 GPU also have support for
> > changing the GPU clock frequency. Add devfreq support so the GPU clock
> > rate is updated based on the actual GPU usage when the
> > "operating-points-v2" property is present in the board.dts.
> >
> > The actual devfreq code is taken from panfrost_devfreq.c and modified so
> > it matches what the lima hardware needs:
> > - a call to dev_pm_opp_set_clkname() during initialization because there
> >    are two clocks on Mali-4x0 IPs. "core" is the one that actually clocks
> >    the GPU so we need to control it using devfreq.
> > - locking when reading or writing the devfreq statistics because (unlike
> >    than panfrost) we have multiple PP and GP IRQs which may finish jobs
> >    concurrently.
>
> I gave this a quick try on my RK3328, and the clock scaling indeed kicks
> in nicely on the glmark2 scenes that struggle, however something appears
> to be missing in terms of regulator association, as the appropriate OPP
> voltages aren't reflected in the GPU supply (fortunately the initial
> voltage seems close enough to that of the highest OPP not to cause major
> problems, on my box at least). With panfrost on RK3399 I do see the
> supply voltage scaling accordingly, but I don't know my way around
> devfreq well enough to know what matters in the difference :/
first of all: thank you for trying this out! :-)

does your kernel include commit 221bc77914cbcc ("drm/panfrost: Use
generic code for devfreq") for your panfrost test?
if I understand the devfreq API correct then I suspect with that
commit panfrost also won't change the voltage anymore.

this is probably due to a missing call to dev_pm_opp_set_regulators()
which is supposed to attach the regulator to the devfreq instance.
I didn't notice this yet because on Amlogic SoCs the voltage is the
same for all OPPs.

I'll debug this in the next days and send an updated patch (and drop
the RFC prefix if there are no more comments).


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
