Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936DFCDB471
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jun 2026 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7EBzlfcQ8A1x0oIduoK7Gkkcr2cB3y3Cml0dWu80nA=; b=ffvBFGUjJRY5Sw
	giwlK70TRnDghu0zLgui7jEY5ffAMwScRPT5LLQeKR1lkW4idquvvht1Hlja/SzUhxVMx1+N/fRW+
	RuseBuDHCJ2a99YKKuQzI0xHs+Oy2uBeTRHONG+MB/XKUKEuQjBaeTsi0lXBcwNh7s7BuWmepMqtg
	guNxTG5JzoLsJ8rBQsQ1sG7Ga5fb4gdp5U2FlXwYmwKE9toTLqx+aQvdrPS2MV3IL5pKuymdGKH7m
	RO3y2GqsLqIVE17yPKM9PYDMsJd8rzv7M8AcckZnua1leL8l/1IV4uO8z3F9f0g7N5Ls+5vJxsGtx
	A9KDIH/7CCjx7A2P4Q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Te-00000006pOM-2K5V;
	Tue, 23 Jun 2026 20:12:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Tb-00000006pMs-2meE
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jun 2026 20:12:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso2410985ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jun 2026 13:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245527; cv=none;
        d=google.com; s=arc-20240605;
        b=Nup6LcMmN6zUcBcCLQLkOBSCHp0BfiUmJfxbeM6bQgsN+ZgMIANQtovj16Lp6Tw5+r
         5KRiSR6U6Rdgt58z98mb4/6FkFdDIbOAa57sWahKIruy/94F0oLcRMlxkfiH64O2u9sH
         cKCzv4BnRZK/5TJvyVmQdbkO5u8m8pmrpY5Nw0u5xgCHTRebDXoboE8Lh3G5XF80JIHw
         GHFfPrjIz8hn0Rdp7yQDC9E7eSR2eq2A2Qrua5Ttih+EzoirpDsuuQDs5sZqupZW+C3J
         RbrljqoFWKZs+tv+O/0Qzsp5/XiUYWVyeSFHQuV2KEDneGxVwyH+RqikzSXze9HqAK02
         Q6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        fh=P0vd7JcIbbUxks80yW9J/FZMb+L9x/VY8w/LLaOMFY4=;
        b=CfKmKLVtwJ91XEIP1jHlBD301slhSV6T0ZSMWJWWWLhm6JgbY5pjW3JMiHp5eNLsdQ
         YZuYHZGSVlkKalTew+U6RN0jhWcxT4BUiKnl0pzoy7Yhqil5cKZNumTOQ0YqO9rKcU+H
         NH2Ghs9W48zgOuf1ly/9I/ouQaxEZXJo2y5XuYQa2Tko31q+8+wvh60Ny3HWb1gEyfsP
         LD5bFVacySsEnvHQ/FQIQ3ob4/hkrimpZTkFGXFFRqyJcd/+XIXjY0dDPKqZ6zY4JdNP
         F2I0f9QcFhJNNCXfhkaxyt1+AdrKSfjTmn+h6fJ9Zi7QrQiUyNlbYIIR/XRUznSI/Xnl
         yhCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245527; x=1782850327; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=NIBbTwvniq3sWyqrGUqBfljYNG1RpzaHzL9YjSdrW5I+PMXyW0GWHfhmkldSPJGxlX
         oeD9d1gxEDtV45wMIKPtKSsvJzJ7j5SnO53cer8FV3+8naETcoOasHu7Mz0X7Va0Ze6Q
         jjMVU5zucv3hms1Lb9Hdpn5NfNpl0uW+xyVvjMpBiovTkhOhEt8oInNP9FPGXbc/W7Jm
         Yw9FFfeIlPXTklictxxrhsOKOWL/dXGnWPc2Q2TXmPeCEoe8x9k9PECZR9rBku1MRAQk
         A7h5Tba3ZrGVyXSoZewzt0TLebyF3F6kjmtiG6Ei53BZxtT4K+o4PAbV9zKKvxTWo6ax
         g3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245527; x=1782850327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=NRKyNAaOoiRKiZWUYEnS4SWz4b1TYPGd3HKURT8mIktK3axR/h1sZcvEkAAv2b/IZt
         t1/7hD9vCx35kE8oYqXm9JV4ydEJHrLHVSe6+E7bBw9/SM4NpjpZzeyR5a+aoyJQeV+w
         PdPkQigdItfmM0fhhFYoxp5hhdnqWq9Gpq0LYLN5DjEF89V1m3DdBFD2RrjizZE79Y1l
         DJPO4e7aP0rtRxt4RlhRyvjhAKtlHJGT5s58RfLXJ9Fspf2HjLu6qJ7UCC2Q1jUWOD6H
         jU7ep4kvGSpd/PMFdxGN5mShfqEmG+Zd1L5n5ZdADKp/bSMx4V32D5xEXU3WQF9tAZTF
         Ga3A==
X-Forwarded-Encrypted: i=1; AHgh+RoKk7lQ5Ih5g1wy4CB1TE6TFhADyoHSPo91Aq8VJZVU2XIHNFDPSxbsu6bgwH/gJbDcrkdSoPD6NeBNGsyT@lists.infradead.org
X-Gm-Message-State: AOJu0YzuEnNvKnyqfIJu/zxPshFl+WoFrlwwXargeQQknxP8HvgH0Atz
	ERrQPxyGkZDtHcC96HpE2T07G1UamyCr4Qg/3IborIYxPc3xhH6ssrOqaSZhhMilHoiXcSkMFxc
	aRtQv32xRlOdxmDguMXoNUpjmyXn1MSI=
X-Gm-Gg: AfdE7cmUiG5c77NlgCtFu6cpG+ODSbsOR/bIa0W5wnKeJCzRxorl8l6IR8AOuKE0ydH
	CcwCFV4xbGkG5c+Zwz1lizIIrgLQ/PJyyO44QvwD9Pz67psNkQ0uoFlZ7FsssM/8GoQnjpysSvt
	DYsnpyuYrRqcOA9dWjjPtWxuc8civvF1gHPwmD7uCT13hAiHVlxN18k6OP2AN3xBv/O+wpBdx1B
	GOqt89umxGKYwQYE/Gzb5zCoiSI0jisglsp6C77x+awMEUX2UbDh5bzbnmOdGp53pQ5KaNUQQAc
	7SVtTte7wlUXswTohOrPfnXy9kwVWS9mRGqlqN+l
X-Received: by 2002:a17:903:240b:b0:2b0:608d:d8a8 with SMTP id
 d9443c01a7336-2c7e13bad7amr4514775ad.1.1782245526813; Tue, 23 Jun 2026
 13:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org> <20260619-drm-no-more-bridge-reset-v3-56-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-56-ff399263111b@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Jun 2026 22:11:54 +0200
X-Gm-Features: AVVi8Ce2NYfA8Y-QDZ6Qs0nmK98DH-xBcBFK3tKliqc_-TAchO1N47N6NmPkuP0
Message-ID: <CAFBinCC7S2N0yKj=ayYf6FyzssLmF0z7JsokKQ=w7pucPxfZ8w@mail.gmail.com>
Subject: Re: [PATCH v3 56/78] drm/meson: encoder_hdmi: Switch to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_131207_700675_B4BEB0F6 
X-CRM114-Status: UNSURE (   8.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMTksIDIwMjYgYXQgMjoyN+KAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgZHJtX2JyaWRnZV9mdW5jcy5hdG9taWNfcmVzZXQg
Y2FsbGJhY2sgYW5kIGl0cwo+IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9yZXNldCgpIGhlbHBl
ciBhcmUgZGVwcmVjYXRlZC4KPgo+IFN3aXRjaCB0byB0aGUgYXRvbWljX2NyZWF0ZV9zdGF0ZSBj
YWxsYmFjayBhbmQgaXRzCj4gZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX2NyZWF0ZV9zdGF0ZSgp
IGNvdW50ZXJwYXJ0Lgo+Cj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2Vy
bmVsLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
