Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C179C83F17
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jul 2025 19:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqVHTZFvgK2TCpKSc5ftomlij4OEZlcYn7phrDUQ6DY=; b=vy10+Q5v/pTwwq
	Fi+N9YqyIMYoSYhKxbslIvB/QjvAPwp9tUzHSPrDoHHk4aMlpVUYLvETdEuqWLsqfrRkezW8gXX6+
	gR7/Ej9gxrPwIPyli4XJMXVwczoVXncRNX8akOxQ9yL4mfVgzo4xBdFjxxzl8RLMRV7nloPbuiwpK
	URDGInglH+dfW8MDetfEUfeVM1Hs5mRB7EzrHXlUUA/gjN15Je4DwbszUDHptGPeH/8rY2OPvkW3Z
	1UJdDhaKisJGue1M9NSxzzMLliYi1kmpuvvetOm214oFf/k26318s3dmTxVESZo3but4ENYwfbi+V
	KdhYq3hZWiwcIkj/q2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefO7-00000005qaa-16My;
	Wed, 23 Jul 2025 19:44:27 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefLf-00000005qCY-0H0N;
	Wed, 23 Jul 2025 19:41:56 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b271f3ae786so244397a12.3;
        Wed, 23 Jul 2025 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753299714; x=1753904514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXkjt9YB46wQ7fKSEspeGwCyc8yw9KfMpYOU1ApO+HU=;
        b=UUv+9iEXMv/+93OfxfpvsMnZtFAAf4lkbEpUC9zGsCWPvUwmMdQxvQ8IknPOgTByir
         TsfCJw1Nc8O4W93Cp7G+HOUm/x7QmNsvyJiw9j174FCMQkkRyFtS9pbFMhhSSmhFgURq
         +Yuxw+pU3zm8BpQntE9zfDiR5gb5hdQ81vrwYejW+oXw/Vs+4jJUWlUm4mjmmRrkKwP0
         in093u+54d+Whdms2AoXYhHyTyrY3GAZZ6B/LjZffiSziwEtKHMfrON5SxbIKAP1HPAg
         dVnzpVnYDwf75xBIOTA4mlL2iLVhJRa/aOeE0oxNvrqRabLLN+fPIDyKXGy70nWSLtmn
         sPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753299714; x=1753904514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXkjt9YB46wQ7fKSEspeGwCyc8yw9KfMpYOU1ApO+HU=;
        b=xEvf8dEq/HhAW773bjcGgC56rpx+4CjgM6UfKJPBYcnG4dtYTQpJt33kd2WmeSozdr
         ZcGfrEsLBsVLMo/loBiicyZvzywbZHR298SOL6/vuGZT2TYksZOS2RyO+jO94sQ59Kv7
         2qMs2nQpJpRN9UXSWlQRCJwhm9u9U4vdgMs2PNJG8TjKreGo0nwMZKQlkWFsOcgyCmyS
         xBemSf0tx7JBQ+EP/o/M//Z2Lx8H6up/cG6zT4Ny4AFwxgiSltxVCvKoRevBkFIvJMf7
         GI0ZRxKKlm3Jrj+P1z5Ge6KGD0iHgJAgn/GA+1I5kcZcz9qaHUv3I7wYwtqK73Zqso0G
         eOkw==
X-Forwarded-Encrypted: i=1; AJvYcCVqUbOzGm1DzHW60/XYl5ImhvcPsrYTtq/fovB/dE6n5WxrKwgy+YoREqETcNY8ZBJel7jkSxYWzeV5GZF9GbpomQ==@lists.infradead.org, AJvYcCXjQ9W5fpFJMu6tyNU0c0v6rDqCwsmtrjrHAZEEKfdIRiXkjXh8Xbxw8SPc9VxnFH8RhEh6onfQRJ9Yewm9@lists.infradead.org
X-Gm-Message-State: AOJu0YyFcsHhBlNm+ugDNy9CG/tl1yzdmNyO/ck22+ocPqeqtWhgv53i
	7O5Fh6qiB3fWg/pY1ZFK0J9jlXKk5DyupXKBxD7ESMzpepbXA6+bUxAhVhPPo9Eu6hrwCCnO+HT
	Rl/jQVOgGwdYfkhBiyeha1DmEgvU9auY=
X-Gm-Gg: ASbGncstm4xQueRgGBNVDP1TMC7g4YnlA8HA+udUMxXbxtK42MExGjjSIsfUES6wTkj
	B2+EBwEfEC/bb42YY1jxeZaV/hFw++wqdi0LrWnW2Q1oNF/ZeOswG6vjjEGYnmlYKuUlE0RMobH
	L70DEiWNTuR0MY6t3R//s41uQ9OSw3oqEhIPm51Cny994Wly8Hkk26OfcuPdndyHBsRpYYedKrA
	7TptpIKBRjUgYB77mJyjx3SqmaAkmH2ZUH0aoTc
X-Google-Smtp-Source: AGHT+IGWeJEGKh+77TLxgOqUFZ6T7wS6eJlh3839BVCy1uQyeIhZdVq4g4jKDXGiGQwgtBSfZKGUpxHiJcD0En+3NEg=
X-Received: by 2002:a17:902:e349:b0:23f:9a4d:2762 with SMTP id
 d9443c01a7336-23f9a4d291fmr33727935ad.31.1753299713947; Wed, 23 Jul 2025
 12:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
 <CAFBinCCmsw=XGPtrk1XbphOu=OwhxmAiZ+2h4x_M-_f64Vo-7A@mail.gmail.com> <8e5e1d09-0706-42b3-8ae1-00a0e2f5139a@gmail.com>
In-Reply-To: <8e5e1d09-0706-42b3-8ae1-00a0e2f5139a@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 23 Jul 2025 21:41:43 +0200
X-Gm-Features: Ac12FXxIbHkGKJlc4jEtw4fHm14nx983sxWIVJ-SRO-9-6MULnML1Fz74CS-trI
Message-ID: <CAFBinCBu4Z_HZuhPChsyraStK=RSAKH4vtNLCoFWAWUjm5n6ig@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_124155_108024_A3A4542C 
X-CRM114-Status: GOOD (  23.29  )
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

T24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgNjozMOKAr1BNIFNhbmpheSBTdXRoYXIKPHNhbmpheXN1
dGhhcjY2MTk5NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMjMvMDcvMjUgMDE6MDgsIE1hcnRp
biBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4KPiA+IE9uIFR1ZSwgSnVsIDIyLCAyMDI1IGF0IDc6MDbi
gK9QTSBTYW5qYXkgU3V0aGFyCj4gPiA8c2FuamF5c3V0aGFyNjYxOTk2QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPj4gRml4IG1pbm9yIGdyYW1tYXRpY2FsIGlzc3VlcyBieSByZW1vdmluZyBkdXBsaWNh
dGVkICJpcyIgaW4gdHdvIGRldmljZXRyZWUKPiA+PiBiaW5kaW5nIGRvY3VtZW50czoKPiA+Pgo+
ID4+IC0gbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+ID4+IC0gaWlvL2RhYy90aSxkYWM3
NjEyLnlhbWwKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFNhbmpheSBTdXRoYXIgPHNhbmpheXN1
dGhhcjY2MTk5NkBnbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiA+Cj4gPiBUaGFuayB5b3Ug
Zm9yIHNwb3R0aW5nIGFuZCBmaXhpbmcgdGhpcyEKPiA+Cj4gPiBUbyBteSBrbm93bGVkZ2Ugbm9i
b2R5IGVsc2UgaXMgY3VycmVudGx5IHdvcmtpbmcgb24gYW1sb2dpYyxtZXNvbi1kd21hYyBjaGFu
Z2VzLgo+ID4gTWVhbmluZzogd2l0aCBhbiBBQ0sgZnJvbSB0aGUgbmV0ZGV2IG9yIGlpbyBtYWlu
dGFpbmVycyB0aGlzIHBhdGNoIGNhbgo+ID4gZ28gdGhyb3VnaCBhbnkgdHJlZSAoaWlvLCBuZXRk
ZXYsIGRldmljZXRyZWUpLgo+ID4KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBNYXJ0aW4KPgo+
IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaC4gU28geW91IG1lbnRpb25lZCwgbm93IHRo
ZSBwYXRjaCBjYW4gZ28KPiB0aHJvdWdoIGFueSBvZiBhYm92ZSBtZW50aW9uZWQgdHJlZSwgSXMg
dGhlcmUgYW55IEFjdGlvbiBpdGVtIGxlZnQgb24gbXkKPiBlbmQgcmVsYXRlZCB0byB0aGlzIHBh
dGNoPyBBbHNvIHdpbGwgSSBiZSBub3RpZmllZCBhYm91dCB3aGVuIHRoZSBwYXRjaAo+IHdpbGwg
YmUgYXBwcm92ZWQgYW5kIG1lcmdlZCBieSB0aGUgcmVzcGVjdGl2ZSBvd25lcj8KQXBhcnQgZnJv
bSB3YWl0aW5nIGEgZmV3IGRheXMgdGhlcmUncyBub3RoaW5nIHRvIGJlIGRvbmUgb24geW91ciBl
bmQuCkJvdGggdGhlIG5ldGRldiBhbmQgaWlvIG1haW50YWluZXJzIGFyZSBmYWlybHkgcXVpY2sg
dG8gcmV2aWV3CnBhdGNoZXMsIGJ1dCB0aGV5IGhhdmUgdG8gcmV2aWV3IGEgbGFyZ2Ugdm9sdW1l
LiBTbyBnaXZlIHRoZW0gc29tZQp0aW1lLgoKQSBsaXR0bGUgYml0IG9mIGJhY2tncm91bmQgaW4g
Y2FzZSBpdCBoZWxwcyB1bmRlcnN0YW5kIHRoaW5ncyBiZXR0ZXIuCkluIG15IG9waW5pb24gdGhp
cyBwYXRjaCBjYW4gZ28gdGhyb3VnaCB0aHJlZSB0cmVlcywgc2luY2UgdGhlc2UgYXJlYXMKYXJl
IGludm9sdmVkIChpbiBubyBwYXJ0aWN1bGFyIG9yZGVyKToKLSBuZXRkZXYKLSBpaW8KLSBkZXZp
Y2V0cmVlCgpJZiBvbmUgbWFpbnRhaW5lciB0YWtlcyBhIHBhdGNoIHRoYXQgc29tZWhvdyB0b3Vj
aGVzIGFub3RoZXIKbWFpbnRhaW5lcidzIGFyZWEgd2hhdCB0eXBpY2FsbHkgaGFwcGVucyBpcyB0
aGF0IHRoZSBtYWludGFpbmVycyBnaXZlCnRoZWlyIEFja2VkLWJ5IGFuZCBhZ3JlZSBvbiB0aGUg
dHJlZSB0aHJvdWdoIHdoaWNoIHRoZSBwYXRjaCB3aWxsIGxhbmQKaW4gbWFpbmxpbmUgKD0gTGlu
dXggVG9ydmFsZHMnIHRyZWUpLgpXaGVuIHRoZSBwYXRjaCBpcyBwaWNrZWQgdXAgdGhlcmUncyB0
eXBpY2FsbHkgYSBtYWlsLCBpbmZvcm1pbmcgeW91CmFib3V0IHRoZSB0cmVlIHRoYXQgaXQgaGFz
IGJlZW4gYXBwbGllZCB0by4KCkluIGNhc2UgeW91IGRvbid0IGhlYXIgYW55dGhpbmcgYWZ0ZXIg
YSBmZXcgZGF5cyAobXkgcnVsZSBvZiB0aHVtYiBpcwphIHdlZWssIGR1cmluZyB0aGUgbWVyZ2Ug
d2luZG93IGl0IGNhbiB0YWtlIGxvbmdlciB0aG91Z2ggLSBidXQgd2UncmUKbm90IHRoZXJlIHll
dCkgdGhlbiBwbGVhc2Ugc2VuZCBhIHNob3J0IGdlbnRsZSByZW1pbmRlciB0aGF0IHlvdSdyZQpz
dGlsbCB3YWl0aW5nIGZvciBhIHJlcGx5LgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
