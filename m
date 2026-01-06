Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC55C47BC5
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ky8q7G9uTugn20MZObPqE9LdmW+fPl20qKEXR3HnA8=; b=k/v9jJr3m6aNAz
	aeMwcQ7cwUzRjTpY46+fjLbClLEopUhLL9K4UeXccLYFRksWdDW/w69JJ5M8hx4CBt+xedEIhuWn+
	SESUpvPXYDFi6WLAdE+O+4vPro8pXNgwUW539djCob+L73lKGW6lngLc0aAfqb7ee1ME0grme4Qln
	U0MP4LqSxPztpbrSNtrnYjpJIHt0tj33hZ2KX4FkIrnPMcyl7xs+vGlZVeMJcjdaU+ETx1dUHWMSH
	HMtRMDi16oFdTmh5sGOTMflHLYfUsm6peKmJFwb9JWvL+ATM4YTk8ENsf6Inejh845q//dcfBS03Y
	jsqajWaz2lI2drT75LPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2t0-0000000CecW-0CCC;
	Tue, 06 Jan 2026 08:57:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2sx-0000000Cebk-177N
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 08:57:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0bb2f093aso7748495ad.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767689870; x=1768294670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIEziJptyk5NU5d1R4im25WNnI9+PWCcCW6Jz9T4txA=;
        b=M7Ja+y6lQ1h8Bt5yNtv0p3+jdk/3ArQyyRGU4N3MT1sRHkR76MatuWI/yDKukLcuDn
         3WtAlohXNmdD/Fu1QsIBVwmVeVnvr0T4zp8tEk/DwOgOE3vxvKPR89CMbz9K9Lsi0yRQ
         jQKeT2I1SVDQOWWG0bn3U8SoXvV/e6kSpdQbwzq/UkrfgEUQPlCVd+VU+yTPmYqEkTgg
         pSvR9LXsvae21wwgJHjwAtY1NbFTEsMU25WhaOdH8lVz++eglawptqB2gdZO+i+wgINJ
         0vYvgKYo7RQwwMVcnTG9o7mSbazuFnlxl/dxZNY34uoSYfXy7UlWSYDqhr5LEAA9mtv4
         JfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689870; x=1768294670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIEziJptyk5NU5d1R4im25WNnI9+PWCcCW6Jz9T4txA=;
        b=IJ3357O0ynL2YeWAFx1tg907wMQpBnPMz7HB4CTmWgB4ttjrD6u2XgNMfMiyJKIMqp
         3YRjAycL8g5I2+xhh0N2icWfpvDFEVbpCYHuZwnFI06AfuS0EJ8SDLxRWgWLGANl+x3A
         sgjCCb66jg33AzEVYB9MbV5y5+9Kxtfanc6ktz6EfabdpNHoKe1s64HZl8YYlYytvUZs
         uvNeIfFc2g/x7DN/20aDswRNEUdXo3LrAt5Et1VPkw6ZolsJhAiWuQkuFU+KoysMANKy
         L+FzVttDLQBjQBl4WxjT+iix9l0RP27K/0PDGtYkq2DQO4hmgC248JwFnShILbJz8ntb
         Q//Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKLBuYXEtZsUSljyplN7/Jxj+mlcAN8tpaEbFXdcqDfSQrQ8N7ft4WReGCZm6sOmpToWoSzJGkbM4MyG7l@lists.infradead.org
X-Gm-Message-State: AOJu0YyK4HMNUCjhuGU4q4SXjUr7H+azp9Ul3pN0FKPBWYRTboL0h9Tm
	3zLdJreAkEVxG45ZmGlOWQT86vvpdunQnbBLTQAA2/7VolYW2pzYYhixQYoIJby4dOIaiRfqUrX
	BkaYcOD00YdGqS0hTcMljv1+MzkV8iUU=
X-Gm-Gg: AY/fxX5UJQvd7RuLSYvF46yAn9LqGVoDNCJ6jM1gz97jueVGuKi75SRH/ZWjGr3II/y
	PC1EP3C4vR9RduwadO95jQ9vHURaYZD9jB3ybejH443f5E1Y21wU22gGfjOgYp/OFR7oHUXEAix
	BkOkDG2b8J5a2yWFqUhpdq98baST7H4At2abJQ7kvzrKeuGtcfiD4r3mCVPFXxA0V76DjWB7w9+
	5YQgDrx9gCnjNjNNSmlmrpvm7hxeWwZ6X2WeXUWNJGjqIqry2/6u/ZhyMatzsgRQjeCr0hkYEO7
	lGEyp3fTDpa7tWBwcfa0ItmmpkE=
X-Google-Smtp-Source: AGHT+IHqqVT35RqtKhqDVDeUn1JSuMEyVNYWSpbNfyaLVeAjnwJc+ZCsnwel1Ct5vYHiZKJmXURlUF7dYeogNEgy608=
X-Received: by 2002:a17:903:1aab:b0:2a0:89b8:4686 with SMTP id
 d9443c01a7336-2a3e2d1987bmr23189115ad.46.1767689870271; Tue, 06 Jan 2026
 00:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 09:57:39 +0100
X-Gm-Features: AQt7F2ogEhOYqvAtPAq6OIcx9b6m5SyZMl6Xih8xD56bOOTG1yFuzVoJm_ASy1o
Message-ID: <CAFBinCDfV-f98c+3EXWVqFkBidsm_OZmfBZOqh7F5wWR4w88tA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005751_306878_26CB2C0F 
X-CRM114-Status: GOOD (  11.94  )
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

T24gTW9uLCBKYW4gNSwgMjAyNiBhdCA0OjA14oCvUE0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFRoZSBHUElPIGNv
bnRyb2xsZXIgaXMgY29uZmlndXJlZCBhcyBub24tc2xlZXBpbmcgYnV0IGl0IHVzZXMgZ2VuZXJp
Ywo+IHBpbmN0cmwgaGVscGVycyB3aGljaCB1c2UgYSBtdXRleCBmb3Igc3luY2hyb25pemF0aW9u
Lgo+Cj4gVGhpcyBjYW4gY2F1c2UgdGhlIGZvbGxvd2luZyBsb2NrZGVwIHNwbGF0IHdpdGggc2hh
cmVkIEdQSU9zIGVuYWJsZWQgb24KPiBib2FyZHMgd2hpY2ggaGF2ZSBtdWx0aXBsZSBkZXZpY2Vz
IHVzaW5nIHRoZSBzYW1lIEdQSU86Cj4KPiBCVUc6IHNsZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBm
cm9tIGludmFsaWQgY29udGV4dCBhdAo+IGtlcm5lbC9sb2NraW5nL211dGV4LmM6NTkxCj4gaW5f
YXRvbWljKCk6IDEsIGlycXNfZGlzYWJsZWQoKTogMSwgbm9uX2Jsb2NrOiAwLCBwaWQ6IDE0Miwg
bmFtZToKPiBrd29ya2VyL3UyNTozCj4gcHJlZW1wdF9jb3VudDogMSwgZXhwZWN0ZWQ6IDAKPiBS
Q1UgbmVzdCBkZXB0aDogMCwgZXhwZWN0ZWQ6IDAKPiBJTkZPOiBsb2NrZGVwIGlzIHR1cm5lZCBv
ZmYuCj4gaXJxIGV2ZW50IHN0YW1wOiA0NjM3OQo+IGhhcmRpcnFzIGxhc3QgIGVuYWJsZWQgYXQg
KDQ2Mzc5KTogWzxmZmZmODAwMDgxM2FjYjI0Pl0KPiBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3Rv
cmUrMHg3NC8weDc4Cj4gaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoNDYzNzgpOiBbPGZmZmY4
MDAwODEzYWJmMzg+XQo+IF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUrMHg4NC8weDg4Cj4gc29mdGly
cXMgbGFzdCAgZW5hYmxlZCBhdCAoNDYzMzApOiBbPGZmZmY4MDAwODAwYzcxYjQ+XQo+IGhhbmRs
ZV9zb2Z0aXJxcysweDRjNC8weDRkYwo+IHNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDQ2Mjk1
KTogWzxmZmZmODAwMDgwMDEwNjc0Pl0KPiBfX2RvX3NvZnRpcnErMHgxNC8weDIwCj4gQ1BVOiAx
IFVJRDogMCBQSUQ6IDE0MiBDb21tOiBrd29ya2VyL3UyNTozIFRhaW50ZWQ6IEcgQwo+IDYuMTku
MC1yYzQtbmV4dC0yMDI2MDEwNSsgIzExOTYzIFBSRUVNUFQKPiBUYWludGVkOiBbQ109Q1JBUAo+
IEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBWSU0zIChEVCkKPiBXb3JrcXVldWU6IGV2ZW50c191bmJv
dW5kIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYwo+IENhbGwgdHJhY2U6Cj4gICBzaG93X3N0YWNr
KzB4MTgvMHgyNCAoQykKPiAgIGR1bXBfc3RhY2tfbHZsKzB4OTAvMHhkMAo+ICAgZHVtcF9zdGFj
aysweDE4LzB4MjQKPiAgIF9fbWlnaHRfcmVzY2hlZCsweDE0NC8weDI0OAo+ICAgX19taWdodF9z
bGVlcCsweDQ4LzB4OTgKPiAgIF9fbXV0ZXhfbG9jaysweDVjLzB4ODk0Cj4gICBtdXRleF9sb2Nr
X25lc3RlZCsweDI0LzB4MzAKPiAgIHBpbmN0cmxfZ2V0X2RldmljZV9ncGlvX3JhbmdlKzB4NDQv
MHgxMjgKPiAgIHBpbmN0cmxfZ3Bpb19zZXRfY29uZmlnKzB4NDAvMHhkYwo+ICAgZ3Bpb2NoaXBf
Z2VuZXJpY19jb25maWcrMHgyOC8weDNjCj4gICBncGlvX2RvX3NldF9jb25maWcrMHhhOC8weDE5
NAo+ICAgZ3Bpb2Rfc2V0X2NvbmZpZysweDM0LzB4ZmMKPiAgIGdwaW9fc2hhcmVkX3Byb3h5X3Nl
dF9jb25maWcrMHg2Yy8weGZjIFtncGlvX3NoYXJlZF9wcm94eV0KPiAgIGdwaW9fZG9fc2V0X2Nv
bmZpZysweGE4LzB4MTk0Cj4gICBncGlvZF9zZXRfdHJhbnNpdG9yeSsweDRjLzB4ZjAKPiAgIGdw
aW9kX2NvbmZpZ3VyZV9mbGFncysweGE0LzB4NDgwCj4gICBncGlvZF9maW5kX2FuZF9yZXF1ZXN0
KzB4MWEwLzB4NTc0Cj4gICBncGlvZF9nZXRfaW5kZXgrMHg1OC8weDg0Cj4gICBkZXZtX2dwaW9k
X2dldF9pbmRleCsweDIwLzB4YjQKPiAgIGRldm1fZ3Bpb2RfZ2V0KzB4MTgvMHgyNAo+ICAgbW1j
X3B3cnNlcV9lbW1jX3Byb2JlKzB4NDAvMHhiOAo+ICAgcGxhdGZvcm1fcHJvYmUrMHg1Yy8weGFj
Cj4gICByZWFsbHlfcHJvYmUrMHhiYy8weDI5OAo+ICAgX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4
NzgvMHgxMmMKPiAgIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHhkYy8weDE2NAo+ICAgX19kZXZpY2Vf
YXR0YWNoX2RyaXZlcisweGI4LzB4MTM4Cj4gICBidXNfZm9yX2VhY2hfZHJ2KzB4ODAvMHhkYwo+
ICAgX19kZXZpY2VfYXR0YWNoKzB4YTgvMHgxYjAKPgo+IEZpeGVzOiA2YWM3MzA5NTExMDQgKCJw
aW5jdHJsOiBhZGQgZHJpdmVyIGZvciBBbWxvZ2ljIE1lc29uIFNvQ3MiKQo+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4gUmVwb3J0ZWQtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJv
d3NraUBzYW1zdW5nLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8w
MDEwNzUyMy03NzM3LTRiOTItYTc4NS0xNGNlNGU5M2I4Y2JAc2Ftc3VuZy5jb20vCj4gU2lnbmVk
LW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVh
bGNvbW0uY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
