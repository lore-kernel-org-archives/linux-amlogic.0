Return-Path: <SRS0=oAzn=ZL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A42FC432C0
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Nov 2019 14:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F13EE222A0
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Nov 2019 14:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="moYMUYgw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QThEqdE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F13EE222A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHf1z/Ay/cyQyaehS0u9fBKDti2MHGw2ccKrU6GjTko=; b=moYMUYgw5ttm/G
	HXg27DbhlTk35JRsu0ZQQXhSn8ityxOwJ3lvI8RB0WcYWp+CQzGVnG+KjXd34ImchFXyAxAX9mesY
	YhQjcpOxVpjOuLUUZo6jCsTHhqlo/DuxAVmNqgQe6urOGG/Cjfzbol/k+L4dGpBptZlHLz1l1ZQ3z
	qPWFK16QZYgMk3Qc+scuF7pSrJnF/oPGxpYOoLSE9wPNcGQdMJVWQRVT/MPgKzZJTg3AG3FaQOc1m
	FluOyW45Usy1YgS4VMG6Fis2We1Xga2rsog5aOkDX6KclnpDsbSAiuFxC5se3817Syu8nhu6NxPii
	82uT7bpf3Pt0e1oRYU0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX4vd-0006CT-Hs; Tue, 19 Nov 2019 14:56:29 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX4vb-0006BJ-44
 for linux-amlogic@lists.infradead.org; Tue, 19 Nov 2019 14:56:28 +0000
Received: by mail-lj1-x243.google.com with SMTP id v8so23688247ljh.5
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Nov 2019 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=In1zGBDOC9xdynfqKqKcIIm3nf1+kiAaNiGZnanvLvY=;
 b=QThEqdE2rR48X8oh0OxwIbdEI4egtNMX2nLjCHAmFesH7XsOljlFWzkSlgEJCooM1o
 9oofv6OFX2+StOidzMwZkInUb1q7S3iYe1jGQBVRMnZfOgswcDhgDIWyKOAf1FCD6Rba
 XexJQjvzoZgk++lHzrQt26VgsTLJOx+TUHxlLHOeTK0MJEgCIpwHfRwVqJPlUzHxt9Zb
 /zQmjaHME4cmgDYw5AkgqfCHdJuboeYIpGoueKqYWs0vXtUAB+SkCD6YY4Fo0JRrpLh6
 H7lOZvbGvmSmFckDGq++HhacqpYwrhABTGhOFbyLnnmHLSRxvnwysAiHcwDZn8jbvU6f
 luHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=In1zGBDOC9xdynfqKqKcIIm3nf1+kiAaNiGZnanvLvY=;
 b=TEPbdMV5ooPLP5Djj5Ief5zQBcInQ28D5f4dkIqNzs2hST7+NXt7vl9Gs1t05clJkH
 1nI6gtEUY/Pz/zMxG8XC5W+Ia2t2AkxPEo5vKGIewXdXefyfZ2wMuqZrOnvQe/6LmIu2
 HZyOYPS2nSDOUCxOC6dBWcfnaJfoz+8aAc+NLmUSB/FKOH9UZZVuHy8i1SGzG6kcHQ7k
 xJcKEtWjTCXInT3GJAnp7a7Xejb4+QXeOqXYsEeDw3mHoAeYPEAeN6ZqW6/JJmGfvhgy
 adyYiBqxSk0dD1mV6UEnV2bY6Z2F5vuedQ4FQIH0SeQZQnYsTrZMOJt2URGuHOBWH5LJ
 cr+Q==
X-Gm-Message-State: APjAAAUmXNURFV91VKbNLEloMMzzeBvZcJGZ1BaShEsaaPMaZTT3ESGe
 xOjTWjkpeiIxAg6PlBfDbeqla1dpatEUYBSXQZSCNg==
X-Google-Smtp-Source: APXvYqwcjOU4MhPKyzAkwDWLM/doKxPzlCHlBi90UnHt7hoHtMGu2PLAM9oNBxpASzc6YLHCH2EH7pH6HA2mWJ6HL6A=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr4283993lji.251.1574175385648; 
 Tue, 19 Nov 2019 06:56:25 -0800 (PST)
MIME-Version: 1.0
References: <1573819429-6937-1-git-send-email-qianggui.song@amlogic.com>
 <1573819429-6937-3-git-send-email-qianggui.song@amlogic.com>
In-Reply-To: <1573819429-6937-3-git-send-email-qianggui.song@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Nov 2019 15:56:14 +0100
Message-ID: <CACRpkdbQ08ivkyVnuy_+=YqHXcXQDUY8aOpp6evdGLofe3FM0g@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] pinctrl: meson: add pinctrl driver support for
 Meson-A1 SoC
To: Qianggui Song <qianggui.song@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_065627_178994_7984D9FA 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Carlo Caione <carlo@caione.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Nov 15, 2019 at 1:03 PM Qianggui Song <qianggui.song@amlogic.com> wrote:

> Meson A1 SoC share the same register layout of pinmux with previous
> Meson-G12A, however there is difference for gpio and pin config register
> in A1. The main difference is that registers before A1 are grouped by
> function while those of A1 are by bank. The new register layout is as
> below:
>
> /* first bank */              /* addr */
> - P_PADCTRL_GPIOP_I         base + 0x00 << 2
> - P_PADCTRL_GPIOP_O         base + 0x01 << 2
> - P_PADCTRL_GPIOP_OEN       base + 0x02 << 2
> - P_PADCTRL_GPIOP_PULL_EN   base + 0x03 << 2
> - P_PADCTRL_GPIOP_PULL_UP   base + 0x04 << 2
> - P_PADCTRL_GPIOP_DS        base + 0x05 << 2
>
> /* second bank */
> - P_PADCTRL_GPIOB_I         base + 0x10 << 2
> - P_PADCTRL_GPIOB_O         base + 0x11 << 2
> - P_PADCTRL_GPIOB_OEN       base + 0x12 << 2
> - P_PADCTRL_GPIOB_PULL_EN   base + 0x13 << 2
> - P_PADCTRL_GPIOB_PULL_UP   base + 0x14 << 2
> - P_PADCTRL_GPIOB_DS        base + 0x15 << 2
>
> Each bank contains at least 6 registers to be configured, if one bank
> has more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included.
> Between two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that
> is to say, for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24
> ,0x25 according to above register layout. For previous chips, registers
> are grouped according to their functions while registers of A1 are
> according to bank.Also note that there is no AO bank any more in A1.
>
> Current Meson pinctrl driver can cover such change by using base address
> of GPIO as that of drive-strength. While simply giving reg_ds = reg_pullen
> make wrong value to reg_ds for Socs that do not support drive-strength
> like AXG.To make things simple, add an extra dt parser function for
> a1 and remain the old dt parser function for only reg parsing.
>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>

Patch applied with Neil's Review tag.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
