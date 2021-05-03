Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF47C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 17:52:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D5B6121D
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 17:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D5B6121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DsuWIuMw5QAV7nCWS+JBdN4ljYwl143Tn9yCkB9Bpik=; b=k3T94Yt2wjSyx0Bi6IR+WghWn
	f6Hl06LWEILFmTGikeHvr5ZY+6+ROogzXtieAk7hOfERfB0zxc2So93U6o4DJEkgxytKdzsyTFJa0
	hcl8tsVZdXuC/PbFUB/Cw34oq4QCUyJ6Wp2elSwq4sMwCcrsfB2AFQwuSMgl0d7uMMecW4ctCSM9U
	hPDwwkAPrXXaCUaoTRMUZFzgo3dtRjY2pbj3xIVh3DQcmsjUcqzqrhBSWuvW50LoW6pqCw0ZX7Rxl
	ScA3WJj6kvK59YfFs5BWRusYacGqaxkxIPdLQexYcsRgGq4JGNwMsfNlpsYdo6mO3NySM4gaw4sCw
	ivg97VobA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldckM-00EYip-Cj; Mon, 03 May 2021 17:52:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldck9-00EYhc-1n; Mon, 03 May 2021 17:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VlqRIueTk0F5zfM99p/8Ijk8GV72FYyMIcRNpH9/8mM=; b=epUjFlDqPG4BipwKnLu3oEJUyj
 OqjX4iMuXjmifOVVfsQdY/URRPtiwa+S4h6B7rewMGIFr3q5JO6W4QCstjI9HisQGfrybBvmNS1jm
 xnJdsoUR5IzIuf8sQoVQo/hv8CvTNh3PHGtfvA7PIqld2zo7xxuDT5XUxpFcPhCw14Ngp/KciKrDL
 a9IDlXDdT4VznicQqJOOewKVFeAtDw+H4XEHiOntmA0xsAbVS4N2A1BA2GWDWQhIB9s96USQZcZCL
 3U7ITdOiYW06zv+4Vz6zjZtF1tHqAHlZlliDP9wXNz2T3xufzdJtw3GwwmZnAQlhQ43A+TCdTgvBb
 0o//tZHQ==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldck6-003N1N-9U; Mon, 03 May 2021 17:52:27 +0000
Received: by mail-ed1-x536.google.com with SMTP id i24so7291251edy.8;
 Mon, 03 May 2021 10:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VlqRIueTk0F5zfM99p/8Ijk8GV72FYyMIcRNpH9/8mM=;
 b=eooZ7Dwqywhke7IsxQry6Qnd3r8Tl+sm5eALs9IGsiN1IxnQMTtnOoewuAZiiELP0A
 Oq1do3ed0/7ljCCNrAa9mhIhhb8AZe+XNd87um07rYhnpkzZPC6XDLVceejTtmMIoPbg
 10RLe8tfnaeruO4rT7qt8do6SmiomXLuSDJjndPoOIpP5eOR3N4HTNiUUCGdNLQZfNaM
 dTLGitz3PDkvou7ykOSbNP4UWLoAYURkQUizwamQHUonxL3blbly2TmB1gEZgk5B6q79
 o0BkQtjxm4Lm4zzEQRv0Ye2Fp3tYu6OAfGs21slmgpOfE19npY9BWZzQrQYmIDQm7Qr8
 8DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlqRIueTk0F5zfM99p/8Ijk8GV72FYyMIcRNpH9/8mM=;
 b=gJ6LGuhtMbeU7U9TYsUI/kubczdD++xWLpQ97wUDB9LynAjzkTWUltCyE+JCQ7kTj8
 uPSrCGJ8/OPlKih9mKi1MPDrpj2YvA7kLsrbnTnKLshGhvsadxWGh7DdTQGkiWynwVJX
 Av29mpRaX1XvskcpuqRtehHRDOooAvNfMv8j1deGdjmdoqEFKhYZTWGx/pi+ql15go4s
 wnRbvQ22oAF2aPh6LscQAgc5EKpimarc0RZXZfjPaTSHdmRGHLF14N1WY8ZjgYDWCNmV
 Iku0pCmt3WHUaFoAu/ybCBrIgProKkbjhgRp1R7PsEp8pAeDyoexpNtOfsHZcY7r9Pem
 vryA==
X-Gm-Message-State: AOAM533wfNQrYY0z498Esd2pNR9VO9JSysoWnIom/BSSuYiDu1OjkvEN
 PjUCdptg+iYXQq0I0n/Temzt+mWtlm+h6gmST3Q=
X-Google-Smtp-Source: ABdhPJyrEQbpkN6DYy/v2aTjZOD4g2MB0cEeRUPbrKzX7JTf9OUhJYCBJs+HCk0MHU6eo1Zly1UAUzUOCR5e8eChZdQ=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr21251334edx.52.1620064344776; 
 Mon, 03 May 2021 10:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210503145503.1477-1-linux.amoon@gmail.com>
 <20210503145503.1477-4-linux.amoon@gmail.com>
 <CAFBinCCxMvomKt9E0jT_XXpyL1_-qXH4=zVDMNdbDCnZCsnT=A@mail.gmail.com>
 <CANAwSgTdFHwtKd-sgQq0Jp8WP55fZG3wsn7feCGo257yqiFkpw@mail.gmail.com>
 <CAFBinCDUc7VG7T9c8snP4ujMMViS0GRdztP6QGJvF9LNESHHCw@mail.gmail.com>
 <CANAwSgSrQnBs06+DG6x+GMvyjvu-hPFX0J5MQ0yKPBvNaNu98w@mail.gmail.com>
In-Reply-To: <CANAwSgSrQnBs06+DG6x+GMvyjvu-hPFX0J5MQ0yKPBvNaNu98w@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 May 2021 19:52:13 +0200
Message-ID: <CAFBinCDMTmZ5ifii8rW=6qSdNngx3Gz1tZPd7aubDkmqNYD_og@mail.gmail.com>
Subject: Re: [PATCHv1 3/9] soc: amlogic: meson-ee-pwrc: Add hdmi power domain
 Meson g12a SoCs
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_105226_369701_5E44E6B2 
X-CRM114-Status: GOOD (  20.44  )
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

Hi Anand,

On Mon, May 3, 2021 at 6:37 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > whenever I try something new it fails. Please ignore this series.
> > if the VPU and HDMI power domains were separate (from hardware
> > perspective, not from driver perspective) then your change is a good
> > step forward.
> > in that case VPU_HHI_MEMPD would need to be removed from wherever it's
> > currently used -> that means we need to also decide if we want to
> > break compatibility with older (before this series) .dtbs
> >
> >
>
> As per the datasheet S922X Datasheet, HDMI and VPU are different
> reg controller and they are independent of each other.
[...]
> Note: HDMI and AUDIO and Ethernet are also independent of each other.
let me say it this way: I've seen cases where the information from the
datasheet is not correct

Also to me it doesn't explicitly state that the bits are independent
of each other (at the same time it also doesn't state that they belong
together).

In the same datasheet you also find the HHI_HDMI_PLL_CNTL0 register
hdmi_dpll_M, hdmi_dpll_N and hdmi_dpll_od are listed in there.
The PLL output depends on hdmi_dpll_M and hdmi_dpll_N while
hdmi_dpll_od is taking the output of the two and dividing it.
This relation is nowhere described in the datasheet either so you
"just have to know it".

Unfortunately I don't know of any good way to check the relationship
of the power domain registers other than someone from Amlogic
explaining to us how it works internally.

[...]
> Below is the output on Odroid N2.
>
> [alarm@archl-on2 ~]$ sudo cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children
>             performance
>     /device                                             runtime status
> ----------------------------------------------------------------------------------------------
> HDMI                            on
>             0
>     /devices/platform/soc/ff600000.bus/ff600000.hdmi-tx  unsupported
>              0
> AUDIO                           on
>             0
>     /devices/platform/sound                             unsupported
>             0
> ETH                             on
>             0
>     /devices/platform/soc/ff3f0000.ethernet             active
>             0
> VPU                             on
>             0
>     /devices/platform/soc/ff900000.vpu                  unsupported
>             0
This describes what Linux sees (based on how you configured the device-tree).
The output confirms what you are expecting to see (I think), but based
on that we can't tell what's right or wrong in terms of the actual
hardware.

To make another example: I could edit meson-g12b-odroid-n2.dtsi and
change the vin-supply of "VDDAO_3V3" to &usb_pwr_en
Then /sys/kernel/debug/regulator/regulator_summary would show that
VDDAO_3V3 is taking the voltage from USB_PWR_EN as input.
But from a hardware (schematics) perspective this is not correct.
Since the schematics describe the relation (input, output) between the
regulators we know how they are connected to each other.
If this relation was not described in the schematics then we'd be in
the same situation as with the power domains.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
