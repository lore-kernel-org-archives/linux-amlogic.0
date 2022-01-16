Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37946C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jan 2022 01:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tDavaIVOO0BqlCQ02qNzGUJknAXYW2WYSNTM3+HEvw=; b=EDidMH9WBXYzI9
	H7oUDUwlMdW3jMNu0SB7HiZnZbhFgLLg80XB4oLN8kFY/CPveG0gEhSmWFoDmCLsMGuif5AHoyh11
	0J+XkNBUDUv/FtEs/IkCKS5DDyNzCN+0f7nQumjk62AL11/iu5uqZC9yOoLSvtPK3k1d89Qj7/k9/
	g2rtbq+Ac8SfpnG/K0G4fEPfjJB4i+BnmH/O+4KwfP5PSA8+lXb/8TiiAOhukdjOzYCXPQ1qKrzlE
	+skjtlDLwYGKiYwgOaTS7vAQH1SXfOsVS1HO30L8/V3qg5rHJzdNq1Gal5UbzUjpuzlRfelUd3JvN
	UA5jjQvqN70nng+KHy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8txO-00Bk7H-4h; Sun, 16 Jan 2022 01:03:42 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8txC-00Bk6D-HJ
 for linux-amlogic@lists.infradead.org; Sun, 16 Jan 2022 01:03:31 +0000
Received: by mail-oi1-x22d.google.com with SMTP id x193so18165403oix.0
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jan 2022 17:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=POoT8lZwdwkVxbrtnXG/2kZ2LyDCImg/KhYjt8hMGj4=;
 b=ImMWHs/t2csAyPe/7X6ixftncpaVAciibtgZoT/rplnNeX4Pfltee6fYOFiHBLes6E
 Bxaou6H9Ak5cSokDSdrfZHw3q2tK4NZba9WZ+yuPgrTtSJx7lpurwM8itnWrk0VJbwAL
 EOtl0Tp4XfO+OCNaKmi6ngD/rysN/lYGD18Y1TmDWOxjztOjzjiVkYRpdxap+ERJgZB8
 cWNZ8v0kxr3J2/iwIxS8zP0O34lynqLcFYjDLuCJckQgy5wUCfuEQQvxw+l2K9nE7RnN
 2ZYM38ba6i14Qh1Ab458gzBjPL9lOgqJK3/TMcJaKltrV+jh4UX9j68lmfJ2rHlEWGJ7
 eQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=POoT8lZwdwkVxbrtnXG/2kZ2LyDCImg/KhYjt8hMGj4=;
 b=2WlAXHyjC4BpjMSK4OEncaZKSjrOrt2tlR1IWNQQ48yaIN7koDVGpT6AS4cI6YmDhj
 ToSsFzsmbjRqBi3Zha+cg7cp5+GL6++Wm9MoEq8+KS6RbGG57l6tJty8fUrbTIFZicfc
 NUnTp2AKKk4+pTJmQ+6cldGxh5WW16GxnLEh3Krvc+HcDLTd7tWA47VC0t/UL78HO9t/
 bsoeZnGWgl/DtLZmQjXuz3Xa65mBROzEIj4oCUHMDfQ0JKh9aTyj2W5lT8FTm+6w2Sq+
 sgt85L29wzVIREatTAyz7zctgakTPtY0I1nZYeMfaJ83kUYm2ayJxGrHSOzg/PRr14BO
 7lfg==
X-Gm-Message-State: AOAM5315QL9PNhGxrZbfSSzXRTgFZdaNpsrRLOwdB5d3yqc8cOo7Di/U
 HpOuf63JxPbE5/1WvQ6NObT2zL4d1QKSdImAlYca7A==
X-Google-Smtp-Source: ABdhPJwafqmBY0WphS0TwqHoMtj+/tWMv898aZCQzPJBVKAu0PbBomZDNH+c2p3i/XuChSguAPuDYyYNS0Ri078n69I=
X-Received: by 2002:a05:6808:2097:: with SMTP id
 s23mr8359331oiw.132.1642295009533; 
 Sat, 15 Jan 2022 17:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220103154616.308376-2-gary.bisson@boundarydevices.com>
In-Reply-To: <20220103154616.308376-2-gary.bisson@boundarydevices.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 02:03:18 +0100
Message-ID: <CACRpkdZRL8VuY5K_d69VHE6eXCmUb18ZRs5v9shExe4ipmw90Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: meson-g12a: add more pwm_f options
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: linux-amlogic@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_170330_624985_520C10F7 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 3, 2022 at 4:46 PM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

This patch 1/3 applied for v5.18.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
