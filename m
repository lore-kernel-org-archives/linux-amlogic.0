Return-Path: <SRS0=tZMI=2X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC59C3276C
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 21:56:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE2C21655
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 21:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vczy6DiC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ly2dIZSj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE2C21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfUXGGQQ6yigFRiOYk34Y5WFlBaVkTrQfdNlEzlE5DQ=; b=Vczy6DiC/E9/mu
	W+0MRf4a+R0JxR6Ho9QjDSwCPwXPtKkyc+HaHyaIQehGNfw50Ixmg4sxJ/4DMBQT1aXX+PSHyHRAQ
	Zq9mYGggXxsFtAjw6uf1VISdjXboaFazShVvsFpV4UylB3nSFOSqs6TZ+04NAIPAD957TY5zuYEJJ
	umC5JYKZhN6GCMYMuLf0YiKY4jWZgSLMwouQ5/6fZgdBVg8IXm3Jok8jTVgU00EHKD13QSmtMssq4
	AMfRQUa7t2knAI4tuFKZmk4ptezYulsUoviFIF2rCGsTkLxklNQGJJ1eWonWRDx3bkRKcsOo1yMaU
	m7Rcspax+QQnCEcq6oYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in8SU-00055x-Lr; Thu, 02 Jan 2020 21:56:46 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in8SR-00054m-9M; Thu, 02 Jan 2020 21:56:44 +0000
Received: by mail-ed1-x543.google.com with SMTP id c26so40234037eds.8;
 Thu, 02 Jan 2020 13:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cde1eNYPYWBeixXF9Crl73naFTdC9XUc+bxs2WxX/lM=;
 b=Ly2dIZSjXAeT8HtYtSJPJ6Dv+s6dXYs9cq+ty9XkFuwhuCPAt0dcGdngKwFOADERqW
 EqUAxLsqsRyfzHyRk9l/QXvHehHwQ/NbJWRtZXKdpg2T0PHdxdEhzJ49HRuaMjbIoxTF
 H0ROzyubSkRLemwerWJUR7m344eUULGXFMTCIIv78nEJjPu9CzT4caheipD6jT3Cc/yz
 vkIqMb6o6D9tkHeC2grYLJLWxu9Y8zLwE55fwtpJRG+H3/8wrlWGlqsstpU5xfd77R7i
 gcxZN0EjVstI7eIDIbWcWuDKp0thvZgqGM8ypCCd95NINQgywbdZNcbGIipuI5HKZg/w
 6pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cde1eNYPYWBeixXF9Crl73naFTdC9XUc+bxs2WxX/lM=;
 b=S3w1DnMJUmjKJ6TQTCSLaUQSqcf2WCSE8gJBNchIg+GJSEF/wVyigWBgQWuDcRf362
 8n1Q0vcVBT6EIADjXaK3D2kFCLzvlssLsxSUj0A3DP/rw4DO+I5gOJDW6jRaI8xhL9ds
 YLR61vn7h16o8Vue89xmAi40bGo64nHUgQDZvwYs/svY4ALJ0HhIR8wRX6vQy1Tp2YL8
 +iVQm7fL/Uw47oGqgQstYuTtUM3OSO1IXzYkxaQBBiBm7swRhUJn7sGCOqpBre/T9uBA
 eOOup+gyJB/k0p8de4A9MEafwvSj8/W+O8TJHdxqb5ksRPQXxsXNhew86XH5QDk0hHFW
 rU8A==
X-Gm-Message-State: APjAAAUVSzw+mxAhH0vjaCzY24mvV7/oUz+dd7fcWpPpDNZpfjWWcRXp
 nr07ivvEV7T+6qC6usTqWK8jp6i+CqzwZkIz3YunBA==
X-Google-Smtp-Source: APXvYqwszQmG5zo+Ugher7yDwGkywdm1jEouad63DKJoLaUyJrV0nf0YqW1DT1mZwUkIrcO6BdfkZhcAVaayLzk9Se8=
X-Received: by 2002:a17:906:1a50:: with SMTP id
 j16mr84941948ejf.106.1578002201411; 
 Thu, 02 Jan 2020 13:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
 <dd38ff5c-6a14-bb6a-4df5-d706f99234e9@arm.com>
 <CAFBinCDs3a8TJcQKgHUkDvssMR6Y2Kys38p50P0q=2KOiDTNHg@mail.gmail.com>
 <fe45f4f8-8c67-ded2-90bf-8d5fd6874876@arm.com>
 <CAFBinCByzLLdVTL0v=eC-TbZQnwnDY7cBLf4jyWq7N4PA1rr+A@mail.gmail.com>
 <ff2bdd26-3c34-63db-beb5-8f7c9fc7e790@arm.com>
 <CAFBinCAgzHJQpcf1WVQPkNXOq1ziXp7nx=ZAU9_2-VzA9hg-Yw@mail.gmail.com>
 <629205c8-68c5-5895-d926-75984110dd49@arm.com>
In-Reply-To: <629205c8-68c5-5895-d926-75984110dd49@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 2 Jan 2020 22:56:30 +0100
Message-ID: <CAFBinCATAwR3RvA3dBkJ4B97tecBTE58=A-OeTKvWhwhodZemA@mail.gmail.com>
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_135643_334710_6F269C02 
X-CRM114-Status: GOOD (  31.18  )
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

On Wed, Jan 1, 2020 at 1:55 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2019-12-31 4:47 pm, Martin Blumenstingl wrote:
> > Hi Robin,
> >
> > On Tue, Dec 31, 2019 at 5:40 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> On 2019-12-31 2:17 pm, Martin Blumenstingl wrote:
> >>> Hi Robin,
> >>>
> >>> On Mon, Dec 30, 2019 at 1:47 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>>>
> >>>> On 2019-12-29 11:19 pm, Martin Blumenstingl wrote:
> >>>>> Hi Robin,
> >>>>>
> >>>>> On Sun, Dec 29, 2019 at 11:58 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>>>>>
> >>>>>> Hi Martin,
> >>>>>>
> >>>>>> On 2019-12-27 5:37 pm, Martin Blumenstingl wrote:
> >>>>>>> Most platforms with a Mali-400 or Mali-450 GPU also have support for
> >>>>>>> changing the GPU clock frequency. Add devfreq support so the GPU clock
> >>>>>>> rate is updated based on the actual GPU usage when the
> >>>>>>> "operating-points-v2" property is present in the board.dts.
> >>>>>>>
> >>>>>>> The actual devfreq code is taken from panfrost_devfreq.c and modified so
> >>>>>>> it matches what the lima hardware needs:
> >>>>>>> - a call to dev_pm_opp_set_clkname() during initialization because there
> >>>>>>>       are two clocks on Mali-4x0 IPs. "core" is the one that actually clocks
> >>>>>>>       the GPU so we need to control it using devfreq.
> >>>>>>> - locking when reading or writing the devfreq statistics because (unlike
> >>>>>>>       than panfrost) we have multiple PP and GP IRQs which may finish jobs
> >>>>>>>       concurrently.
> >>>>>>
> >>>>>> I gave this a quick try on my RK3328, and the clock scaling indeed kicks
> >>>>>> in nicely on the glmark2 scenes that struggle, however something appears
> >>>>>> to be missing in terms of regulator association, as the appropriate OPP
> >>>>>> voltages aren't reflected in the GPU supply (fortunately the initial
> >>>>>> voltage seems close enough to that of the highest OPP not to cause major
> >>>>>> problems, on my box at least). With panfrost on RK3399 I do see the
> >>>>>> supply voltage scaling accordingly, but I don't know my way around
> >>>>>> devfreq well enough to know what matters in the difference :/
> >>>>> first of all: thank you for trying this out! :-)
> >>>>>
> >>>>> does your kernel include commit 221bc77914cbcc ("drm/panfrost: Use
> >>>>> generic code for devfreq") for your panfrost test?
> >>>>> if I understand the devfreq API correct then I suspect with that
> >>>>> commit panfrost also won't change the voltage anymore.
> >>>>
> >>>> Oh, you're quite right - I was already considering that change as
> >>>> ancient history, but indeed it's only in 5.5-rc, while that board is
> >>>> still on 5.4.y release kernels. No wonder I couldn't make sense of how
> >>>> the (current) code could possibly be working :)
> >>>>
> >>>> I'll try the latest -rc kernel tomorrow to confirm (now that PCIe is
> >>>> hopefully fixed), but I'm already fairly confident you've called it
> >>>> correctly.
> >>> I just tested it with the lima driver (by undervolting the GPU by
> >>> 0.05V) and it seems that dev_pm_opp_set_regulators is really needed.
> >>> I'll fix this in the next version of this patch and also submit a fix
> >>> for panfrost (I won't be able to test that though, so help is
> >>> appreciated in terms of testing :))
> >>
> >> Yeah, I started hacking something up for panfrost yesterday, but at the
> >> point of realising the core OPP code wants refactoring to actually
> >> handle optional regulators without spewing errors, decided that was
> >> crossing the line into "work" and thus could wait until next week :D
> > I'm not sure what you mean, dev_pm_opp_set_regulators uses
> > regulator_get_optional.
> > doesn't that mean that it is optional already?
>
> Indeed it does call regulator_get_optional(), but it then goes on to
> treat the absence of a supposedly-optional regulator as a hard failure.
> It doesn't seem very useful having a nice abstracted interface if users
> still end up have to dance around and duplicate half the parsing in
> order to work out whether it's worth calling or not - far better IMO if
> it could just successfully set/put zero regulators in the cases where
> the OPPs are behind a firmware/mailbox DVFS interface rather than
> explicit in-kernel clock/regulator control.
thank you for the explanation
I'll experience this case on newer Amlogic SoCs where regulators are
hidden behind SCPI firmware. so far I have only tested the case
without OPP-table on those SoCs.

> That said, given that I think the current lima/panfrost users should all
> be relatively simple with either 0 or 1 regulator, you could probably
> just special-case -ENODEV and accept a spurious error message sometimes
> for the sake of an immediate fix, then we can make general improvements
> to the interface separately afterwards.
OK, I'll be working on this next week again
if you get to fix panfrost earlier then please Cc me so we don't duplicate work


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
