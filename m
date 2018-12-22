Return-Path: <SRS0=jkUD=O7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B76C43387
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Dec 2018 17:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164DE219D6
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Dec 2018 17:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFYmt+A0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Hk7/tOSk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164DE219D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vckoGScu94m5SFErj/fxKMbuBfPZ6yhgXlnfRM8PaVI=; b=fFYmt+A0FXiobS
	wKhFPnF/jRercKbx7Q1oCu1ZHzZ3K9YSKq6UB9y3GItyhuafL9ZhvDnsY4nxW2Tn/LEiyuf9GM2oT
	BUhMEPopwTg0EK8/RBJ2LAOxZv6e4kF78JOF+v7mWVk9zHGvnCoO8ahnkyW+r43aA9EEGgPWYRI/z
	pqH0c/LOJqKUZs/w0QYPzLzf989qkwC246rcVWNFliCrUfZ4YrC0nWfBRf3EuBAiEzOr0Ucct4cBm
	V+63hcUHCjPxhF2/Uql2KHs+J042GQrBYytkA1YNxknib9zCFqzlqYE1FOpaCdlHbKgwf22qfaQYY
	qycvgyvyPfY2ZI7ugJ0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gal4e-0006HK-9j; Sat, 22 Dec 2018 17:28:28 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gal4a-0006GN-TM
 for linux-amlogic@lists.infradead.org; Sat, 22 Dec 2018 17:28:26 +0000
Received: by mail-ot1-x342.google.com with SMTP id k98so7948473otk.3
 for <linux-amlogic@lists.infradead.org>; Sat, 22 Dec 2018 09:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJmJivfBFqLOcN6TtpH6HpKHEyAijaY/EYqQyvBRsyY=;
 b=Hk7/tOSk2lTgpVxfoZmtLgCG/Cz/dSMP0rDKgKJ3WJX80th/1nGSKiGZHU6P6+HnMf
 KuGwrhGoDBA1RKzzDYsCkBgcBRfsnLvDLgRE090aT2swNsf2h6msbXHAeeP7/JWtu7wf
 HNAfMRS9fylDJsFp0HJgX8Xl81wDUnDQ7glsI5+aG4rADCX4b3AyknshUy0VQfEoS5QT
 wzZ8cJj8rgJHnRyZACnSUlfz4w71A00StynPZSOpBW0RpxA/i74Zi9DLVHjroe4/3UjQ
 S796DxZjmdAvCJSCdmYeHERfnYk5aUWO8JEf/fka/t9t3ymvkji2sIpBlihY95nwBzLG
 r6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJmJivfBFqLOcN6TtpH6HpKHEyAijaY/EYqQyvBRsyY=;
 b=B2GYMSgU9xfsfPhZBxiO3rKHD2GF3kWkY+n3PPtCFkb6sr6h/GBBAsSh3LwNYZFEv3
 1jNnJEj6J4deXbH+lqmjLgKJZq0FqDQUwgdKoI0hD0dXCGVIiZYDCOvzrmIamszKocmx
 bIf51F96nxnZzQt8j9QCG6gFM+wx0++ZxPPwAc3Y4AFywuZiVwSXbuoJ5XXfQorNeix+
 8F2x6E6Nqf+eLF7PoUsJW0obNDSs562mksgN5DhMOM3rXzlZyN/zTBX8H+BQ74Ke4Jo9
 e+F3lZ5gxAjc58pwAwrWgJeItQgYpGa0PWiHLwLpMCYrckSm7Lg3+vAQLk3Bk//SryTN
 0KyA==
X-Gm-Message-State: AJcUukfkIwktU99sMkXn0huDqOIyc3mItc38hpwd9155syNkd+ZB0p25
 WEZwGQKd5OQ9H/4xvxQmrvJtA6rJkOPx5SCy0O8=
X-Google-Smtp-Source: ALg8bN54gfw5tixjH1TSeMscrYxm3+6mbfhLbTfOvL97Kk5ron7b5GnyKGWXXFYjJiRPly3z5enNakahWKyrTB8DLMg=
X-Received: by 2002:a9d:a48:: with SMTP id 66mr4797932otg.308.1545499693815;
 Sat, 22 Dec 2018 09:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20181206151828.24417-1-jbrunet@baylibre.com>
In-Reply-To: <20181206151828.24417-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Dec 2018 18:28:02 +0100
Message-ID: <CAFBinCCUO6ihxNWDup5ZVKWBc8+oiW_-j8OUxRhb+tjpGsUBkg@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: meson-gx: chained descriptor fixup and
 improvements
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181222_092824_952494_EBEF987A 
X-CRM114-Status: GOOD (  17.88  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Thu, Dec 6, 2018 at 4:18 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The goal of the patchset was mainly to address the following warning:
>
> WARNING: CPU: 0 PID: 0 at /usr/src/kernel/drivers/mmc/host/meson-gx-mmc.c:1025 meson_mmc_irq+0xc0/0x1e0
> Modules linked in: crc32_ce crct10dif_ce ipv6 overlay
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.1 #1
> Hardware name: Some A113 Board (DT)
> pstate: 40000085 (nZcv daIf -PAN -UAO)
> pc : meson_mmc_irq+0xc0/0x1e0
> lr : __handle_irq_event_percpu+0x70/0x180
> sp : ffff000008003980
> x29: ffff000008003980 x28: 0000000000000000
> [...]
> x1 : ffff80001a71bd40 x0 : 0000000000000000
> Call trace:
>  meson_mmc_irq+0xc0/0x1e0
>  __handle_irq_event_percpu+0x70/0x180
>  handle_irq_event_percpu+0x34/0x88
>  handle_irq_event+0x48/0x78
>  handle_fasteoi_irq+0xa0/0x180
>  generic_handle_irq+0x24/0x38
>  __handle_domain_irq+0x5c/0xb8
>  gic_handle_irq+0x58/0xa8
>
> This happens when using the chained descriptor mode. If there is an
> error, we call mmc_request_done(), loosing any reference to the cmd. It
> turns out that the chained descriptor does really stops when we do so, at
> least not completly. Most of the time, it can be seen with this harmless
> warning because the descriptor will raise another unexpected IRQ. On rare
> occasion, it will completly break the MMC.
>
> This is mostly adressed by patch #1.
> With this fixed, I took (yet) another look at the ultra-high speed modes
> and the tuning.
>
> I came up with new settings in patch 3 and 4. I've tested them on eMMC,
> sdcard and sdio on the following platforms:
>  * gxbb p200
>  * gxl p230, libretech (eMMC only), kvim.
>  * axg s400
>
> So far, these new settings seems to be working great but I think it
> would be nice if others could test this and provide their feedback.
> This why  patch 3 and 4 are RFT tagged.
>
> Jerome Brunet (4):
>   mmc: meson-gx: make sure the descriptor is stopped on errors
>   mmc: meson-gx: remove useless lock
>   mmc: meson-gx: align default phase on soc vendor tree
>   mmc: meson-gx: add signal resampling
I gave all four patches a go on my Khadas VIM2 Basic (16GB eMMC).
regardless of whether I have your patch applied or not: eMMC
sporadically fails tuning (if I reboot the board a few times it starts
to work)
[    4.172686] mmc1: tuning execution failed: -5
[    4.182535] mmc1: error -5 whilst initialising MMC card

I'm not sure if this issue is specific to my Khadas VIM2 so this is
*not* a nack for your patches.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
