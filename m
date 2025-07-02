Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2528C83F03
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJ7p8OMTRitRrh8eecBU3o4IZZinHFcHQqFUcLqR8iU=; b=gCtHYc6IFOY9oH
	8csOp77rOv03CEfIADVWdSkoS58BQF9R++rGwj2jIqHsyZ6GcqVo/dbH3ieYHI8MVWxkZwgjz+ODG
	1Zj5ucFadoULjlSkrSPpVsSj/QbPehlRL2MnMuCijPvbozEPXHv7z7iRc6gsBHjMm9MoGtK89qIy8
	K1sJNcZ/rBu9oxXOxEPd1hG8V9ZSBFCwfybRYSXNQOXlOr1gKtC/OW5kSzjW2BJV2depALXeR8QcQ
	TT1XwMJWb9owxQlbXVNWl+USS5KV4O+AFK9mMVx8mexq7HbS6JHWuOu0yq88fA6IrH7ITgIWgXCLk
	BoYkYHLyXc3D1qldC5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4dz-00000009Ysp-28fD;
	Wed, 02 Jul 2025 21:05:27 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4dZ-00000009Ynl-36s6
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 21:05:03 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-711756ae8c9so74224907b3.3
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751490301; x=1752095101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=;
        b=RnlHZZ2L/OkhV1bCHmJMCdegFGUIRM/oHZmiAY2eLv+TG/M5OSpwbmG+F+AF0X4Hw0
         Kf4DHtVUA1Tkj2LypXeN2b88HpJQ1UQ6cXq4WOSgTG59otI8H94hkcmqlA/iMHF5HpfZ
         41NUQVPROCVHp59N/yFk3rLaEnSemZ5+4ksq0AF3hoEJ1lbjNc6OhdAbpN+KAMdCxqNn
         H5B6bLDFe+EB9qAPAPOjiiA2p2BgiiEx7GtoXACmQFDuYDyKOOsQ1pMB8L5GzpwnGg4h
         SZ3o/+YVnnUn9dqEn6KqCB1ZiP9uxUlSCBf8Td/jEqbLRoX6rC2Bzg4Pjkzx8Q7Vmj+J
         /FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751490301; x=1752095101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=;
        b=TyzaJfBST+dS3xJw81/znok44lf9Wma9nQMRFiX+4ifuvKvLbaAYYcAjr5bxtPI6eW
         +GCWhOV6BhQidk/YRBdw0yTZu3tGcK+nRonvt+IkJliWWq9GPK4j9GrhnYnpFLngMzB7
         Fd83imxmm+/Zn4yve7MipI4L1hL6nYoJke/mR1svl0roV1Vf2sD7Z2dOiuc8JZP5oEsl
         o0azaCOJqSA4M40iAhOhM52peSh/DGTu1ffj6VjKxFDRPy2yneqjmShAj8S97M9L3mtb
         0+4DC1rMZZVZQ3gcgiKgw+IdGN5dAomtwV0ZY/uDeEMv55ulycxsk5M8IvvZh7Bj/KMi
         oYtw==
X-Forwarded-Encrypted: i=1; AJvYcCXt0Tc8WbnWSdE1IU1R4JgIHr8q/iB9YuKrfTY7xaXWIIKq/2OVjF04Vl4RXHT4uPmJyHCW3rrfCEbJmolf@lists.infradead.org
X-Gm-Message-State: AOJu0YyMYPcs3OHa0N5QWDxMMAJK/7nLsls0xDv0We46C3dpwMwVgcHT
	FqN2IlfRugQcvLqRnD/qIgqcLS8PFsGgMmAzy9ux/X5CfAuPZCZdD8Nt032LQngaGDsprTjzI09
	3uHeI0E34gGSi0AwHnQO18eCphm8boAULIG9N7pYr
X-Gm-Gg: ASbGncvijzxgc4tLi4PzlTiyMvMRV8LUUJ7PnKu7ezCASD7Da27YXrH74W/tJJ05aFc
	D5PZkDTZcS6e17A/iId6kXhmX4Uf8rLb5NPu2IYBTeNWURORMFXVwLduzYeI80shYp126htZ04Z
	beesXgDlHUvZCPt2z4KNzeXqE2PZBsIdz4usCIw/ps/E4RHpyY6Jcn34ZUfjAyw6KZkB1vRLXEo
	XLY
X-Google-Smtp-Source: AGHT+IEiQuh5LjlsCcA7qaI9oQhIPWCsjEyB7JTNTj6XFbJ9WVg7qPtMe5Tz7PrvBDjuqNqnia9yn5ArtcfzXOoCqd8=
X-Received: by 2002:a05:690c:6ac2:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-7164d4db0b0mr64094247b3.22.1751490300545; Wed, 02 Jul 2025
 14:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
 <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com> <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
In-Reply-To: <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 17:04:49 -0400
X-Gm-Features: Ac12FXz2eBEQpE1uXBge_BXeozibSAfNnKLrTRR6ZVdJLMP7Abjjpj73aBSCXy4
Message-ID: <CACqvRUbQD3HS=_DH-ZW-D8JTkC_o2PbBkOzcZ44h57JJWW4-mw@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>, 
	Anand Moon <linux.amoon@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_140501_933273_ED5C9098 
X-CRM114-Status: GOOD (  26.69  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA0OjU34oCvUE0gTWFydGluIEJsdW1lbnN0aW5nbAo8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAy
LCAyMDI1IGF0IDk6MDfigK9QTSBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPiB3cm90ZToKPiA+
Cj4gPiBPbiBXZWQsIEp1bCAyLCAyMDI1IGF0IDI6NDDigK9QTSBNYXJ0aW4gQmx1bWVuc3Rpbmds
Cj4gPiA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFdlZCwgSnVsIDIsIDIwMjUgYXQgNzoyMuKAr1BNIERhIFh1ZSA8ZGFAbGlicmUuY29t
cHV0ZXI+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCAxOjA3
4oCvUE0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4gPiA+
IC4uLgo+ID4gPiA+ID4gSWYsIGFzIHRoZSBkZXNjcmlwdGlvbiBzdWdnZXN0LCB0aGUgcmVndWxh
dG9yIGZyYW1ld29yayBzb21laG93IGlnbm9yZQo+ID4gPiA+ID4gdGhlIHRpbWluZyBzZXQgaW4g
RFQsIG1heWJlIHRoaXMgaXMgd2hhdCBuZWVkcyB0byBiZSBjaGVja2VkID8KPiA+ID4gPgo+ID4g
PiA+IFRoZSByZWd1bGF0b3IgZnJhbWV3b3JrIG9ubHkgY2FyZXMgYWJvdXQgdGltaW5nIGZvciBy
ZWd1bGF0b3Igb24uCj4gPiA+ID4gUmVndWxhdG9yIG9mZiBqdXN0IHR1cm5zIG9mZiB0aGUgcmVn
dWxhdG9yIGFuZCByZXR1cm5zIHdpdGhvdXQgZGVsYXkuCj4gPiA+IFRoZXJlJ3MgYW4gZXhjZXB0
aW9uIHRvIHRoaXM6IGdwaW8tcmVndWxhdG9ycyB3aXRob3V0IGFuIGVuYWJsZS1ncGlvcwo+ID4g
PiBwcm9wZXJ0eS4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHJlZ3VsYXRvcl9kaXNhYmxlKCkg
aXMgYSBuby1vcCBpbgo+ID4gPiB0aGF0IGNhc2UgKG1lc29uX21tY19zZXRfaW9zKCkgZXZlbiBo
YXMgYSBjb21tZW50IGFib3ZlIHRoZQo+ID4gPiBzd2l0Y2gvY2FzZSBzdGF0ZW1lbnQpLCBzZWUg
WzBdLgo+ID4gPgo+ID4gPiA+IFRoZSBjb2RlIG1ha2VzIGluY29ycmVjdCBhc3N1bXB0aW9ucy4g
VGhlbiB0aGUga2VybmVsIHJlc2V0cyB0aGUgYm9hcmQKPiA+ID4gPiB3aXRob3V0IGhhdmluZyBl
bm91Z2ggdGltZS4KPiA+ID4gQ2FuIHlvdSBwbGVhc2UgbmFtZSB0aGUgYm9hcmQgeW91J3JlIHRl
c3Rpbmc/IEknbSB3b3JyaWVkIHRoYXQgSSdsbCBiZQo+ID4gPiBsb29raW5nIGF0IG9uZSAuZHRz
IGJ1dCB5b3UncmUgbG9va2luZyBhdCBhbm90aGVyIG9uZS4KPiA+Cj4gPiBodHRwczovL2dpdGh1
Yi5jb20vbGlicmUtY29tcHV0ZXItcHJvamVjdC9saWJyZXRlY2gtbGludXgvYmxvYi9tYXN0ZXIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWxpYnJldGVjaC1jb3R0b253b29kLmR0
c2kjTDQ4MQo+ID4KPiA+IHZjY19jYXJkIGlzIGEgZ3BpbyByZWd1bGF0b3IgdGhhdCBnZXRzIHRv
Z2dsZWQgb24tPm9mZi0+b24uCj4gVGhhbmtzLCB0aGF0IGNsZWFycyB0aGluZ3MgdXAgYXMgSSB3
YXMgaW5kZWVkIGxvb2tpbmcgYXQgYSBncGlvCj4gcmVndWxhdG9yIHdoaWxlIHRoaXMgaXMgYSBm
aXhlZCByZWd1bGF0b3IhCj4KPiA+IEkgdHJhY2VkIHRoZSByZWd1bGF0b3IgZnJhbWV3b3JrIGEg
ZmV3IHdlZWtzIGFnbyBhbmQgZm9yZ290IHRoZSBmaW5hbAo+ID4gcmVndWxhdG9yIGRpc2FibGUg
ZnVuY3Rpb24gY2FsbCwgYnV0IHRoYXQgY2FsbCBiYXNpY2FsbHkgcmV0dXJuZWQKPiA+IGltbWVk
aWF0ZWx5IHdoaWxlIHRoZSByZWd1bGF0b3ItZW5hYmxlIGZ1bmN0aW9uIGNvbXBsZW1lbnQgaGFk
IGRlbGF5cwo+ID4gaW1wbGVtZW50ZWQuCj4gWWVwLCBmb3IgZml4ZWQgcmVndWxhdG9ycyB0aGVy
ZSdzIGFuICJvZmYtb24tZGVsYXktdXMiIGRldmljZS10cmVlCj4gcHJvcGVydHkgKHdoaWNoIHRy
YW5zbGF0ZXMgdG8gIm9mZl9vbl9kZWxheSIgaW4gdGhlIGNvZGUpLgo+IEl0cyBpbXBsZW1lbnRh
dGlvbiBpcyBzbWFydCBlbm91Z2ggdG8gbm90IHdhc3RlIHRpbWUgYnkgYWRkaW5nIGRlbGF5cwo+
IGF0IHJ1bnRpbWUgYnkgaW1wbGVtZW50aW5nOiBvbiAtPiBvZmYgKyByZW1lbWJlciB0aW1lIC0+
IHdhaXQKPiByZW1haW5pbmcgdGltZSArIG9uIChtZWFuaW5nOiBpZiB0aGVyZSB3YXMgZW5vdWdo
IHRpbWUgYmV0d2VlbiBvZmYgYW5kCj4gdGhlIHNlY29uZCBvbiB0aGVyZSdzIG5vIGFkZGl0aW9u
YWwgd2FpdCkgWzBdLiBPbiBzeXN0ZW0gc2h1dGRvd24gaXQKPiB3aWxsIG5vdCBhZGQgYW55IGRl
bGF5IHVuZm9ydHVuYXRlbHkgKHdoZXJlIExpbnV4IGxvc2VzIGNvbnRyb2wgb3Zlcgo+IHRpbWUt
a2VlcGluZyksIG1lYW5pbmcgd2UgY2FuIGVuZCB1cCB3aXRoIHRvbyBsaXR0bGUgd2FpdGluZyB0
aW1lLgoKWWVzLCB0aGlzIGlzIGV2aWRlbnQgb24gcXVpdGUgYSBmZXcgQW1sb2dpYyBib2FyZHMg
YnV0IG9jY3VycmVkIHJhcmVseQplbm91Z2ggdGhhdCBpdCBjYW4gYmUgb3Zlcmxvb2tlZCBidXQg
bmV2ZXItdGhlLWxlc3Mgc2hvdWxkIGJlCmFkZHJlc3NlZC4KCk9uIG91ciBTTTEgYm9hcmQsIHRo
aXMgb2NjdXJzIG1vcmUgb2Z0ZW4gdGhhbiBub3QuIFdpdGggdGhpcyBwYXRjaCwgd2UKY2FuIHJl
Ym9vdCB0aGUgbG9vcCBpbmRlZmluaXRlbHkuCgo+Cj4gQWxzbyBteSB1bmRlcnN0YW5kaW5nIGlz
IHRoYXQgaXQncyBub3Qgc29tZXRoaW5nIHRoYXQgY2FuIGJlIGZpeGVkIGluCj4gdS1ib290IG9y
IFRGLUEuIFRoaXMgaXMgYmVjYXVzZSBib290cm9tIGFscmVhZHkgaGFzIHRyb3VibGUgcmVhZGlu
Zwo+IHRoZSBuZXh0IHN0YWdlIGZyb20gYW4gU0QgY2FyZCAod2hpY2ggaXMgYSB2YWxpZCBib290
IG1lZGlhKS4KCkNvcnJlY3QsIG5vdCBmaXhhYmxlIGluIFRGLUEgb3IgdS1ib290LgoKPgo+Cj4g
WzBdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1L3NvdXJjZS9kcml2ZXJz
L3JlZ3VsYXRvci9jb3JlLmMjTDI3NTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
