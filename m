Return-Path: <SRS0=f3vK=C4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A764C43463
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 09:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3D721582
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 09:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOEfjjkT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3Z0VC+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3D721582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8djouDBntHTrgOebxSZUjk9++8vS6AGwSgRWKnDXyGU=; b=NOEfjjkTFDHX/2/HuiyFeRR0G
	t0H4EGsTqASwoXuHNclmp2chJE/BdHubIOfOCiaSvsVlzaUFoP9mPNQADolTMs7v/631WnCAT5M0C
	YG7+3eZRb8OahgPEibpNVk1NBp2Ntn6T5ZolVgkvELLvppPUsjFxInTCclpq5ygEcAsgGwEcrqAqp
	N9eUusaLaUu/lxd6NE2kzuohWTebVtQivFedakEFDNdAw8AC4LffF8+lJUMHQMVI79rfiIFWC2Z7T
	C1A9uU7ROfV3r7y85Dj/4Gbus0DUxoBerjfSkt9qTWgXIIJf+id71UVKHZISRHgSPrIt1DncVX4hv
	Yjb0HqpEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJZSy-0002v0-54; Sat, 19 Sep 2020 09:47:36 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZSv-0002u7-Ld
 for linux-amlogic@lists.infradead.org; Sat, 19 Sep 2020 09:47:34 +0000
Received: by mail-il1-x135.google.com with SMTP id q4so8715866ils.4
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Sep 2020 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SlRABcjq9Za0vlL0KUB7eVTAqiAA/ra6/huW2cnUEN8=;
 b=G3Z0VC+0LkD25sl6uTd9s5DFbzY9l3OC+z95u81BWCQ8rN0XPuqZom9lTO0gxqnf1T
 OnQTs58CKKvdJ544BL1Ply30UoW+RDA/4INtUUPMEVppVUlj2fBZCQ38oLqLPcDtrMmF
 Gfz2o1esjDnPG61t0ZZ3szLSdxxSH6W7kuQ5DbpYXP3fIidMIFAQYu48enLZr6DNel2K
 J+OzFdU0Y8wxqK5nIxsGpBgcdFlDj3/BRKc7+sr6v5jnLTtBw9OegbKin+xR1S4LzwR1
 7DeHN4h34CS8hKUFtO8p2Y8Y1+Qe6AsbAUhTlbFk/YhLfOtye42K+5XN1Wq3XxZZ3CdG
 EnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SlRABcjq9Za0vlL0KUB7eVTAqiAA/ra6/huW2cnUEN8=;
 b=iLTJthU/5Ek8YuHg6EIGfxA7dmsD2JB42bWqL2sGji8in+Z+LTgCAkr6Cl7pobcEQh
 xj6U1USgj5akOYNHTYfGk6BcwZuiAF8MiOHG0MHFUfsIjBAtjOK6AeWzfkV+csoKjLhm
 nYEYUqkjinXVDFI0w8JGftiBVSZ4o8lWgsx2PjPNx9QLL8ZevdA/sB5lm4pCDoKBpC0i
 fvdO7x/cGL12R7rxH/WYkYBPxrqkvz6zyxksM93JYfM2tFjUWIb/xY126MxNfDncMGmJ
 /UCXrr5lniV1CfvDiVU+8BD+ZLMq074fOnY0deyGn4WrihqgCXF4eKfAq8Y+XeJ5E7nl
 7pSQ==
X-Gm-Message-State: AOAM532t0bpH9N8Pq4TCr9MVOjC36U5V/Q+HKUDfEWoe8pTNJQHmM5lS
 i5U/fT1wMA4OFBZtnOtOsRsdMbM+u/Du2CEYHh0=
X-Google-Smtp-Source: ABdhPJyvfwO+ICbVhmPvOnjH2Af57Hb83fBxmyLCfFc9S521dvuzuPYJ1giuY1koM2BdmKoJybKc8DTZ7m/goqdXLeQ=
X-Received: by 2002:a92:c084:: with SMTP id h4mr11593543ile.6.1600508849274;
 Sat, 19 Sep 2020 02:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <87y2l8plev.fsf@dell.be.48ers.dk>
 <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
 <87tuvwpgjr.fsf@dell.be.48ers.dk>
 <CANAwSgQnnkVdYNWTdTez8wdDHMW50vk+1Vcb7mBFkObnS1tAnw@mail.gmail.com>
 <875z8ap0xe.fsf@dell.be.48ers.dk>
In-Reply-To: <875z8ap0xe.fsf@dell.be.48ers.dk>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 19 Sep 2020 15:17:19 +0530
Message-ID: <CANAwSgR4Nq0rsg3yi-AF1HfAAvNquB2=EJj4n0_J2uHbSgVJCA@mail.gmail.com>
Subject: Re: s805x USB broken in 5.8?
To: Peter Korsgaard <peter@korsgaard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_054733_751832_B7D2D331 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Peter,

On Sat, 19 Sep 2020 at 15:02, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Anand" == Anand Moon <linux.amoon@gmail.com> writes:
>
> Hi,
>
>  > Can you share the instructions on how to build an image using buildroot?.
>  > I need to do some testing of some features in the future.
>
> Sure. Have a look at the lafrite defconfig and readme we have:
>
> https://git.buildroot.net/buildroot/tree/board/librecomputer/lafrite/readme.txt
> https://git.buildroot.net/buildroot/tree/configs/lafrite_defconfig
>
> You may want to change to a prebuilt toolchain to speed up the build
> (make menuconfig -> toolchain -> toolchain type -> external toolchain).
>
> --
> Bye, Peter Korsgaard

Thanks for the quick response.
I will give this a try on my SBC.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
