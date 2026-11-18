Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83491606A336
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UBfDMZrl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjJ9tHlI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Z4CoRqpW1bM4qsOXH/i0EGgDKlDxQpsyfyPJGcDLlA=; b=UBfDMZrlhfAWTFuRikWXh47mQi
	mJ+EELHpddBxikeE1Z4uiI8SOion5csRuSZ/wicjW9Am1AB9nXarEN8A7cssHDQK3l/9VH04Mia8i
	ubBTnWb/2sam7zqSkmNPZMlMn1CN4CJNEtdZaRzS96qrxQURBmc21k7mRe359hOLRBALGqYfjPjIc
	Pel/FUvsd4kvIHexrSGsMZThBbn8DUJpJVFYN13KWrIVvslaDOAGkqeLEp8SsefCAcVH/iEpoWYCP
	S77ZQs4ODIo5HkKqKZhAahUvJr1PQisCV8+WQ/y1mROuP1zHMAzfx/GpKYQathGRlewro6mxRIAiq
	CVdyjpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkFK-00000009scr-3666;
	Wed, 18 Nov 2026 18:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkFI-00000009scV-2VhP
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 18:19:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFACD45C77
	for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 18:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44F51F000C9
	for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025939;
	bh=mTjGPBEegQRgp+TkjbZALo5DNvb5ic4MusjOWTiPzo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fjJ9tHlITqozv2A92bNFUGPP3O63gD73RHRUV66TQHLqaE4cc6+TzRhFOqy9gzhem
	 GTHREosT5FaTm2Pjdg+AjYNxu5//4SEZfEhEHhiozX8SZeWZ/8dEtGFuYPFxYwM4gK
	 etPTTSZracOXrm1gcffhReZFmNPHRh3Hm7sBQgaV8+PuzeQ/1B/K/+OagIpFMxgsFY
	 jkFkF/peQjEbokh2deNwGkjXqHFoWqnVcoWlqBfshEuyRIR2UswgkPTtiN2rgj3CcH
	 snSBneN/QS5am26e2yW9pua73F29jEy+Csb7B9imBfYjzayRVV3WVJ7VRlyQkE0aLl
	 GLz3xpVN2IP9Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1126227e87.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 10:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGg4CzQaD8cmA3HkDCV9bt6btj76Vxzl3Osk26fKFriGNSmxVH6Z0sBOX4iZh2Rs2gDeFiNeryOmoTuDGVw@lists.infradead.org
X-Gm-Message-State: APuU4Z/79ax+tPN6NEqLd3+UqH3snVQZBPknY+WuQdMlkBpcrZ62N25b
	cT3mbvQyECx1zNJ/kz3EoqD36nDmeu1PUxbUBVjvrL2RpJEua1uhdhs11OvRAA3eyzLfF1qZJBx
	fx3weSV9wAHSuQRslGYeKXFP0pbdpHoU=
X-Received: by 2002:a05:6512:401a:b0:5bf:d54c:1fb1 with SMTP id
 2adb3069b0e04-5c1a9b709a1mr1153837e87.2.1795025938593; Wed, 18 Nov 2026
 10:18:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
In-Reply-To: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 19:18:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
X-Gm-Features: Aa3M54oSzmSzW6vVL6kt_cC3y7y55k_eM3IqSPDViqpXGwp_Vn4eEmeBhlms50g
Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgNjowOeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoK
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IEFsbG93
IGZ1bmN0aW9uIG5vZGVzIHdpdGhvdXQgY2hpbGQgZ3JvdXBzIGR1cmluZyBkZXZpY2UgdHJlZQo+
IHBhcnNpbmcgaW5zdGVhZCBvZiByZXR1cm5pbmcgYW4gZXJyb3IuCj4KPiBPbmx5IGNvdW50IGFu
ZCBwYXJzZSBub2RlcyB3aXRoIHRoZSAiZnVuYy0iIHByZWZpeCBhcyBwaW5jdHJsCj4gZnVuY3Rp
b25zLCBpZ25vcmluZyBvdGhlciBub24tR1BJTyBjaGlsZCBub2Rlcy4KPgo+IFRoaXMgYWxsb3dz
IHRoZSBkcml2ZXIgdG8gc3VwcG9ydCBmdW5jdGlvbiBub2RlcyB3aXRob3V0Cj4gZ3JvdXBzIGFu
ZCBhdm9pZCB0cmVhdGluZyB1bnJlbGF0ZWQgZGV2aWNlIHRyZWUgbm9kZXMgYXMKPiBwaW5jdHJs
IGZ1bmN0aW9ucy4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFv
QGFtbG9naWMuY29tPgo+IC0tLQo+IEFkZCBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24gZm9yIGVycm9y
IGR0cyBhbmQgRXJyb3IgcGluY3RybCBjb25maWcgbm90IGFmZmVjdCBub3JtYWwgcGluIHdvcmsu
Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKCkRyb3BwZWQgdjEgYW5kIGFwcGxpZWQgdGhpcyBpbnN0
ZWFkLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
