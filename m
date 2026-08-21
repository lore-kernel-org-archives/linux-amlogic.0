Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACE3C5DF87
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GV7OxhcJ+7RRQ3QAcDfZS/5UIYWyo4YGkSU2TzVGYjg=; b=h6+malWjg/YZEK
	nhyW+3Am3mYGvNQhvzrvJN4puB2yBTyiWp9//o1811/OaobPX7PLenQS9JzXReXj9iaiD4C71+d+j
	XgFYGvNZ6KdT/pVJK3reZB9dOcfRvpR/Lwi6ampF4WV4RWgANiUNSxUYUweO28tdQ1WKS5YZ38OKK
	HeSLI3n6elef0BQ6hiy8yIL6Vq3gL4OiSf0vBgDkF7eM2h6UxbAKz2mcP3fiugoOWPxEIdZ2VVVEU
	b0rbbc9OhhomnB+sMSXUWQbF/sXW3b/TZRZHChg5oYo4AevCNvJIId+qIfIwlxZZSnPruMivgcil1
	TlgLN2B8p6J1WMvyjvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNY5-0000000DCOP-12fm;
	Fri, 21 Aug 2026 11:36:37 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNY0-0000000DCMj-0RU7
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 11:36:36 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so282918137.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 04:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312191; x=1787916991;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ec+NopWifWei3xhy94Jsaew2jyivOXpRYVcmATiWbTA=;
        b=UCHcC92trCg+eeJTbl2bZHsDsNKfIo5Wi7bfjum+SY8Nf7IM29Yj/Sg4f1jEleVgRo
         8kiz1oHCFIjiSWKLnNJIOTasfBcQRupbwbJSLxhmK/VBwzf68Q0nmWkPnFaZu7JGjKCh
         /+ks/O2PvxGyF9ANhL/jIrOlh162/CPZFkbXwmGAIC2NErHp48nWnQNgqpzLVLagyQyO
         brqHGbvracQRQjR0vbOmFuwpJM/DrDEQDDuXpsrkjQHwiks8DrVny2ywuwzz6d/M3FCV
         OCwTf/yEV9wOXEnchBMISNOaa8jeSGOwYwcufN7T1Ro61TDls3WXCWvrBD+oupmK4Id0
         j6pQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/tkTz4xpMTboMuBYeEKf1gfpIXCFbtnjOn3lc4ixdiNFKznr1dFOFo6ZtcphLUcd6rrZRmg69c4GtMLmO@lists.infradead.org
X-Gm-Message-State: AFuF++l5IB/ss+aoJHXMvIBJeUSSzJhi0PU2OObMDE3EEQpavmfWkD+3
	q+pQJxcnbWSM9/5VO+CRhUvAaCBw2GujSee/bj4HtbWuiwNKi/EDhLnx1HcYCZt9
X-Gm-Gg: AR+sD10pASpSZ7wXHJzSRawa9S/O8J1uc1lcauUOX12Y4D7H64OuxkXvCU4movbQHju
	hAG7Z8xhF00jqBBkCoDLaGbMoLkYk2xMcgN0vRxYODlRo/ZoyqwkuLwb1Ad53jd+cj7ZA/0HXI9
	GWZSa8ksmXO8Ml4m5q3PIxM8fSReieHXiLTvChYm1ighU+Y4iDOS21VQ1OKuvJ+tcWju6mwa9bX
	h0/tG/UixVSHSHPTSXccL2KMb65tsDI/l0hKjJ4Tk7S/7umEWo3+i9L6z1nYPT9sx8Iu7/EkHck
	90KwiaGpS0na3lcB0imAm7mIcvU+WPyNBE0MT80J8srYpNLXCAKt0bdWbpF2PlbaB9iIsw+7oTd
	VFCz6vNNDuEbE1WzPJdYGymd9YyhwwmKQ2qqQfrM0mlzaYMYS/un4C8+oB3ZUsLwxo4mPKc17RH
	i7K9W1wMlX+/WM8qiMahmtOPqL5ybtopTm10glMa+fuTU41BsaVXSLgmiTc+ndf6jzeeEy/qpeW
	AY4DqrRpGRilJ20lM1VH3TOdM/pfWIiRS+EmHjU
X-Received: by 2002:a05:6102:5126:b0:779:5099:6ce2 with SMTP id ada2fe7eead31-77a62c4430fmr1818497137.7.1787312190643;
        Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e78d181sm8870184241.4.2026.08.21.04.36.30
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so411344e0c.3
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrGj5l0oPBD8fiwcGOfrsw7AqUKItvjrkgIeivaW6+FQ+GikPlelQW8A6UPRtcatQXiNso8bNeQ6poruVgP@lists.infradead.org
X-Received: by 2002:a05:6122:1798:b0:5c5:732c:f4f5 with SMTP id
 71dfb90a1353d-5c5ff866132mr2035837e0c.8.1787312190118; Fri, 21 Aug 2026
 04:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787240090.git.geert+renesas@glider.be> <5d066598-7aff-4912-89c6-23761fdccc7b@amd.com>
In-Reply-To: <5d066598-7aff-4912-89c6-23761fdccc7b@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Aug 2026 13:36:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSwx36pDJ0kW=CvQztFx53OvcdfMTpv1h2H6J3z2+Wfg@mail.gmail.com>
X-Gm-Features: AcwNN1Vx5LhEzAerkbLpsNS7FWTQ-s_Hejhf3XNTw2-87OEOYM9RyiJaA3RAFBU
Message-ID: <CAMuHMdXSwx36pDJ0kW=CvQztFx53OvcdfMTpv1h2H6J3z2+Wfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: Make sure clk_init_data is fully initialized
To: Michal Simek <michal.simek@amd.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_043632_144808_1690B08D 
X-CRM114-Status: GOOD (  25.44  )
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

Hi Michal,

On Fri, 21 Aug 2026 at 12:56, Michal Simek <michal.simek@amd.com> wrote:
> On 8/21/26 12:06, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the MMC subpart of Part Two, which fixes remaining cases
> > that are currently harmless.  These are still fragile, and may cause
> > future breakage when converting drivers to a different method for
> > specifying the parents.
> >
> > Thanks for your comments!
> >
> > [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
> >       initialized (part 1)"
> >      https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
> >
> > Geert Uytterhoeven (2):
> >    mmc: meson-gx: FIXME: Make sure clk_init_data is fully initialized
>
> It looks like a broken series to me.

Doh, I made a silly mistake while filling in the correct patch prefix...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
