Return-Path: <SRS0=pqGQ=YC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A15C47404
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 07:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9696D20B7C
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 07:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EazGx20R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjvQivs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9696D20B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvWHqBrOmGVYLxNYRX0ekq0gWk1YDM/7Qarmr2hZiPI=; b=EazGx20R6ICZES
	lfcmJPdQe+Sr4RUSfy0VGS8LVF2ZEjZ7HnGT1s7Tv4QJ+SRGYpDquhR9pJ26iprP/HjoqB6SYY01K
	cmHJqUN4tBONPR6NvTJHWOgV69o0M2KGDSEDZxGSJVLoyJ3vwuEDpLel0If882neq0kgQ+5AIE9pk
	uGH6W+VEvgMzy8fjsb4x536vE6nL19kaIUnbOlPvVHQucswpWZwpULbUBHee3ELvXcc4stRjxDWXa
	zqMCApqeJ+II1JFZ0Owt7aaf+vMPWhB1fU1PcvjU0O16mUtuKapbHJdzZM/UUWyEvyd85Nrahcf+M
	pGPpvec2VL+A+BZvcBZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI6gR-0003RO-Rr; Wed, 09 Oct 2019 07:46:55 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI6gC-0003Dt-M6
 for linux-amlogic@lists.infradead.org; Wed, 09 Oct 2019 07:46:42 +0000
Received: by mail-lj1-x243.google.com with SMTP id b20so1447591ljj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2019 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hZEfc+r3FkjJNXGg5OrQndZ7EVhjrXvy0Arp8Ba6y3Y=;
 b=wjvQivs+C+mNfu/kBT+oqZ7KD4q6+IZ5Kth6hhfGFbltlKdqAJ38C7ajvyZ31te4gJ
 C5EqhO//ZRTNxmVHsnWpL4FPvGmq6RGPaLctgOfRFcn64vZmRPcZzkMMWQJ5TtpYGxOS
 ++ZFPLLjrWzBCECqMtnDgmicGmA0oWmKIWQeYM/ZOxDhwuAVKbdEN/zSfWvAA3hLQZZq
 ubaT/P3ZZ59MYBEbi3oE/Ge+OFG+iQYKsWIiR5Ef3yKK7kivB5XTNZls9k74vNap0dO9
 ytr/crl5hSQEYBvLZjmMXVpBhkzUNMwtOdUVNlFdxRC9uu49L9C1IMRlaxaQ+WnE44XU
 dFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hZEfc+r3FkjJNXGg5OrQndZ7EVhjrXvy0Arp8Ba6y3Y=;
 b=MaVzjCwr7meWG3/s+iLconKyqFWFXPLL6F0jGAIsz/dU7dhCxwKJeRmLB/pZ+8dj0Y
 igedCbhYmKHy8bzTP/qi3EYs8PwsoGPQAub/SlXOw31Q9mY+ry/+4wWnnM1kNnDzeCW/
 oWlvSZRs2A3Rq/AugXgKyPzACVsuzHK61zGAqQ4dlaY7xeQmED1HljVwc+p901eYV/ZC
 w/UeViiK+tPxoFDZgKr1kLK9XJh9aczFybGsy9sU8VQqYtmynzXYHZsaZJ3TPKjYAJEf
 WEyDdUVlSQuaAQPamYcCW+6Mg2YdF3XPaxqGnhM1tb7EipzhXmrkEbhR0GSbmOA3FgR0
 5jVg==
X-Gm-Message-State: APjAAAXG3b/fVowFx61Rhugl/dmsCZ/krG5OftLpzjYsclggxY/z/XfX
 PwgQNExV9+aFwmYZKk3w1VNhF2Y45hUeVoHW3LoIgg==
X-Google-Smtp-Source: APXvYqzKb6yyez5/a7eDQjEjte0+mGMXwCtZbVyeffNWrWYP4x2euviqJJy4ezdD4TVfujVbQ0UR4GcHrwjyGqp8gXQ=
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr1435527ljg.118.1570607198839; 
 Wed, 09 Oct 2019 00:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-7-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-7-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2019 09:46:27 +0200
Message-ID: <CACRpkdY5x3wG4h6Wm_L5OXWXB7SPqHimUFOQa2jOeqDETWciYg@mail.gmail.com>
Subject: Re: [PATCH -next 06/34] rtc: coh901331: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_004640_733330_A75CD47A 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Baruch Siach <baruch@tkos.co.il>,
 Patrice CHOTARD <patrice.chotard@st.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Gregory Fong <gregory.0xf0@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 huang eddie <eddie.huang@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Oct 6, 2019 at 12:32 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
