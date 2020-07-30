Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BFCC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 13:55:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F78B20656
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 13:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3eYrXfd4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eZ4bllHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F78B20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0wUqWclJOa9q3yKmt1Utc7ZQI69SqaNJ0MLEvrm8FoI=; b=3eYrXfd4NfOFTvPaP5dvkEe37
	l8E6CCAGgkXDgrFAJ+qS6L0b18BKhxdmLGXFrD0ymu5nW10YWFzfbJVKXXtYT1AlV62670QCakdIi
	YgDcGPmrSq+05aANZnS67ABvtsyYXoq8wI+JD5s3vpM9Frbwdw5UNkDPN8uTeFNE5wLGKsGX+zFTe
	j+SXM8MRDQ0RJr54bPplTNTwmofm7+yySY4Cch7ywl7hWRH5VhzMul33zxxv1XezuqEFRkcvsjGRz
	33VybqWbU/ATOVD7PnXUwiO1ExYp5+HL/1W8rszy4zIHq99X3rorPbykWCbGOzPuJBfZGhWZ6cXQk
	3/U3/66sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k191m-0008ID-Io; Thu, 30 Jul 2020 13:55:22 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k191h-0008Gl-9m
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 13:55:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id z18so21437664wrm.12
 for <linux-amlogic@lists.infradead.org>; Thu, 30 Jul 2020 06:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Yhp/1dp/W+9XlLvqN4/caKDc0k5LmNf4y6EcBCNmqto=;
 b=eZ4bllHmDTz159zzmoDusNthWOwW5rTOsT0hvj+j6VaK1s3NBXPfCUPFu0ffCe3j9y
 g5P6IuSaVL2nlGDtEdcM5ktLFGiA1BViV3RuTN1GSF+g0IDx6V3koc6W51jTXygYiLiE
 VObOh5FR5EbEINZQ4vzlqYU4RMnCVplo/oR+MVo7Gl81/FbzZpbGuJ5lkY5dFUOSqdQo
 qvgqgCEEAU9L8poiMNiFjmUdwPSGlSwqOhUrHHjqJcafjx2/3li5vszQfIEWsL4T10Hl
 Zxm8pUxUK9Z/OvgqlzjTuPzd3I1a19e0N1Uusz8bk15LNd2K/VrJni8nQ2wwaeAMQJ+J
 LXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Yhp/1dp/W+9XlLvqN4/caKDc0k5LmNf4y6EcBCNmqto=;
 b=P/Ms2DCKKcYJtzrOu21zoEz4fMItqidzw8ZqiIERc2dPasDMGZ0Ed57Qz29AAO1Lw7
 EFCMGtkgfRMkgRigTNUiYny5ld3ljjFvEClIDCAk4SLvGzcVyjxzz2jRbdv6YnosXK2e
 Vg9liRJcPR/gztiHqpZXkB6K1zoYzMlgw+nUaFB9P6zuEAFAoeqQfSVEHS2aKrEv7sOC
 X6wBSoJeyXu0yVKoe+UGFqo5xMFF72bVlMLS0ExLLGw+IjDWqKBKyccsZozxmUy1Iu/m
 Czgn+MM+tXyELTpe1IQM7vkUGmg/hYyQDq2ARh82sLPyHTN3Cblj/Smspzvu74vkxnfO
 N8Fg==
X-Gm-Message-State: AOAM530raLN/23oaThPq6XERljdLCOTGCTadRTg2tDKv9HkpGhMUuNjd
 w0mqO9ahNPtYsZ642p6rdNEAew==
X-Google-Smtp-Source: ABdhPJwXI0dK+4LbZcWu/4DqwqVMOQ829RGnEM7cmL2FieWvgVjkEsEQva7bPhn5EA3sTLIEfDoBEw==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr36772698wrq.357.1596117316198; 
 Thu, 30 Jul 2020 06:55:16 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o30sm9973036wra.67.2020.07.30.06.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 06:55:15 -0700 (PDT)
References: <20200730100209.793-1-linux.amoon@gmail.com>
 <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
 <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
In-reply-to: <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
Date: Thu, 30 Jul 2020 15:55:14 +0200
Message-ID: <1jbljx85vh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_095517_495659_196FD4CE 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 30 Jul 2020 at 15:46, Anand Moon <linux.amoon@gmail.com> wrote:

> Hi Jerome
>
> On Thu, 30 Jul 2020 at 17:44, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> > On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
>> >
>> >> These patch fix the Ethernet issue on Odroid C2 & Odroid N2
>> >> Some time Ethernet interface come up but no DHCP request
>> >> is forwaded to the Router, this happens quite offern on
>> >> my side. Adding Reset controller to ethernet node FIx the
>> >> inilization issue.
>> >>
>> >
>> > I'm seeing this on other device as well. Strange that it pops up only
>> > now. Change tested on S905x, seems to help.
>>
>> Strike that one - still seeing random DHCP issue on boot with this
>> applied
>>
>> >
>> >> -Anand
>> >>
>> >> Anand Moon (3):
>> >>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
>> >>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
>> >>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
>> >
>> > None of the patches apply, please rebase on kevin's dt64 branch.
>> >
>> > With that, you can add
>> >
>> > Tested-by: Jerome Brunet <jbrunet@baylibre.com>
>>
> So I have to drop the Tested-by  ?

Yes

>
>> So still worth rebasing and applying on I suppose but I don't think it
>> solves the problem as described in this cover letter.
>>
>
> I have a mac address mapped to the ip address on my router,
> So I am just testing with the latest u-boot-2000.07 on my boards.
> Usually the ethernet comes up with no packet getting forwarded,
> Even ping to the device is not working, which is what I observed at
> my end many times.

This is not the use case descibed in the cover letter. Please clarify if
you resubmit.

>
> I will try to rebase on top of Kevin's v5.9/dt64 if needed.

If you intend on submitting the series again, rebasing is necessary.

> Please let me know.
>
> -Anand


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
