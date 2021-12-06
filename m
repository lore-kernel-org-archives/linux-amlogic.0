Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E352BC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sj/qXHfRkeJwO3FajE1tKewhL9QT7PPEZI4702ZV55I=; b=m5l6bp6bRFSN+x
	kaA4QWYD8gmopn8X75AOaoYbb0K/1KQmMBDNa3nPmJbZVun5QA4QiHCDm0qxMDQGERYj5Vsh/aegR
	fBGnrd+Uat53vHMPIuUmGcNP9aNHsWG+/dOAQBfwQiqzlF2ZmaZUPT6nacEhh4xXVUEHfMcUajOfk
	U2+tKtkHwAJxFSpL9FermkSjt+KqWRa6hFUyn2KJM8oSgKx7tLhNDZKIos7A5gQT3dzNfvy03kV3W
	DdoMVzya2XGEqZNoehaA9hxK4TlOJEQEh2w4liq+Z+G5SA6P8FtVkcpjnb2PAqOQD6pfypn7ABImt
	SX1eh7+kQsszVTV8rSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLS2-005qiU-7h; Mon, 06 Dec 2021 21:23:10 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLOu-005pLm-P9
 for linux-amlogic@lists.infradead.org; Mon, 06 Dec 2021 21:20:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id g14so47918005edb.8
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Dec 2021 13:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=npVIllIrzbanEnSWMWYv86vweK4sS4wEJk4Mwyduuyo=;
 b=Pn4keIE7pu0NvrTG9cm2WG8BpLD9VfYMriDuW+LBng1Fo/8YfSzQtIfgbKV+yP6DP+
 0pGx9agAGyWkdecELWKTMsuI2HKt/C3nOQdL9nfUmMgjTuiXaSfjKEyVx9es4lPdq3qh
 QvYEckGJzBjJDfH74z3nQSmZwNkRsCCfoqrzoSDeF57OCWZfjTjhDCxbBH3gtLH7+CR4
 vWckSMzRbY10P9wEyXEY46OpX4n+2jZUYwKTpWfiCyuLLgvMCb689QCJ/e/sqhdpWGra
 oTvK13K0/WfUl4zUIkhquYp96GKzwsHevBs/YUMiOph2CbbbuHoMp128iWwDOpU1MIbE
 NLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=npVIllIrzbanEnSWMWYv86vweK4sS4wEJk4Mwyduuyo=;
 b=r75gWqy0+bLkwuEGRDbNVZ7faur5Wzu85Lj/61yHZy7StCTJQW+zF9y3r0eIcpbWZ+
 zQ9dJgGZIOw5g6bsvgdBKjxzZrCvSw1HL2h6A4FmvR9FZ3U0cFH7KznDK0YzUoJURYOO
 WlEzaLjG67QpslqWHqT64ieB538EpCOJDVSla/a2uM0m3zCYXGf6ci7j94JTO1nO/Qjz
 YngxN/T0+UobTWfD6s8muEuy/MxJJfYiFtyk6MB/cmdvzAQJ9m7ln4gc9u8eh+KSo3hU
 qmt9ZKmqro16m8adK/Dz1XxsBF9aef0tVFQAWM4kfqjXyy7/ulX4vEZvcmydM+SN7jRU
 xJNA==
X-Gm-Message-State: AOAM5335/JTwgX/Hj7jbqUV3BH7HZogDNmXZFOPZM4noTSNEVSKtFLdU
 wHU60vO8FYMc1ii+sRrU2IkQL1rDapC9ihq+b1Q=
X-Google-Smtp-Source: ABdhPJzg5usv5f0RaSqWg9mf7QzcFnAMff1LKR1fQBgsK2p4lTLH5w1ZlTVKL6A8Jz5Sj2CrhyAHKuW6LzqUDQ6MGIA=
X-Received: by 2002:a17:906:229b:: with SMTP id
 p27mr48499254eja.264.1638825594626; 
 Mon, 06 Dec 2021 13:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20211205215846.153703-1-aouledameur@baylibre.com>
 <20211205215846.153703-2-aouledameur@baylibre.com>
In-Reply-To: <20211205215846.153703-2-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 22:19:43 +0100
Message-ID: <CAFBinCDZ2nTg2V_6qxok_y+wXHTVJ6XyyvON59TLJZ9B3fKY3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de
Cc: khilman@baylibre.com, balbi@kernel.org, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_131956_869195_BB74C7C0 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Amjad,

On Sun, Dec 5, 2021 at 10:59 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use reset_control_rearm() call if an error occurs in case
> phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
> phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
> and the reset line may be triggered again by other devices.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework. Therefore, use of reset_control_reset() on shared reset line
> should be balanced with reset_control_rearm().
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> changes since v3:
> - Remove unnecessary reset_control_rearm() after reset_control_reset()
> failure.
I double-checked your patch in v3 and Philipp was right:
reset_control_rearm() should not be right after reset_control_reset().
However, I think reset_control_rearm() is still needed
phy_meson_gxl_usb2_init() whenever clk_prepare_enable() fails.

So my suggestion is to add reset_control_rearm() in
phy_meson_gxl_usb2_init() if clk_prepare_enable() fails so we are
resetting the ref-count for the reset line (just like
phy_meson_gxl_usb2_exit() does).
The difference compared to the previous version is that the
reset_control_rearm() call needs to be placed a few lines down.


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
