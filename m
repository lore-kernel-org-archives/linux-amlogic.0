Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F4DC021A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5s6yFt3tyv2/7UxgNiCrt/kwEknDRU+Ox1IxkK+2sM4=; b=lv+X0pQevMyj6h
	fnjbdti1hPZl31HLDaiSjTkcHw9I0IX5CD1vMI/Hf9YsxSLvF2HdBKBHpNQ0MDHg0UvPu9YmdKYfu
	rN72ugPIW3nRVBvsi2DnKvwKZw71ar2k8dnl+7W+hTHzc/9tAqHUxPmsmFb4iOk2m/ZKeaN2lLkQu
	iQzcZYeBDu0K5qloYYGbS8eSA5DJJkJKw2e7YbIWSqjGLLyXlBO2HqogNvFb4XHkzIYgaRSUtL+g7
	3fMS3UwmDaCNGDHf01jyNxNmCIqkiRBucnoTrMNVMPgz9sxBK4EnlzRNyK+KjO1QF5kda87lBKkyE
	PVj4DIYloTwsqrCacXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGZ-00000008F88-1Fpl;
	Wed, 12 Feb 2025 17:11:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFr5-000000089OI-0ymS
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Feb 2025 16:44:56 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so9458079a12.2
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Feb 2025 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739378691; x=1739983491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=OwfLuO8wtLfonpjj6OzVleuqu4jemc8uUPgCjRkyivhMbhTYyRjx2M0bf05/Uod/lF
         DSfB044q/jM/WM3HJ6sluQtsWR31l/I2b5XPIiWF/Z0Waey9ZMDhKIKav0NKqb9Y+XsP
         At0VJCV5tzhY8x7ohipoDxREBrAuAdIvbliPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378691; x=1739983491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=hEg5HXkUiesPZhoRAB4nRbfG+Gj/dB7WC+t//Sz7L2Ln0kG2OijelBQohBihtBVWkA
         zSnLoaVmrrDB1mQwHrR2fCDAvUpdfE9VRnhhnJPuMbDU004afifUYACJBLj1bzMsdwdw
         x4GmmZHTBPdMwI3u6iDvApKUlgUU5GGMfi5sc7Bk6mc5AcL3dzbk8INDpZmWtrPcRNyb
         aEb55uqHDCa0YcCOhO7FzHvCkUHtw3UOkOzXs7DEih91Yw1ar4z/JcVL7nlpDCUX43hn
         u6uz//keoXlAT4Y+cu4eQ5ZlDv5nWGzN6rE1GL34V/Ifuqs3gZUFwP8qf5TPktpz435y
         zX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpJu3+bvmQ5GmLSpT+akbAe6JwvMc5CQ6XmDWIK9KIlB43F1Je6Sk1vno4F8iOYoGYVydHdNz9V6vHG2lQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ocVEQrLCfa4nrwux23u9O8pMEQhMUed5KDGlexrE26Xw9Nfd
	AthVarm2PkBHYJwGc9qpY+lPgcoJJYDUDDwWlwLJNBMJ5UfJEK4cKTclhsSmyDxdwZSzMdZSrUa
	DF6Oo
X-Gm-Gg: ASbGncvqnRLw1MGWho+Y+RenclsOI/XBnIIQBqWqwcJxogD5/yc7q2Dce134wTVke5O
	30QhYoFg9WeYxZOZgYI0v5FnP8Bdz1HY2p6sX7VnoIacvZi08FQ0IW1YbAttcSVFuiDNSnOsqNN
	Ess3MAIpBut/nmVhDJCgqz+E9OOxQPJfTtW5eVqhsWoAV9OvA7sIfN31nb4t1ubbEpFLeUlxdLF
	O4Zd4JV00cYE6xzrMwPK85/545sQd/agTRE8vg1mGQZpzJHrIKijJNjrOXyZGPQig+3mWyd5Eec
	LnLcKG+rXuo77HE688CgpZdUFhWBhzAsGYoN7Pdkpf/wAI+/Yl5olJM=
X-Google-Smtp-Source: AGHT+IGiCCQqum7N5fd8A8ZmbMLkmHIkwY1utJgHq5Rrvhfiws5/Wq9Keuu+Sq6SBaL0yVCtgzM7/g==
X-Received: by 2002:a17:907:1c85:b0:aa6:9624:78f1 with SMTP id a640c23a62f3a-ab7f3714978mr406295866b.9.1739378691486;
        Wed, 12 Feb 2025 08:44:51 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b9bfd2c4sm707104366b.43.2025.02.12.08.44.49
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:44:49 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7c14b880dso724921066b.1
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Feb 2025 08:44:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeif1HWcVv32sxWQPm6PFNkmH5yxKEasUN/WU+8ynwIHsjhxDlO9iy0IlIQlDf3/bd0NRlpCqsnUDKFRyX@lists.infradead.org
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_084455_265388_9F978162 
X-CRM114-Status: GOOD (  16.29  )
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

SGksCgpPbiBUdWUsIEZlYiAxMSwgMjAyNSBhdCA5OjI44oCvQU0gSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gVGhlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRp
b24gb2YgdGhpcyBkcml2ZXIgaXMgc2ltcGxlIGVub3VnaCB0bwo+IHVzZSB0aGUgYXZhaWxhYmxl
IGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyLgo+Cj4gVXNlIGl0IGFuZCByZW1vdmUg
c29tZSBib2lsZXJwbGF0ZSBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8
amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
c242NWRzaTg2LmMgfCA4NCArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCgpUaGFua3Mg
Zm9yIGNyZWF0aW5nIHRoZSBoZWxwZXJzIGFuZCBnZXR0aW5nIHJpZCBvZiBzb21lIGJvaWxlcnBs
YXRlIQpUaGlzIGNvbmZsaWN0cyB3aXRoIGNvbW1pdCA1NzRmNWVlMmM4NWEgKCJkcm0vYnJpZGdl
OiB0aS1zbjY1ZHNpODY6CkZpeCBtdWx0aXBsZSBpbnN0YW5jZXMiKSB3aGljaCBpcyBpbiBkcm0t
bmV4dCwgdGhvdWdoLiBQbGVhc2UgcmVzb2x2ZS4KClNpbmNlIG5vdGhpbmcgaGVyZSBpcyB1cmdl
bnQsIEkgd291bGQgYXNzdW1lIHBhdGNoICMxIHdvdWxkIGxhbmQgYW5kCnRoZW4gd2UnZCBqdXN0
IHdhaXQgdW50aWwgaXQgbWFkZSBpdCB0byBtYWlubGluZSBiZWZvcmUgbGFuZGluZyB0aGUKb3Ro
ZXIgcGF0Y2hlcyBpbiB0aGVpciByZXNwZWN0aXZlIHRyZWVzPwoKCj4gLXN0YXRpYyBpbnQgdGlf
c242NWRzaTg2X2FkZF9hdXhfZGV2aWNlKHN0cnVjdCB0aV9zbjY1ZHNpODYgKnBkYXRhLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdXhpbGlhcnlfZGV2
aWNlICoqYXV4X291dCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpuYW1lKQo+IC17Cj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwZGF0
YS0+ZGV2Owo+IC0gICAgICAgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eDsKPiAtICAgICAg
IGludCByZXQ7Cj4gLQo+IC0gICAgICAgYXV4ID0ga3phbGxvYyhzaXplb2YoKmF1eCksIEdGUF9L
RVJORUwpOwo+IC0gICAgICAgaWYgKCFhdXgpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5P
TUVNOwo+IC0KPiAtICAgICAgIGF1eC0+bmFtZSA9IG5hbWU7Cj4gLSAgICAgICBhdXgtPmRldi5w
YXJlbnQgPSBkZXY7Cj4gLSAgICAgICBhdXgtPmRldi5yZWxlYXNlID0gdGlfc242NWRzaTg2X2F1
eF9kZXZpY2VfcmVsZWFzZTsKPiAtICAgICAgIGRldmljZV9zZXRfb2Zfbm9kZV9mcm9tX2Rldigm
YXV4LT5kZXYsIGRldik7Cj4gLSAgICAgICByZXQgPSBhdXhpbGlhcnlfZGV2aWNlX2luaXQoYXV4
KTsKPiAtICAgICAgIGlmIChyZXQpIHsKPiAtICAgICAgICAgICAgICAga2ZyZWUoYXV4KTsKPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIH0KPiAtICAgICAgIHJldCA9IGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIHRpX3NuNjVkc2k4Nl91bmluaXRfYXV4LCBhdXgp
Owo+IC0gICAgICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtCj4g
LSAgICAgICByZXQgPSBhdXhpbGlhcnlfZGV2aWNlX2FkZChhdXgpOwo+IC0gICAgICAgaWYgKHJl
dCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIHJldCA9IGRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldChkZXYsIHRpX3NuNjVkc2k4Nl9kZWxldGVfYXV4LCBhdXgpOwo+IC0g
ICAgICAgaWYgKCFyZXQpCj4gLSAgICAgICAgICAgICAgICphdXhfb3V0ID0gYXV4OwoKSSBub3Rp
Y2UgdGhhdCB5b3VyIG5ldyBjb2RlIGhhcyBvbmUgZmV3ZXIgZGV2bV9hZGRfYWN0aW9uX29yX3Jl
c2V0KCkKdGhhbiB0aGUgY29kZSBoZXJlIHdoaWNoIHlvdSdyZSByZXBsYWNpbmcuIFRoYXQgbWVh
bnMgaXQgbmVlZHMgdG8gY2FsbAoidW5pbml0IiBleHBsaWNpdGx5IGluIG9uZSBleHRyYSBwbGFj
ZS4gSXQgc3RpbGwgc2VlbXMgY2xlYW4gZW5vdWdoLAp0aG91Z2gsIHNvIEkgZG9uJ3QgaGF2ZSBh
bnkgcmVhbCBvYmplY3Rpb25zIHRvIHRoZSB3YXkgeW91J3JlIGRvaW5nIGl0CnRoZXJlLiA7LSkK
Ci1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
