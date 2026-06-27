Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAA2C43458
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cc9PdoTi8pcEXHSlRuegST5JMLIupHVxMaYg7M078j4=; b=h67PahoOveU05A
	WjEdERwXBCT/HnWz1Oa/nhHCgpku4DvjjCWG+R0o8hIdUMs2RcE+ZRiS/dGpaCF/uWC9JKAE8NhTc
	/AcrVz4POazxuUlEWREgAy26YtkLE72mWa1f7wzZQH46F/8TLkm5n0W1kGCLc1+yR6vQgaYZVxkXp
	eTSybTfe5ngSDCGkgcpU7fvP2a0dXiBwMw+zRhstkpWnmfynPh4jDI/e1HNOQNDaVHQJHEibzPxBQ
	GrYvrLsoeZMjW9tBQDTywIgtywMbpYr9NO114dXzbEr59l4IPRiK4J08ZfAQIokBv4BdNNA391I11
	fT2e/CoDVMU/SFZo/fjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTu4-0000000CY4T-2UyH;
	Sat, 27 Jun 2026 14:21:04 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTu1-0000000CY3d-24KS
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 14:21:02 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-39979f72d0cso8870591fa.2
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Jun 2026 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782570059; x=1783174859; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=;
        b=B5cuxV8ogooDD5XUc+X2Fu9fOqw9XB9Yasqm0cMPE95DkjkzYRD9XJfq5Mnn/+Rb80
         xANioJdBKY0JWcp6e6zeSv/5xtODGoto4R8fLSXsTHp+mkFxf1iCYwvZi1OqU8WHPe7+
         eLrctUY2wOzDZyUb37pILgCCDO4zCLFouQJxQGq70NZnlWF49WeML6f1sFGAa8OkQBRi
         1KvYgsZfZuP8+7+/Y7ls+LD3FxGZi2OyAoskGeoFSWbkCaAJzl4W/p12tOteAYui4BX7
         vUPvp8UIJ+fTkYOEboIeszRQHhUZtINKtPNZHKb71eh1FJGbQ5tCeEsRia9L6t70ZC6R
         Q58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782570059; x=1783174859;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=;
        b=phruWvLWX5afGi9EbRqhBC3LiPHRhCDzcON/xFggQ9QIeKuC4iGnLdTqUY3UzhqyUx
         xAJGfnPafJNlCdH3C3a0gqhA+cnsoz2D2CSoXbL2XESggYaeXU7GHzYeh86CSpEWBDgk
         3wJcKk/IsbwnNYwVmK12y/6WYO+bco70Yg29AsmA7FQttNEob7Gfv9AdIcJRHDgpB0mv
         EJa4VWz0oV3Pwy44EZ7sPUA+n+ScKxCcx1JwC7vKRUECyQMfuZvHcUxdci9wy5x4/73P
         RShoSgBCWtFp/qRgQSsJwRwiVq6fomuKH8l+VgpFZGf6L+ruLU9tCzNhM1AV9X7kjVEq
         fp/A==
X-Gm-Message-State: AOJu0Yxn0TPlz8uNkK/Tq3CBkpUWtuRK1bJIbYoIEH0WmYgUHRp7ncmL
	NQbjXWRP0S1aE4k6JtxDn61Qw6qnnIOl33oE8qqYRGzhnFKNKeEumtGw
X-Gm-Gg: AfdE7cmiu67hD/F/+43ImPEGC8YLkPcK/4YsiSQG3lbf5V8OgOyksRp54KFiTDzxRHu
	qjjDsJB2di52dtul9ZStpUjfsPaYD2+0/6FvceUQyC5o0myZzgaYbCoO3z5HaLj2mfXEugWw8fk
	YDs3zrnQRwNEvz5WgDdwClK09G4phO/2Nd4ZwOC8LuvRyqUE1/5M9Wn60dNKJoXw39VCPmoawym
	+/JCeJAUWw2poAYgJS3MqlGwbtGS52qgFTd2KbtlCY/mSZ5wJ8q3ajEUsnukt/OyFfL9xRoaITV
	LvoE9DhkCtbwUpjP3AaznkzmYhzc/XEInvfd5stGYRCF3b1wXGy/7U7OM6/bqxzHbe4GYufYV0h
	09RYlWOtVhbyJjrflbi+D+s1inr2YBsWBIwVNErFM/lLJW3sM/AU0Ae5EkVjD/h8rEfx5dzojLS
	+LCeKs46pkKdToHSRPoJz2ZECUtXOLYGruz7F3XsoG4A==
X-Received: by 2002:a05:651c:435a:20b0:399:99f9:3a17 with SMTP id 38308e7fff4ca-39ae15d1919mr7629901fa.21.1782570058841;
        Sat, 27 Jun 2026 07:20:58 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b1a7esm59752681fa.40.2026.06.27.07.20.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jun 2026 07:20:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <thanni.i9bbkrc1oza2@postmarketos.org>
Date: Sat, 27 Jun 2026 18:20:43 +0400
Cc: linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <D982B214-552D-4E21-AF98-4367C5ADC62D@gmail.com>
References: <20260627125030.808058-1-christianshewitt@gmail.com>
 <thanni.i9bbkrc1oza2@postmarketos.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_072101_549074_C2D766DC 
X-CRM114-Status: GOOD (  13.02  )
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

PiBPbiAyNyBKdW4gMjAyNiwgYXQgNTowOOKAr3BtLCBGZXJhc3MgRWwgSGFmaWRpIDxmdW5kZXJz
Y29yZUBwb3N0bWFya2V0b3Mub3JnPiB3cm90ZToKPiAKPiBIaSBDaHJpc3RpYW4sCj4gCj4gT24g
U2F0LCAyNyBKdW4gMjAyNiAxMjo1MCwgQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0
dEBnbWFpbC5jb20+IHdyb3RlOgo+PiBUaGUgSTJTIEZJRk8gc29mdC1yZXNldHMgaXRzIGZhc3Qg
ZG9tYWluIG9uIHN0YXJ0IChBSVVfUlNUX1NPRlQgYml0IDAgKwo+PiBBSVVfSTJTX1NZTkMgcmVh
ZCBpbiBhaXVfZmlmb19pMnNfdHJpZ2dlciksIG1pcnJvcmluZyB0aGUgZG93bnN0cmVhbQo+PiB2
ZW5kb3IgZHJpdmVyJ3MgYXVkaW9fb3V0X2kyc19lbmFibGUoKS4gVGhlIFMvUERJRiBGSUZPIGhh
cyBubyBlcXVpdmFsZW50Ogo+PiBpdCBvbmx5IHRvZ2dsZXMgdGhlIElFQzk1OCBEQ1UsIHNvIGEg
c3RhbGUgZGF0YXBhdGggRklGTyBjYW4gYmUgcmVwbGF5ZWQsCj4+IHByb2R1Y2luZyB0aGUgIm1h
Y2hpbmUgZ3VuIG5vaXNlIiBidWZmZXIgdW5kZXJydW4gLSBvbiBzdGFydCB3aGVuIHN3aXRjaGlu
Zwo+PiBvdXRwdXRzLCBhbmQgb24gc3RvcCB3aGVuIHBsYXliYWNrIGVuZHMuIFRoZSBsYXR0ZXIg
aXMgYXVkaWJsZSBvbiBkZXZpY2VzCj4+IHdpdGggYW4gYWx3YXlzLW9uIFMvUERJRi1mZWQgREFD
IChlLmcuIHRoZSBFUzcxNDQgb24gdGhlIFdlVGVrIFBsYXkyKS4KPj4gCj4+IFRoZSB2ZW5kb3Ig
ZHJpdmVyIHJlc2V0cyB0aGUgSUVDOTU4IGZhc3QgZG9tYWluIChBSVVfUlNUX1NPRlQgYml0IDIp
IG9uCj4+IGJvdGggZW5hYmxlIGFuZCBkaXNhYmxlIChhdWRpb19od185NThfZW5hYmxlKSwgYW5k
IHdoZW4gcmVjb25maWd1cmluZwo+PiAoYXVkaW9faHdfOTU4X3Jlc2V0IGNsZWFycyBBSVVfOTU4
X0RDVV9GRl9DVFJMIHRoZW4gcmVzZXRzKS4gRG8gdGhlIHNhbWU6Cj4+IHJlc2V0IGJlZm9yZSBl
bmFibGluZyB0aGUgRENVIG9uIHN0YXJ0LCBhbmQgYWZ0ZXIgZGlzYWJsaW5nIGl0IG9uIHN0b3Au
Cj4+IAo+PiBGaXhlczogNmFlOWNhOWNlOTg2YmYgKCJBU29DOiBtZXNvbjogYWl1OiBhZGQgaTJz
IGFuZCBzcGRpZiBzdXBwb3J0IikKPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8
Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+Cj4gCj4gWW91IG1heSBoYXZlIGZvcmdvdHRlbiB0
byBhZGQgTWFydGluJ3MgUi1iIGhlcmUuCgoxMDAlLCBidXQgSSBhbHNvIG1pc3NlZCBhbWVuZGlu
ZyB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGZvciB0aGUgdjIgY2hhbmdlIHNvCnRoZXJl4oCZcyBh
IHYzIHdoZXJlIGl04oCZcyBiZWVuIGFkZGVkLiBTb3JyeSBmb3IgdGhlIG5vaXNlIGV2ZXJ5b25l
LCBzZWVtcyBJIGFtCmEgbGl0dGxlIG91dCBvZiBwcmFjdGljZSBhdCBzdWJtaXR0aW5nIHRoaW5n
cy4KCkNILgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
