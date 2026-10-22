Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB6606A319
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bvYdjx6I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wVtukHGFgRF3ZDbgMpkvtRucJkDYtTqp0+1jycIiCD4=; b=bvYdjx6IM55An04PiYPcy2cEL0
	GXrRrwzYjT+yZ98XsqOpPvbnhshUYsHrBPxsUiH/3ylIOqE86nzAqGZ3x7BnqJH4rgMg+bPKkfuQk
	PDk3XYxaZOmyud7GdwPtmmOfyrHr+jcZxk+l/ZOshG9jAJL3q0jA9xKdW/k8cIN8MTP5KMUk1k9pd
	qhyXbL4OP7TZG39E6z4+1a3ThVh06FgmJWR/KCzLjXAnnAEfhQM131AlrPtxkjiTTy+y8y/LIt8gJ
	EUHce14dncZBz311BiJRFSkB75TcPPSdwhfDoeNSZivAEyiN3m93NOVQj2tGet9nVeKBABrcfE7r6
	MGxqikEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwKW-0000000EZBa-3Lzw;
	Thu, 22 Oct 2026 17:11:52 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwKS-0000000EZAn-1h4I
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 17:11:50 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso22597f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 10:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689106; x=1793293906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2uug97+9g9Ifw2alnlucQZ1byzTMHdm0Mg+gmOCcls=;
        b=JciPXJpGWHsIf3/L6hP5YPB34BR425dbTpQuSkWlb5i/UTaKFnOALOb/rMPbKgWEb1
         48uSKa37mOK2iG2SQwbMyUKmnFiLXr54jb92fgTLBzpyw3G9EHPs2oW3Agk06995mfmX
         4yilYNMsKx+l4ifZVWcf1QDg1VsCauVab4i8O175gyajTezsKTR5YZNF2Yd1ucoAdWCA
         q9We6iyoDuCRbMKoympFn66z4ceHuiPltIlHF4DjVoi2p0azG716tvME8FhKuRA7L9ZE
         iBKLo4+YxYF17xMpe7f3G8yNUvIbv+kh65NxJRJ2Fut7UOtt3M2Gn0SWC6597sI6vHpV
         ts1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeiWRzBtK/KUtN6tkYEwy3IBqoIsEWl8YgXWT7g4WgmXaZ4ZxF0nRW+1w2JauPL3AL/9jYqtasu2sMLq8w@lists.infradead.org
X-Gm-Message-State: AFq9FYJhvkfW1pxGFQrj8DCpuwcKTLi+czQTL6xWcZqyb9zH6/fJsFHU
	VHDm+Y4duok5BSdERwyMYspyawJf31mnmYnEXJcJ2NV92QA9LddqQRh7
X-Gm-Gg: AYBFou2ccqIO7MgLlNn2dfZkKSUadAmlNBgmUkeSHkWRjKC06BLyTugoVe0ShyAxFwp
	TTpfO+qyMyhnwLTbVTsG+ZxPT37ti5gP9vde1ANPdN99Ggd0ouYGXCOaf9tUZqoiqyyjKAeBzx1
	nSfmieJ+sekcg8aoeYlieQUkrcBgYqRoG4NBmm20tNPn+jsbOuvnlIquDwiBdAtAPylj6V+/YaF
	si6OxSuI9/Rkp7UV8TepcS9pP/S72nbmNLVLjT/qOSU2QVNQMKpXKRudVTaF03MxyX2aPQj3k1H
	RTUyNXi6m4lUqbYmreYqqXmu7VH+e7PzcCK4sDb3C38h0/hf2H0itEtS1So14fJ3GG1Nk4y8Kot
	7S4sFE/FFlHY2Zo9aMcQC8p9j6whLK6uuzte/4OihSEBoR8yHbHjtJd9HI39J+y1wWyFl8TrE0l
	yVewIE5pIDI8ZOyUB+fla/L9uiebvXsRM97dUhVJgQBUA6jCHHLgcN3kbN4G7TSTPvRJt2yGGkM
	to8L4kHgpf1gjQvXuldWb/+PQ3XbzDgpo5MX+oMOI1sfaohNhXberWv8Z1CMRa9CeiKDZwVhB+W
	2QrQl4350dSJ5yHX48zb/BPqLoma1yM=
X-Received: by 2002:adf:e004:0:20b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48e264a640dmr8341797f8f.44.1792689105826;
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm13532427f8f.32.2026.10.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Message-ID: <5100a774-9c85-44bc-abf6-9679f8395856@linux.com>
Date: Thu, 22 Oct 2026 18:11:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Conor Dooley <conor@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
 <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
 <20261011-starship-foyer-1105c1b35e31@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20261011-starship-foyer-1105c1b35e31@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_101148_537218_A7296365 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTAvMjAyNiAyMjoxMywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFN1biwgT2N0IDEx
LCAyMDI2IGF0IDAzOjE2OjE4UE0gKzAxMDAsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPj4gT24gU2F0
LCBPY3QgMTAsIDIwMjYgYXQgMTE6MDTigK9QTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCj4+IDxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPj4+Cj4+PiBIaSBMdWNhcyBh
bmQgQ29ub3IsCj4+Pgo+Pj4gT24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTnigK9QTSBMdWNh
cyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdyb3RlOgo+Pj4gWy4uLl0KPj4+PiArICAgICAg
ICAgIC0gZW51bToKPj4+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244Yi1kd21hYwo+
Pj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCj4+Pj4gKyAgICAg
ICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1kd21hYwo+Pj4+ICsgICAgICAgICAgICAgIC0g
YW1sb2dpYyxtZXNvbi1nMTJhLWR3bWFjCj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBzbnBzLGR3
bWFjLTMuNzBhCj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjCj4+Pj4gKyAgICAg
IC0gaXRlbXM6Cj4+Pj4gKyAgICAgICAgICAtIGVudW06Cj4+Pj4gKyAgICAgICAgICAgICAgLSBh
bWxvZ2ljLG1lc29uNi1kd21hYwo+Pj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjht
Mi1kd21hYwo+Pj4gTWVzb244bTIgZHdtYWMgcmVwb3J0czogVXNlciBJRDogMHgxMCwgU3lub3Bz
eXMgSUQ6IDB4MzcKPj4+IEluIGNhc2UgaXQgaGVscHMgSSBjYW4gc3VibWl0IGEgcGF0Y2ggdG8g
Y2hhbmdlIHRoZSBNZXNvbjhtMiAuZHRzaSB0bwo+Pj4gdXNlICJhbWxvZ2ljLG1lc29uOG0yLWR3
bWFjIiwgInNucHMsZHdtYWMtMy43MGEiLCAic25wcyxkd21hYyIgLSB0aGVuCj4+PiB3ZSBjb3Vs
ZCBtb3ZlIGl0IGhlcmUgdG9vLgo+Pj4gVGhhdCBsZWF2ZXMgb25seSBNZXNvbjYgd2l0aCBhIHNp
bmdsZSBmYWxsYmFjayBjb21wYXRpYmxlLiBJIGRvbid0Cj4+PiBoYXZlIGFueSBNZXNvbjYgYm9h
cmRzLCBzbyBpdCdsbCBoYXZlIHRvIHN0YXkgdGhhdCB3YXkuCj4+IEhpLAo+Pgo+PiBGaW5lIGJ5
IG1lLiBCdXQgSSB0aGluayBpdCBpcyBiZXN0IHRvIHdhaXQgZm9yIHRoaXMgc2VyaWVzIHRvIGJl
IG1lcmdlZC4KPiAKPiBJbiB0aGUgc2Vjb25kIHNlbnRlbmNlLCB5b3UncmUgcmVmZXJyaW5nIHRv
IHRoZSBkdHMgcGF0Y2ggSSBhc3N1bWU/Cj4gSU1PLCB5b3Ugc2hvdWxkIHN1Ym1pdCBhIG5ldyB2
ZXJzaW9uIG9mIHRoaXMgd2l0aCB0aGUgOG0yIG1vdmVkIHRvIHRoZQo+IG90aGVyIGVudW0gYW5k
IE1hcnRpbiBjYW4gc3VibWl0IHRoZSBkdHMgcGF0Y2ggbm93LCBzaW5jZSB0aGUgY3VycmVudAo+
IGJpbmRpbmcgcGVybWl0cyB1c2luZyBkd21hYy0zLjcwYSwgbm8gbmVlZCB0byB3YWl0IGZvciB0
aGlzIHRvIGJlCj4gbWVyZ2VkLgpPaywgSSB3aWxsIG1vdmUuCkkgd2lsbCBzZW50IHY0IHdpdGgg
eW91ciBBY2tlZC1ieSwgc2luY2UgdGhpcyBpcyB0aGUgY2hhbmdlCnlvdSBhc2tlZCBmb3IuIFRl
bGwgbWUgaWYgeW91IHdhbnQgaXQgZHJvcHBlZCBpbnN0ZWFkIGFuZCByZXZpZXcgdGhlIG5ldyAK
cGF0Y2ggaW5zdGVhZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
