Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36383C83F04
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH54cJZbCItx6JdzKpPrhOIf/o+d3240UqzCRGvdgNE=; b=t5fAL/43joFvP8
	W5iiJdCybD54Z42L4VhMQHuKkmF2U7WKiRasxyJLrx1ptcEcWM3JQbAUpK3Vpg8m1rapMtT5SGnEs
	481WgK+Olco2M1jSYvQE4sqYMPx6X+lUmKd7Ernsc+38Rc5ZaM5KhqoL2ShmaPGYvuj/Kp39Spaoa
	cUDXczalTBK3sMsoBvFBhndnhRt51gmRh21dbUvJ//jdbIYjzEjBEKdnSbVvGKmiorTN1TjV6f1ym
	lVeX9fj/Jc5KQWPTV/Mlw9tHKZBwubiOWA8MtmCEoC6EyKlqDllc4FCfttv3LuOnQHmZl7ssujR4o
	tSP4Ewkcz4QIg9cO5N9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4Zs-00000009YRf-0oUK;
	Wed, 02 Jul 2025 21:01:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4WV-00000009Y5N-09so;
	Wed, 02 Jul 2025 20:57:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23526264386so44748915ad.2;
        Wed, 02 Jul 2025 13:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1751489862; x=1752094662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueVYBf/vvIdXw8MFHMMhsOsTsQ52WkYR53FawATwmKc=;
        b=gyQriaoIP0eSsTl6XhQkynrvK1TubZV7VxduRX0Vqe/Rkto/5SVFhCwVnYD4oUh9WI
         k3r9veAvl4Pl6CH6r72uwr4p8T8idIlJkervm6fDA7QXPI5PWuZ2Ait5LIYFyxceA7rN
         7HvbHaZPRODaUto8pplGaFtVBH0k6WvytLiSZSPAMdlJ7tUs7Y+KM59pX7KGSm2SC1uG
         cDwJYFQfnl1tvDiGJhUV3UMA0D6XnLad5ZfjhPCYEzTAd6qpC8yepHzTrFccUxtvoiwV
         jdNDUQFAgsKkAVbeKH2eq9LthVUUSCK3qiV0OHe6XGXMrVulSK6QAMjIp14+Mr5eOyet
         jM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751489862; x=1752094662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueVYBf/vvIdXw8MFHMMhsOsTsQ52WkYR53FawATwmKc=;
        b=P8x/h8CFcyoGdRS310Oc4qRvYtoRKwwRzAXpS12VSjVaqExIMeQhkS1mfzAY7cW0q5
         0/aQfFUw+4zCS7EFN7LOUUDGLmMo9M9Ftd9SRP6ZxRSzEsQzLw6qi2vZ9V9SqqdXGxxr
         NKdB9BbbiUYwbsxhwpTj2Z19qts9I9D+E8gLHFWp+sUZxsdjSJnIDh5NVx4F8BWZ0jSx
         EooH33dDX6k8gKvdbX+iBJAjGCB/O5BJYKsLzVvmWvXyKHhnCNEY+cKtO/uueU8CuIm6
         MruG6bLShrZuE8czFJY2pZHGEbLDlSlzxcK5Xtfi1DZMBXU+Mx1hts7soR6LFsVMgVLT
         dmpA==
X-Forwarded-Encrypted: i=1; AJvYcCUAd7rzVUvDo4QhrPz0k/jwmZORZWohC+HEj27J7u5muS9oTPa1cALCqISIBNXsFV7fqYo8xlMBelqTKUek@lists.infradead.org, AJvYcCWFfdgypk7fCNS6T+Vsgx7oarX4Cwaf5AtiUL+oeAn8SvRfxQQEq5q/Kto0Pl82P8EU0REkLviml0ZV3qj5ySh2Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkLStF08byD9YWgpsIBs1w/6W/pxnO8Qg73bIUTcbCg9bhHDqA
	GRhIx0qy2aEIkBxxCSpn9MrU2zBAjERCmicYEd9EEcNqe7fUlUxOAWd3km9MT+UI/qvamZwHPXt
	dPuGd2wfurSXe3y6oaTxDyJSzQqaGZAo=
X-Gm-Gg: ASbGncu57KHFScl2l74rhR7BEYs8wgkPeYQrbE5jLjbQy+cvkZavZwetlYPqSFmgz7A
	/a6pVyKhMJaNBvkP0jX0/K+Y0rFL5zI5Fc/cowa3ysl9+GyqMfMsbpOF4Non7ke65bQ8xyxIIIY
	bL7/ZN/nmvYoDcvgJYLapsDbZ2Gyr0QkjHWzurLx2ypl41FbiOHQmhKQ7J4jXh0b0CBduVD9+7v
	8Cj
X-Google-Smtp-Source: AGHT+IGjgIPfifmbYpcB2lF3QfBA5zuc6wFJQKxRY4/yEEmq/VYap82lAwrs8+bzvEScw/tJQqdROF0TMX1gsfJcQ+g=
X-Received: by 2002:a17:902:d481:b0:235:f078:473e with SMTP id
 d9443c01a7336-23c6e5cade9mr66917995ad.43.1751489862178; Wed, 02 Jul 2025
 13:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com> <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
In-Reply-To: <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 2 Jul 2025 22:57:31 +0200
X-Gm-Features: Ac12FXz6XZtGm-3ti_MXvq5_F1onfeA5_tjNx4dcE-d4NTCOTzJlhlVHJUTnayc
Message-ID: <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Da Xue <da@libre.computer>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Anand Moon <linux.amoon@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_135743_093643_8C71DF24 
X-CRM114-Status: GOOD (  22.09  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA5OjA34oCvUE0gRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRl
cj4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAyLCAyMDI1IGF0IDI6NDDigK9QTSBNYXJ0aW4gQmx1
bWVuc3RpbmdsCj4gPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+IE9uIFdlZCwgSnVsIDIsIDIwMjUgYXQgNzoyMuKAr1BNIERhIFh1ZSA8ZGFAbGlicmUu
Y29tcHV0ZXI+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIEp1bCAyLCAyMDI1IGF0IDE6MDfi
gK9QTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPiA+IC4u
Lgo+ID4gPiA+IElmLCBhcyB0aGUgZGVzY3JpcHRpb24gc3VnZ2VzdCwgdGhlIHJlZ3VsYXRvciBm
cmFtZXdvcmsgc29tZWhvdyBpZ25vcmUKPiA+ID4gPiB0aGUgdGltaW5nIHNldCBpbiBEVCwgbWF5
YmUgdGhpcyBpcyB3aGF0IG5lZWRzIHRvIGJlIGNoZWNrZWQgPwo+ID4gPgo+ID4gPiBUaGUgcmVn
dWxhdG9yIGZyYW1ld29yayBvbmx5IGNhcmVzIGFib3V0IHRpbWluZyBmb3IgcmVndWxhdG9yIG9u
Lgo+ID4gPiBSZWd1bGF0b3Igb2ZmIGp1c3QgdHVybnMgb2ZmIHRoZSByZWd1bGF0b3IgYW5kIHJl
dHVybnMgd2l0aG91dCBkZWxheS4KPiA+IFRoZXJlJ3MgYW4gZXhjZXB0aW9uIHRvIHRoaXM6IGdw
aW8tcmVndWxhdG9ycyB3aXRob3V0IGFuIGVuYWJsZS1ncGlvcwo+ID4gcHJvcGVydHkuIE15IHVu
ZGVyc3RhbmRpbmcgaXMgdGhhdCByZWd1bGF0b3JfZGlzYWJsZSgpIGlzIGEgbm8tb3AgaW4KPiA+
IHRoYXQgY2FzZSAobWVzb25fbW1jX3NldF9pb3MoKSBldmVuIGhhcyBhIGNvbW1lbnQgYWJvdmUg
dGhlCj4gPiBzd2l0Y2gvY2FzZSBzdGF0ZW1lbnQpLCBzZWUgWzBdLgo+ID4KPiA+ID4gVGhlIGNv
ZGUgbWFrZXMgaW5jb3JyZWN0IGFzc3VtcHRpb25zLiBUaGVuIHRoZSBrZXJuZWwgcmVzZXRzIHRo
ZSBib2FyZAo+ID4gPiB3aXRob3V0IGhhdmluZyBlbm91Z2ggdGltZS4KPiA+IENhbiB5b3UgcGxl
YXNlIG5hbWUgdGhlIGJvYXJkIHlvdSdyZSB0ZXN0aW5nPyBJJ20gd29ycmllZCB0aGF0IEknbGwg
YmUKPiA+IGxvb2tpbmcgYXQgb25lIC5kdHMgYnV0IHlvdSdyZSBsb29raW5nIGF0IGFub3RoZXIg
b25lLgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpYnJlLWNvbXB1dGVyLXByb2plY3QvbGlicmV0
ZWNoLWxpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1s
aWJyZXRlY2gtY290dG9ud29vZC5kdHNpI0w0ODEKPgo+IHZjY19jYXJkIGlzIGEgZ3BpbyByZWd1
bGF0b3IgdGhhdCBnZXRzIHRvZ2dsZWQgb24tPm9mZi0+b24uClRoYW5rcywgdGhhdCBjbGVhcnMg
dGhpbmdzIHVwIGFzIEkgd2FzIGluZGVlZCBsb29raW5nIGF0IGEgZ3BpbwpyZWd1bGF0b3Igd2hp
bGUgdGhpcyBpcyBhIGZpeGVkIHJlZ3VsYXRvciEKCj4gSSB0cmFjZWQgdGhlIHJlZ3VsYXRvciBm
cmFtZXdvcmsgYSBmZXcgd2Vla3MgYWdvIGFuZCBmb3Jnb3QgdGhlIGZpbmFsCj4gcmVndWxhdG9y
IGRpc2FibGUgZnVuY3Rpb24gY2FsbCwgYnV0IHRoYXQgY2FsbCBiYXNpY2FsbHkgcmV0dXJuZWQK
PiBpbW1lZGlhdGVseSB3aGlsZSB0aGUgcmVndWxhdG9yLWVuYWJsZSBmdW5jdGlvbiBjb21wbGVt
ZW50IGhhZCBkZWxheXMKPiBpbXBsZW1lbnRlZC4KWWVwLCBmb3IgZml4ZWQgcmVndWxhdG9ycyB0
aGVyZSdzIGFuICJvZmYtb24tZGVsYXktdXMiIGRldmljZS10cmVlCnByb3BlcnR5ICh3aGljaCB0
cmFuc2xhdGVzIHRvICJvZmZfb25fZGVsYXkiIGluIHRoZSBjb2RlKS4KSXRzIGltcGxlbWVudGF0
aW9uIGlzIHNtYXJ0IGVub3VnaCB0byBub3Qgd2FzdGUgdGltZSBieSBhZGRpbmcgZGVsYXlzCmF0
IHJ1bnRpbWUgYnkgaW1wbGVtZW50aW5nOiBvbiAtPiBvZmYgKyByZW1lbWJlciB0aW1lIC0+IHdh
aXQKcmVtYWluaW5nIHRpbWUgKyBvbiAobWVhbmluZzogaWYgdGhlcmUgd2FzIGVub3VnaCB0aW1l
IGJldHdlZW4gb2ZmIGFuZAp0aGUgc2Vjb25kIG9uIHRoZXJlJ3Mgbm8gYWRkaXRpb25hbCB3YWl0
KSBbMF0uIE9uIHN5c3RlbSBzaHV0ZG93biBpdAp3aWxsIG5vdCBhZGQgYW55IGRlbGF5IHVuZm9y
dHVuYXRlbHkgKHdoZXJlIExpbnV4IGxvc2VzIGNvbnRyb2wgb3Zlcgp0aW1lLWtlZXBpbmcpLCBt
ZWFuaW5nIHdlIGNhbiBlbmQgdXAgd2l0aCB0b28gbGl0dGxlIHdhaXRpbmcgdGltZS4KCkFsc28g
bXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0J3Mgbm90IHNvbWV0aGluZyB0aGF0IGNhbiBiZSBm
aXhlZCBpbgp1LWJvb3Qgb3IgVEYtQS4gVGhpcyBpcyBiZWNhdXNlIGJvb3Ryb20gYWxyZWFkeSBo
YXMgdHJvdWJsZSByZWFkaW5nCnRoZSBuZXh0IHN0YWdlIGZyb20gYW4gU0QgY2FyZCAod2hpY2gg
aXMgYSB2YWxpZCBib290IG1lZGlhKS4KCgpbMF0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTUvc291cmNlL2RyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyNMMjc1NAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
