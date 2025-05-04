Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FF3C369DC
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 May 2025 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hH1rkxzDv/QBEAWv3jZv0bWVGaqPfYVM5hLut97auB4=; b=a19SlDXamWUgPM
	qJPgLrrjw8SMjgmYMMSSRUxMwQMZU1MKzux18j2kJrpUSrojC0y11UsdMUZocP/FjIoqRI+ZLIDCT
	rf4K1XBZeRmHDFXApJCKSjmKgrqJFFN2jHYbqP63o8VaitTGfeE7PrxE58Ut/6rJaEp9uVCBKDt6r
	APasnv4DvMxdXulSA+YRN58IzSWMYRK+PAw5Xh0yFb9ESKLb8LeTIRJhll8dVDsi8B+tvJOIFbxy6
	vKMQL7RdWm1Iud7jnIqPxOomfizvwYwartrOj3OdJD7FAXTiLrt8wNNOP0t5MOS/wD3Ul/5f1VYg9
	/UCcuT0yPFjE8kcGusKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgbR-00000005xmb-215a;
	Sun, 04 May 2025 21:10:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgaP-00000005xdt-1yWB;
	Sun, 04 May 2025 21:09:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2241053582dso56143095ad.1;
        Sun, 04 May 2025 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392960; x=1746997760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
        b=f1sUTUS8Hkwfk3z7uwwF0wjOzZv0+ZW3sLBnS7va56ELYKIWjAeGevU9SjHP9pwoEp
         j74WqvsWVcKgvd8P3Cl8DYtDubkZwaAbsNtiXFhTBKsBmZY9kFT3FxWMiZounyhfwBGu
         Mz0CfVljYxkFb4T7TsZqcWNGt56ID7GWn+YkRNTHGkXDyzzXH9wSxpPG34HrrZfxQL7c
         XcchrjztHtAHOgdpRbNhjc0q9/63WWdzgFGKAL2U7nrz9nfJWQy5yAJHnJJG3itMGCPN
         8QuFXU57XfO3RQvLjPTn4uisbXNwYhYSvGI2ARSSVsb8/5AGaBUpTlvQ8HkCT6KSph6Z
         HK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392960; x=1746997760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
        b=lyHvQVHMIhJlHYTWxLl06kB08JuvgzLIr0C+pZ7uZ3CL7raiwWAt07YG/oZ0/x9+gv
         cqSxWU9TkAVunOEU/c8IT9H4mXZNNghK2yhs3yCh2ywrdRfkkXU5ixWt5SxSvTEkTO+o
         2w+gurNg3ZsvlBDqiSNZexZXvWHUDtGwDnYBhPOe7DpTn/MkLB7af0x+94l+JgM3txSn
         Be4KkujNfyMxN9lB8icH0ru/FBuknWgzy8Oup0FhI9qWlqyeBcncOZQ1I6hql/MimQVv
         FHprjy99umgF8eXbxHrfzN32vsFYhYJY4uuN0//WTPkiUdB3dZdWsaZS4CVrnJ9rYYwF
         SHEw==
X-Forwarded-Encrypted: i=1; AJvYcCU8lQdxwuLykLw4vUeipTbsjewKL6lsbr/r3tT9Q5xY5NDWG8tHUVUsEqFb+oVh6zTWmXSk+/O6k32CusM6kqTw@lists.infradead.org
X-Gm-Message-State: AOJu0YxZSY9bS6cwM8bpI4NgCxBf4529vViDD+ya9h6xYyd5vohP8Mjt
	0B+MsvjHZfHoBEuTfqKxX5fM1Tgfy4WTJRbP9Na+fb0j3VMMtPSRfGLxgopPVlIrwLQZXZ1QPQR
	bLUC9OHsHEnoGtPq4FnO+PPd/EJk=
X-Gm-Gg: ASbGncvaf0PhVkP468FZOv7y/3YaWnklvWX6DmVvqUh/jXz89J8AGhfO0iBpGm4OXMM
	9FzABp2V/GPxydAQYM8EK2RV+Z7yB5rvNNnmsKttdWwD9picbZAsOb1o1OcWFcPCyReNmqPE1om
	zWqktoAG251qLNWA17pjKg7o5/2Dc8zWUtCv6Ic67aeQ90Ej3fcUheeCA=
X-Google-Smtp-Source: AGHT+IEyQ8Cn4QAYZf+y84T7uCSwNBjwsnr+WPyy9pwHvrfCp2EP9RKPuRWxICK3yBH7elJzirFItrsmdm3FGbNjikM=
X-Received: by 2002:a17:902:f541:b0:224:c46:d166 with SMTP id
 d9443c01a7336-22e1ea96542mr80783075ad.40.1746392960457; Sun, 04 May 2025
 14:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl> <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org> <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
In-Reply-To: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:09:09 +0200
X-Gm-Features: ATxdqUFTzdLXr8lgfVVRwynOfAK5_xWM8dvz6TKO1bT-XzLgIOntX4SmbjH_alg
Message-ID: <CAFBinCDxhx6siM0woQCJwr2J_SJNJq9gKYm2qLu8W=bN4DWj8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: neil.armstrong@linaro.org, linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140921_507025_5F169D0A 
X-CRM114-Status: GOOD (  24.09  )
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

T24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgOToyM+KAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDIyLzA0LzIwMjUgMDk6MDQsIG5laWwu
YXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4gPiBPbiAxOS8wNC8yMDI1IDIzOjMyLCBNYXJ0
aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+ID4+IEhpIE1hcnRpam4sIEhpIE5laWwsCj4gPj4KPiA+
PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCA4OjQ24oCvUE0gPGxpbnV4QG1hcnRpam52YW5kZXZl
bnRlci5ubD4gd3JvdGU6Cj4gPj4+Cj4gPj4+IEhpIE1hcnRpbiwKPiA+Pj4KPiA+Pj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guCj4gPj4+Cj4gPj4+IEkgZW5jb3VudGVyZWQgdGhpcyBpc3N1ZSBz
b21lIHRpbWUgYWdvIGFzIHdlbGwgYW5kIGhhZCBhIHBvc3NpYmxlIGZpeCBpbiBteSB0cmVlIChz
ZWUKPiA+Pj4gYmVsb3cpLgo+ID4+PiBNeSBhcG9sb2dpZXMgZm9yIG5vdCB1cHN0cmVhbWluZyBp
dCBlYXJsaWVyLgo+ID4+IE5vIHdvcnJpZXMsIHdlJ3JlIGFsbCBidXN5IHdpdGggYm90aCwgb2Zm
bGluZSBhbmQgb25saW5lIGxpZmUgOy0pCj4gPj4KPiA+Pj4gV2hpbGUgbXkgZml4IGlzIG5vdCBh
cyBzeW1tZXRyaWMgYXMgeW91cnPigJRJIGxpa2Ugc3ltbWV0cnnigJRpdCBpcyBzb21ld2hhdCBz
aW1wbGVyLiBJdAo+ID4+PiBkaWQgbWFrZSB0aGUgYXNzdW1wdGlvbiB0aGF0IG9ubHkgIGNhbGxp
bmcgY29tcG9uZW50X3VuYmluZF9hbGwoKSB3YXMgYXQgZmF1bHQgYW5kIHRoZSB0aGUgcmVzdCBv
ZiB0aGUKPiA+Pj4gY29kZSB3YXMgY29ycmVjdC4gVGhlcmVmb3JlLCBjYWxsaW5nIG9uZSBvZiB0
aGUgZm9sbG93aW5nIGZ1bmN0aW9uczoKPiA+Pj4gbWVzb25fZW5jb2Rlcl9kc2lfcmVtb3ZlKCkK
PiA+Pj4gbWVzb25fZW5jb2Rlcl9oZG1pX3JlbW92ZSgpCj4gPj4+IG1lc29uX2VuY29kZXJfY3Zi
c19yZW1vdmUoKQo+ID4+PiBpbiBjYXNlIHRoZWlyIGNvdW50ZXJwYXJ0IHdhcyBub3QgY2FsbGVk
LCBzaG91bGQgbm90IHJlc3VsdCBpbiBhbnkgaXNzdWVzLgo+ID4+Pgo+ID4+PiBJIGp1c3QgdmVy
aWZpZWQsIGFuZCwgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgYWxsIG9mIHRoZXNlIGZ1bmN0aW9u
cyBkbyBhIGNoZWNrIHRvIGNvbmZpcm0KPiA+Pj4gd2hldGhlciB0aGUgZW5jb2RlciB3YXMgaW5p
dGlhbGl6ZWQgYmVmb3JlIHByb2NlZWRpbmcgd2l0aCBjbGVhbnVwLgo+ID4+IFllcCwgdGhhdCBz
ZWVtcyB0byBiZSB0aGUgY2FzZSByaWdodCBub3cuCj4gPj4gTmVpbCwgd291bGQgeW91IGxpa2Ug
TWFydGlqbidzIG1vcmUgc2ltcGxlIGFwcHJvYWNoIHdpdGggYSBGaXhlcyB0YWcKPiA+PiBhbmQg
YmFja3BvcnQgdGhhdD8KPiA+PiBUaGVuIEknZCBzZW5kIG15IHBhdGNoIGFzIGEgc21hbGwgY2xl
YW51cCB3aGljaCBkb2Vzbid0IGhhdmUgdG8gYmUKPiA+PiBiYWNrcG9ydGVkLiBPdGhlcndpc2Ug
SSdkIHNwaW4gYSB2MiB3aXRoIGEgZml4IGZvciB0aGUgaXNzdWUgdGhhdAo+ID4+IE1hcnRpam4g
Zm91bmQgKGFuZCBpbmNsdWRpbmcgQW5hbmQncyBSZXZpZXdlZC9UZXN0ZWQtYnkpPwo+ID4KPiA+
IFBsZWFzZSBzZW5kIGEgZm9sbG93LXVwLCBJJ2xsIGFwcGx5IHRoaXMgb25lIHRvZGF5Lgo+ID4K
Pgo+IFllYWggZmluYWxseSBwbGVhc2Ugc3BsaXQgdGhpcyBpbiB0d286Cj4gLSBwYXRjaCAxIHRo
YXQgY2FuIGJlIGJhY2twb3J0ZWQKTWFydGlqbiwgSSBzdGlsbCBoYXZlbid0IGZvdW5kIHRoZSB0
aW1lIHRvIHNlbmQgYSBzbWFsbCBwYXRjaCB0aGF0IGNhbgpiZSBlYXNpbHkgYmFja3BvcnRlZC4K
SWYgeW91IHdhbnQgdG8gc3VibWl0IHlvdXIgdmVyc2lvbiBvZiB0aGUgcGF0Y2g6IHBsZWFzZSBn
byBhaGVhZCEKT3RoZXJ3aXNlIEknbGwgbmVlZCB0byBmaW5kIHNvbWUgdGltZSBuZXh0IHdlZWsu
CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
