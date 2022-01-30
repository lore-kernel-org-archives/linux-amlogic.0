Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3655FC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Jan 2022 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROEsMKYQKgC9SokKRw5bf9IZnHXXrtKdayBqx9/U+ws=; b=jERHHVrGmG108s
	DOWmsAFwLFSzQ+SSqtA8kuq2nYyydJoyE+AwUwHxaOeekfDGbP2794KaraNdK19Dbk2koswo1Nj0q
	y8sv5wha5cxDOoztP9GDjK7Iz1VR+B2fmlZCx/blxJ/Jft1Kba3thX4N+muplgDO5PTYtdDFO0g9F
	Ns8CpySpbwQjx98jN85ymvUKWDszequXUImily2QNef6rvK6VI7/bz28ndgG0iz8PTIkSUMPIfxQH
	FV99IK5aq2P6xtxIfWX0C1xqsi1hF+imPC5JfqiGmDfqEBuk8Ynm1MqR5aicpS+9HoIpX+sUSbpBv
	tBA75+/5/HJeVmLw7pJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDzPR-005lit-7V; Sun, 30 Jan 2022 01:53:41 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDzPF-005lh9-RL
 for linux-amlogic@lists.infradead.org; Sun, 30 Jan 2022 01:53:31 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id g14so29794270ybs.8
 for <linux-amlogic@lists.infradead.org>; Sat, 29 Jan 2022 17:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1etZ9IjDzBTEkVleweIl3YZgotYIhfaP98loFEGM3L0=;
 b=fne/K7NjcoDH90Udswk9Bkj4SURKXd8ywi5QKQOSplbPhtz5kcCCKyEEqe4LSrFMXn
 yDiQpS4gBNbNtNDHUEQDgVrlZPuQFQl0wn3DXJkz6t/RYz2z087qEf+qBabGqqjFLVLV
 Qgf9WOdWJbWYw6AmzyAZMMMM3YVBCeT1WsALzoP7vmKzAcNmrKyc9lKjjuVGS3kDA+FB
 0FIv9gp0Obh5N7gGkfQBOpV4aZajHlH+InYw3SHFLqAiB09Vhx+Hwh6nXO66SazH8dI5
 tPexWNuKVqeFUN8cVXrSiW3mc3rytQNZ4gQ+NQsF34SVp1hig+OVIgrjvm6SAWDSKJW4
 lplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1etZ9IjDzBTEkVleweIl3YZgotYIhfaP98loFEGM3L0=;
 b=PU5cP+cHQc07XWSd7PQ5D0VH9ZKTJQbMDSvihV7Qjj8ZXlsao4sJjXW9reqb09KmOD
 h0CmpC+IufGlNuedi8m7KQZfEcQ7BXqYJWWDWa1niuAHAinoTNehzkCm5ydOIrOdFNEr
 IqReDj9E+2Cf7XEle9/TcF04ZzauKjWsiBlWJd2mRjxX4x8jNq0TMQ/CH6AKq7Z9lRYy
 pWdOu+4ibxzFv6XSFXT6QZl5O2k65Pv0henis/lx8JXp/PE5eXiLyYBBemn4ImDhSes0
 4pKHMPC3nG2Phb0NmpuzecMT/nGkappoM4OlD+PhhPPiZjerU+VQyn9jar8wgoZLr8Re
 tHPQ==
X-Gm-Message-State: AOAM533DB4EwUaLeHv3s83VqgXAJ+ILZdrWNfsMb5OGlrlqfekKIntAz
 Fhpc8EYmmzHmeImY7fMUUXPChCE9VDBZ+LX+wR47rw==
X-Google-Smtp-Source: ABdhPJyUGH1z2piANbXPGRmAVLBIfBwy5bibCedidrII3JMdMvlOR1lB93EaHTiTq+/7Zp5gY/DXkDLD0XAOPFGMBck=
X-Received: by 2002:a25:5143:: with SMTP id f64mr23745520ybb.520.1643507608742; 
 Sat, 29 Jan 2022 17:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20220113031044.2665-1-qianggui.song@amlogic.com>
In-Reply-To: <20220113031044.2665-1-qianggui.song@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 02:53:17 +0100
Message-ID: <CACRpkda-jP8m-os6tjXQj3zOykzDq5cfTp9ir+T-H16N4ZAWcg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] pinctrl: meson-s4: add pinctrl driver
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: linux-gpio@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_175329_895191_E727CF3E 
X-CRM114-Status: UNSURE (   8.72  )
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

On Thu, Jan 13, 2022 at 4:10 AM Qianggui Song <qianggui.song@amlogic.com> wrote:

> This patchset adds Pin controller driver support for Meson-S4 SoC
> which shares the same register layout with previous Meson-A1
>
> Changes since v3 at [2]:
> - collect Martin's Acked-by and Reviewed-by
> - remove useless empty line

Patches applied for v5.18!

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
