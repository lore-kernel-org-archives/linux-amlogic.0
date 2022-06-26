Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE472C43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jun 2022 22:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+8hosM3Wt3FsCDMXnMDxthS+cpYpUdZq/AZP3WvwLc=; b=yGD20zTpbSMd75
	yboIP8CzrRfVqIBKeA+nis0PcAx6SxnxCRTayEmQC+nO8ZVQI3Te8ZEcyPXRUR6bqjknUnkVgtyKP
	oL7kORGohZsBk6sN5VMKDLm7R70rzJdAftl+hvD9SEAUrpmMx5jhd/S3UPiFq8Sjg99+jqIAMPWVh
	NNMqtLeUn2Ff3up59mOsPGxqSi+IKtGhHK6gN2BUeuh7VfI6n/mvevInSqVWer+EjRgqgmIcV6YsH
	dIdDWr4NmNwW8LVVQnVfyg2gk0HSRB0wFKkhEtQP/mA1phbBrae5DNtXc25uwaRrkNaaQOFjPllMk
	fE1vKi5GDSElhq0vpQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5aLO-00DlSd-54; Sun, 26 Jun 2022 22:03:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5aLL-00DlQP-Pl; Sun, 26 Jun 2022 22:03:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id ay16so15328982ejb.6;
        Sun, 26 Jun 2022 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XfW/VwtrLWMZiQ+jQiAJFUp/vxYAvVxarx6R7M3NLzw=;
        b=NL/pTwUmJuOCKwFUHOqE5dIQcvjsKCof8imstS6QeTcl/ajghafvgi4TK9Mpw3af9H
         QzGQW3/0kVUankXisBitlqTGT8igJiJCU682miE+yE+0ut1KnabMk+ubPf9xZuXg6Xn7
         i509es9NbFjLphSLOWfCG24/f255kMPL+pck45DfXa8DbEG2nL7SCmVgnMIhmlPapOTc
         I0dhP+IkLCn4M3+gtGU7wrqc1vFsQ2gGOG4kufA9Ob8FncL+FkI/GAvqsapux9iiQAMD
         bZsrOy5AvIlMD5xx/DVv54Q4wH7wy3LgmeJZ5K6LApkvgHHR4Q1a9M0HFzK0nENY79AM
         IZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XfW/VwtrLWMZiQ+jQiAJFUp/vxYAvVxarx6R7M3NLzw=;
        b=23UzdW7Kx/B71Xt9NS3Z3QK867+V898ShBYNP4yq/Ay1qZZM2Pt6RKN2AL1G9rAf/x
         P1D3Mk35ru0sN/D4YDtafAsvZXVj4CsFJIIDDHXdVJ/b8xTncujmvSkISZ+JTOb90G+1
         titNXlI7nHyBsCvDiVDbiCLTvaSNh1clwWH3UtLTSjCpJvPU2BCr2N8/418yVXql3TjF
         2zxPSkQvICWnbnetMfqI2NPW8USThomR8F3Gwv/7VfQCYaxICSI/AnnybPE+CWGfXD1b
         4O1vc2aHQ5J8bTZYHyA9/hL9fCol7ezrDbj9pg6PkSPrilBIJDceFf2eMyz7uiYsDKX/
         sl2w==
X-Gm-Message-State: AJIora9vakS0uh4oczgYDPFLdpiSx0kEmqrNfViGABcteSFiF/ZaZnnU
	mEhzMAOSmftxqRQexEFVD9HkEDRIhNKX3UcP5eXYn3Je7ME=
X-Google-Smtp-Source: AGRyM1vKQnwhvoQofdNB0MEwK/QKGv/LjtJ95CZtJvpQ6lqMbLI4kkKCimwdLIHfgjFwNvtXilCR8wdIFzDBvw/OjBg=
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id
 f6-20020a170906738600b0071570243df7mr9908436ejl.543.1656280976621; Sun, 26
 Jun 2022 15:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220624102719.4166125-1-windhl@126.com>
In-Reply-To: <20220624102719.4166125-1-windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jun 2022 00:02:45 +0200
Message-ID: <CAFBinCB3=JWs78oC1GrZ_JkW56np1CAVkW25uST5hhYfoXxu-A@mail.gmail.com>
Subject: Re: [PATCH] clk/meson: Hold reference returned by of_get_parent()
To: Liang He <windhl@126.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_150259_895037_D1C07304 
X-CRM114-Status: GOOD (  13.34  )
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

Hello,

thank you for submitting this patch!

On Fri, Jun 24, 2022 at 12:28 PM Liang He <windhl@126.com> wrote:
[...]
>  these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig
Please note that you're changing some drivers which are only in the
arch/arm/configs/multi_v7_defconfig while others are only in
arch/arm64/configs/defconfig
I think at91_dt_defconfig will not compile any of the drivers below

[...]
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 8f3b7a94a667..54188319f349 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3796,8 +3796,11 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>         struct clk *notifier_clk;
>         struct regmap *map;
>         int i, ret;
> +       struct device_node *tp;
This function uses reverse christmas tree sorting, so the longest line
goes on top while the shortest should stay on the bottom.
Can you please explain what "tp" stands for? Personally I would call
this variable parent_np, but maybe "tp" has a similar meaning.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
