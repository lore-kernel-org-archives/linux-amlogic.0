Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E335606A330
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ELM0ijAF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PSeWZXmy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9NXbZ9wyfZ8O/0KWBhU2iRCyXbH0Ff6J/51UtynzbGk=; b=ELM0ijAFRXjee8+gYIXxyFm0Q6
	TcaXGLtzRVcYh0SkrSisuphuSUEEaJ5Lgw+vNKLHw1jLoh1PUrP6KNv/WJ0XGfjq7VGX1sAVgqEvp
	xENmzru42tKzqJN7jMpShoa3OWWKF6Sf6Fey+JtR4crBabhXglPnef+2YI+bSR+3QXq6VFxDFKHpm
	BkDKwiGTWFTLFTUAS/kBUB0gCN6KpI4UMRY0u+ZylLPzBgsK+bFjqs2Rmao9hgLd8j/4EGjb9Pxkx
	ed1W1katYjB4V4Bt52xjTggiDpTFXpW8djwaYl+Rebv2TjlpOjgWkMq2jQNCgPjj0uA4UaiGp8kWV
	rioX4dWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGD2-00000001xhN-0o3p;
	Mon, 26 Oct 2026 08:37:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGD0-00000001xgg-0KZG
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 08:37:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2483617f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793003852; x=1793608652; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=PSeWZXmydpsgP8ornx3+L6EPWqEvwO2KPNv9qYZCvubTNfriDfgC+XV0IJYmkBrSxZ
         ix9X8078kJYLu7lP4D+eHfW5QmS4F5tNj6qunUuG3yCdWG08qCMEiZ/5bDPuGTDI4E73
         +eiLUVSAgb3pZD2CgokCfMDUfYEHYWY9X+C06oJSiP79RaLcfelJxE986ThKC/PGflXS
         vuYAk/dnnKCQpdwp9IYLeKzYXanX3n38SDKopq2qSmOkG2vYHwispJ3KvECpzTkuueED
         rf8nGnEItHGVzLCg9L7BmihZkV4wNyfwaNldAC28U1oiyuydFRL8eBnGw8a8M0njJQJD
         c0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003852; x=1793608652;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=dz2TSjYgc7jiJ6vmJeeFt5AwO/TN3AGhe7N++ACjYfseOueR29EIFkG3+vx+9YKXo0
         x2rOoRjpfVVyWWapzwL4tYwk15HIsm0uqg6q1uHxJ0i3ofdFfhrYZwNAgmUZN849242V
         R9o4RJwmBwsRyosPyYHYZkM3aIacGfjbuPf3TMK61z07I1kFUuAG4TSsls1tcTuAIb+y
         MZR/YywPG/bYDPsq7e4v9g33tFki+ZLM8zDR4D7II05P4nAXBMpl/Opy7IwpITy88YoV
         PdOb8LU1YunOLbkBqt4sbQzC3a5ulhcpkxf3f+drtLjVd856DdkUM3y9gn1Dr6uxKMHK
         uR/w==
X-Gm-Message-State: AFq9FYJqL1APkto7B7uPyVw4OwZiRq/P5JFi4Hnf/Q8uL8gCoeMe9h1D
	uuQMOYOHp98eeKLDCUVjybsHRCRwkHMRLSrwoTwENogBKq3PToutpc1NZGfjq5YaZSE=
X-Gm-Gg: AYBFou3nyaAdSN88eniqkd1aJr1BP8OHXHS6m9KHr+pxYUN8ZbWf8FLIclj/AMzygIK
	qupkRvO/vO2DCtpGveLOF3TUP7laIBPIOpiDJloLzvJrdMySTbps3ouI5cgFZsck2hf6AUwLlKD
	juojFcDFfDWCEpBygyhtxrZlITgPV1ixwqr6PQvJznoeDZIM13DuwRVHMQfPJGMhTCvsaaK7uSA
	FiunZi55x/zxgO8eySQWzirTaxQm9munMaH2PeuTwYXrZRElZYo3ZPgp4bqI7G9kWgG62hRwsFn
	HG0P2IMLp6Bl88j591Pou8FBOeech4py6V4LNpnC9J+8N1HJwpxAFyp63oivlJhAGZ1F3KEOXNB
	Hg/CBCuUFubTn8inJzjgVKq8G18JnBznpGJL2bd2lza14dE44EmdyshKXAnrfhzwdp5bYp7blZZ
	eIVMBsD6m85j69cJwrtALFhb7YeSIj72L2bSHumUqWDD4JU7HDbwFnw3NhSJjY6WjWQUBePvF+C
	JjOQMgR2D4wBiKo/faA75unfgXaSAM8a/L4/910bG2XpeyXWZx9zgG1iFfr9RsoNNr+LrU8xkmr
	gCi1Z+650SB9YmpYDfubUA==
X-Received: by 2002:a5d:64ed:0:b0:487:1575:ebe2 with SMTP id ffacd0b85a97d-48e3eb96fb0mr10894843f8f.44.1793003851960;
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm73219f8f.13.2026.10.26.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] clk: meson: s4: propagate rate requests through the
 CEC 32k muxes
In-Reply-To: <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:37:30 +0100
Message-ID: <1jmrs0kgc5.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_013734_158762_3D64E301 
X-CRM114-Status: GOOD (  18.98  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gZGltLiAyNSBvY3QuIDIwMjYgYXQgMjA6MTgsIGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1
ZGVudC51aWJrLmFjLmF0IHdyb3RlOgoKPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXIt
RHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSBBTy1DRUMgZHJpdmVyIGFza3MgaXRz
IGNvcmUgY2xvY2sgZm9yIDMyNzY4IEh6LiBPbiBTNCB0aGF0IHJlcXVlc3QKPiBzdG9wcyBhdCBj
ZWNhXzMya19zZWwgLyBjZWNiXzMya19zZWw6IGJvdGggYXJlIG11eGVzIHdpdGhvdXQKPiBDTEtf
U0VUX1JBVEVfUEFSRU5ULCBzbyBpdCBuZXZlciByZWFjaGVzIHRoZSBkdWFsIGRpdmlkZXIgdGhh
dCBjYW4KPiBwcm9kdWNlIHRoZSByYXRlLCBhbmQgcHJvYmUgZmFpbHMgd2l0aAo+Cj4gICBtZXNv
bi1hby1jZWMgZmUwNDQwMDAuY2VjOiBjb3JlIGNsb2NrIHNldCByYXRlIGZhaWxlZAo+ICAgbWVz
b24tYW8tY2VjIGZlMDQ0MDAwLmNlYzogQ0VDIGNvbnRyb2xsZXIgcmVnaXN0cmF0aW9uIGZhaWxl
ZAo+Cj4gVGhlIGVxdWl2YWxlbnQgRzEyQSBtdXgsIGFvX2NlY19zZWwsIGNhcnJpZXMgdGhlIGZs
YWcsIHdoaWNoIGlzIHdoeSBDRUMKPiB3b3JrcyB0aGVyZS4gQWRkIGl0IHRvIGJvdGggUzQgc2Vs
ZWN0b3JzLgo+Cj4gVGhlIG90aGVyIHBhcmVudCBvZiB0aGVzZSBtdXhlcyBpcyB0aGUgUlRDIGNs
b2NrLCB3aGljaCBtdXN0IG5vdCBiZQo+IHJlcHJvZ3JhbW1lZCBvbiBiZWhhbGYgb2YgQ0VDLCBz
byBib2FyZHMgc2hvdWxkIHBpbiB0aGUgbXV4IHBhcmVudCB0bwo+IHRoZSBkdWFsIGRpdmlkZXIg
d2l0aCBhc3NpZ25lZC1jbG9jay1wYXJlbnRzLgoKQWdhaW4sIHRoZSBjaGFuZ2UgaXMgT0sgaW4g
aXRzZWxmIGJ1dCBpZiB5b3UgYXJlIGdvaW5nIHRvIGFzc2lnbiB0aGUKbXV4IHBhcmVudHMgdGhy
b3VnaCBhc3NpZ25lZCByYXRlIHdoeSwgd2h5IGRvbid0IHlvdSBhc3NpZ24gdGhlIHBhcmVudApy
YXRlIHRvbyA/CgpZb3UgYXJlIGRvaW5nIGhhbGYgdGhlIGpvYiBpbiBEVCwgaGFsZiBpbiB0aGUg
ZHJpdmVyLCB0aGF0IGlzIGtpbmQgb2YKb2RkLgoKPgo+IE9ubHkgdGhlIENFQ0EgcGF0aCB3YXMg
dGVzdGVkOyBDRUNCIGlzIHRoZSBzYW1lIGRlZmVjdCBpbiB0aGUKPiBkdXBsaWNhdGVkIGJsb2Nr
Lgo+Cj4gRml4ZXM6IDU3YjU1Yzc2YWFmMSAoImNsazogbWVzb246IFM0OiBhZGQgc3VwcG9ydCBm
b3IgQW1sb2dpYyBTNCBTb0MgcGVyaXBoZXJhbCBjbG9jayBjb250cm9sbGVyIikKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5k
ZT4KPiAtLS0KPiAgZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYyB8IDIgKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL21lc29uL3M0LXBlcmlwaGVyYWxzLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9zNC1wZXJpcGhl
cmFscy5jCj4gaW5kZXggMzI5Y2Q1MjY3NDllLi44ZTMwM2RiNjE1NGMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL21l
c29uL3M0LXBlcmlwaGVyYWxzLmMKPiBAQCAtNDA3LDYgKzQwNyw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
Y2xrX3JlZ21hcCBzNF9jZWNhXzMya19zZWwgPSB7Cj4gIAkJCSZzNF9ydGNfY2xrLmh3Cj4gIAkJ
fSwKPiAgCQkubnVtX3BhcmVudHMgPSAyLAo+ICsJCS5mbGFncyA9IENMS19TRVRfUkFURV9QQVJF
TlQsCj4gIAl9LAo+ICB9Owo+ICAKPiBAQCAtNTE0LDYgKzUxNSw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
Y2xrX3JlZ21hcCBzNF9jZWNiXzMya19zZWwgPSB7Cj4gIAkJCSZzNF9ydGNfY2xrLmh3Cj4gIAkJ
fSwKPiAgCQkubnVtX3BhcmVudHMgPSAyLAo+ICsJCS5mbGFncyA9IENMS19TRVRfUkFURV9QQVJF
TlQsCj4gIAl9LAo+ICB9Owo+ICAKPiAtLSAKPiAyLjU2LjAKPgo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKLS0gCkplcm9tZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
