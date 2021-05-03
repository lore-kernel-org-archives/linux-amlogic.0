Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62909C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:30:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73DF61073
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73DF61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KNCOEvRLfJaehDKyXfuwQ+p8Z/XoO2wfzCvTQ8Txg1g=; b=keyd2ZtUNHeGFsFM+7oaQIz20
	5Tq+4cM02PMvWAh33Ulh5oJ6rb/bD4kFC+nf+Z6TsQpyXsYDaDSFVbhgaR61JKZFfYTLO6jdgsrJm
	YMRGdK2RvGr8KCGY/nswE3RWLsUKhOV7tN0qkFprwVVROIRk9kdMaXsXtut17xcItDOXgvi1Pkkbf
	epZSreNt5idlOn8OKblMub5blkKKGrj/GtUAExyvj024++JMHcqq0LkVdhUDwVNa+vHNuF9Vssnp6
	BPUw11lSXhriZuXAt6aSHjOsKO8yYp7p3FGHXmYfXhuHfledMSxPqxUMPy8EN/YeWQ3FaGRU6DFnr
	bqwzYUj9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaX2-00EF35-4T; Mon, 03 May 2021 15:30:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaVk-00EEiF-7C; Mon, 03 May 2021 15:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4X7uf9sLw2LlIz1sJKu9KjMmCuee+1oBT6AFDo3JZs4=; b=2kPXJmbI+1vI6m1sTiIzgFFabM
 Oj8itgeOtyigPu5Jx/V3RQHXpKt25PqnUgvS4JGsQRuEWohqAztrNdPnQ/JEYMpV57ZuZ1dBZFnUo
 TBM+29VInWpwpmciYrm8h1SQ87Oap/FaUUcoOgU6Ych6oZuMeCh6J/LTRvB6hEYV//797taq6Rw50
 mDkqlMZBXT9lHUG7b3L2GVN0/1ER9+cL/oEmSZTEQ3tZlisWwSJEFPRpvfnweTMHlMQGxr/FlNYWu
 BQNLMsqvzkFhopRwm+E1FUO77zM0r8U2fMrqmQNAEvY1GeNZkUiWNiiJslJn9kw9HMB/z5ufi8pgA
 i6UXgXdg==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaVf-003BCV-KV; Mon, 03 May 2021 15:29:26 +0000
Received: by mail-ed1-x530.google.com with SMTP id j28so6734420edy.9;
 Mon, 03 May 2021 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4X7uf9sLw2LlIz1sJKu9KjMmCuee+1oBT6AFDo3JZs4=;
 b=YHBmCP2QAl4UzlJRUwELp0pRtUuuTgj9SePAQgh6pBzUlMqEIihvB/BnB1ISLD9XLJ
 BKxUpaoPLwvUtbfqSpzQ/OXJsxEad60XDz0+ZwLOnvVdOBwqg0akGN0T3UAdj81O1MGb
 lIQo/4UkudtSN5Sdlf35N7rSNnQPusUK5hWxlHRouDNKkJtogwtERshwV9kGrAgpQMrU
 VRF8fN52dZcTuDK9d/xIg9A1CJyBZmilowV2bpXD7Z++CmFeqNWk2m2YT3JmYpoKP4R1
 kvZov44AQrurIsljnM251Lr+rTJR621Y+BKwWdA1mOF/yQDBs5L1PqYUeZD7thjgiPNy
 2vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4X7uf9sLw2LlIz1sJKu9KjMmCuee+1oBT6AFDo3JZs4=;
 b=lDXsoaMqQzutaBm1GSZ03n5lRcF0YDdrwoyQuSkgjXXIT8nxpP/yXk189rbu3h+dcZ
 wssoAqfBZ3b8+ZzXZGcbuPw3ki0P7PA9g4ioErB8Jk+cOagGHG4gjE4bVpqXo3Xmn6xf
 KTJHvFlBJuJueh+vBctmsnyM8/PclY+Gv8xcVLjUl0SogqPvG14/TIHFKdJEql6E5FsJ
 6WPh408hLLy1cQT1dG4eb1jvL1oa5RX2I2bQD539cOqQJ/fCR6xmdSK6I8CtMso/TrAl
 AMBhR6zJns4Oxoi/kZ0DdARHFbJ0fj1+72QzbkR4g6/wpvsX6wk6oh4VKtB/4QkF+SEv
 31dw==
X-Gm-Message-State: AOAM532RTBrafbfhEIT1H3F8lgN9mt2nnuWxRRLEHwOdoxclYO+W5gtp
 XzAda3M9Ya8E8a+CDPIx3m+OU+qzTKlFaByO2afa/9bAfOdCZA==
X-Google-Smtp-Source: ABdhPJxfMfM7a1H/LJS5Afi+r7tTgt7hvt2NboGd9ad2yL60vbFwa1WMHRpQW6zegP4+XVp6V1klfNeWf455cXNzcXI=
X-Received: by 2002:a05:6402:2548:: with SMTP id
 l8mr1073099edb.208.1620055762146; 
 Mon, 03 May 2021 08:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210503145503.1477-1-linux.amoon@gmail.com>
 <20210503145503.1477-4-linux.amoon@gmail.com>
 <CAFBinCCxMvomKt9E0jT_XXpyL1_-qXH4=zVDMNdbDCnZCsnT=A@mail.gmail.com>
In-Reply-To: <CAFBinCCxMvomKt9E0jT_XXpyL1_-qXH4=zVDMNdbDCnZCsnT=A@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 3 May 2021 20:59:10 +0530
Message-ID: <CANAwSgTdFHwtKd-sgQq0Jp8WP55fZG3wsn7feCGo257yqiFkpw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210503_082923_699587_07492851 
X-CRM114-Status: GOOD (  20.47  )
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

Hi Martin,

On Mon, 3 May 2021 at 20:37, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Mon, May 3, 2021 at 4:58 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > As per the S922X datasheet add hdmi power domain
> > controller for Meson g12a and g12b SoCs.
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/soc/amlogic/meson-ee-pwrc.c          | 5 +++++
> >  include/dt-bindings/power/meson-g12a-power.h | 1 +
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> > index 2e07ddf2d6a6..ec402c4ab931 100644
> > --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> > +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> > @@ -154,6 +154,10 @@ static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
> >         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
> >  };
> >
> > +static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_hdmi[] = {
> > +       { HHI_MEM_PD_REG0, GENMASK(15, 8) },
> > +};
> > +
> the VPU power domain already includes:
>   VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
> whereas VPU_HHI_MEMPD is bits[15:8]
>
> Having two power domains which are managing the same registers sounds
> like it'll be causing some trouble
> So for now this is (as I am not even sure what the goal here is):
> NACKed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>

Ok, thanks. On the line of Ethernet PD, I tried to add this accordingly.
whenever I try something new it fails. Please ignore this series.

> Best regards,
> Martin

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
