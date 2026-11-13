Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7777606A333
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HEhvNHfW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GDo6HpDX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3GUrhV/ZP2LeDmHC1kMGDzbEMu6F2mz8VSqUe+lt21U=; b=HEhvNHfW9FQKk5ISES5PSfq9Zg
	x58cER7DKWXZ/uq/x2aW3ovld1hcHam9FHfbn8V0HZPTWdPu61vz2lnxcUA4k4rNfmAdBMXhE8yhr
	Cb1Hh3MGpSa2SDzeuI4KJbIt+FhOd8yJxHAjOK0BuEuyF6djof5RwpI2hr7vIdbZHx/MsyWoHRX7Z
	dfAzJc8GZHUyA7LhvExUdktrL91SB3FKBovpDZTeTT2Up365nmsNZS65GsrOXKpiI1M+PoK1EggGI
	8tzjuihV0Ige41rjvUXvNADlRifqIDr/lFaOZI5MX8SqGuMsUdqWiDedUq+OGiO4JfkgiV69WvkKy
	C8hd/XiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqhB-0000000CmOR-2u6V;
	Fri, 13 Nov 2026 12:47:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqh8-0000000CmN9-2faI
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:47:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so2185705e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794574072; x=1795178872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=GDo6HpDXB4v5VcO+R013dhhrIUwWIL2YYi16SsOCHDoip0TvkvtKxiXJWNY1/Suuf8
         7Phy/6AdnyhgSAHMYdWYElpgbeZ7JXkuTA3AShC66xgs8SuEi+DG2Lw1wx4xwnSFSXDo
         /igcQy3WdagcrOjXbaWXr+Wg6pK7QGGhkqVzKLqnX2/Cqr28YetO8X+qe+FRnx5fU7a8
         KkM1j22/4qHw50ODRyLakiHWHdc62hWU4vp2NjjXO6V0S7/Gbos9bQ8WNQsNKbaXwOVV
         Wa9KelEfLDURjgav+HajrNVcytHF0K1AzuJIonQoTcGrDFoOwyF2rLP/risMnQ6T5Of7
         kyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574072; x=1795178872;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=KO1/TGy4rQLaXHS5P2i4kxGLt1XYZOMGJ1niz/mULsd+ry9UYylbXvilrInoKNCBrG
         ySBvhMvTQPWJ8yOOIcOjBvzHSod2M1HPxcVQZbuqWXi8iYA6SxkKEir7vUAHvyvibAiv
         U609Zsn5m/1aOAr5xSvim/g8ZWBtEvFmgioLXQbb2ZLWj5u7lWYGx10bx1Ml2P6B1KIu
         LOlsyP0kgGhGHTcQ2sU+lewrDrya5eKEFtKvh/NEy7avxXSu0t2asfc+587wEZQa9LHV
         i9U0aF0K+deyf0z4s5O1EHgW523Yx0EfUnQwvIXQuoU81Xtts1m1zKa0mbwwexOrtjtR
         6l7A==
X-Forwarded-Encrypted: i=1; AL+hErHZUKTouKPA6WFKwCziofGcxzOGv9CLdcY/+0bMxTKa9etW9TS0L9KWgZfc6Ygq9nQH7aEdqWnNd5rPlUfy@lists.infradead.org
X-Gm-Message-State: APuU4Z8HToPanLxeL5KD3Kto+GVycxKs33IdvuCNk0e142mDjcjkEyYN
	eBRGCUga7waEQ4oy1zrTijXmRLZWItL3ThWam2X0POjSzDn2rXtl5pR/PWXL+UKOfM4=
X-Gm-Gg: AYBFou32+k7Hyv2UqH4koa7tHb+O9di4y0p7YjQ/8UKuRrJFl/FZLuHLxBRx9hFwaem
	EYnjZBq/bi3E1KAqE61XmE7DcwZ+bwPvTcOCuQqHtMFiXbIB7vWURHQn1tCeOBGVb/27HQXUFpr
	0nKwZ+cA3Rx0LPg3jPiphLGactBhFujHoE0ph3tVpNZohldEHVAF5+agHUCY2E/Z1H2YDxQfFnR
	Sa60ps3FW17seOu0T/UfXiY839i9Vd+atSYt3t9a9j11JFhESjoZQWtdMt1oA218B5zcMhCMg3q
	v/zpbskM3eWEMsNbWL5gMSkIb9ROGOyEIOr6Qnc1JfKXmLMx8OL7ABc8tdqumKYnsQ41b/9CLGb
	rsO5IgPMCcrxaxG2L3AzH1/BdPBH6aCQd/Sc6jJNnkKT3raR/JIdkP7lxktrobw1iGaa1j0ZhnB
	vx/y6fgnx4a7y+zs84QzfS29P0nZHBbD8i9D203jHUOMIq1zFYIjOQqEC88xd59gC6ITaFneW94
	LEJP26YIq+njIRfR9DkWhIKwOWVF2V253La6IKh3DgS9I+VKHerdml4NfUnq5En3es5q5cUznac
	3EVq9z422jMmGnY+ee/+P0Kis+OuxQIj
X-Received: by 2002:a05:600c:1c0d:b0:4ba:59f7:9032 with SMTP id 5b1f17b1804b1-4bb55c5f60dmr58910305e9.10.1794574072378;
        Fri, 13 Nov 2026 04:47:52 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm161390445e9.2.2026.11.13.04.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:47:51 -0800 (PST)
Message-ID: <7a268a4a-692b-4aa4-82b3-a13006e9a3e3@baylibre.com>
Date: Fri, 13 Nov 2026 13:47:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_044754_687563_C57FB900 
X-CRM114-Status: GOOD (  13.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFydGluCgpPbiAxMS8xMy8yNiAxMjowNSBBTSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPiBPbiBXZWQsIE5vdiAxMSwgMjAyNiBhdCAxMTowOeKAr0FNIFZhbGVyaW8gU2V0dGkgPHZz
ZXR0aUBiYXlsaWJyZS5jb20+IHdyb3RlOgo+IFsuLi5dCj4+IEBAIC0zNyw4ICszOCwxMSBAQCBz
bmRfcGNtX3VmcmFtZXNfdCBhaXVfZmlmb19wb2ludGVyKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVu
dCAqY29tcG9uZW50LAo+PiAgICAgICAgICBzdHJ1Y3QgYWl1X2ZpZm8gKmZpZm8gPSBzbmRfc29j
X2RhaV9kbWFfZGF0YV9nZXRfcGxheWJhY2soZGFpKTsKPj4gICAgICAgICAgc3RydWN0IHNuZF9w
Y21fcnVudGltZSAqcnVudGltZSA9IHN1YnN0cmVhbS0+cnVudGltZTsKPj4gICAgICAgICAgdW5z
aWduZWQgaW50IGFkZHI7Cj4+ICsgICAgICAgaW50IHJldDsKPj4KPj4gLSAgICAgICBhZGRyID0g
c25kX3NvY19jb21wb25lbnRfcmVhZChjb21wb25lbnQsIGZpZm8tPm1lbV9vZmZzZXQgKyBBSVVf
TUVNX1JEKTsKPj4gKyAgICAgICByZXQgPSByZWdtYXBfcmVhZChjb21wb25lbnQtPnJlZ21hcCwg
Zmlmby0+bWVtX29mZnNldCArIEFJVV9NRU1fUkQsICZhZGRyKTsKPj4gKyAgICAgICBpZiAocmV0
IDwgMCkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiBzbmRfc29jX3JldChjb21wb25lbnQtPmRl
diwgcmV0LCAiRmFpbGVkIHRvIHJlYWQgRklGTyBwb2ludGVyIik7Cj4gQXMgZmFyIGFzIEkgdW5k
ZXJzdGFuZDoKPiAtIHNuZF9wY21fdWZyYW1lc190IGlzICJ1bnNpZ25lZCBsb25nIgo+IC0gc25k
X3NvY19yZXQoKSByZXR1cm5zIGEgKHNpZ25lZCkgaW50Cj4gCj4gRG9lc24ndCB0aGF0IGxlYWQg
dG8gYSBzaWduZWQgdG8gdW5zaWduZWQgY29udmVyc2lvbiBlcnJvciAoaGlnaGVzdAo+IGJpdCBz
ZXQgLT4gbGFyZ2UgdmFsdWUpPwoKVGhhdCdzIHNvbWV0aGluZyB0aGF0IG1hZGUgbWUgdGhpbmtp
bmcgYSBiaXQgYXMgd2VsbCBhbmQgdGhlIHJlYXNvbiB3aHkgCkkgaW1wbGVtZW50ZWQgaXQgdGhp
cyB3YXkgaXMgdGhlIGZvbGxvd2luZy4KJ3NuZF9zb2NfY29tcG9uZW50X3JlYWQnIGludGVybmFs
bHkgZ29lcyBpbnRvIAonc29jX2NvbXBvbmVudF9yZWFkX25vX2xvY2snIGFuZCB0aGVuIHRvICdy
ZWdtYXBfcmVhZCcuIElmIHRoZSBsYXR0ZXIgCmZhaWxzIHRoZW4gJ3JldHVybiBzb2NfY29tcG9u
ZW50X3JldF9yZWdfcncoKScgaXMgY2FsbGVkIGFuZCB0aGF0IGNhbGxzIAoncmV0dXJuIHNuZF9z
b2NfcmV0KCknIGludGVybmFsbHkuCgpTbyBteSBnb2FsIHdhcyB0byBrZWVwIHRoZSBzYW1lIHJl
dHVybiB2YWx1ZSBpbiBjYXNlIG9mIGVycm9ycy4KCj4gYXhnLWZpZm8gc2ltcGx5IGRpc2NhcmRz
IHJlZ21hcF9yZWFkJ3MgcmV0dXJuIHZhbHVlLgo+IFRoYXQgc2VlbXMgb2RkIGF0IGZpcnN0LCBi
dXQga25vd2luZyB0aGF0IGl0cyByZWdtYXAgaXMgTU1JTyBiYWNrZWQKPiAoc2FtZSBhcyBmb3Ig
QUlVKSBtZWFucyB0aGVyZSBjYW4ndCBldmVyIGJlIGFueSBlcnJvci4KClRoYXQncyBhIGdvb2Qg
cG9pbnQgaW5kZWVkLiBJIHdpbGwgZm9sbG93IHRoaXMgZGVzaWduIHRoZW4uClRoYW5rcyBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQuCgotLSAKVmFsZXJpbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
