Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEFBC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 11:54:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBB35230FC
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 11:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBB35230FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3P0ErUp1FdRD2U3M/FiNWjxQy6xaayp/omBA9+/E8eM=; b=dSHEFpYAXcr9fAba/BD/Pn3YA
	g686BECX/OHko8tbCEIHV85wJhvbVKwKjZMvjUFMLIEVIxDfONUfEjh4DmvzM3tKvL1lPev6y/lE0
	oggayhsi4s2FHqEeCr+e8iNAN73CXjXUZfNUhlg2/bMECaTzK1JO2p2qvIJn3Z/frukkmJePhzgp7
	9F5RZDH4VdLDJqFxcATQK1gwNknl3/4Jx50Yucc7xrHG1MbaMRvC7lslmseCtFEzZkuthHMuCuT6Y
	PQ9228ug8MdptOEf5JxxdDZ/cfnfzzLyFG5r8VvsUADIvWghIkM2twLaJVutI1FnbCG457zAKOZoA
	L3b2pwvSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klW8t-0007kZ-Rf; Sat, 05 Dec 2020 11:54:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klW8s-0007kF-05
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 11:54:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id x16so12571735ejj.7
 for <linux-amlogic@lists.infradead.org>; Sat, 05 Dec 2020 03:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RsyZQxMB6g1gQjoES7MOuuPKhndG4nVmN9AvLlEOsVo=;
 b=jMdmE/4xGsiF9bB86AL37zgWK1WFZId9XSlXKj3Yxo3W7SqpdZw9mnT2MYzwPkAJQr
 NiwAgcvraoHdpVJV0dvI7Fj0m/hffGrnRHTROE02AilMU4xAQ0tPUBZb+Xj9GuEjHcmh
 xkM20i3keE64C06K7XPlgP0UZWWzE2Z1+LxnLgi07gcCbBr1FNOodwTC7UnvJis8tu8R
 XHrfvtFTvsgA92Tl1Ssb3oqGp3w1KR9trBHerfS4eCwHpLm8P3BRUtWbWA6HkLIKpGAX
 xRQtTvcE7rfKzgCq5rbCItXcNGK6LJtRkpgyBTPw0Ljg7xa+XvUdHo+KqO865uT+Iady
 na2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RsyZQxMB6g1gQjoES7MOuuPKhndG4nVmN9AvLlEOsVo=;
 b=a9lYSNYeyrzjeTx05h1zWlsGkcNUOazw5QdYpz4ENarq+EXvNaC4720kh4BVX03XP1
 ummIX95BurQDkPN2s2Dz1FIytJIhhAI1OvL5GY1losse2j240vIpFItEnk3LCn1G2wJ0
 aIC82Amho1nDFoELVJWCqOVigEH29Uvine06So1nVDfjGUyLpWpGx5SDtY9JIbmYURRA
 4GJm/ps8y1UOw3NnG75KbUROU19MLz7CjY+yJ0sKM5O1TRq3PKxCDN5G7Y+WrsP3UVVa
 YtMP7YWhie8M4euO0EW5mOf5ZEb59n0M2uIAsLixy9wSSrae1bwna7My5tnL72vK6XjJ
 GIFg==
X-Gm-Message-State: AOAM530qGVI1Dz8Q9VBSiVGukoHv7xtgFjzrsYMplnhi1Uanq28vl51F
 qwhlAEtmTIuEnsJfCoohdZvvZT396057iy02ze08jNnEa84=
X-Google-Smtp-Source: ABdhPJy5Dri0kwKoFP2wWmwxnmloWsTTN9PdpR5aCx4g5Vj5FB37+1ryiVW6fGGsDMUEXv1c/WzsGpSgdaZIRAmC/+4=
X-Received: by 2002:a17:906:71d3:: with SMTP id
 i19mr11072387ejk.187.1607169260781; 
 Sat, 05 Dec 2020 03:54:20 -0800 (PST)
MIME-Version: 1.0
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
In-Reply-To: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 12:54:09 +0100
Message-ID: <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Otto Meier <gf435@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_065422_114381_2AC14D07 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Otto,

On Sat, Nov 28, 2020 at 6:10 PM Otto Meier <gf435@gmx.net> wrote:
>
> Hello,
>
> I run an Odroid-c2 with newest kernel 5.10.0-rc5
> usb recognises usb devices only when they are plugged in before boot.
> after boot plugged in devices get not recognized.
>
> Any idea where to search for a fix?
there are two answers to this:
- this was fixed two years ago with upstream commit cc10ce0c51b13d [0]
- I think it broke again. off-list I received a hint from a user that
setting kernel cmdline parameter usbcore.autosuspend=-1 works around
this issue. can you please try this? if it fixes USB hotplug for you
then this needs to be reported to the USB maintainers


Best regards
Martin


[0] https://github.com/torvalds/linux/commit/cc10ce0c51b13d1566d0ec1dcb472fb86330b391

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
