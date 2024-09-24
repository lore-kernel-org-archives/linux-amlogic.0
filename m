Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598FACF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7u3l3L36kCvC+U5s02ZzzZq5+poU5fxPNjBZPRNcJI=; b=OAJl4U4F5eDD84
	ijmiASGWRFPPhF5rlbvEW1Z1Q6Z3Oa1tZy2Gs5/JSH5y/wujKz4Wt5z6lxv4Nf6QJCHDZhulKbBfR
	Bs3MT+yCXS9wuWfDp07Vtjdcp7Wi4jEx4fcNBn4hR7Z/Uh7WHd00dWDdKbUBmF2xIwz/L5iY/kTy+
	LZs196oYsy/OzMo+YFxKloRhheZGDVnpltFVQS/t9GNVtTeDldIsafgYUZGCZvnYsdz+Ua4T8nw1H
	M49t9jDoLToSCkno9cRx9MxQhpFG7FDL3LSusrZDB3ZERK3It194J324YniNj/sXSOuebhUCoVCBx
	iRtQCYKf0EPsrfuXPqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st12M-00000001cNK-01aM;
	Tue, 24 Sep 2024 08:36:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st11A-00000001c8w-381o
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Sep 2024 08:35:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42e5e758093so45412315e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2024 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727166930; x=1727771730; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajeLGRjVvqIoh7fHFa/mBoUm6iFMTd+Uc6vP6nnSb0w=;
        b=0ZoVZSZm3CoMis6OXHmC+fjJIJo6rXTvDB+YxHNKC/2MbVJlcCcLuXy8ZY6GJHp9W8
         x1fgGCxiOabLkFyuLHjYBIuA4o9SeyWuTsOoC+H2h0YcFAtdsoPuHQFwbemVZaNpl4Ba
         nRUl3F8EeyoRtwb5me85ZdlZn/PLkhZf0UI7+WBGopZcbIT4JkqjjI+daJ/dkpT2kdKl
         5gBQ8GiIDdlvojfEv9VU0mV5FclmXoWlLjgkTD1916dY9UC8VfR9Pzh71JDB5TsQ+Jt7
         u7xLn4Wbp2Bkg+uLFO+DDGd8rOOyfp/LbWnGPUW0i0ISAkxHkKr2V/Qio/XUMydf/rqc
         d+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727166930; x=1727771730;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajeLGRjVvqIoh7fHFa/mBoUm6iFMTd+Uc6vP6nnSb0w=;
        b=lAFn7JYWIMVsnW2nFjtHJSg6jXljI2dPYs51P5FcSvocIAKPVdehth20wmKXHb4iHh
         FbY0as5dZOE9Q+DofsfWqrg/cgS+lx7xc/9s23nmXcfe+MoN0XxmJ2/X7Lx7OPpmbEy7
         Lv6gwSOj564X/LEaROnMJDjtn3uYGDDiEiScV/4KLsKsSYUS4XWY1DioKtrLDSTLbqKL
         0oV1WLEYhvLweU15az4aAHP29TQfTgmN2I5ymOqrggSZBAoqjHY+4OW3bIyR18HuGesN
         8MHYHyH+gY46mXzSDMaVw+Ox84wd5dNam3am5UwZj2pwrGrnMBq4e0lW1YSQM3aO1kAT
         Nzzg==
X-Forwarded-Encrypted: i=1; AJvYcCVlOK62kl0xMJoccl3cfnZSjsOVJLWSlDyZ10ZhTGXYC5YXu3j42bcWuSG+dBhZ2b7hdVxH2Wz4W8b4dMex@lists.infradead.org
X-Gm-Message-State: AOJu0YyZsf9H1SlRZ3qvp2vuX31EO7fCEZhIJaS0Tr9eeXgFWdqn0K87
	YjIxD6/nL+sKzvcxwapIchZ4EcYiUMsrONJAXWdrqIZHBcUS0FaKoPyKec0hLRc=
X-Google-Smtp-Source: AGHT+IHhTgBXiAq5c+olVcBWWoivRLr76awcJwTLO/O9wNbJguyL/g7Rk4pyYzb8CS+Nk0zSGxEACw==
X-Received: by 2002:a05:600c:3ba5:b0:42c:87dc:85e7 with SMTP id 5b1f17b1804b1-42e7ac23e28mr98263485e9.18.1727166930213;
        Tue, 24 Sep 2024 01:35:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:885c:440c:fff5:ed00])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e902c66d0sm14303335e9.41.2024.09.24.01.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:35:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: meson: Delete a meaningless spinlock from the
 MPLL
In-Reply-To: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com> (Chuan Liu
	via's message of "Fri, 20 Sep 2024 16:16:10 +0800")
References: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
Date: Tue, 24 Sep 2024 10:35:28 +0200
Message-ID: <1j34lpzbxr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_013532_820696_991D2E56 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri 20 Sep 2024 at 16:16, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> The existing locking mechanism of CCF can effectively avoid concurrent
> register access. struct meson_clk_mpll_data has no meaning in defining
> a spinlock repeatedly.
>
> In addition, the register corresponding to MPLL does not share the same
> register with other module drivers, so there is no concurrent access to
> the register with other modules drivers.
>
> Every driver file with mpll defines a spinlock with the same name (even
> if defined as "static"), giving the illusion of repeated definitions?
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>

I'm ok with the patch in general but I have problem with the wording.
The lock is not meaningless. It has a meaning but it does not serve a
purpose, at least not anymore. You could write that it is useless, or
superfluous if you want to, but not meaningless.

Also, please squash the changes. 1 patch for this is fine.

> ---
> Chuan Liu (6):
>       clk: meson: mpll: Delete a meaningless spinlock from the MPLL
>       clk: meson: axg: Delete the spinlock from the MPLL
>       clk: meson: meson8b: Delete the spinlock from the MPLL
>       clk: meson: gxbb: Delete the spinlock from the MPLL
>       clk: meson: g12a: Delete the spinlock from the MPLL
>       clk: meson: s4: Delete the spinlock from the MPLL
>
>  drivers/clk/meson/axg.c      |  6 ------
>  drivers/clk/meson/clk-mpll.c | 11 -----------
>  drivers/clk/meson/clk-mpll.h |  1 -
>  drivers/clk/meson/g12a.c     |  6 ------
>  drivers/clk/meson/gxbb.c     |  6 ------
>  drivers/clk/meson/meson8b.c  |  3 ---
>  drivers/clk/meson/s4-pll.c   |  6 ------
>  7 files changed, 39 deletions(-)
> ---
> base-commit: 0ef513560b53d499c824b77220c537eafe1df90d
> change-id: 20240918-mpll_spinlock-4b9b55c44fd5
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
