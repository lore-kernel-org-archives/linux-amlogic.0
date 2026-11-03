Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE712606A324
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fSMB0wCA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AIjT9IkBWgtmGAjPxAXFJJjaQtvE7YDiiKAubUsrkHY=; b=fSMB0wCAGIULbqRbq3ygMLiTZ7
	nO72k7a1Ha/7NhI6M7OpO51r4vnjtLMKBHxP0pxog1OTrxgY24CgwJ4KTk4SvvvmCvSkIeoXqOnoK
	XN1W/BrflG9ayIFuQZvOfswfuELf2Vv9268k4F7djmKPiw6+Rjfzd9atLNA8FQoCgf0d/OmdjMswV
	mZHJ59n74/kaGu7BpgB4V/wIDCe/lV2mRYDqoRkdoUqcApDnfp//PRZ1kJSRpZLDOjL6jK31z6kR2
	KnbHXrMzyeiE7/WVmTgCXQsOmQx58cK76MQszr7eWiJlGJ+x90UctOW9anlhQ3M9RuRxFV5wHo5+v
	CcaU+S8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHTg-000000038gO-0zJ3;
	Tue, 03 Nov 2026 16:35:16 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHTe-000000038fD-0kJI
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:35:15 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so3437129a91.3
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723713; x=1794328513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNY6h4Csi0xCblDGgiFLCrE5yAWsa766ysMezcggLVQ=;
        b=04ReCVorXwzV9jjD4inxlWq0c0Jvr4rdLnOQ/04u3pEVJWq3l8EawwyG7axPtikZjC
         NkGkytL9/BCC1+1Iop60DB6RZ3BeeNdhEl+xqE/ASYDOJmleTnoc/SYHC2t2mXrLNyQM
         3oZjwNw5Yk2+ET06QHVOXgK03Jn/x09vcuiXDvTYu36dphyfIfXvLg9r3RzigGCntfh5
         bPoGwHVWvGHu/rUszwYNR17PNLXZyeaxe2sKPJG6RWcm0Q9rw7RrsG21rzWRl36KjZ3n
         W3gaBgKJjHY3zVXatOtf3XHbQ1ytatZdA9qUg9uYwcSopGZjLGwWsyrpp5Vx9USzrD8I
         ZJFA==
X-Forwarded-Encrypted: i=1; AKwUvByVxc1FD3/wN+bVLlJo2GthZiqagWn7STGii3Mt+Ux03nO8JpRiIrxv6qvcoFc8zimI0nPM8AbotR0ZxJCO@lists.infradead.org
X-Gm-Message-State: APuU4Z/4QCI6wPftS7HbFjASDHkQPF6wIJgQ7NqgkjzTn2vATR3IHTiz
	mNYLv6U9CZGc1iqhdseASR5aw0ijVFCHSpICGV44TV3Yg56hRPfvyNZscb3EUo6FIkw=
X-Gm-Gg: AYBFou3doURS3/SU7AttD04ILOuvNXhS1onk4JARo3a7bE7gHAu/Y051dP6BQtob0se
	wgTpGKDwmanjAcP0IaJu+jtru6OpgEWH+/bhmPNDpwER3VrFB5J6ftJiTrmL7x9mIvVNYBC6446
	sS6d93Mb0RVobE0c1RZbt0bzqK6j3yOT7y9qwDffldZI9aTyPYEbXBuCQH++j4jmUvX+AjKNbnn
	bsGbOpMDQx+f+Bojx3KYKV5oRVf2PItsqvWhMxT9ZWg2H5PBUt4Mhddp1B7KMA6AVJocqYpFUxb
	8DXMU3coJ91WgZRsJJh00y/Ff2K5nXm2IRA606SzwpXD0M7aHKDg7GCVgCVVbMwP66oIUt9UHRd
	c1NVbzw2TJdZz2LJ6h0U6wnLUiILtv0FDlg+2uP+3ctP1UHuOf44uB2btMyho/uVxTayYTwAXz7
	4xBfSedUw6DxZ+6umOPFth+Ut3udmMxI7QvYOaiva2jklfLwiMWxLYa404+x2jLahMvDSzwEzfC
	hD631wi5HJXVBwTAbI/0bzqKeCKYWStXzkvbZPrdHd0AXgI93CytvbvfTYO9EGGeiNgyyDeOIGu
	qN+MwT9IY2wE5YuCTdkd0mgmt5u+OPbOU50csHF8Jnac9gutgE8tbBV7NY5z0377wQPupzGKQMG
	kW76VfL76ZDK6fiSi3V5BZC7x5NvqCvQgQCWZovUAPSlcxgJMXptJJwg=
X-Received: by 2002:a17:90b:4a83:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3ae897c834emr11385641a91.11.1793723713006;
        Tue, 03 Nov 2026 08:35:13 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f37e7esm11623127a91.1.2026.11.03.08.35.12
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:35:12 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so7415756eec.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:35:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByBlJh65JoQ6O8QPm2DkXYt0l+feph7c2Y8XSBCs9Y6cjyf033ZmKbauk/vbYScCDqK3DZ8pVSHg2eivtMk@lists.infradead.org
X-Received: by 2002:a05:690e:1c07:b0:676:8974:9795 with SMTP id
 956f58d0204a3-67ba50e5d1emr10529834d50.92.1793723366247; Tue, 03 Nov 2026
 08:29:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
In-Reply-To: <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:14 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
X-Gm-Features: AclHuK9_PvSlgVJNQpbckdVoDA5-AvRndijSeKC1Bujpf2P-dAJH6DOiVyEau-s
Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083514_458433_14D1EC5C 
X-CRM114-Status: GOOD (  10.95  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMiwgMjAyNiBhdCAxOjI34oCvQU0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gKyAgICAgICAgIyBUaGUgUEhZIGFkZHMgdGhlIDJucyBSR01JSSBk
ZWxheXMsIHNlZSBldGhlcm5ldC1jb250cm9sbGVyLnlhbWwuCj4gPiArICAgICAgICAjIFRoZSBS
WCBkZWxheSBsaW5lIG9mIHRoaXMgZ2x1ZSBpcyBmaW5lIHR1bmluZyBpbiAyMDBwcyBzdGVwcywK
PiA+ICsgICAgICAgICMgYWRkZWQgb24gdG9wIG9mIHdoYXQgcGh5LW1vZGUgZGVzY3JpYmVzLiBU
aGUgVFggc2lkZSBoYXMgbm8gZmluZQo+ID4gKyAgICAgICAgIyB0dW5pbmc6IGl0cyBvbmx5IHN0
ZXAgaXMgYSBxdWFydGVyIG9mIHRoZSBjbG9jayBwZXJpb2QsIHRoZSBmdWxsCj4gPiArICAgICAg
ICAjIDJucyBhdCAxR2JpdC9zLCBzbyB0aGUgVFggcHJvcGVydHkgaXMgbm90IGFjY2VwdGVkLgo+
ID4gKyAgICAgICAgdHgtaW50ZXJuYWwtZGVsYXktcHM6IGZhbHNlCj4gPiArCj4gPiArICAgICAg
ICByeC1pbnRlcm5hbC1kZWxheS1wczoKPiA+ICsgICAgICAgICAgZW51bTogWzIwMCwgNDAwLCA2
MDAsIDgwMCwgMTAwMCwgMTIwMCwgMTQwMCwgMTYwMCwgMTgwMCwgMjAwMCwKPiA+ICsgICAgICAg
ICAgICAgICAgIDIyMDAsIDI0MDAsIDI2MDAsIDI4MDAsIDMwMDBdCj4KPiBUaGlzIGlzIGdvb2Qs
IHRoYW5rcy4KPgo+ID4gKwo+ID4gKyAgICAgICAgYW1sb2dpYyx0eC1kZWxheS1uczogZmFsc2UK
PiA+ICsgICAgICAgIGFtbG9naWMscngtZGVsYXktbnM6IGZhbHNlCj4KPiBNYXliZSBhZGQgYSBj
b21tZW50IHRoYXQgdGhlc2UgYXJlIGRlcHJlY2F0ZWQgaW4gbmV3IFNvQ3MgZmF2b3VyIG9mCj4g
dGhlIHN0YW5kYXJkIHtyeHx0eH0taW50ZXJuYWwtZGVsYXktcHMgcHJvcGVydGllcy4KRG9uZSBp
biB2NS4KCj4KPiAgICAgQW5kcmV3Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
