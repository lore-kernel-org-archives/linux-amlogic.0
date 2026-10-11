Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6F3CA9EBD
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wj/crZL5puwy14WRSoJVp+VXFufU6gOI1VEYydhquE=; b=pl72xVjpp82Lhx
	F/wXVJaPdzRcNjVr9tIdqhSomUmKmnOliHoc9u5ic/as2txyYPaDdBoTQx80GFbg8m/aWlCU3FUyd
	/zQwoJLMtuYD7CpIjhNKobrbPRj9zYj8DrfA2NRYytfGB7aHrNRDEkPoTqIopiqI9s0E3Q/BU1hn5
	lg7fRXRXJ9Xfw/FfAmGlQCoRmDuFBlzNi2sjR5BtihzEmsnhJ6hnWPuxku3mASZzUbzs6tNbNaRcc
	hM0edkwpOWPj3AkcBptSjc+p4SE7J/63W8pzysbsiCDmoMueeoSenVVtNjSKFm6Nk/J/gEgXhziEs
	EVv4OxXZ1Ptc+UHe+lhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuLs-000000096dK-3ra8;
	Sun, 11 Oct 2026 14:16:36 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuLp-000000096cJ-3FUT
	for linux-amlogic@lists.infradead.org;
	Sun, 11 Oct 2026 14:16:35 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8a83d2706fdso6467087b3.0
        for <linux-amlogic@lists.infradead.org>; Sun, 11 Oct 2026 07:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728190; x=1792332990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66qeQFvPa1OLNzA9zOG/eSFE0YAdZbwXEI8cdDv4Aes=;
        b=M5l/5NVbH0CFyLd61kmxzIJ4eDkXKKHyDVxZ8o84AUuKk3TxbVlkHIZEg+SPnJWYHq
         tSJJ2+C9z4pFBrgY53OaxkkFb2F40ddRPqU+xaGiA9EReUgpI4cU5AFjcyX4Ma6In3PM
         x9aW+dWPjwXGehxFIsLn5wgAIZx0SXcKMjkOsQOBCdjiA9KnfgJMFrAE5pFQOzJsrSV7
         Fb+pJuVB00E1Jjcs3aoF5trF+Kme0J8DX4bxpu6ZHBOc7DAL4pV3x9chruFC+EQzRo2v
         6hud75Ytq62nZph3Z7noWeaKOslXcOQJyWiZ4V6oAJJ0RmTm7kD5PgZMy/JRCuh9L6zD
         h9Jg==
X-Forwarded-Encrypted: i=1; AKwUvByfAU7Ghb4NhJg3tVQixPHBB9FLyh+wheNmfw80tXxGNjCrZ//rRJ/0q+VrgErTykjwvRENZW/3BFgUYP8M@lists.infradead.org
X-Gm-Message-State: AFq9FYJzsyUPpYRbyHSf5Feqj509D1VC3mRFDDiZlw2yqX5UTbn7maW2
	UCPRBVcb3CBz/NWDyg7hv4NY7VvegVw1+hyEvgOx418GIULDOu9KrKMFVLbLtjT6
X-Gm-Gg: AYBFou0tV0+yho1TuDPLRoVScpSCBnj2fKS8s/SOheGeYDbv8mVo58m2O5S8Wi7ss3Z
	8HXzaVhDRCraBsjVAQ8z0U3AXe+lXsZ1FUuOXk5H48113+20IbihHYjAnJfEY39dIBQO7KXs2P2
	7no1M5eiqZy82EktaOPStunMsMSbYFsLKLTef+Jx3/8BqlBqbD5yt+o95bsWjHONqZX1j3WTG5n
	SS8hGHjssKkXLggjEMuhdVFnGe4KNQGkf4J25r98nsOJhrMUeYgP8r8uCo98ROAZScyMva1i2Pj
	/yDhCQaHnqBzFJlYawKQXwbP0LFSREfpQSfSA8HZ8z5UeAS5rjreNrZU4U85Zpc6vf9AWZTVuX3
	/mKczU8BbZhIErsF2DLI6sFJnM3rK9W88EXUoDm3SYGleVRt4yRPJtppwynU1aF+fuHR8uUz4p1
	p+4g1iIvmpKUjzujdo1TnwiAxIMW6G7K/OmFZuD6T6xIg+X9Wd7kvEJ1a6SeXSnBXWJer+zyr21
	Z8zXHrMuMbP4RTgzznELQR9xPzKoZfKfpg=
X-Received: by 2002:a05:690c:dc3:b0:8a8:4cd6:b366 with SMTP id 00721157ae682-8b07edb4565mr19201727b3.34.1791728190378;
        Sun, 11 Oct 2026 07:16:30 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f25ae62sm26436977b3.43.2026.10.11.07.16.30
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:16:30 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ac9d666d4eso6706427b3.3
        for <linux-amlogic@lists.infradead.org>; Sun, 11 Oct 2026 07:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhZGQT4LFajcWmfYmuT+6hxZf6kdQqrByTI7HR8xK4sexoDDsZUvcgi7LFElMDgpgi/VaiAnEQUpxXEbDk@lists.infradead.org
X-Received: by 2002:a05:690c:a78a:b0:87e:2404:45fc with SMTP id
 00721157ae682-8b07ee0119bmr12804267b3.53.1791728189975; Sun, 11 Oct 2026
 07:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
In-Reply-To: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:16:18 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
X-Gm-Features: AclHuK_1GqFe_9xMchzTuN-zUjY9-HZS8dq9HbxopbZkfG1FPjpin79NLsfNCvI
Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_071633_835213_95DA4F39 
X-CRM114-Status: GOOD (  10.93  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTE6MDTigK9QTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IEhpIEx1Y2FzIGFu
ZCBDb25vciwKPgo+IE9uIFNhdCwgT2N0IDEwLCAyMDI2IGF0IDEyOjU54oCvUE0gTHVjYXMgVGFu
dXJlIDx0YW51cmVAbGludXguY29tPiB3cm90ZToKPiBbLi4uXQo+ID4gKyAgICAgICAgICAtIGVu
dW06Cj4gPiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244Yi1kd21hYwo+ID4gKyAgICAg
ICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPiA+ICsgICAgICAgICAgICAgIC0g
YW1sb2dpYyxtZXNvbi1heGctZHdtYWMKPiA+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNv
bi1nMTJhLWR3bWFjCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMtMy43MGEKPiA+
ICsgICAgICAgICAgLSBjb25zdDogc25wcyxkd21hYwo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiAr
ICAgICAgICAgIC0gZW51bToKPiA+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjYtZHdt
YWMKPiA+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhtMi1kd21hYwo+IE1lc29uOG0y
IGR3bWFjIHJlcG9ydHM6IFVzZXIgSUQ6IDB4MTAsIFN5bm9wc3lzIElEOiAweDM3Cj4gSW4gY2Fz
ZSBpdCBoZWxwcyBJIGNhbiBzdWJtaXQgYSBwYXRjaCB0byBjaGFuZ2UgdGhlIE1lc29uOG0yIC5k
dHNpIHRvCj4gdXNlICJhbWxvZ2ljLG1lc29uOG0yLWR3bWFjIiwgInNucHMsZHdtYWMtMy43MGEi
LCAic25wcyxkd21hYyIgLSB0aGVuCj4gd2UgY291bGQgbW92ZSBpdCBoZXJlIHRvby4KPiBUaGF0
IGxlYXZlcyBvbmx5IE1lc29uNiB3aXRoIGEgc2luZ2xlIGZhbGxiYWNrIGNvbXBhdGlibGUuIEkg
ZG9uJ3QKPiBoYXZlIGFueSBNZXNvbjYgYm9hcmRzLCBzbyBpdCdsbCBoYXZlIHRvIHN0YXkgdGhh
dCB3YXkuCkhpLAoKRmluZSBieSBtZS4gQnV0IEkgdGhpbmsgaXQgaXMgYmVzdCB0byB3YWl0IGZv
ciB0aGlzIHNlcmllcyB0byBiZSBtZXJnZWQuCkx1Y2FzCgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4g
TWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
