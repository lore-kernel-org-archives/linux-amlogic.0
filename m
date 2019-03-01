Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4B6C10F03
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 16:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC5220818
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 16:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuwm6/r9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YadzOFns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DC5220818
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQTHjMMegHMwmiJ9f6MKU2tMCXuyCGn+oB9Lhs6GaD0=; b=nuwm6/r94HAAJH
	vkA314DPc/Qg/J5AEd8baUvFEkM4d5Jx0Qz7biHWqqNlBQiDAPA95iujBgSto8tEH1nSnKnBB99b1
	QzggUzr/1Zb7FwitT+AvhP6XmL76msxL1zMlOGCkcPUiM7XfvGxgNcExbgBzoEMGNIVLAQG/M/Jqc
	Z/Vv5C01adJbgopDz2270s528qai3c2cp+yWRjLlL9wbauAmvbxgrSqaHI6sUtabe7GYccPn3nI/Y
	0+KPW0w49UjZW1jfjjOAUtVB7dcYkONjBlQCAxHXGqRfwAE9iZRHQ1DI3RNG4m5lYQMejBTxWp7Fs
	MPu4i0W6VrOu9FCBQNnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlOz-0002Ns-ML; Fri, 01 Mar 2019 16:52:49 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlOw-0002Lq-On; Fri, 01 Mar 2019 16:52:48 +0000
Received: by mail-ot1-x344.google.com with SMTP id z19so21539774otm.2;
 Fri, 01 Mar 2019 08:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kfGCMUN5rPhxXOHU6GO9HQgy62a74lDnvzWD2rPXkz4=;
 b=YadzOFnsRt7HqStDcUVL5g8FLyCYcHKVpJdvB0bs1QQyo32ZJ1O9mujXJuPzSREToa
 sJ/RCeeCUgznWWwjgLw1OMIH4WaVArcbAs6BqSwIWpQ2qA5KsuKpaaEz6RBU6iHqX8rJ
 7dCzY3wWKFJOFJRfkSq0z0zw23LcbiZSspzyQTvkdX+UqaBWfmAGCIda/ny15hjDO9hn
 A1gun7G8mD8U5Fo8F18Auo5eThd+j1CoBtc9hahktTw8/iP+gHvxRgKU3hZ+6FrDNNBv
 N6yiFGE4d2vDJHNrcECwzbjbrQwhCA3iM2M2p52iFfRuObce+glfPhATOcKud57G7bdy
 SwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kfGCMUN5rPhxXOHU6GO9HQgy62a74lDnvzWD2rPXkz4=;
 b=Ys9/jAVWsTzyBV36HoswUaAX4iQv/xvpjnbtGJivHDRB9bkj9tjuPX+I1UnfGXXQrY
 mGRhuOV3Jreom0HmY05ogPupE6dOvy565MimEEcBZVv8vA+gBmVPnKADkdBJycjyk/Ka
 70mhgUIeVXc0ONDM9TUaKLzaBL0Mjs6idJtuz4/RLCxDQ6Eetmp3jF6ycWfeUNA74U5O
 FckVjn/FE8cn0lPfQANdg4idpJXmZp0YS6SLLctSnmgbPu95ep1npW6rzV25YU0fbQV2
 K25f4B0UqnQLTcTpn9c4H9xQ2anAPItgBPAckV6S4UT0j7zoF7eGoGfQvm8yHpyvVfZp
 JiwQ==
X-Gm-Message-State: APjAAAXYZDPKUJRhK5qZyP0UGhu6dICPI6FHFbK3hg9H8/zJGgevTlGC
 413KRPOja9IMeSw5Uz9+BFd2lDNrQHpfnDf5I68=
X-Google-Smtp-Source: APXvYqyGLydGGb+d8KABdstqENqvMOYfuAmB+lV9H24A55nw4V6X6UtyiPVGvL6BE7VbtjwSlCGD66Sqj8XyTHrXH/0=
X-Received: by 2002:a9d:798c:: with SMTP id h12mr3782628otm.86.1551459165541; 
 Fri, 01 Mar 2019 08:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20190301102140.7181-1-narmstrong@baylibre.com>
 <20190301102140.7181-3-narmstrong@baylibre.com>
 <CAFBinCC1b5Q8Y=5qXKJ+B1XBhpo8PGFYHwTEeVTgbXwz7ge3-A@mail.gmail.com>
 <a3654bdb-4289-7755-5601-e8177b00790f@baylibre.com>
In-Reply-To: <a3654bdb-4289-7755-5601-e8177b00790f@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 1 Mar 2019 17:52:34 +0100
Message-ID: <CAFBinCA6VJqK31NgyVkf2rLva0R2RbYQasdZGe+0BjjdOmnmFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: g12a: add cpu clocks
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_085246_820440_A66B6BDC 
X-CRM114-Status: GOOD (  15.45  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, Mar 1, 2019 at 5:42 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> +static struct clk_regmap g12a_cpu_clk_dyn0_sel = {
> >> +       .data = &(struct clk_regmap_mux_data){
> >> +               .offset = HHI_SYS_CPU_CLK_CNTL0,
> >> +               .mask = 0x3,
> >> +               .shift = 0,
> >> +       },
> >> +       .hw.init = &(struct clk_init_data){
> >> +               .name = "cpu_clk_dyn0_sel",
> > the buildroot code has a variable with the name "p_premux"
> > I'm not sure what the datasheet states, but maybe this should be
> > cpu_clk_dyn0_pre_sel
> > same applies to the corresponding dyn1 clock below
>
> these bit are named "premux1", and cpu_clk_dyn0 names "postmux1",
> which has no sense because there is no mux in between.
>
> clk_dyn0_sel is the actual source selector of the dyn0 tree,
> clkdyn0 is the top of the dyn0 tree, this is why i did not add "sel"
> in it.
OK, thank you for the explanation.
can you please add a comment with the name from the datasheet in that
case? that'll make it easier (at least for me) to compare the
datasheet (and also buildroot kernel, since similar names are used
there) with the mainline drivers

[...]
> >
> >> +               .flags = CLK_IGNORE_UNUSED,
> >> +       },
> >> +};
> >> +
> >> +static struct clk_regmap g12a_cpu_clk_axi_div = {
> >> +       .data = &(struct clk_regmap_div_data){
> >> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
> >> +               .shift = 9,
> >> +               .width = 3,
> >> +               .flags = CLK_DIVIDER_POWER_OF_TWO,
> >> +       },
> >> +       .hw.init = &(struct clk_init_data){
> >> +               .name = "cpu_clk_axi_div",
> >> +               .ops = &clk_regmap_divider_ro_ops,
> > out of curiosity (this applies to all CPU clock post-dividers):
> > did you check whether CLK_DIVIDER_POWER_OF_TWO is correct on G12A?
> > I'm asking because on Meson8b the post-dividers select between one of:
> > "cpu_clk divided by 2, 3, 4, 5, 6, 7 or 8". also some of the
> > post-dividers use register value 0 for cpu_clk_div2 while others use
> > register value 1 for cpu_clk_div2.
>
> It's correct !
thanks for looking this up again and double-checking!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
