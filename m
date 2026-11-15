Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85699606A31E
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5D1vo7Vr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=hqyAjYs2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+11dopgje2xWvqJwgpNEWHLmOY+5mc8pI2LFqeaksM4=; b=5D1vo7VreRQbpQCLHDBDq2ysYM
	gAaDu9Mkc62zOtopVLrj2EIYCBbEeo5eGff/z/8DjMnyAalotNuJIgHaApZkgdISeOyNIQ24RwHQM
	5yxrDZHwXeom0yp6yeDCF2Gi23BoZGE63HkDl+XxaSGjQaP1VX/03F264cx1wxcivSYPHJSnVBGOR
	Q6+MUJ0tQmdSwbf5zXwQkIn2Dmu6kQBHI1HaIetDcHCbU/8T1u5qdZYK83+xHXC1nRdA8Qz8NemDX
	h+UFkbEdLRJgLGI4p8TDB4LcongkZTIn+F6e5cFjUlAhRRZ4HWJgKLfFZTV9jyZd2/7llNqyMDR3C
	Kqw4PrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeUS-00000000I1a-3b01;
	Sun, 15 Nov 2026 17:58:08 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeUQ-00000000I0v-28zk
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 17:58:07 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-67db5e13b0cso222901d50.3
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 09:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765485; cv=none;
        d=google.com; s=arc-20260327;
        b=Wt8cUnY5Eo5LYGBpbPeznWjnwiijlopgvE3fhI1uwzpwXXFVo3mvD6DU/lOvA8tlXT
         1Te4iCcc2X4hIuoYg4Kxnc7M83VC59YuMxxVvDxcQKXnyfHvKpyTcqVXVReWOxONzR7d
         HOmbUQdbjN23ihJ/8YKzwFkRWoYaIGrngWpsmFKyVEBD4Zyde2zM7UphBB2H/XGC2Ve4
         ycnoyyYHdBHRDginezh3tQkcdmO6654YjH7AqdahtycVxJhBuZG90cGHHI0Y0YJ4EmLu
         7TUCw/9b2UiP9wgDPmxPupBbrLfbiwRIvClOd2md+cx3k+jPP0tpEtupCL0/b0+eLuYS
         MkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        fh=JPbG+sRixHuCF77rUn2F97uPUyGlgnQwJVWaItPqUbo=;
        b=Wntk4Og2gJ84W2BbnMLISQcP6gu2c0/p3I8EuUuoWKXe/uU5l8YGX4XFLdiM8gFaMn
         b3+QupM8ow95NE4oex6gwRs5p8kh8YAWZCyCDfIRn4tzVd96bZ9XVuDDPN7lJt/d4iIt
         NXTPBirf7C++QA4W30db/VzzGVYuJgtds2z1dMcQj1kOSSuyGAO2e/RUZ3hc2RwIL9vI
         Lvu/gt3+QQWVXFiX97hQ/A8weYmNWW+0q+b0GRm43wNj65/JOpISoHQLUjqOnQxBr7Z7
         ELzrJAvjDE3aUvNI137DNWDAZTd42tPCalUWqGqcnbUotzEj3f0h4KCDpsIq1bfuKmB/
         XwEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765485; x=1795370285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=hqyAjYs2ikFgHxLvIo1XpaV/oumK0VRwoFYy2ZraLwngAsrsr5fVwfcJ+5koGB110L
         IzLNX16m6+rX8TJMIykOi6EefpzZe9do7f9hx/63A5ei4ayMnPiIgBegsi/p8V1h1Kx9
         XY7ZkCokOOXV/SOdLPzwUPB4BbM4P2x4MYgpQUK4DscewrYIRjr0zTBP0uZ9290+PQ/a
         GVe7wFDz9XvuwNN2Tq/FhiuvxRXwSu9ALrLHB7yDgoNS9wFlQP4lJnDAzd1nngO55bt+
         byKjnoztCYoQZEkfWGP4wM0OMshXLawiAvXRas5i0mv23wIpInJeZv59XCsmunrxyIKu
         ML1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765485; x=1795370285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=0TLbkMaClo4PwdHJdrPefoPaUAUUFebPB1CJayvJlMbE6u3fSglxzam1AN4sMxHgGy
         EZuJUWAZetWoUcHvFCkTJuevxmHtR+C9RzFVg4F4+KrrIEra7J3dkGjkb4naW8kjArni
         anqvETk5/FfAu02e3odpLPv/HPHzGOUSczX3wRK0WeIfNDi4NqG66oKWlz20xcFocCqQ
         TiS/qv1s+x4FP/53nPesIkotlfDniDVzAAQime6MKtcTm53lpVl3UglGQVcDDA5FrUF2
         SbEGNqdoXxHuTNbZF1/3A17pM/Ekiwb7vA++AbhzhPTSlAEQ7KToBT0qQU7bX89UH4aU
         Vdnw==
X-Forwarded-Encrypted: i=1; AL+hErFwJgrlj7KlYPvjdCxUAHwumi7RoxiRW8Ji6YwVvZmYLaAdnGtchqw6XuU0IWhlKxe/fHq8Yq3CprwhcUVZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9gg8Bzq/7dyK3WDy4XxFjUzlZW3oioB43mAXSjMIPwUS42h4Gk
	RKBytD78bQMh8+GGp6XxHmA4/KlCsgvxBkc7rVyH0lFNXGYDOlPE6KZ+/mUN/3OQ22gzjFaok7n
	wD7HOLlTwOziSWV7AeIdOVXcslvr2TA4=
X-Gm-Gg: AYBFou2oXIVPYAL6NgZE86nCAhm387aE2hX1fKoFNvqI+UyiLdMYPWkeZygUrn1UUca
	ukcIpbnANHo5XAbWfcnTVLZEdPgcbpKy0WHTM552/N8U51BDQz9ZMPtnjhyyGO9KJc9a09Zvz7G
	FmFsHkMGK2zC9R1JaRSW4/GtowmhZFIDdcbeSUTws83e5UN+rBocF5SWfMczhq81r2e4tyLwikF
	5mg679OcFn8blnnLi0MDKnkWRwkVeG/kALai0+dzvqEAvYH7BeF/l3Vg0c9noQKETYV4sine/WZ
	iHUnb5dagxAbMe5NzanBuQKHFr0gbEMKjDBtlN61o7UQlP55/n8hSQRXTxpgc6c9upoU7jNOMQy
	Yor3v5Ga3aM4eoeA49DRoh45rVR+HsJ2G/wNY4qe1Y3PcsKg1QfX4YvwPXJZD761nYYBksg==
X-Received: by 2002:a05:690e:803:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67d89661b52mr2605986d50.45.1794765485479; Sun, 15 Nov 2026
 09:58:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-5-tanure@linux.com>
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:57:54 +0100
X-Gm-Features: AclHuK9m7YW9F8wMPiMsA7yThjtGjePZoU8lN6bMh8Ee4d6dZkum7e9qCRT0s2I
Message-ID: <CAFBinCA7XhksQaTHoGP3jCCeSCBdwAYgamW2AfPTdK0ncSCzCw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_095806_564230_ED469649 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMToxOOKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBUaGUgZGVsYXkgY29kZSByZWFkcyBwaHktbW9kZSBhcyB0aGUg
bGlzdCBvZiBkZWxheXMgdGhpcyBnbHVlIGhhcyB0bwo+IGFkZCwgZmFsbHMgYmFjayB0byBhIDJu
cyB0cmFuc21pdCBkZWxheSB3aGVuIG5vIHByb3BlcnR5IGFza3MgZm9yIG9uZSwKPiBhbmQgdGFr
ZXMgdGhlIHZlbmRvciBkZWxheSBwcm9wZXJ0aWVzLiBldGhlcm5ldC1jb250cm9sbGVyLnlhbWwg
c2F5cwo+IHRoZSBvcHBvc2l0ZTogdGhlIFBIWSBhZGRzIHRoZSAybnMgZGVsYXlzLCBhbmQgdGhl
IE1BQyBwcm9wZXJ0aWVzIG9ubHkKPiBob2xkIHNtYWxsIGZpbmUgdHVuaW5nIGFkZGVkIG9uIHRv
cC4gRXZlcnkgYm9hcmQgaW4gdGhlIHRyZWUgZGVwZW5kcyBvbgo+IHRoZSBvbGQgcmVhZGluZywg
c28gaXQgc3RheXMgYXMgaXQgaXMuCj4KPiBObyBUNyBib2FyZCB1c2VzIHRoaXMgZ2x1ZSB5ZXQs
IHNvIHRoZSBUNyBnZXRzIGEgcGF0aCBvZiBpdHMgb3duIHRoYXQKPiBmb2xsb3dzIHRoZSBnZW5l
cmljIHJ1bGVzOiB0aGUgcmVjZWl2ZSBkZWxheSBsaW5lIGlzIGZpbmUgdHVuaW5nIGluCj4gMjAw
cHMgc3RlcHMsIGFuZCB0aGUgdHJhbnNtaXQgc2lkZSwgYSBxdWFydGVyLXBlcmlvZCBwaGFzZSBz
dGVwLCBvZmZlcnMKPiBub25lLCBzbyB0aGUgdHJhbnNtaXQgcHJvcGVydHkgaXMgcmVmdXNlZC4K
Pgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Cj4gU2lnbmVkLW9m
Zi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgpSZXZpZXdlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
