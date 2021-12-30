Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564CBC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GspQ4MRTgjTbGZmr0kP0vBLvGyW5lKmyiA4ND/vv1uc=; b=NGY6KVYLE+MZB1
	wHrspJ0XuhhP+JPZyz6HutfSz8Tj3BeCNDlONU2nLU2dLsSpfEN6J7JjHhzPN1vJdaGB/DSkZzf9L
	Q7XxQSgrTkVmK3KK5cKX+HG2zwK9ZkpjvPY++0t5Tp7oyvn6OBd8orxAmnJhag1aZPm6HKBicv40B
	s2ZWU/kpJDKPE+hZ8zVNBsBVtSOdYlKQJZCb4oC4sxsl+p5Qkt4QOsrYgpW6uJemhQeTgb2pto6bK
	GlYR3A4zz3nBhQVPp7P7ZvEiuscKOmWKyFCHuJHmoShny1keW/vv33LeCrugigl1NDxh9BvoLxNIH
	xHK/Z+qSy1YkdKAzpgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n33by-005JLN-2h; Thu, 30 Dec 2021 22:09:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n33bm-005JJB-OZ; Thu, 30 Dec 2021 22:09:16 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y22so102823462edq.2;
 Thu, 30 Dec 2021 14:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9fO4xO7NNKZaCmkJK0S4qOaQjqknEjPN6Tb/y58iIAE=;
 b=jB4HxVZtVS4EyhNwvAkbMTGe/LdlFRTxmCOzQDI89mCYySIaxJuR/SJdKvJ3ufUl/y
 nfz/N855jhI9UT7uzId0A7jJm7t80Tnjwb0vvzLnXtBYk11IdSlImbct7l1dXvJnri8D
 Upn+axPHiZZFsUWMIHBv5kX9INAwm8dbnHeCLRJL4BnbZZQKKPK+nMBzo1B6CEhfevdU
 4At2gSbhQM+iTHI8vTgkJA7rzgb9sVtQjmeEXXQRVihULHitylBLuEV9urMbdGNYp3En
 nineYS7rCe9amOt2rpGy0W45giP5ZPojrMleRQT5UsB6jYBBgjFmAbT9Q1G/aRawVLRd
 M1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9fO4xO7NNKZaCmkJK0S4qOaQjqknEjPN6Tb/y58iIAE=;
 b=W5+i+nboUKXgdoc7YB8rZEMcvpq7ETdCIREWMcy6pI2XrC3UdG11+AzgBHOG4LSoge
 NBacokH7ozjSTGA+YEMUjdnUbqQB3EjoGGYajMX340wdfBqfEyM6G2xNh/8Rf1YPVGIm
 SvEiNpCXWuNBCTRw6EjlwQ19tZhDeZGQFhEFS969d5U8By1CTedlkDcnDDvJJuZXkbhh
 Q/6UsJ+rtkPfPjgZVlh0AVVcxRon0s2VVO8y6S3xoxsnzeNp/hWOdfBWitffvUaFfg9q
 P2Aovy92YuDBe67r0JBossQWaQyy8TIHYb0A5/fol/8uC93FfrgYZNKc3+zaGfZ789lc
 Zoeg==
X-Gm-Message-State: AOAM532z/ruAOciwNep1qWLboOSaSxbZGvThXKMj1w3tSB6+ET27KrIr
 r1c4zvSr6JBrKeXvR4Q8hPjvB582Mk/g/tWZUho=
X-Google-Smtp-Source: ABdhPJwm1oRq60d2pmgoT5DTcTtrHQ23EXvLPaQWHXG3LWn+TVf6ggb3MjU0IpAfSWv+tjOdzX5jfHxJVZeCmnrjRvY=
X-Received: by 2002:a17:906:685:: with SMTP id
 u5mr25866667ejb.543.1640902153070; 
 Thu, 30 Dec 2021 14:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20211229121605.10513-1-qianggui.song@amlogic.com>
 <20211229121605.10513-4-qianggui.song@amlogic.com>
In-Reply-To: <20211229121605.10513-4-qianggui.song@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:09:02 +0100
Message-ID: <CAFBinCDPtiPHZ7BkTLoqpd1HiNQa1n45MeByzGHtHmK=-oOxzQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_140914_843446_9CA2B970 
X-CRM114-Status: GOOD (  10.25  )
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

On Wed, Dec 29, 2021 at 1:16 PM Qianggui Song <qianggui.song@amlogic.com> wrote:
>
> Add new pinctrl driver for Amlogic's Meson-S4 SoC which share the
> same register layout as the previous Meson-A1.
>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
Due to lack of a datasheet to compare this with I cannot properly review this.
Instead I confirm that this generally looks good apart from two very
small nit-picks:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

I suggest waiting for Jerome's review before re-sending this series.

[...]
> +static const char * const mclk_1_groups[] = {
> +       "mclk_1_c", "mclk_1_d", "mclk_1_h", "mclk_2",
> +
There's an extraneous empty line here.

[...[
> +static const char * const pwm_b_groups[] = {
> +       "pwm_b_d", "pwm_b_x",
> +
There's an extraneous empty line here.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
