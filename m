Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA73C46CCD
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74jZhPWGeBc8FB5riZctO1NYz/oT1DRuy3r00HzLEHE=; b=CJUlA/2TEZ3a/A
	CUo3T+AopaHyEpRahjNl9GX5qPtt0pxwg50vDKnYyavu1xGgI3jmjZdzMV0g6EEI0bMgvQDOT/u4R
	7ahFG6DMTLOZwM9yvxSzAyX/GOMs6rbWYyKOFa0iNrwy4aYeH5T4SE6zg9Jcb2eOQCGk4yC24HEt3
	iahKNxM7IVzgkmlFCqiG9Afq6r4iGoQyXJtVMBIBBFcaufR6u/ZULGTY1uZ26obIbBZYRIfG1MLRr
	LzfHV3RBqT7b47Ae3cP6NvvsNaYseAvmFy1B6R+6PQkpjLBwKMNJD7JWy/vAVSnuJGZuB1cpHd3Gv
	adTpWt1xvq2JYts96cEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGRkb-004L1m-0k;
	Thu, 21 Dec 2023 22:42:45 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGRkY-004L1P-1Q
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Dec 2023 22:42:44 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5cda24a77e0so752340a12.2
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Dec 2023 14:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1703198560; x=1703803360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTQxlQCO+Gf4xIjXRg1HmFnmLBOGQYr6tXPcOA6WFzY=;
        b=lfSb6Xpwx1bMlJDDC7ur+2491SSnF6Tt/WRNNhtm5yR5p3KC6ebcawy44AFLkN39Jz
         Zn/f7dEGP+NxdvAchKhpa/6WDLXokVPyvqn68Zq9hK3rT7kawkH8WFsyf8Euc6acxqij
         lNScsoMoZ/8a7MHqTxW9qyJdSfut+akyq8Jby9OSV9lzHAvhhYq7KZQD1yRdROATP9Wj
         +DM9hLf9vqIjp0AqyWvqCbWJXVHs3PXHH2Ly8mghm/9cHgAmvNpWWwwtddZgzDToEe4Q
         FJbhXHtV62sR8dOwXlPs2RUD2KA9UjvX9kEL2kAKYg7fc/QCAUFAyVrdBZc3Qyeih4Cq
         ujcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703198560; x=1703803360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTQxlQCO+Gf4xIjXRg1HmFnmLBOGQYr6tXPcOA6WFzY=;
        b=KBjDmApMH1RAs8SciSKPmzHZ93pZytfbqbwveWYG9Iy9JbhdXVl2wSnytKYHHII6MD
         tzUgjzpq8weCIUhOigR11/Fvs20Cvk0giABtV0RN1oXFe93TqZIrN20OiWdQF0ULShWP
         muk6FUtrjVewdrOoOy8nlB1gleuC7RmUXWSoY8Swsi0XqPack3OR/dCOV3HtAfrTqrFB
         Qz8nRBPbSVWaVAPvIWc9hneT8ORtDO/rAjVg+rXDgDDf31O4PLldz8WkcIcJfWZxTfHS
         YN1eAqZFLnuDdNlJciBsS2e2F7+lANUHupbrFPCJhtpyrPdoOMv4NpM2m9DJZRYQBfua
         KAkA==
X-Gm-Message-State: AOJu0YyK4LAcs3cszPNQavyyblG5H8E9JTLg4bqdjgneETM1BviGAUUS
	DewR4PDNIgT13B3YZuWpiW35591lJU0KNrlr8Us=
X-Google-Smtp-Source: AGHT+IFs18DvgzMKPzBRIvgnZpu8I+QVnR7YPq+Vnesd+qyDskEada4/byLmH1j6vYxxxmhT3SvY3lJ3atYoHbL7e/8=
X-Received: by 2002:a05:6a20:8b04:b0:18f:97c:8261 with SMTP id
 l4-20020a056a208b0400b0018f097c8261mr338231pzh.107.1703198560349; Thu, 21 Dec
 2023 14:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com> <0c99b575-5cf2-4bd6-8cfd-af19f5fd58da@sirena.org.uk>
In-Reply-To: <0c99b575-5cf2-4bd6-8cfd-af19f5fd58da@sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Dec 2023 23:42:29 +0100
Message-ID: <CAFBinCDJnVzE2sMwu52MQGTKW7dtCuUoj63ZZHhJPJO0+dZDkg@mail.gmail.com>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_144242_644144_65689A2D 
X-CRM114-Status: GOOD (  25.25  )
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

SGkgTWFyaywKCk9uIFRodSwgRGVjIDIxLCAyMDIzIGF0IDEwOjQ14oCvUE0gTWFyayBCcm93biA8
YnJvb25pZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgRGVjIDIxLCAyMDIzIGF0IDEw
OjEyOjIyUE0gKzAxMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4KPiA+IEl0IHR1cm5z
IG91dCB0aGF0IGF0IGxlYXN0IHNvbWUgYm9vdGxvYWRlciB2ZXJzaW9ucyBhcmUga2VlcGluZyB0
aGUgUFdNCj4gPiBvdXRwdXQgZGlzYWJsZWQuIFRoaXMgaXMgbm90IGEgcHJvYmxlbSBkdWUgdG8g
dGhlIHNwZWNpZmljIGRlc2lnbiBvZiB0aGUKPiA+IHJlZ3VsYXRvcjogd2hlbiB0aGUgUFdNIG91
dHB1dCBpcyBkaXNhYmxlZCB0aGUgb3V0cHV0IHBpbiBpcyBwdWxsZWQgTE9XLAo+ID4gZWZmZWN0
aXZlbHkgYWNoaWV2aW5nIGEgMCUgZHV0eSBjeWNsZSAod2hpY2ggaW4gcmV0dXJuIG1lYW5zIHRo
YXQgVkRERUUKPiA+IHZvbHRhZ2UgaXMgYXQgMTE0MG1WKS4KPgo+IEhybS4gIFBlcmhhcHMgdGhl
IHJlZ3VsYXRvciBzaG91bGQgZmlndXJlIG91dCB0aGF0IGl0J3Mgb24gd2l0aCBhCj4gbWluaW11
bSB2b2x0YWdlIG9mIDEuMTRWIGluIHRoaXMgY2FzZSAtIEFJVUkgdGhhdCBicm9hZGx5IGNvcnJl
c3BvbmRzIHRvCj4geW91ciBjaGFuZ2UgZXhjZXB0IGZvciB0aGUgZmFjdCB0aGF0IGl0IGRvZXNu
J3QgcmVjb2duaXNlIHRoYXQgdGhlcmUncwo+IGFjdHVhbGx5IGFuIG91dHB1dCBpbiB0aGlzIGNh
c2Ugc2luY2UgaXQgYXNzdW1lcyB0aGF0IGRpc2FibGluZyB0aGUgUFdNCj4gZGlzYWJsZXMgdGhl
IG91dHB1dCB3aGljaCBpc24ndCB0aGUgY2FzZSB3aXRoIHRoaXMgaGFyZHdhcmUuICBXZSdkIG5l
ZWQKPiB0byBrbm93IG1vcmUgYWJvdXQgdGhlIFBXTSBpbiB0aGF0IGNhc2UgdGhvdWdoIEkgdGhp
bmsuCklmIHlvdSBoYXZlIGFueSBzcGVjaWZpYyBxdWVzdGlvbnMgdGhlbiBmZWVsIGZyZWUgdG8g
YXNrLgpHZW5lcmFsbHkgaXQncyBhIHZlcnkgc2ltcGxlIFBXTSBjb250cm9sbGVyOgotIHdoZW4g
ZGlzYWJsZWQgdGhlIG91dHB1dCBpcyBMT1cKLSB3aGVuIGVuYWJsZWQgdGhlIG91dHB1dCBtYXRj
aGVzIHRoZSByZXF1ZXN0ZWQgcGVyaW9kIGFuZCBkdXR5IGN5Y2xlCmFzIGJlc3QgYXMgcG9zc2li
bGUgKGRlcGVuZGluZyBvbiB0aGUgYXZhaWxhYmxlIGlucHV0IGNsb2NrcykKCj4gPiBUaGUgcHJv
YmxlbSBjb21lcyB3aGVuIHRoZSBwd20tcmVndWxhdG9yIGRyaXZlciB0cmllcyB0byBpbml0aWFs
aXplIHRoZQo+ID4gUFdNIG91dHB1dC4gVG8gZG8gc28gaXQgcmVhZHMgdGhlIGN1cnJlbnQgc3Rh
dGUgZnJvbSB0aGUgaGFyZHdhcmUsIHdoaWNoCj4gPiBpczoKPiA+ICAgcGVyaW9kOiAzNjY2bnMK
PiA+ICAgZHV0eSBjeWNsZTogMzMzM25zICg9IH45MSUpCj4gPiAgIGVuYWJsZWQ6IGZhbHNlCj4g
PiBUaGVuIHRob3NlIHZhbHVlcyBhcmUgdHJhbnNsYXRlZCB1c2luZyB0aGUgY29udGludW91cyB2
b2x0YWdlIHJhbmdlIHRvCj4gPiA4NjBtVi4KPgo+ID4gTGF0ZXIsIHdoZW4gdGhlIHJlZ3VsYXRv
ciBpcyBiZWluZyBlbmFibGVkIChlaXRoZXIgYnkgdGhlIHJlZ3VsYXRvciBjb3JlCj4gPiBkdWUg
dG8gdGhlIGFsd2F5cy1vbiBmbGFnIG9yIGZpcnN0IGNvbnN1bWVyIC0gaW4gdGhpcyBjYXNlIHRo
ZSBsaW1hCj4gPiBkcml2ZXIgZm9yIHRoZSBNYWxpLTQ1MCBHUFUpIHRoZSBwd20tcmVndWxhdG9y
IGRyaXZlciB0cmllcyB0byBrZWVwIHRoZQo+ID4gdm9sdGFnZSAoYXQgODYwbVYpIGFuZCBqdXN0
IGVuYWJsZSB0aGUgUFdNIG91dHB1dC4gVGhpcyBpcyB3aGVuIHRoaW5ncwo+ID4gc3RhcnQgdG8g
Z28gd3JvbmcgYXMgdGhlIHR5cGljYWwgdm9sdGFnZSB1c2VkIGZvciBWRERFRSBpcyAxMTAwbVYu
Cj4KPiBTbywgdGhlIGNvbnN0cmFpbnRzIHNheSB0aGF0IHRoZSA4NjBtViB2b2x0YWdlIGlzIHdp
dGhpbiByYW5nZS4gIFdoZXJlCj4gZG9lcyB0aGUgcmVxdWlyZW1lbnQgZm9yIDEuMVYgY29tZSBm
cm9tIGluIHRoaXMgc2l0dWF0aW9uPyAgSXMgaXQganVzdAo+IHRoYXQgbGltYSBoYXNuJ3Qgc3Rh
cnRlZCB5ZXQgYW5kIHJlcXVpcmVzIHRoZSAxLjFWIGZvciBoYXJkd2FyZSBpbml0Cj4gKGFuZCBw
cmVzdW1hYmx5IHBvd2VyIG9uKSBldmVuIGlmIGl0IGNhbiB1c2UgYSBsb3dlciB2b2x0YWdlIGF0
IHJ1bnRpbWU/ClRoZSB2ZW5kb3IgQlNQIGluY2x1ZGVzIGEgY3VzdG9tIHUtYm9vdCB3aXRoIGxv
dHMgb2YgcmVsZXZhbnQKaW5mb3JtYXRpb24gZm9yIHdoaWNoIHRoZXJlJ3Mgc2VlbWluZ2x5IG5v
IGRvY3VtZW50YXRpb24uCkl0IHNlZW1zIHRoYXQgMS4xViBpcyB3aGF0IHNob3VsZCBiZSB1c2Vk
IGR1cmluZyBub3JtYWwgb3BlcmF0aW9uLgowLjg2ViBpcyB3aGF0IGNhbiBiZSB1c2VkIGR1cmlu
ZyBzeXN0ZW0gc3VzcGVuZCAod2hlbiBwb3dlciB0byB0aGUKQ29ydGV4LUE1IGNvcmVzIGlzIHR1
cm5lZCBvZmYgYW5kIGFuIGludGVncmF0ZWQgQVJDIGNvcmUgaXMgdGFraW5nCm92ZXIgZm9yIHdh
a2V1cCBwdXJwb3NlcykuCkhlbmNlIHRoZSBzdXBwb3J0ZWQgdm9sdGFnZSByYW5nZSBvZiAwLjg2
Li4xLjFWCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
