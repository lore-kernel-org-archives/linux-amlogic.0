Return-Path: <SRS0=bYYt=J7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0969C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 08:19:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC57611EE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 08:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC57611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ONqCD1AB2JpaQW8ukoXHnAcor1bBUUunEksR1cNoBEc=; b=XkWcHaKH7oaREOmaJ3ZragSvh
	QU5ew8dwbltQOskuZfyNFylBog4PLMDXntlCT/lR+X7eT5Vw7A1tFmkcMB0+EX715vAq7c6WW21Ft
	f5+mNwMEzideYi4sh+UHSZldcj6iiMS5qcMFTg/r3FXGmbVjQPveRg2XUH0RISUYINQyCDX9TWuGx
	GMfZ/xTjO9pMJIRmjNv+UK16LoS9dDcuGLz9teyyJpb9//h5daj84sx4kQO+SRcElXrJEwebO3SZq
	1xXjPmPcHS0dNOVtARNBJNAa1ne0FJIykRNp+KjU4CkB8EEvorZ6Pl9SfWd7VXBButXGEJkvs9Oij
	SJvVlLvHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldqHM-00FiMf-VP; Tue, 04 May 2021 08:19:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldqH6-00FiL9-P3; Tue, 04 May 2021 08:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jFYxxE/Ai61oQCqbk8ib70Q6yklWPzwYT//bt7eipoQ=; b=cCXZ2r1pfdRAyWfFQn7GP4UtJd
 c2xlf1aiuoLM4wXbz9HRw/98aMUZ+G77Ilble6vgDpOhayOvbokyiKKSOXS90QsU0sdVx+9zQoJst
 ++1dIs+K/h0++Vf4zmohGN3eUqx30KdUiWWdRNHpI9efrSj/GQ95G+Bk1Y+NN990rcKmj35MbJXFW
 nGUPULOfCmwvIKkm6jfV092K66skfjFTE63PTQMgTY6jN4PKaNNcIx+I997VRwOHPumcAhr/X+F6u
 e5PfeMPXRfHpEgZU0jGRs8BO3YkPkJsdVvwDOQU+1qyrSUhEyZJmmMpgvAOw+nNonJ/JeQp3ICq2c
 gwKbQ/Fw==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldqH3-003o0Y-TP; Tue, 04 May 2021 08:19:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id l4so11800158ejc.10;
 Tue, 04 May 2021 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jFYxxE/Ai61oQCqbk8ib70Q6yklWPzwYT//bt7eipoQ=;
 b=PQsB/zeXbufsBRfumImBtGFOi4EbfyiEQq5+qZDzRL6EhpH8bcfUuuTC0UeF36vX+f
 Lovgh0fM6kGsl8gMaWO0cRPkRrvGnitQJJrx01HlFX9FDP0OlnNJ8ZZ8j42bjLIZPqsS
 htXhTkc7MLmWrMUCXRf6FON1PW+DVg6Q3iPiIlAuRVF0sZnWGw/kbhY3bhRHs5gTq73E
 XaR7TMWoNWupzuVxoTzgeGV9MBsbCGlm+MOfbv/Jqb+ssbhyV0HPsu4cQVk5CcVT1gMQ
 OLp4yYpjzBHPHWdNILPMAyRk4OtLPLoTgfKr7MV5ibuReAovyqQOmcet3yMeNweCbFrN
 4mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jFYxxE/Ai61oQCqbk8ib70Q6yklWPzwYT//bt7eipoQ=;
 b=NeBZfNceyiygZfFPRCDEpIBVtERAFbONiPeHCEduRnOvBrOv+N9q/PD0y8MF1SZvNA
 o15mNBlOCdPMvAf8HzLzs1uDEjJ/4/MY4Nqb8GZrrTXa40nKYCk8A5ecbG33cg6HUwlk
 NpakVbZ7L1KewtPj+xyLUcftCAi2+2jHtHo8+5j3SZR0HG3JGc7wB7shDe2e0LLo9PSH
 T7aiSyWPFLzKDgnil3FAb/dZmX3tx8HxRSyVdEOf9H6bT5KRI8thoYrG5eI4FxeHrQIl
 jXgjR9iKNAkbrOBo+kSnpsr8WpfeD+owPUtuLgyy7CkwrwAA2urYLx6D421LmjUDfrx3
 Oc/A==
X-Gm-Message-State: AOAM533rq70jhwv+dZsEQQVFKTyeWw/JFlv6iX2XCxIw/R7I0d9o3RVv
 IP5ElO2PB6UxYME4JQYIIEaSm1WOLGeXteuFauc=
X-Google-Smtp-Source: ABdhPJxrfkJv9gNQ+qTu/TrExlQlnYNHOczojGBxK9lx7BvpZiX2BxSk3Wu3w6SGImnypoxi5TrlwEVehxkbRq9PUrE=
X-Received: by 2002:a17:906:f1d4:: with SMTP id
 gx20mr20558733ejb.108.1620116359971; 
 Tue, 04 May 2021 01:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210503145503.1477-1-linux.amoon@gmail.com>
 <20210503145503.1477-4-linux.amoon@gmail.com>
 <CAFBinCCxMvomKt9E0jT_XXpyL1_-qXH4=zVDMNdbDCnZCsnT=A@mail.gmail.com>
 <CANAwSgTdFHwtKd-sgQq0Jp8WP55fZG3wsn7feCGo257yqiFkpw@mail.gmail.com>
 <CAFBinCDUc7VG7T9c8snP4ujMMViS0GRdztP6QGJvF9LNESHHCw@mail.gmail.com>
 <CANAwSgSrQnBs06+DG6x+GMvyjvu-hPFX0J5MQ0yKPBvNaNu98w@mail.gmail.com>
 <CAFBinCDMTmZ5ifii8rW=6qSdNngx3Gz1tZPd7aubDkmqNYD_og@mail.gmail.com>
In-Reply-To: <CAFBinCDMTmZ5ifii8rW=6qSdNngx3Gz1tZPd7aubDkmqNYD_og@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 4 May 2021 13:49:09 +0530
Message-ID: <CANAwSgTTvPRJW8G1g4gzaSvud2YVf_bPP3QZdYMtL-CuSvosAA@mail.gmail.com>
Subject: Re: [PATCHv1 3/9] soc: amlogic: meson-ee-pwrc: Add hdmi power domain
 Meson g12a SoCs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_011921_993011_92D905CD 
X-CRM114-Status: GOOD (  35.37  )
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

Hi Martin

On Mon, 3 May 2021 at 23:22, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Mon, May 3, 2021 at 6:37 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > > > whenever I try something new it fails. Please ignore this series.
> > > if the VPU and HDMI power domains were separate (from hardware
> > > perspective, not from driver perspective) then your change is a good
> > > step forward.
> > > in that case VPU_HHI_MEMPD would need to be removed from wherever it's
> > > currently used -> that means we need to also decide if we want to
> > > break compatibility with older (before this series) .dtbs
> > >
> > >
> >
> > As per the datasheet S922X Datasheet, HDMI and VPU are different
> > reg controller and they are independent of each other.
> [...]
> > Note: HDMI and AUDIO and Ethernet are also independent of each other.
> let me say it this way: I've seen cases where the information from the
> datasheet is not correct
>
> Also to me it doesn't explicitly state that the bits are independent
> of each other (at the same time it also doesn't state that they belong
> together).
>
> In the same datasheet you also find the HHI_HDMI_PLL_CNTL0 register
> hdmi_dpll_M, hdmi_dpll_N and hdmi_dpll_od are listed in there.
> The PLL output depends on hdmi_dpll_M and hdmi_dpll_N while
> hdmi_dpll_od is taking the output of the two and dividing it.
> This relation is nowhere described in the datasheet either so you
> "just have to know it".
>
> Unfortunately I don't know of any good way to check the relationship
> of the power domain registers other than someone from Amlogic
> explaining to us how it works internally.
>

I should have sought more details on this feature before posting something.
Thanks for the detailed explanation of this feature,

So in order for this feature to work the final state should be *active*
for each power domain.

> [...]
> > Below is the output on Odroid N2.
> >
> > [alarm@archl-on2 ~]$ sudo cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> > domain                          status          children
> >             performance
> >     /device                                             runtime status
> > ----------------------------------------------------------------------------------------------
> > HDMI                            on
> >             0
> >     /devices/platform/soc/ff600000.bus/ff600000.hdmi-tx  unsupported
> >              0
> > AUDIO                           on
> >             0
> >     /devices/platform/sound                             unsupported
> >             0
> > ETH                             on
> >             0
> >     /devices/platform/soc/ff3f0000.ethernet             active
> >             0
> > VPU                             on
> >             0
> >     /devices/platform/soc/ff900000.vpu                  unsupported
> >             0
> This describes what Linux sees (based on how you configured the device-tree).
> The output confirms what you are expecting to see (I think), but based
> on that we can't tell what's right or wrong in terms of the actual
> hardware.
>
> To make another example: I could edit meson-g12b-odroid-n2.dtsi and
> change the vin-supply of "VDDAO_3V3" to &usb_pwr_en
> Then /sys/kernel/debug/regulator/regulator_summary would show that
> VDDAO_3V3 is taking the voltage from USB_PWR_EN as input.
> But from a hardware (schematics) perspective this is not correct.
> Since the schematics describe the relation (input, output) between the
> regulators we know how they are connected to each other.
> If this relation was not described in the schematics then we'd be in
> the same situation as with the power do
>

On Amlogic SBC, I think VDDAO_3V3 and VDDIO_AO1V8 share the power with
SD card and USB.
so can we add these as optional regulators to enable/disable within
the usb driver if needed?

I am facing some issues to fix the power on Odroid C1+ and C2 board as well.

> Best regards,
> Martin

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
