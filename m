Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B16C433E3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 08:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A97207BC
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 08:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="toUZzKdQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YSDDfgFE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A97207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I8yeJovedsheS5mAO3GWpjjSmZKki/XslZ3jPtJ1RYk=; b=toUZzKdQXFPIIj5hE7eU79wTp
	2/jPFMEAxdHpAQKZLk0XAubBRxQdggYdr2CKMBbNZHCdds4MDRcFmwTaELDZ3Mn81PwVli6i/cAjZ
	c7My8BK0B/oEH4vPtowiAKC1ZFqeN61lKnltp46V7LicCNqMdiNX8OyscC0kezSLGefuKP6GBKBsz
	1hGUj7xfoLX3VL1qnjBVYe1K9ZUxi+vU9M1kjhmJtNS6He5QZ1jU86tjAFpKinAXwpazgjhHa1bhD
	6f6ksUKURNVcwoPXddzgeBLa/j3imeLRNr5EUVPbgNMVo1njCkpn0+EFob9lAxO0BxUFeGmKDsEJ7
	YuvbAFthg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAqt1-0006Qo-D1; Wed, 26 Aug 2020 08:34:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAqsv-0006P8-7b
 for linux-amlogic@lists.infradead.org; Wed, 26 Aug 2020 08:34:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id s13so894697wmh.4
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Aug 2020 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=gQpijk3JcIMZZ0cFZ4tG+wZUcQxMP1zZpT7hvYh+Sak=;
 b=YSDDfgFEBukj/TI7ekhG44Whd1alTg+ThJwW6EDjs07aZYw3k3ITs5ljNur4WhVmY5
 qCNojzfRTYpcSz0gReBmDB4eZK+QGpSNMpYyRdtpbZqAQmLCt//NgO/ObmvcDiEwdBz4
 CpJU5wjla9RW+9en+UuPmKyYQ1do9q0134nG98atsWSmgPIBYdJuzabIGEndHHy0wbfG
 DUkjm0BaPG4BHfP5CMDDureElu7SLQzR8HJSCwShnNuFwTh+jdXRC16HSxBefaxJTB6a
 WAgTxkqDMZLoINS/l/DqnXGPt9LxN63L2B19PrxVayYCIVVqeRXF6cTr1Th7ODUz2bTH
 4wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=gQpijk3JcIMZZ0cFZ4tG+wZUcQxMP1zZpT7hvYh+Sak=;
 b=hh8jvT1LlqExZKuXay3EOiLWNDzSXPyUwX69KYS07doLHyDAcpCQccb/fIhYP946Dc
 KruuLEVXj3cMeSCIJWodYNzgXb+O/LU3nviDO9hkWFGB6GQ+4m6WHCNZSamRP90Fg8Dl
 s1CMC9fjewnSfBui7+wK60FOwkElz+t35beambjlPHf1fj1vbH6PJX6lxsdF7F+dA+9R
 XdEN/HPVDFa/2Qraua+G7HqAEZBhlBQ6YxlmTERIUavMnliW9sVTlv+94zYx8//44JyI
 wxsWpdpoDQ7UdDebhf67qYsV3eTm19Y+5icTcOzb8fJTNuK6V3fwBO5aw5mpsh2Jsl0Y
 +U3Q==
X-Gm-Message-State: AOAM532cTPSNdg5I+UAjL9lubpUK1nIBC7yLtkjY2e6DK8b89tgCXPFq
 9C4xlnxEz4OKbwksswRs3sz/mQ==
X-Google-Smtp-Source: ABdhPJyoOlUfSpEUc6JgLbt5iFJZnV4BST1h16BqGANFU/nrmJKgcGP6ek4QCyqjzjo6vnXM0SX5qw==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr5858275wmk.148.1598430860181; 
 Wed, 26 Aug 2020 01:34:20 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j11sm3691332wrq.69.2020.08.26.01.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:34:19 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
 <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
 <1j5z964xis.fsf@starbuckisacylon.baylibre.com>
 <79a2e84548697be86be3d8fde4a1975ab37d0c00.camel@pengutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Dan Robertson <dan@dlrobertson.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <79a2e84548697be86be3d8fde4a1975ab37d0c00.camel@pengutronix.de>
Date: Wed, 26 Aug 2020 10:34:18 +0200
Message-ID: <1jv9h53iwl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_043421_476348_317D91DC 
X-CRM114-Status: GOOD (  37.00  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 aouledameur@baylibre.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 26 Aug 2020 at 10:14, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Tue, 2020-08-25 at 16:20 +0200, Jerome Brunet wrote:
>> On Tue 25 Aug 2020 at 12:20, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>> 
>> > On Mon, 2020-08-24 at 16:26 +0200, Jerome Brunet wrote:
>> > [...]
>> > > In practice, I think your proposition would work since the drivers
>> > > sharing this USB reset line are likely to be probed/suspended/resumed at
>> > > the same time but ...
>> > > 
>> > > If we imagine a situation where 2 device share a reset line, 1 go in
>> > > suspend, the other does not - if the first device as control of the
>> > > reset, it could trigger it and break the 2nd device. Same goes for
>> > > probe/remove()
>> > > 
>> > > I agree it could be seen as unlikely but leaving such race condition
>> > > open looks dangerous to me.
>> > 
>> > You are right, this is not good enough.
>> > 
>> > > > Is this something that would be feasible for your combination of
>> > > > drivers? Otherwise it is be unclear to me under which condition a driver
>> > > > should be allowed to call the proposed reset_control_clear().
>> > > 
>> > > I was thinking of reset_control_clear() as the counter part of
>> > > reset_control_reset().
>> > 
>> > I'm not particularly fond of reset_control_clear as a name, because it
>> > is very close to "clearing a reset bit" which usually would deassert a
>> > reset line (or the inverse).
>> 
>> It was merely a suggestion :) any other name you prefer is fine by me
>
> Naming is hard. All metaphors I can think of are either a obscure or
> clash with other current usage. My instinct would be to call this
> "resetting the (reset) control", but _reset() is already taken, with the
> opposite meaning. How about _rewind() or _rearm()? Not sure if those are
> good metaphors either, but at least there is no obvious but incorrect
> interpretation. I kind of wish reset_control_reset() would be called
> reset_control_trigger() instead.

We'll pick something for the v1 ... maybe the inspiration will come
later on and we'll make a v2 ;)

>
>> > > When a reset_control_reset() has been called once, "triggered_count" is
>> > > incremented which signals that the ressource under the reset is
>> > > "in_use" and the reset should not be done again.
>> > 
>> > "triggered_count" would then have to be renamed to something like
>> > "trigger_requested_count", or "use_count". I wonder it might be possible
>> > to merge this with "deassert_count" as they'd share the same semantics
>> > (while the count is > 0, the reset line must stay deasserted).
>> 
>> Sure. Could investigate this as a 2nd step ?
>
> Yes.
>
>> I'd like to bring a solution for our meson-usb use case quickly - even
>> with the revert suggested, we are having an ugly warning around suspend
>
> I understand. Let's still do this carefully :)

will do

>
>> > > reset_control_clear()
>> > > would be the way to state that the ressource is no longer used and, that
>> > > from the caller perspective, the reset can fired again if necessary.
>> > > 
>> > > If we take the probe / suspend / resume example:
>> > > * 1st device using the shared will actually trigger it (as it is now)
>> > > * following device just increase triggered_count
>> > > 
>> > > If all devices go to suspend (calling reset_control_clear()) then
>> > > triggered_count will reach zero, allowing the first device resuming to
>> > > trigger the reset again ... this is important since it might not be the
>> > > one which would have got the exclusive control
>> > > 
>> > > If any device don't go to suspend, meaning the ressource under reset
>> > > keep on being used, no reset will performed. With exlusive control,
>> > > there is a risk that the resuming device resets something already in use.
>> > > 
>> > > Regarding the condition, on shared resets, call reset_control_reset()
>> > > should be balanced reset_control_clear() - no clear before reset.
>> > 
>> > Martin, is this something that would be useful for the current users of
>> > the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
>> > meson8b-usb2 with reset-meson)?
>> 
>> I'm not Martin but these devices are the origin of the request/suggestion.
>
> So these two phy drivers are used together with dwc3-meson-g12a?

Yes, reset is shared by the different usb devices of the SoCs

> Will you change them to use the new API as well?

That's the plan, yes.

>
> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
