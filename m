Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFD7CAC5B5
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Sep 2025 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqWtJ53T09qaQ6HIEshwZmaVMYZzPbAG/umAiDjppzs=; b=OjYY2D/sYAC7Fc
	fgdPddUGQRSBFgcOYxydRL0kRLZ8Xfg3cpvhP2xALuJmY8X2XNZETYzdtckIFROoETN+ZYskLmviL
	yytZUHTwbtPw8YQ7nDkKqZmG3jbRJBnXos5qylO+Ra6+3NfMz8iqDQH9S0pdr9PcKP29PTFBq36/l
	TnmQEojw5FhSjz4X5iPnMZWvYfvGWh35hKO1BZ67BJvhJHKqV1mXD3edUqLYIsFTMymURsHmKdfou
	Iu+Ue4cqXUJgkn/9DHSFyhYpj5qgXKZRs7Le/QMMnFiEL1BznwiRWvpOwWZNy7V8YoZJr3imONibW
	VifDk5e9GRShaVXj9YMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ysR-0000000072a-0wd3;
	Sun, 28 Sep 2025 21:24:15 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ysO-0000000071c-3Noi
	for linux-amlogic@lists.infradead.org;
	Sun, 28 Sep 2025 21:24:13 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b556b3501easo3386726a12.3
        for <linux-amlogic@lists.infradead.org>; Sun, 28 Sep 2025 14:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759094652; x=1759699452; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/EfDBi2iuXg+iTflyjOQYQZOOuaeW3hYJUN8DQ5IUg=;
        b=jP5BcjtEFWBMbX2RNWHsd2k9GeXR5aHciBf+oZocDw4oyYjbfzUjbrGmlDhhDbu9Ry
         8r1Aksy1bIo65Mm04EZYF1uKB0XQj1cMYKXC/YIBP+1cIPZbuDfi15Fj04Vgy4UP/uKQ
         1iBudP3E9g7yCPP07VuuxRvksvbVHLn9rDdO5FC+xRLjw4S93LoEL0+JojpO1Ax6okDU
         UkvfpFHP7WvfxQDICo9/lyvR5E9YDMy284PQ4rnJ8HX75aQ1TJ90fZhXZhlm8e2KpngY
         dKAVcPCOpmQ8C19S7MkXSw/ui84AYtVVz8Rn7E4rgXM6DS9wEb/l5ltYxWdsaXQDwFNe
         dzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759094652; x=1759699452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/EfDBi2iuXg+iTflyjOQYQZOOuaeW3hYJUN8DQ5IUg=;
        b=qXSlW3Ie+FQ5/dKtfNFR8EtbaER5ASPqDdulEXdo+FG/ipPUzDQ7fZZzoYBqsn62j2
         hHh2zpZqZB3yj5fM2FfLXWdqmvbzwfWGnEDy3Otz/f7BiKxASoC4c317FXtBAOBU1B8P
         aNhboCAvm4paadXh/+tIFcIdD6b7FFIlADR+voR1uQ80Pqclxnf7/tLRQUPFkm6uPs5a
         PrGySK73BkZGXqw1ZgEP4C/ESCB6zccOUQwUQbrv3z3ymb6WdsvZUqvMEHP1aqm4hCdh
         yQ7dzPenXMw6HQGAvuvk1PM0myVzgJctnhY75ACNlB42qf/ZrRY6PepL1FB+KU5o7Qdx
         3dXA==
X-Forwarded-Encrypted: i=1; AJvYcCWQUHpF+Cx8L0jBJJGSx2emFQdMht96+XYrqLE57HJBFV7u5mYzQqY2l1AvheJBDNN6/dihA0lbJexpGWpF@lists.infradead.org
X-Gm-Message-State: AOJu0YyKqnNGW7zZMBW4jfoXQYY5n7RBVbU5ZE2AqRPStTkYLy+2s0Cb
	aZtwiwvq16iDR23drnalLHD1mdKI35XZNNsQKx7HVO/ogvp838ShdouUD4MCRjQTSPRKb4Qr8hv
	pN+ehcF09YApdLcGOugk5laSSDp6JacQ=
X-Gm-Gg: ASbGnctBOEd1GRgQ913zNVu3osUyOKmhZz9+WFfjifNavViYJlnO64I9mQABNcfUwGc
	MikTH/Q8IFoDuY8m6s2gIAccbi868ODTBm95pm4EH1JRJ5Vpk0qZ6whauUEHfclMjLFvTpOlj4K
	d9YLokK1134r2Sij5XwZCpXmNmURbVu7yUBzs9ladVKHKuVP7eYizcMmBBVFJLIGfPT6nRT8wzY
	R54+AeFdVqGREgrO7k2oMUtns64XI0ajLQ2EWJ8
X-Google-Smtp-Source: AGHT+IGYeAH/2koMMwWRpMeTjHt3nx4vF27nPj6cQxfPYTjKMshJ5FnJQAOC0KdwVHl9l4KPM6h4tqlgjIdg+H3Sves=
X-Received: by 2002:a17:903:19ee:b0:269:b6c8:4a4b with SMTP id
 d9443c01a7336-27ed49c7798mr160858095ad.6.1759094652033; Sun, 28 Sep 2025
 14:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250927130239.825060-1-christianshewitt@gmail.com>
In-Reply-To: <20250927130239.825060-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 23:24:01 +0200
X-Gm-Features: AS18NWDzM6EO1Jvv--jbu1zBUk9kHyWLoS06NGipbYnYIhNafpGwzdVcGq2jayY
Message-ID: <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dongjin Kim <tobetter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_142412_844721_FBF1FE48 
X-CRM114-Status: GOOD (  12.89  )
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

SGkgQ2hyaXN0aWFuLAoKT24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMzowMuKAr1BNIENocmlzdGlh
biBIZXdpdHQKPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKWy4uLl0KPiBAQCAt
ODk0LDYgKzkwOCwxMCBAQCBzdGF0aWMgdm9pZCBtZXNvbl92Y2xrX3NldChzdHJ1Y3QgbWVzb25f
ZHJtICpwcml2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIG0gPSAweGY3Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGZyYWMgPSB2aWNfYWx0ZXJuYXRlX2Nsb2NrID8gMHg4MTQ4IDogMHgx
MDAwMDsKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAg
Y2FzZSA0ODMwMDAwOgo+ICsgICAgICAgICAgICAgICAgICAgICAgIG0gPSAweGM5Owo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGZyYWMgPSAweGQ1NjA7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7CkluaXRpYWxseSBJIHRob3VnaHQgdGhpcyB3YXMgd3JvbmcgYmVjYXVzZSBpdCdz
IG9ubHkgYWRkZWQgZm9yIHRoZQpHMTJBICh3aGljaCBpcyBhbHNvIHVzZWQgb24gRzEyQiBhbmQg
U00xKSBjb2RlLXBhdGgsIGxlYXZpbmcgb3V0IHRoZQpHWCBTb0NzLgoKV2FzIHRoZSAyNTYweDE0
NDAgbW9kZSB0ZXN0ZWQgb24gYSBjb21wdXRlciBtb25pdG9yIG9yIGEgVFY/Ckkgc3VzcGVjdCBp
dCdzIHRoZSBmb3JtZXIsIHNvIEkgdGhpbmsgaXQgZXhwZWN0ZWQgdGhlIGNvZGUgdG8gdGFrZSB0
aGUKTUVTT05fVkNMS19UQVJHRVRfRE1UIHBhdGgsIHdoaWNoIGF1dG9tYXRpY2FsbHkgY2FsY3Vs
YXRlcyBtIGFuZCBmcmFjLgoKSSdsbCBnaXZlIGl0IGEgdHJ5IG9uIEZyaWRheSBhcyBJIGRvIGhh
dmUgYSBjb21wdXRlciBtb25pdG9yIHdpdGggdGhhdApyZXNvbHV0aW9uIC0gc28gYW55IGhpbnRz
IGZvciB0ZXN0aW5nIGFyZSB3ZWxjb21lIQoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
