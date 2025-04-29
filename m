Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4616FC369D5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuIwN2+MuHS+mUEeYBmGIoH/hT6erk2TUT2d7h1uPLA=; b=49WEHBAWTIgU1J
	rOFdHyI2TFHATAZdUpvsKTqyccK6iHRhAFiPJ2SPPIkkG/vLgHCuBoVN201VD1kq51UhA5Iki5epz
	IbFJGtseES8H6G3c4AO+H1gQJEx3yhr6l6ZA+/4x/WltWt72gZsIHpy3HM4THGbx+8qnKfCjt5Tif
	K/BdzBURunh/A1A0suSvN98poTtw2VxoTATzdu2EobttVIlPRdidxNWcwUx8Utx9lprKkkqSMDo19
	azIBrxYPWva1SPKtgL3xfvJ2mdTBdYjscA3miLi1sskf5Zhst5B6xXGpH14jEDj8yaU5vkIEms0UM
	48phGjd3kNCmM4fzc89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aQt-000000083YT-0gzO;
	Tue, 29 Apr 2025 02:10:51 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aOw-0000000839g-1lI1
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Apr 2025 02:08:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso4011801a12.2
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 19:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745892529; x=1746497329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOL8cAzDh7/cTXRXsftT/THY4eVY9mbWKCNY3CIWC+E=;
        b=j6cBtDzSG4y2VPNKbhbq2IIhT0x5TTLbmqiCSnn2gZI0aeOENMNh97CV2uEVSXr5nJ
         aKsOYuiKYKuhzWW2Xsg/bEJXmf4WVaF8xFcWReQ7fU1r57c1OEqICLBbGC1Fhb/h7AUQ
         EOFGYjcNkM2+bK6S6eq8G2F2KSeJLr7vOJlB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745892529; x=1746497329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOL8cAzDh7/cTXRXsftT/THY4eVY9mbWKCNY3CIWC+E=;
        b=EysObbeSlOL1DUNPexnhcOKKfgjshRNPoRLnCQitdJXCsrx1/8HiA/83gtw0tXpy0T
         SjKkUKzHip7hNcOKEJolYjF1cRgDnWrhMYcfRQFSx4Eh5YQpRerWGInLdzhMcawDJsCj
         JN+7cfjRl2Yt/gnT4eVJCbZu1ed4/8z2XpEa26frzSSjS01NpHAAJeP0Qq5mhvNNuloR
         ZaUM/RAyyzpXAK4i+esdVPttcYABqCOOjxsCRoJ1krKFjj6spFY0pHAbpnYW2dbSoSN2
         +hA1EzOAIkVIwmfTg+uRldXAKcg4wWEISxRV6EhuMU8q3eGg2VAfzOeU6vGXk02IVI4W
         h+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUtxmlc+DwAqTbCthuBx/HO9sRs2XteMYxjUGZ/uOqn2rpKwtWaFDl+2t0bg9Ew23qwS/mevmwAUPOcglBC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+Gz8RYRf89J//ddWzeZWIOlDuHfNzWvsdofMParjtXSlhixP
	VuZ8KNrQYI0yzvp4AX5CxA2kNVxaTW3nqETEhDwG9k/AxxiiVebmG9wXeIzS49zLEJnwtTkqHYS
	0kthVok49aGWNvkLZPAPK8qwiDd9WjOOU/5CmLw==
X-Gm-Gg: ASbGncu3F+W2yFKbdMqU6v+UAQV5/issy/hT5ILpyERzt+6vrJs/aGyrQ9e9C8gN/PB
	4qLoegMX/M/p3GuxtuSDIDTNPUwfEEUr33hPu7I7u1iqs7M3NLtK9Pp+uBZD0hbtDbW07mMzU03
	dhQui1K3F0sx3wmDCifsCzvKysZMS77GzRd8Psp0zu+TXrxCqVwYaGasw=
X-Google-Smtp-Source: AGHT+IHCPRZOUIvFcl8lsvnwfO+9RLYKzmV+Oh7P+gkUHVtVP2yGSVFYEv1JALFXz/61Bb1nArjTw0CpObv33VgEMCo=
X-Received: by 2002:a17:90a:c88c:b0:309:ebe3:1ef9 with SMTP id
 98e67ed59e1d1-30a013070damr20213230a91.12.1745892529578; Mon, 28 Apr 2025
 19:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
In-Reply-To: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
From: Da Xue <da@lessconfused.com>
Date: Mon, 28 Apr 2025 22:08:38 -0400
X-Gm-Features: ATxdqUEtIxVd1qwCtsriUSTxo6iPaZohjrD-HjaaVAgl0Wkxs3YcV-UpkMno1rk
Message-ID: <CACdvmAi9v=DFqSOjWdeAabNC1QECs0U3yHM4LZ=Gtthn-pUMNA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: neil.armstrong@linaro.org
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_190850_460434_E3BADBAD 
X-CRM114-Status: GOOD (  23.39  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMzo1MOKAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDI1LzA0LzIwMjUgMjI6MzEsIERhIFh1
ZSB3cm90ZToKPiA+IEdYTCBJMkMgcGlucyBuZWVkIGludGVybmFsIHB1bGwtdXAgZW5hYmxlZCB0
byBvcGVyYXRlIGlmIHRoZXJlCj4gPiBpcyBubyBleHRlcm5hbCByZXNpc3Rvci4gVGhlIHB1bGwt
dXAgaXMgNjBrb2htcyBwZXIgdGhlIGRhdGFzaGVldC4KPiA+Cj4gPiBXZSBzaG91bGQgc2V0IHRo
ZSBiaWFzIHdoZW4gaTJjIHBpbm11eCBpcyBlbmFibGVkLgo+Cj4gU28sIHllcyBpbiBzb21lIGNh
c2VzIHdoZW4gdGhlIG9uLWJvYXJkIHB1bGwtdXAgaXMgbWlzc2luZywgdGhlIG9uLXBhZAo+IHB1
bGwtdXAgaXMgcmVxdWlyZWQsIGJ1dCB0aGUgd2hvbGUgaWRlYSB3YXMgdG8gb25seSBhZGQgdGhl
IHB1bGwtdXAgcHJvcGVydHkKPiB3aGVuIG5lZWRlZC4KPgo+IFNvIEkga25vdyB0aGUgcmVhbCBt
b3RpdmF0aW9uIGlzIGFnYWluIGFib3V0IHRoZSA0MHBpbiBoZWFkZXJzLCB3aGVyZQo+IHNvbWUg
YXBwbGljYXRpb25zIGRvbid0IGFkZCBhIHB1bGwtdXAgYW5kIHN0aWxsIHdhbnQgdG8gaGF2ZSBp
MmMgd29ya2luZy4KPgo+IFNvIG15IHF1ZXN0aW9uIGlzOiB3aHkgY2FuJ3QgdGhlIHB1bGwtdXAg
cHJvcGVydHkgYmUgYWRkZWQgaW4gb3ZlcmxheXMgPwoKVGhlIGlzc3VlIGlzIHRoZSBwcm9wZXJ0
eSB0eXBlcy4gSSB3aXNoIHRoZSBiaWFzIHdhcyBiaWFzID0gPFBVTExfVVA+Cmluc3RlYWQgb2Yg
Ymlhcy1kaXNhYmxlZCwgYmlhcy1wdWxsLXVwLCBiaWFzLXB1bGwtZG93biBzaW5jZSB3ZSBoYXZl
CnRvIGhhY2sgYSBidW5jaCBvZiAvZGVsZXRlLXByb3BlcnR5LyBpbiB0aGUgb3ZlcmxheXMuIEEg
bG90IG9mIHRoZQptZXJnaW5nIHRvb2xzIGlnbm9yZSAvZGVsZXRlLXByb3BlcnR5Ly4gVGhpcyBp
cyBhIGNvbnZlbmllbmNlIHBhdGNoCndoaWNoIG1heSBjYXVzZSBwdXNoLXB1bGwgdGltZXMgdG8g
Y2hhbmdlIGJ5IGFuIGluc2lnbmlmaWNhbnQgYW1vdW50LgpXZSBoYXZlIGJlZW4gY2Fycnlpbmcg
dGhpcyBwYXRjaCBvdXQtb2YtdHJlZSBmb3IgNSsgeWVhcnMgd2l0aG91dAppc3N1ZXMuIEkgaGF2
ZSBub3Qgc2VlbiBhbnkgZGVzaWduIG9uIEdYTCB0aGF0IGhhZCBhIFBVIGZvciBJMkMuCkV4dGVy
bmFsbHksIEkndmUgc2VlbiB0aHJlYWRzIG9mIHBlb3BsZSBhc2tpbmcgd2h5IEkyQyBkb2VzIG5v
dCB3b3JrCm9uIG90aGVyIGJvYXJkcy4KCj4KPiBOZWlsCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPgo+ID4gLS0tCj4gPiAgIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1neGwuZHRzaSB8IDEwICsrKysrLS0tLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bC5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bC5kdHNpCj4gPiBpbmRleCAyZGMyZmRhZWNm
OWYuLmFlZDhkYmZiYjY0ZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1neGwuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLWd4bC5kdHNpCj4gPiBAQCAtMjE0LDcgKzIxNCw3IEBAIG11eCB7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBncm91cHMgPSAiaTJjX3Nja19hbyIsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImkyY19zZGFfYW8iOwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiaTJjX2FvIjsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJpYXMtZGlzYWJsZTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJpYXMtcHVsbC11cDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4g
ICAgICAgICAgICAgICB9Owo+ID4KPiA+IEBAIC01NzYsNyArNTc2LDcgQEAgbXV4IHsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdyb3VwcyA9ICJpMmNfc2NrX2EiLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaTJjX3NkYV9hIjsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gImkyY19hIjsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJpYXMtZGlzYWJsZTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJpYXMtcHVsbC11cDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4g
ICAgICAgICAgICAgICB9Owo+ID4KPiA+IEBAIC01ODUsNyArNTg1LDcgQEAgbXV4IHsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdyb3VwcyA9ICJpMmNfc2NrX2IiLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImkyY19zZGFfYiI7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJpMmNfYiI7Cj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBiaWFzLWRpc2FibGU7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBiaWFzLXB1bGwtdXA7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+
ICAgICAgICAgICAgICAgfTsKPiA+Cj4gPiBAQCAtNTk0LDcgKzU5NCw3IEBAIG11eCB7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncm91cHMgPSAiaTJjX3Nja19jIiwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJpMmNfc2RhX2MiOwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiaTJjX2MiOwo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYmlhcy1kaXNhYmxlOwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYmlhcy1wdWxsLXVwOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIH07Cj4g
PiAgICAgICAgICAgICAgIH07Cj4gPgo+ID4gQEAgLTYwMyw3ICs2MDMsNyBAQCBtdXggewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3JvdXBzID0gImkyY19zY2tfY19kdjE5IiwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJpMmNfc2RhX2NfZHYxOCI7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJpMmNfYyI7Cj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaWFzLWRpc2FibGU7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBiaWFzLXB1bGwtdXA7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgfTsKPiA+ICAgICAgICAgICAgICAgfTsKPiA+Cj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
