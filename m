Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A9EC4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 10:17:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F482151B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 10:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F482151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZIEviTcL5PcPYZpJBNobFG6T63YgR2tdcqDU3GE9duo=; b=V8CaqmrdIgzsTD67740CeOGPn
	IIjDVvxXJJCpmKqlx78sTWRcjxNLhUPp8eS50MDBnBh7/FX1/DNhc9/yPuGoDoATch0GVspQnd34t
	JPakvkShoHVSJTUAdijNgWo4CeaB8sjT1VOklTDLoEkyJKk5Kw/lE+i1zR702OY/7h3k03JrhYMou
	kvye4393w5rEWVJn6m7bWk6AnpPNYRFK8670QwbLG9AfwccQ1X5C5ydjBB/68QCj/tv+5b/gVtXOz
	YpbDCjJOy2bhNzerpvgtXEGs/qUga+737BuFuFDhQ5asLnqvzpj7zHNxKJfUPCnwiIeK+AoIHJnRM
	z8J/JTw2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDaW-0004je-7M; Mon, 07 Dec 2020 10:17:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDaR-0004iX-Ek; Mon, 07 Dec 2020 10:17:44 +0000
Received: by mail-pf1-x436.google.com with SMTP id 131so9384061pfb.9;
 Mon, 07 Dec 2020 02:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=szht+q557K6QXYFXak80NbTgGz6XROzE5Ko0mOeRIdw=;
 b=QGLYL/hY/ySDQqquUqATa57X9iZKoJ1oZeCdqFTuCFGLPs6+LSt5T6wuFDp/gLRUKg
 4bZcVB3HXmtx7NJkXKCnH/iMgHsHUfKRMeAJkBqKUaoo7mOQPRBZymdIlz75HM+oW4KC
 7WsfDIv5qIDRkZbc9/HmUhA6lB+O868Stkxe+qau/c+Ks4aATFO+tqX9yzSKo/SvaB2X
 JPB7YXp/tUj8eGjh9kH9jJN0dCt52TsfozvS5AAkg09XYaMc91lFnJ4x0OIZfpo9b7cO
 gHuPmf1QfXFENDBMpBUYyaHoVWqmS38E7OqPPtcU46heVqaITq7osc+NZLSxR6euxHin
 2uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=szht+q557K6QXYFXak80NbTgGz6XROzE5Ko0mOeRIdw=;
 b=KGAQ7V8qSSu8gmhGyjxMNUY0i8BuCgjpJl+G138x3FCIIW61YS4dm6spgJKirxiyZD
 8KinPFVZ+ldAEh4nj5CI7Z2tHMstjgDKwtrDU/wmMvrfrLB0YO+D/MfZPXev8nChfote
 xy3j2rTZe1SOi8hdOiSxT5Hm9glRZaNF7+FGdxi5uffwKtrx04GohN0jg+iEktKZU8LB
 gG1nGT/btOt2g2W7F8pvU7A/7UtZP+CgEZ1TIiwQQpMsMMwZLaJI0D3yA0PPOWg6SOdo
 m+ClodJ2AUKhq11Sa/ArX7bTmWfujQo4eRzYh/oduaF/7KgIB3kQ7MMAzwfYJ30ek5fI
 rsgw==
X-Gm-Message-State: AOAM532J50JGaotQHyBladlVYoKVyKfIWsBjjT6GoJUY5BoY/N0XJ4w2
 GGeArhexitdJBJclMQ6+cpV9F1KVd7muj/i2fUM=
X-Google-Smtp-Source: ABdhPJzNPheYkcqjCTxjnzfr8Z04g6FUo9B9zhpTBRJtKnCdXL0ko5vzAVHOrSXMNCyS6Xn64kSx7RF818+ol+aiJe8=
X-Received: by 2002:a17:902:c244:b029:da:e63c:cede with SMTP id
 4-20020a170902c244b02900dae63ccedemr8008417plg.0.1607336261018; Mon, 07 Dec
 2020 02:17:41 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Dec 2020 12:18:29 +0200
Message-ID: <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_051743_541832_264E355B 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: narmstrong <narmstrong@baylibre.com>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 khilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:

> This HW only has 8 irqs that can each be mapped to a pin. No direct
> translation can be made, we have to allocate an irq to monitor the line.
> So when gpio_to_irq() was called, we had to do that allocation dynamically
> to return a valid irq number. Since there was no counter part to
> gpio_to_irq(), those allocation cannot be freed during the lifetime of
> the device.

I'm not sure why we are talking about legacy API which should not be used.
Besides that I didn't get what you meant under counterpart API (IRQ
descriptor has a mapping to the IRQ chip which keeps the mapping to
whatever hardware wants).

--
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
