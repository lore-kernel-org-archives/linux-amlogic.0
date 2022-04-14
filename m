Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85113C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbvbMSly/PaTXTSHgkMhXCw91IRe9kta9Z9aFsE7WOA=; b=QHPxVnd5PdH8u/
	HVwVB1CZGJO21YWDQCk+xTn83zyv1UBXA7BAdYpI7vTnNkU+f6TXb0nHaYODHgRa+J3933MpziJV8
	Vw5A9HR8ajXSZNVVhKHjNQMqhI/dnxvL7CdpphgeeWCkpo4/KD+fPYa9cqbl8Jk2ynt89bTZR4YSA
	Ld4bc1/U3ShZ0ZRzx+LvnWRN/WvPyxRzLdSRH+B0qfFbUylFnsHZ/8SWvR7EKKmV20ZKWfFK9/4xR
	ITWqCk6CUZIOfDjXdxQt7UOLlKWPKEJGbSe+yab4r5Djfr4uMM4k2n7q1cS8MR8XB2f796MS5SMCS
	OfBFnaFJzRKjGqn2Hgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neztL-005t4a-Rq; Thu, 14 Apr 2022 13:52:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neztA-005t19-5p; Thu, 14 Apr 2022 13:52:01 +0000
Received: by mail-ej1-x62e.google.com with SMTP id bg10so10200150ejb.4;
 Thu, 14 Apr 2022 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkVkOAS9A0MIQPbsfpNua8Mc2ZR7CENLAnkVniIdPoc=;
 b=CXFcqAASxG+Z7VaPl8afDddAJZU3KVfQsH4a1JGZ1EjQwUWtZOh58dCXqu1CRt0nRH
 GbroBEhSONj1yEyS1nlMjO2dTZs5iIHj3amuNDroTKV8vuWjGlUxmp6N8l0rJzVuL9iS
 SK1pfqweFFp8qNmsy1ouvojo1qwb0OkgYbmw5cI1wWa07tZDoFoyAqHiu63K1oCpvGXv
 JCFOxbvoB1FH365GTO/MeElQ0rQQ182PE1dbIz0Nw0J7NGFvquCeeFsdv6sqLOE6QIn0
 C7C+hEmjvWZeIfvuZm9FyH27VeOaKjraYed4fP9gI2wtI0kf1Yw8FEPqUkn+IykqKHnl
 lMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkVkOAS9A0MIQPbsfpNua8Mc2ZR7CENLAnkVniIdPoc=;
 b=liZ75Okag0sFPZTje9Z7ODkwtycWFYjFvk/cHNqHN4+53lT37532Lx9LiLfAr37+3L
 wPDdcaYfsDnbcK6UZRqLexVdm2gwQA3ZAIARAAaWf4x7zHcKFkQsbIfMWL7kQ+gtEm9L
 toOpBqUgbs0all4IGSDO0mEAgfdJElBZFofjpZTz4iIx0a0dhp3xPB7tHhXAvSYuEPdJ
 yEKgG6NeOgjsW8kRiQ0mfKGxHMdcezfHSq9rUJ+miaoZeflHDJEIG2q+AA2Hye5TNxKu
 ojIE23Zq+6YgjK/8Ji8HN+j+BU/ob8syrs+vutjjCqMfNIzxBeM+YAIYmUNCp+1e/6m7
 dWmw==
X-Gm-Message-State: AOAM532n2jAwA5AMmFYZvZQU0WXC0hzgN4qnxNmdiEJh9o1E7cOPt5Qw
 I7t76pAqCGmu3fM1vVRUjQbHbvWh+aF3kgIRzPLUGucgIg7j/w==
X-Google-Smtp-Source: ABdhPJxL5jFoyaZVlB5dK/sqGFzMiTnpEAX7i3HpaSvcMs3Sr81F+WGQbyWSGSsYbk2dWKrwQ76KhtaYazmSqwcH7pQ=
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr2412944ejc.132.1649944315429; Thu, 14
 Apr 2022 06:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
In-Reply-To: <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Apr 2022 16:51:19 +0300
Message-ID: <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] pinctrl: meson: Replace custom code by
 gpiochip_node_count() call
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_065200_252263_9BC473B4 
X-CRM114-Status: GOOD (  11.30  )
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

On Thu, Apr 14, 2022 at 12:44 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 01.04.2022 12:36, Andy Shevchenko wrote:
> > Since we have generic function to count GPIO controller nodes
> > under a given device, there is no need to open code it. Replace
> > custom code by gpiochip_node_count() call.

...

> This patch landed in linux next-20220413 as commit 88834c75cae5
> ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> Unfortunately it breaks booting of all my Amlogic-based test boards
> (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> boards are unable to mount rootfs. Reverting this patch on top of
> linux-next fixes the issue.

Thank you for letting me know, I'll withdraw it and investigate.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
