Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8375CDB471
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jun 2026 20:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7EBzlfcQ8A1x0oIduoK7Gkkcr2cB3y3Cml0dWu80nA=; b=RGpa/Bm0HvoAhH
	mVFcZIeiHUZFa9mPis44TFjGDQYRpvyt8kmJtlH9UTITvrakOscAOYbazT6wBV+ZfktUyo0BAkt4F
	0PllE/FHAWVHG9V9nBSytfiGAuyr1AL3pwtItOfQWr9k/eftk3aVMTS3zDvUxBTCQvLRzvArcf0Sk
	AdbjAkQvwpKpTpHzFHuKO4hA8xUYtxkRGoUuLSv7ahDg0Ac8zGJRBZSYuGL+r1BQduXxX6LMvOnth
	EXaRd2xl2xv6sMFIKM7g/M81OaMthJFx2fA8LtvEWY84/ScBqhPq4t85H5+hIVBuStCAkaQMNCIJe
	J7dV31oWEi9jDg65h1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TS-00000006pJq-1Ozj;
	Tue, 23 Jun 2026 20:11:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TP-00000006pIV-1xCV
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jun 2026 20:11:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c74383c93cso2107435ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jun 2026 13:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245515; cv=none;
        d=google.com; s=arc-20240605;
        b=B0CtJe0MruKwZVwdp0hQLZIs+EaqL4hIYsT/5xx6o197RBBgK6v1LAvcIRoNmP/H3+
         GO/n4JxU2IhPpmS3gNzeH/hykdgy7OhTCak01E8K0oT7fcUc6clZZzBHXMOyw+/6r6c0
         GbRfRuZ6QMhnU5K8219Xei1LvEo5XXKWb13KdRSP/HMnF6J/odx5AeRWlGtZ2IUfHjw2
         ifixEDI8/GlF6XOMjO7lm0FGi2BEgGinDG8OOoL8AO4iWIyCYwcvurtjj0EFpBgOHDzW
         av6xiGTQRgT5yMyBk4X9TjAxU0XSzvDAUH1FoFK9jtTwigzd8CJClnPDXfeBTrVow2ZB
         9rhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        fh=PpWWC4lSr2rkniUAUwbnyIvHAmxYUp1bC7NLuOMeaIo=;
        b=gLQdZZC2Myr6rHu8+5u+T+YdGCfH+Dlc1a/jM2lfJu7a8ljX8GD3vjhOxs0Eas+H+I
         tUYEnXkLFBGt0QtMs2P7I9lhDzBnGRCuY5yPLxYv5v4JBjpJdAyfVDaBWUJWv3gGsTFY
         lK1kIRYBXGYEvg3SrP0pebS1mY7rG4udFaX8lQci1x5GkHPpATDcqendLyjBdKIAXzsD
         R53UDTsJgUxTpdvaqvgRcGzD8Wn90X1FLBK0ZS9tSK0iE683tS+dn7hMXnm9a16b+GM+
         SV09NCFtCxuowbIqQfFDpdFhCBis6vj+7e+9tQ8CPyxn2HTdHsieVRbjpvSve1nPG6oH
         vT+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245515; x=1782850315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=OBJ33mahA732IOiO3vrKJNPcTTz+wV5kpvcYNxqMmpCX2tK7YgJjvJfRsIcLE8qbmd
         wgqNBQLuY4psLtdug0mLBBnctPQz/L9axExj77SgzPP1I5qaC/4vvtVzrJw+KsQT+tlm
         AsT4ZL9PDTlivtSI8l8h7p4ZzUiURKqsmihudbxugLA0RtOciBUQBgryhIHn8hQanfm0
         h1UnkFRvzh5s3RWrWAoFvu350bOyixD1OHPzIyZPZZtZmGjMp1krMKxP064QJfcjJUgO
         jkFmsWYr8feE18yHosmy1MaULddlwC+WeLPGl8ZE2opOBd8tKN6mzjuJcwFzOO5R4Bfi
         KUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245515; x=1782850315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=qMDeyreS58+sHLPrb9k+oL6CneB/wIq0j4K6eWYmzJaJoY4xX3s38SsC3Q8C25WlRT
         ST+ZFWK/WljNOLKJEtruZssxnX6ISHk4RaqybN7quar63Up36hPUZKw3y1HUW50McamG
         EsGAM50EtFO6OF2mvCVvLrHC8yopeVklHvGRRMoI37AK/2zUeMWyLUHpkifPCcFrjC/N
         hAx7r87s58wpslify2Q0Ncf5vmDmmEnn+xRWFkFPDmXGUHtCzA8IqcOLZgF8bsNyGUig
         S5bZnKTZsfQjRspATtrdgmsuCvclE4I6j3Lrx0N2uKFllBmi9KBcXVTzWdhob/VGIsyR
         Iuzg==
X-Forwarded-Encrypted: i=1; AHgh+RoScBb7tVkj5PeXL+nqgXlQdlJCjRrHO0S79iMfwK5+A+yXlJgc0qAJgaxCNbsoP0GC15Qwip/aI2n7R0GJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEeEA+UVhZjF2Nx+W3RGTLXg8tdhY3h6g4pGmfNHdfYXJiM1cf
	ofkiS+PzSqkRz1+hMLPzxqu19ullM2JlxyokdBmKlv7KJ0BU5tBjjxQh2NDuT22ssiFzIk9b6Jx
	8lTGFx5DtQMsd854FCSD1wANTClCDet8=
X-Gm-Gg: AfdE7cnjFAXDzuNKqMRu/P+jkf6e/TI4xYxEQvQMMfnHvhEqEsCbLt6WWOnXFtZDyL9
	8CxXwpc2DCvm9sCf+JlEZlwvcJV4CGWWu/V21PMxgh2iuSrFFjCYOdYbNphPqutd/w8blvFATli
	SBLB0yLWW1uweo3UtJoAup1N7rMYZfTPgJH4i4st0A5dB0ZKIii5C8oVWvWAoQx1oYBLC7MbbRA
	IGqN4Vef7J4/yt/sZYv4y2JLlUrmHGZA+ZvrdjmZYb5FjhC9SydEcvqXOb6uCgZz6liSHwE5Lsg
	M6C2Pw35bytLrVbfQknu0Pjv5LTSRw==
X-Received: by 2002:a17:902:c40d:b0:2bf:160f:7043 with SMTP id
 d9443c01a7336-2c7e16f52ebmr3796575ad.34.1782245514637; Tue, 23 Jun 2026
 13:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org> <20260619-drm-no-more-bridge-reset-v3-55-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-55-ff399263111b@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Jun 2026 22:11:42 +0200
X-Gm-Features: AVVi8CclP812_MCc2l3_hynpLrJPPYN9UiQ3ld_pgUPdTcXAwwfZrBnBsjf6dHk
Message-ID: <CAFBinCD3suLGY4ZVK6bH_F4O2-OAtVAD81HSped+LkYUaEeNxA@mail.gmail.com>
Subject: Re: [PATCH v3 55/78] drm/meson: encoder_dsi: Switch to atomic_create_state
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
X-CRM114-CacheID: sfid-20260623_131155_502303_F0A7F29A 
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
