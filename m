Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F097FC3ABB7
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 May 2025 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEs9bSajgRdE/6C2a8RcfZlmd2/Zw51saDVxRumYcKk=; b=BzbEOShZmKilGV
	FSPvPLYQZMl0/pELoRJfr0eTmzUsZDePWOT9mSi+QyEMP2nvE/gXcOYeYMVEyEhqqiyIxLEDEUlOS
	wyGucJpVRit6cwNo3AUa12WEG5fzFBxZuGZzfbZrrnpe59onrd2SAOOyRXgGpoYvpSLT9PAngt92Q
	L/o0DJpSa+5P/ayygCDfAsp7JYKBAigZQr4RhTgv3E8Ct14hHWlFIdyFQzbrjGvgtQH71JldUWPS9
	Bje6LNNWqjU6QqXcP+qHqXTcDabkei7472Hxhcc9zfVKmhADZ+iWxdpiIhgrq3hIdvFV6NJBIyVe8
	XofECPQva2iPFfJPxttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgXg-00000005xLg-0D74;
	Sun, 04 May 2025 21:06:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgVN-00000005x6Z-1DuC;
	Sun, 04 May 2025 21:04:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2295d78b45cso49780595ad.0;
        Sun, 04 May 2025 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392648; x=1746997448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=;
        b=Shu0HDBhMRpBGQbNzt00u9ZOwONYHrEs56mYO9EyUDFXZ9D9/Y6bsqNvQT+3LzgMea
         owJArJPQT09jW3SdXzYlvGylXni4qCTaskkJ85/toIL0iQOKVbHzu/a90D5KGNhlZERH
         22W0TZoabXQ4dsXagmbUHTOMHFqp9/4f7UvztXi7XS/BAJ8NdqY6Q4/OnE+blnpZ/Cvx
         fGA68VKEZIUj6owomSnw4hO7/U0oCKzC0aDzgVCTh+fYgGiAWQTYWWPEPDGXlQsYe/vn
         3PxxPOfkMzjJ/Hc20y3pKOsC3FpT7A7E4NSUuykln4YnnKZVXnWM8bVgOFfGANefH2Kt
         4Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392648; x=1746997448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=;
        b=TbdSQU4/bBAiXyYmCVudFmRp2sY2XtpraPcK7f5vvy8pDhhSQkKhSm62ZKrnybi2Im
         7WQYX52kcTvc6ow2CnLGCEEosXZaHqJuAAAkv9V4rhimo2+84o3dCJAfcdpkhCMnivXX
         DR3S7Xw8h/cmZXCMycKb1QyqpwM7S+k/4VvX7V8CxTq+BnKgbXYiSlqjyzKbe1YVTpvW
         5IhDdWjOSJAXl+6JU4yvtwNcKi0WeH3FPRkCIfoIHtSKPBJthVCY/nlq5KVHiFVmRDG7
         LkR4mafrJTezX9kJJJWtfmm99seNQpo7d6Wj3cIB9w6u1ZWmm7Vky/VdBwFARhoMtrop
         ybbg==
X-Forwarded-Encrypted: i=1; AJvYcCW7rCyT0Xghtea6VtOfN3G8FE6z5qr9kJ6NL5JWAZ/Uq/paw3yPumT2W2fG5DXnows318pIGt2IAJuXmUadtgS+9g==@lists.infradead.org, AJvYcCWj5jI1ITE5yFHsa2C1hjB3rF5kcIjLXW9dBfMu/Opeyoz5qQDHlsr6b4NIPl526l06joiQ4nZFQE+q2xCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQ3K4p/ncX9UdbTdrEZR86RPsWst3e9gmMtNkY1+NdNgqwo7C
	MX4nsDNR0z0azMVaSlo078GeX9slgceKdkSDAOUKbfFE23Dy47uSY//6J+kqufHqKAyW1b7uYIk
	2tCl7XcbBh/10HjwBaupJ9Ssj80LA7Q==
X-Gm-Gg: ASbGnctwrba3gZ4IW6PM74hrH2Neqi7bIDTK41sl0vEXCRti0vmvMEA8qup3oU83l4j
	0I38fuwse5rbwQIeVEwT5L4+wvvD+dflc04fJXk7cVdfdIqd3P1OKKtrMn8ykaveoMlvDsn76zQ
	bMU8+z09QBeaRiqMNbevivebAiBHHbVfKP+Y9wM0deWXK+Cj3Lo1vOiiw=
X-Google-Smtp-Source: AGHT+IHyW0Ndt2dWKLCX5IHkW1ixcqtSrXB9YBoKdwGtqxefF3YX3XxIJcSkkisV04VzYQvQjJESqa/5NELP+RsPwUA=
X-Received: by 2002:a17:903:1107:b0:224:5a8:ba29 with SMTP id
 d9443c01a7336-22e1eaa1038mr72613585ad.43.1746392647862; Sun, 04 May 2025
 14:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
In-Reply-To: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:03:56 +0200
X-Gm-Features: ATxdqUEuPW-rw5wD2OzNxnpoTVETgPI-7rkDkzV6eL_44Q5_KgcaUYRwZKj6F_M
Message-ID: <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: neil.armstrong@linaro.org
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140409_347775_D3B746C3 
X-CRM114-Status: GOOD (  16.55  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgOTozMuKAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
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
MmMgd29ya2luZy4KRm9yIFNEL2VNTUMsIFNQSSBhbmQgVUFSVCB3ZSBoYXZlIHB1bGwgdXAvZG93
biBlbmFibGVkIGluIG1lc29uLWd4bC5kdHNpLgpJIGNhbid0IHJlY2FsbCBpZiBJIGhhdmUgYXNr
ZWQgdGhpcyBiZWZvcmU6IHdoYXQncyB0aGUgcnVsZSAob2YgdGh1bWIpCmZvciBoYXZpbmcgYmlh
cy1wdWxsLXVwL2Rvd24gdnMuIGJpYXMtZGlzYWJsZSBpbiAuZHRzaSBmaWxlcz8KCkluIHRoZSBw
YXN0IEkgaGFkIHRvIHRyYWNrIGRvd24gaW5jb3JyZWN0IGJpYXMuCkl0IGdldHMgZXNwZWNpYWxs
eSB0cmlja3kgd2hlbiB3ZSBkb24ndCBoYXZlIHNjaGVtYXRpY3MgYW5kIHRoZXJlJ3Mgbm8KdS1i
b290IHNvdXJjZXMgYXZhaWxhYmxlIGZyb20gdGhlIHZlbmRvciAoSSBrbm93LCB0aGUgbGF0dGVy
IHNob3VsZG4ndApiZSBwb3NzaWJsZSAtIGJ1dCB0aGF0J3MgdGhlIHdvcmxkIHdlIGxpdmUgaW4g
dW5mb3J0dW5hdGVseSkuCkl0IG1lYW5zIHRoYXQgd2UgY2FuIGVuZCB1cCB3aXRoIG9uZSBvZiBm
b3VyIGNhc2VzIGZvciB0aGUgYmlhcyBzZXR0aW5nczoKLSB0aGVyZSdzIGFuIGFjdHVhbCByZXNp
c3RvciBvbiB0aGUgUENCIChwdWxsaW5nIHRoZSBwaW4gdXAvZG93bikKLSBoYXJkd2FyZSAoU29D
KSBkZWZhdWx0IGZvciB0aGUgcGluCi0gdmVuZG9yIHUtYm9vdCBjb25maWd1cmVzIGJpYXMgZm9y
IHRoZSBwaW4gKGJ1dCB3ZSBkb24ndCBrbm93IGJlY2F1c2UKd2UgZG9uJ3QgaGF2ZSB0aGUgc291
cmNlcykKLSB2ZW5kb3IgTGludXggY29uZmlndXJlcyBiaWFzIGZvciB0aGUgcGluIChhdCBsZWFz
dCB3ZSBjYW4gZHVtcCB0aGUKLmR0YiBhbmQgaG9wZSB0aGF0IHRoZSBiaWFzIHNldHRpbmcgaXMg
aW4gdGhlcmUpCgpUaGF0J3Mgd2h5IEkgbGVhbiB0b3dhcmRzIGhhdmluZyBzYW5lIGRlZmF1bHRz
IGluIHRoZSBTb0MuZHRzaSAoaXQKc2VlbXMgdGhhdCByb2NrY2hpcCBkb2VzIHRoZSBzYW1lPyku
CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
