Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD61C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:36:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E834461159
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E834461159
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y2voNugpsgdBfI0zZV2SyYbwYqwzrby17/siAzb/VUA=; b=b6stRTDqihVul5fFiLdm0YU2V
	mDT0UBy/U17vpxMuumbwzBiTQTuE5xuHEsA2COZ1DupGPJ4hETxa1Kd0BZ1spOUFXAPIXgVJDQO5b
	7ASd7GbcFLgW6zvB8vvOIDcp1x2/0IxoEq3U/Wq7r1YBtNw5tR2OGJXNLEXPGppQowCSW6btNF0jn
	0zXj2nT/tCnUNi/rgEa94gYTjaWhHn0jQLvbxQwck+5JIv9UCA3jKXfUBCvR8fiHKoxbQ4EQ9R+e6
	ljTDPHna9l7obEBpAUQxyZE8svHDeK6uwSOatuHUGSeaKT3LPHUMHFhv2/DD+W+qzVyMUuY/3zzwS
	zRO7R4J0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldacM-00EG6E-M9; Mon, 03 May 2021 15:36:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldabb-00EG15-R5; Mon, 03 May 2021 15:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=W1PWtzVUy7B6825OBB8ZeJD50r7eCh8stJaf1S2Tnn8=; b=nebhsQ/COcthw2QPy+eHMjZCPj
 6ncjPaXRVT7DSiBWtle8DnkLI5c6SKmDkuc1wR4aGMm3m+xv1mEbTyv4hpo6zSicSrwPQ2ihhAfEo
 IqYKEpG1GyTN6TQLiTDVtOqJ8QVSvvv4Sl7g7rMbdGN7N5mZVG3RJfgXp/6GXuhummGxPNzEcBaGh
 zLSDjR6ATCTGXfCsP0SzKYXsoZcsCmgms+OrkxDBcvTml05LmydVMsoZER25xlaaiU+MSLGomFfdI
 NG/hybOne3rajxzW4D6NCz9Dn2JCJCFIFgBSMiBjn5QwLxegViFXZ2NmdDZ1mEaP6DTFMdBWPBq7s
 /pHOeTgg==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldabY-003BXG-Eb; Mon, 03 May 2021 15:35:29 +0000
Received: by mail-ej1-x631.google.com with SMTP id w3so8528506ejc.4;
 Mon, 03 May 2021 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1PWtzVUy7B6825OBB8ZeJD50r7eCh8stJaf1S2Tnn8=;
 b=DPd6o4YVw63v43ugoINIMP0Ns66RGzJvKqhUadTCA8FuU/iB9p2ZqNQq62YrKsHTvT
 9AEj5CDTQ3gwQrkc1EVmBqlveECEMlVraM3rNteXlGjPJ1TTNImot4LuY1rYljRU1gZM
 Qz0Wc7DPGfQqMktWYey9kXh+z8ZRzBwWrsEL6SSdtw5EumTgv/HJwsJtWNxJbi2U2Rit
 nlpkrraMLBWwsIUCLNZIDZsoQwMZU9A5OIyXExN95FsRvZ6pBUBF+KEMA0dJRuj7bj/V
 m02Bqgu8sVJ1C+SoB2ri07UumjMy7hWw2haLuaWykF6fCtwQlgG4+yMm9SJ2EqhwEGkB
 zHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1PWtzVUy7B6825OBB8ZeJD50r7eCh8stJaf1S2Tnn8=;
 b=MpRKV6ZqQrqM1/4D+s6KNbEIxULKiz8OKU6ewRIwv52EjTm3YiSi87z4ljOLPnjnhK
 yCJg45iNYGMuWVakMxul6NdYOqfZ5TajbZMlBo95XU9hR+hBMwAE7Td5h+Yn8FWhbWTH
 ptZ7R4LxBRWr51jiqY0Nx6Uu8VcvAxVzM2bBct8icG+dLqK6XqtM5x7N4etUpvUS3qnV
 VJBP0d00oSbpmG7DSMwU/Ufe5I5Mmme0aoOAHtimhpfDObNeKYX8jhZxLO/92W9pGtb8
 IPjzXV+x1w8DuDT64i88iJLa1rvEScTpCLT2zb8akBj6bBT4oHJ+DAsD651mhyOx5h+q
 lwkg==
X-Gm-Message-State: AOAM531IM0Q2Nwh7vAi/sOdyftq8tR4z6VRPtYMBSIQoVImH7KjKbYjf
 ETtfsEFccmIfxMEOb1YGU453LS5a+eJaB4npjAbSHeiEEAc=
X-Google-Smtp-Source: ABdhPJxxcjijY0bRqQKCJgp4M/RuYW0jeM1Agfsa6Rq7dQx5YhS78mT2TIp017G6Mw3vCdMTOaIH+XJquptSAP1NzyY=
X-Received: by 2002:a17:907:2bc7:: with SMTP id
 gv7mr17236354ejc.187.1620056126503; 
 Mon, 03 May 2021 08:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210503145503.1477-1-linux.amoon@gmail.com>
 <20210503145503.1477-4-linux.amoon@gmail.com>
 <CAFBinCCxMvomKt9E0jT_XXpyL1_-qXH4=zVDMNdbDCnZCsnT=A@mail.gmail.com>
 <CANAwSgTdFHwtKd-sgQq0Jp8WP55fZG3wsn7feCGo257yqiFkpw@mail.gmail.com>
In-Reply-To: <CANAwSgTdFHwtKd-sgQq0Jp8WP55fZG3wsn7feCGo257yqiFkpw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 May 2021 17:35:15 +0200
Message-ID: <CAFBinCDUc7VG7T9c8snP4ujMMViS0GRdztP6QGJvF9LNESHHCw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210503_083528_529880_379D559A 
X-CRM114-Status: GOOD (  14.02  )
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

On Mon, May 3, 2021 at 5:29 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > +static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_hdmi[] = {
> > > +       { HHI_MEM_PD_REG0, GENMASK(15, 8) },
> > > +};
> > > +
> > the VPU power domain already includes:
> >   VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
> > whereas VPU_HHI_MEMPD is bits[15:8]
> >
> > Having two power domains which are managing the same registers sounds
> > like it'll be causing some trouble
> > So for now this is (as I am not even sure what the goal here is):
> > NACKed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >
>
> Ok, thanks. On the line of Ethernet PD, I tried to add this accordingly.
From what I understand the VPU power domain is special because the
display pipeline consists of multiple components (HDMI, VPU, ...)
that's why the handling currently is special

> whenever I try something new it fails. Please ignore this series.
if the VPU and HDMI power domains were separate (from hardware
perspective, not from driver perspective) then your change is a good
step forward.
in that case VPU_HHI_MEMPD would need to be removed from wherever it's
currently used -> that means we need to also decide if we want to
break compatibility with older (before this series) .dtbs


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
