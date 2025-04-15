Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68621C369B8
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Apr 2025 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igU1L5T5RF4/8bgZPBY5psjvFE9NUOMvuEWYHX+0cXA=; b=4SiFg9oDR0Ms2s
	rg7ypO5kTMJH2SfYWHUEIr8JP8fFSr9Q+JcG7UKrqSQQfHjCmQZC4zdz1cDsRzVCqLUqkRbwJoXqo
	4pC8KeF97fshcsB+KlH8QwP23I2TnxV3+nfCdT5j0zY0LMNXTTWP5KGh/83OunBKSjBlYEqY5R/WS
	Y6DSuQ4hBeqOIKJA3m22L88vyYJ8gmLf7T7RqzIKAffkMb6JhfCHY5fI1rn03NeRDpYr5Q5MEZ+O0
	Uqt4xJiofzk6TIimqyIl49oWH92ss3ehYP39ajcwP4gEOvMCjf144+M3y/1DSC9VC6oWTRyAYwIte
	5QsR6tpYb61WLvBq9o9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bWI-00000004xtd-3oiw;
	Tue, 15 Apr 2025 08:19:50 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bMR-00000004wCC-05zU
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Apr 2025 08:09:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so5098021e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Apr 2025 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704577; x=1745309377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=whT6K3uRrPxXhBSoMwFk/CW62Q9HZOYbqE1Iy1N3r5lKaL052X4eA7bXmnYD6yei6M
         HJdqgwf0x+aAO/uJ4ZmuhflqrJr+aTqQy89lcj49RkDOxBVWZFPUQ1OzVaJ6jKXqZNAA
         jgahnqJG7noR6kUBHmHeFBtt69EvY4E4DFb2EFOxPe7NCP0TV/IKufjJmuG1z3ZoF8yE
         XrSWM5zOrlbfi+PrYchYsDD5Icos0uk8CUKyy8KrEK2p0SzdDIubqj3tiSFlUBy1axzE
         VBsxH63ssJQ7L2ByyGRo7ERLgu5HcA2L8ZQBsB0H8NRkAai3uJSSnBVraDw7o4d80nv/
         MJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704577; x=1745309377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=jSfiMijj4C+vc0xms069m2dW2M/RcphEmFRe181AdAn8pIAlTYWKzMzp6nZMQFc+YL
         eoLVH7JI77BIAyxggEQ7zXS5aLe+dH49ZLyZnTdG8CzMCP3AUmvmHBLhoGN7kAEtcKSJ
         rWg9L0k3JNMj7WbQYlGRUkP8/fIgeaF3qGKkjEMj6doHlPGdG+8E2jUE8wVaYonBAAaO
         cmVh6WjXv0RT4NPoyHopahMlteCoB94zK4YKpbwk2BGMw4MUXb/MNOckM/KDUz1I8G9+
         ml0GojB8D4n7iBsWk6KUC8an7MHwdUw4crzW019sbkItUoYV6VqETI1Ibo5DOutJD+O8
         e/bA==
X-Forwarded-Encrypted: i=1; AJvYcCUQNmMQpdbOlr2LFK8q33APRIN3Wl6XYLW0l5veshceKhHZs05IiIEJ4vSPIY+79Ue+ucyFYhEQH465K3Zf@lists.infradead.org
X-Gm-Message-State: AOJu0YxjkAAfx3Ut4Egl0wBreUCctVul/89/ab9p9I24L0HS4g4Qc/W/
	xpakwzMeDw/lLK35CBmanF6ALYydvSxL2AUU2mUGBWOcbCcg1vydLXRieZQJcB1WNQoq0cUHtuu
	zkuepMmzAZkxBA1oFsVK3nXU82HSz7HizUKiWVQ==
X-Gm-Gg: ASbGncvTNAtkGy6Xiev7xNykLpUNary/refN7xJ7k87vjzcXmKowPm0FSJ1KfQmy7jH
	y9eot84ud7v/ono+iY70ESj4Lj8gE8oq/KH2O1cDuUS29Ped1fl5LzSuXUMijwaYecV+csQH8U4
	z+L99XgplTyDr3Y5sR0Qlg+w==
X-Google-Smtp-Source: AGHT+IH0Y4jm0LaYVhqlf4ygy8v6EM0HqVDr1pCml9YV4eSiyilIsQJQAcufVd3/LXkLFdiQwaLxvtXP5qPvFl0mrI0=
X-Received: by 2002:a05:6512:4019:b0:549:8f06:8225 with SMTP id
 2adb3069b0e04-54d452d692amr4312543e87.53.1744704577064; Tue, 15 Apr 2025
 01:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:26 +0200
X-Gm-Features: ATxdqUHY0rsQZ362mf1eSV0hA552eBY6l9M2A3A0WPZhzC_XlT3-mPSct8oGVPI
Message-ID: <CACRpkdZr-s2sW07M8f-qr6YzRuNxJ_vRE6-kFaXaX7v+3g01FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: meson: Do not enable by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010939_063922_44F6C451 
X-CRM114-Status: UNSURE (   8.90  )
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

T24gRnJpLCBBcHIgNCwgMjAyNSBhdCAxOjU34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKCj4gRW5hYmxpbmcgdGhlIGNvbXBp
bGUgdGVzdCBzaG91bGQgbm90IGNhdXNlIGF1dG9tYXRpYyBlbmFibGluZyBvZiBhbGwKPiBkcml2
ZXJzLiAgUmVzdHJpY3QgdGhlIGRlZmF1bHQgdG8gQVJDSCBhbHNvIGZvciBpbmRpdmlkdWFsIGRy
aXZlcnMsIGV2ZW4KPiB0aG91Z2ggdGhlaXIgY2hvaWNlIGlzIG5vdCB2aXNpYmxlIHdpdGhvdXQg
c2VsZWN0aW5nIHBhcmVudCBLY29uZmlnCj4gc3ltYm9sLCBiZWNhdXNlIG90aGVyd2lzZSBzZWxl
Y3RpbmcgcGFyZW50IHdvdWxkIHNlbGVjdCB0aGUgY2hpbGQgZHVyaW5nCj4gY29tcGlsZSB0ZXN0
aW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBsaW5hcm8ub3JnPgoKTm8gY29tbWVudHMsIGJ1dCB0aGUgcGF0Y2ggbWFrZXMgcGVy
ZmVjdCBzZW5zZSB0byBtZSwgc28gYXBwbGllZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
