Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA33E8B386
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Feb 2026 23:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zw980BaiwJErv+WYiaCEWUJB5FLGkVAkXeKBv7SWATM=; b=PZqnbSGjTU6r1/
	MOHHG8JxdzDAlKMhghNNw8EV4QfA3+JI7QP/zkWnu/PtbYN+8dNgcjPxn9AJWp13CABiKRc8uqVcL
	3mUdQQTBgGzdBLxMCzuhWiA2hwCmniP60T/5bvLwz/uLr/7dHaoOrtXrvi7SMdkfevxe0xYYFB8U8
	LqRTXFC8qQZvtIrKzt1g5YP0S+9MLQj+QY5ILnFuCo3eOhYTbpSOO2//gWbskLBfhHe8pMePhd+G4
	Hav9PG7P/xT5XkfxWHGGiDZbjjrnxo9TTNRvWeQT/5lR3uveoowd1SFfjYjjJxO4RLwV7Es6BTZ8c
	HxOmoxCoacUCb2QyAcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPv1-00000007ZNm-0pm0;
	Tue, 03 Feb 2026 23:34:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPuy-00000007ZN7-1wYe
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Feb 2026 23:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B774243B0A
	for <linux-amlogic@lists.infradead.org>; Tue,  3 Feb 2026 23:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A01C4AF0C
	for <linux-amlogic@lists.infradead.org>; Tue,  3 Feb 2026 23:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770161687;
	bh=H3N6t3iT+lRw2Y3wcq0juSNfNc3ZLSsvKLjYx4BlJTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nqtchg46hJV6r1bQFLQT7aBrl24yYiUpMB5HgW9eCGF1JT/AyvItPIfcJRJxTC4A5
	 C0CcRJov/r6C6UdEbHNQ+0GBUxZ/Kc99tCry5UO6nlDXm93PLJuMrp9ZRf1/0x2djE
	 Uz9k49tDAjcnFpbt4vytBBRSxC2xDZmqx1YopK8OfLlbl8Uvd5Q078y1oa5RFDwncv
	 Dt2ASczc/ILf0ZN6ez/txaG+HUebwqPiQcsiUZbriRUAQT8ePpOXFLIY7eb9HZ8HYJ
	 54ISvN7+WcYtIrd9jA/MU/1iPGmvL4IHhm4Dp721CEaVKZlP6QUKKrx7EKwsPwzZ7C
	 VyiMFb+TvNTKQ==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-649b5f5570fso639931d50.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Feb 2026 15:34:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrHOJzFCUhXA7retKmM5UqSS1ufnmE6BeARsHawgifbq5iEGbWrL6ZTon2v5MB9MolIJ8qjpLFcEalyNT0@lists.infradead.org
X-Gm-Message-State: AOJu0YzoGSzY3nj39Jilo/prsnr9b5dnVeoEfXim/MxLqONZ4CIuHV2U
	mp5TNqgGF2FhXaDfE/pV45SiEeCoADW5IUu8qe5Ul/0VQFySp0se/Nv2iuci+MCLpB5byg+vd32
	6VgMfE6n7byP3kKNxr8WrsClIL6ZORCg=
X-Received: by 2002:a05:690e:dce:b0:649:ba22:58d0 with SMTP id
 956f58d0204a3-649dbec902amr1077376d50.29.1770161687019; Tue, 03 Feb 2026
 15:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20260203-craftsman-battered-3491ff68f462@spud>
In-Reply-To: <20260203-craftsman-battered-3491ff68f462@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 00:34:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
X-Gm-Features: AZwV_Qi7lxnWnjXussICca0lyIFaqwLa7DfHaZmiOVa6EJi8C3uLkn3H5EkvZDE
Message-ID: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to
 amlogic-am4 driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_153448_524580_3A4A2B09 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBGZWIgMywgMjAyNiBhdCA1OjE34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4KPgo+IHBpbmNvbmZfZ2VuZXJpY19kdF9ub2RlX3RvX21hcF9waW5tdXgoKSBpcyBu
b3QgYWN0dWFsbHkgYSBnZW5lcmljCj4gZnVuY3Rpb24sIGFuZCByZWFsbHkgYmVsb25ncyBpbiB0
aGUgYW1sb2dpYy1hbTQgZHJpdmVyLiBUaGVyZSBhcmUgdGhyZWUKPiByZWFzb25zIHdoeS4KKC4u
LikKPiBUaGUgb3RoZXIgZHRfbm9kZV90b19tYXAgaW1wbGVtZW50YXRpb25zIGFjY2VwdCBhIGJl
aW5nIGNhbGxlZCBmb3IKPiBlaXRoZXIgYSBub2RlIGNvbnRhaW5pbmcgcGluIGNvbmZpZ3VyYXRp
b24gcHJvcGVydGllcyBvciBhIG5vZGUKPiBjb250YWluaW5nIGNoaWxkIG5vZGVzIHRoYXQgZWFj
aCBjb250YWluIHRoZSBjb25maWd1cmF0aW9uIHByb3BlcnRpZXMuCj4gSU9XLCB0aGV5IHN1cHBv
cnQgdGhlIGZvbGxvd2luZyB0d28gZGV2aWNldHJlZSBjb25maWd1cmF0aW9uczoKPgo+IHwgY2Zn
IHsKPiB8ICAgICAgIGxhYmVsOiBncm91cCB7Cj4gfCAgICAgICAgICAgICAgIHBpbm11eCA9IDxh
c2poZGFzamhsYWpza2Q+Owo+IHwgICAgICAgICAgICAgICBjb25maWctaXRlbTE7Cj4gfCAgICAg
ICB9Owo+IHwgfTsKPgo+IHwgbGFiZWw6IGNmZyB7Cj4gfCAgICAgICBncm91cDEgewo+IHwgICAg
ICAgICAgICAgICBwaW5tdXggPSA8ZHNqaGxma2E+Owo+IHwgICAgICAgICAgICAgICBjb25maWct
aXRlbTI7Cj4gfCAgICAgICB9Owo+IHwgICAgICAgZ3JvdXAyIHsKPiB8ICAgICAgICAgICAgICAg
cGlubXV4ID0gPGxzZGpoYWY+Owo+IHwgICAgICAgICAgICAgICBjb25maWctaXRlbTE7Cj4gfCAg
ICAgICB9Owo+IHwgfTsKPgo+IHBpbmNvbmZfZ2VuZXJpY19kdF9ub2RlX3RvX21hcF9waW5tdXgo
KSBvbmx5IHN1cHBvcnRzIHRoZSBsYXR0ZXIuCgpUaGlzIGFsb25lIGlzIGEgZ29vZCByZWFzb24g
dG8gYXBwbHkgdGhlIHBhdGNoLgoKSSBoYXZlIGEgc3Ryb25nIHVyZ2UgdG8gYXBwbHkgdGhpcyBh
bHJlYWR5IGZvciB2Ny4wIGRlc3BpdGUgaXRzIFJGQyBzdGF0ZS4KCkFueW9uZSBhZ2FpbnN0PwoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
