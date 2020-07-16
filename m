Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDECC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 15:42:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F422076D
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 15:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXPOP2mp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkv6LkY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F422076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ra6Ztkt8NWvZ2C3v/xrKB011kmhcqJfyqhDr87auT2A=; b=OXPOP2mpflezweMxlQ3L2QFd+
	AfADvjjpKm1PKUZ+yu9mVSwkNWhk2QO0lojMj54WQ4mWPAiYwuMYCIqPSXBjtGuiAs9iHZ1Vuni4v
	3mDKmtxA3jV65R3avtq3SEaa8t+IJJKt0v/KOuMjFHuuQA7X6ZCsHsxVUtMJrlL59NcLaG4Adni2H
	Aq14oHe2yRyEN2EOAwVWPdbfsGY5YuiZqj/7CpZQz+3HSTPNq0mwXxNTaQyRVT22cCdvk1EO/RCJS
	a4R9PeN67Tgp6df4X2xIbVyB080sUulF5t/FPXQkl2zX32n67/3y3rTY/18wZJVjCgsV3krwCXNVC
	o+HuowIAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw61u-0002bK-0h; Thu, 16 Jul 2020 15:42:38 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw61p-0002aO-3J; Thu, 16 Jul 2020 15:42:34 +0000
Received: by mail-il1-x141.google.com with SMTP id h16so5420908ilj.11;
 Thu, 16 Jul 2020 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b0u1Ktk7Razombpw+VKtZ2EiV3sdrsnL2SrGFQwq5gc=;
 b=Nkv6LkY6ZQVCWJ5riUqbyS5rW6CG4x3CXZ6qX031txwjrwFCaXxxqwy65dxKWglT0B
 gGRCqaoQfXguq3A74GeIz3teSOCSxxTsgNOGfDkt5AVvZM1rJkeqmIrCyLAjz7aCyKIt
 wVvlAeSW3RyewbKFLmDZXpVnFUKyXPMn4bWEsKW9EgjRSu5SjxLh4cayOz4Jd8DdJxyG
 ykrx4nEg4bZyRxuKpGYBu5aWsustzUDbNYIvfFu5BITLbEfJoW3aRYYVDS2GBuQNWXd6
 7DYyfQZJs3hNZaoW6FpX57kb/UgEOyA2cWk82AMiztgUuHQBflr44JOSCBqPCwNoYjRv
 opxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b0u1Ktk7Razombpw+VKtZ2EiV3sdrsnL2SrGFQwq5gc=;
 b=Cs8c14D/HdPIbHYmu+7W5OuQkb4LIfv3krApnaFQ/Iq6hPfQ5YJ8Sq+bcMJsj8Idex
 /K8iaQGHWEYRzsKackaPPrsE8IEb0+TaEm1Tbrv7qPM01oIhUS2ADfF4OtaZU5eCaQe4
 CZ93YCoV1GdfD+hptJ6RaphB3Bocbo2+zQBjEDfGetuK+bjLhIvtQjlDE5lSwz0fyUQo
 eFAqoMWJ1kM1bZV3iOP3knKnb77M7eFFcGBeCj4kbaVHrQlHsnDX3cgPi/brw/3Aj2qk
 cLssRwzt8DD7p4qYkCys37rqeZP/O33pSCY1BrDazNv+UnOfqQmVeoG1CtJ+j9Xf3WQF
 2rDg==
X-Gm-Message-State: AOAM532KfEKp9UyGzBt0H5VaHi8IMLRyYjJ4XbiQoyal+8m2ZY9DqDz2
 kav0gMIkLWdrAMX7Hc4cqbbYkNFYYiRUh9XdtBY=
X-Google-Smtp-Source: ABdhPJyB2P2sQk/4pFFdFQV8RmEmUqp4OZPnagXYnUH/VUn4XenhJM/80v/X3TtMOjrgRZ7a/oozy0sIRSh1x07seeI=
X-Received: by 2002:a92:dc8c:: with SMTP id c12mr5187959iln.243.1594914151188; 
 Thu, 16 Jul 2020 08:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
 <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
 <91fbbe36-d839-d864-7666-5483cc643a5e@baylibre.com>
 <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
In-Reply-To: <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 16 Jul 2020 21:12:20 +0530
Message-ID: <CANAwSgS8FfZ=_GfZBRYLOozzp5dcsuhiiHuwM_dOxdAwaSxWEA@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_114233_264284_4B1FF173 
X-CRM114-Status: GOOD (  22.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

hi Neil,

On Thu, 16 Jul 2020 at 14:05, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 16/07/2020 10:20, Neil Armstrong wrote:
> > Hi,
> >
> > On 16/07/2020 10:14, Anand Moon wrote:
> >> Hi Neil,
> >>
> >> Thanks for your review comments.
> >>
> >> On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>>
> >>> Hi Anand,
> >>>
> >>> Only the vrtc is able to wakeup the device from suspend,
> >>> the external RTC is not capable.
> >>>
> >>> Neil
> >>
> >> Now I have two RTC driver registered
> >>
> >> $ dmesg | grep rtc
> >> [    4.737315] rtc-pcf8563 0-0051: registered as rtc0
> >> [    4.738763] rtc-pcf8563 0-0051: setting system clock to
> >> 2020-07-16T08:00:46 UTC (1594886446)
> >> [    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1
> >>
> >> And there are two nodes
> >> # ls /dev/rtc*
> >> /dev/rtc  /dev/rtc0  /dev/rtc1
> >>
> >> So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
> >> How can we resolve this issue?
> >>
> >> # time rtcwake -s 30 -m mem
> >> rtcwake: /dev/rtc0 not enabled for wakeup events
> >
> > rtcwake -d /dev/rtc1 -s 30 -m mem
> >
> > As Christian reported off-list, it may be necessary to keep the vrtc as rtc0,
> > so you should add aliases in the odroid-n2 DT to have vrtc as rtc0 and the on-board
> > rtc as rtc1, but it may break the hwclock tools, so the reverse may be better
> > but you'll need to specify rtc1 to rtcwake.
>
> While looking closer to the Odroid-N2 schematics and U-Boot/SCP Firmware, the external on-board
> RTC can wake the device with the GPIO_AO 7, and wakeup is enabled in:
> https://github.com/hardkernel/u-boot/blob/odroidn2-v2015.01/board/hardkernel/odroidn2/firmware/scp_task/pwr_ctrl.c#L143
>
> So, something must be missing.
>
Ok I have missed this setting.
But I could not find any more information on this configuration
in S922X_Public_Datasheet_V0.2-Hardkernel,

But HK uses the same set up as we do.
https://github.com/hardkernel/linux/blob/odroidn2-4.9.y/arch/arm64/boot/dts/amlogic/mesong12_odroid_common.dtsi#L322-L333
I could not gather much input from this configration.

Does VIM3 support VRTC or do they prefer rtc wakeup via RTC ?

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
