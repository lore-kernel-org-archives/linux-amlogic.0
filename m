Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D754C63797
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSs0oavZtBDONurS64mKxh+6CMJwypoC+Lox7D1BP4M=; b=kPpX7vYxY65oXG
	7T4n9axCr9g/ronFGxjaa/rWQODq1WyUaOq42oiplAvjIVXPFwjEwqMkfdsvBRdrz8Xo/0Hj2cKHN
	VjE/BC6pkZ7HTa8t9ITphYh61XuFkkUpsruJPlR1y1vkWEDCuDFFYrjyGSm1PIIgiIio8W0VAOW0c
	XrdV0YSSejJ61LDxLXQbJhLw5iXQug250HvPXur2r6kzWDRh4P8eWjlsI2qOQbEHb992D0Yd8eIIU
	JOjxiHXs4Jnk2Aflz7SfkI6QDrzc+HQCfQuPLm9wWtv6X0f0yLla8J0Fi25+OH+GDa4PpEgh6VF2W
	ONtS6KEAtXH9Ls35WBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH8tk-007rII-TQ; Sun, 15 Jan 2023 19:42:32 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH8tZ-007rHB-GS; Sun, 15 Jan 2023 19:42:23 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id i82so12264616vki.8;
        Sun, 15 Jan 2023 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=429LMFggIvhGz8qRMjmDSEe5DoMNlkqaMJ0R+hNU+2c=;
        b=OwF9NB3iAyHnblN+dOE6zNF5a+MZoJ0Knz4yoGLZ4ea5bpjDdN5VqzxhptF+IboX9w
         YWciG+7MqFpu1iSliTR48CSxflQ1UbEvZXsdo9lTJtktXiShigyg/57SFKhKg+0E+whe
         iGKtouuC67/cCmS49qrIqTdcgKJcYQjdKJH9g7weClh5pV3cZTdr68nUqBjiGx/2fAJ+
         AgqsrJ1uiPEwl/6v5SS9x9qQbLci9XeUwkA7jJQBYotKQE1A0KXAGP8i+pUOAbP9Q5kj
         hYf708OOqRmyFqsZyoHN+eU1ergOBqyCh9DL+eEBjpJSHJdaRZNN99UXu56yqSUL6Eg/
         U/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=429LMFggIvhGz8qRMjmDSEe5DoMNlkqaMJ0R+hNU+2c=;
        b=BK34PuuCYUw7JT/MkXWPxurGruDIEBfzEVIsQItS47QcK5jWHyZzJRMalrSZoXySmi
         bwSgsmi7jlDkKTWE/GJIbW+z92svftUJ1J3rfRlR83Gklznzn+x9mDcQEBf1bkfcpzpi
         qIo37qGdaP+qk1ziZcMOCeVrfu47U22Bv8tr+O1qXqGGDlomi42dF2rs5XAAskvWHEj7
         6HgUklRo3VeQcxNGqOklcC1DvqgtbHEx30Y7zhZGcH1i24ZKeyV8lpdRCjSc8pihckrC
         qYHasgiwEGUFj7NTNcIvpG+EhJrEs4NDgH09SfpZq7EoyTJeMzfZqWEs4RUITVOtovMN
         UQxA==
X-Gm-Message-State: AFqh2koa+Sc1Rs7RV2I7TRKehR+9h7UV2mRr99dD7qEvRSTg4GVmPDNu
	oTrnMtlsioZXxGVbeBbUrpBBNSNeZmErNca9pdw=
X-Google-Smtp-Source: AMrXdXvGlKZ8CATIwg9ngJFhAyYR9/MwVylkcpDl8ZJZ63x+t5eayYPVaH2OWTehJz4fKVpiIQOxxQ5yxcxGlcPunP0=
X-Received: by 2002:a05:6122:1689:b0:3c5:db35:9288 with SMTP id
 9-20020a056122168900b003c5db359288mr11291155vkl.32.1673811739388; Sun, 15 Jan
 2023 11:42:19 -0800 (PST)
MIME-Version: 1.0
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch> <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com> <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
In-Reply-To: <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 16 Jan 2023 01:12:02 +0530
Message-ID: <CANAwSgSfUPocbXuyBoytcgV5Yd+bfpn2DBzRNAkCAUmPnQQysQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, David Miller <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_114221_608712_C33A68A9 
X-CRM114-Status: GOOD (  27.36  )
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

SGkgSGVpbmVyLAoKT24gTW9uLCAxNiBKYW4gMjAyMyBhdCAwMDoxNCwgTmVpbCBBcm1zdHJvbmcg
PG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gSGkgSGVpbmVyLAo+Cj4gTGUg
MTUvMDEvMjAyMyDDoCAxODowOSwgSGVpbmVyIEthbGx3ZWl0IGEgw6ljcml0IDoKPiA+IE9uIDE1
LjAxLjIwMjMgMTc6NTcsIEFuZHJldyBMdW5uIHdyb3RlOgo+ID4+IE9uIFN1biwgSmFuIDE1LCAy
MDIzIGF0IDA0OjE5OjM3UE0gKzAxMDAsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPiA+Pj4gT24g
bXkgU0MyLWJhc2VkIHN5c3RlbSB0aGUgZ2VucGh5IGRyaXZlciB3YXMgdXNlZCBiZWNhdXNlIHRo
ZSBQSFkKPiA+Pj4gaWRlbnRpZmllcyBhcyAweDAxODAzMzAwLiBJdCB3b3JrcyBub3JtYWwgd2l0
aCB0aGUgbWVzb24gZzEyYQo+ID4+PiBkcml2ZXIgYWZ0ZXIgdGhpcyBjaGFuZ2UuCj4gPj4+IFN3
aXRjaCB0byBQSFlfSURfTUFUQ0hfTU9ERUwgdG8gY292ZXIgdGhlIGRpZmZlcmVudCBzdWItdmVy
c2lvbnMuCj4gPj4KPiA+PiBIaSBIZWluZXIKPiA+Pgo+ID4+IEFyZSB0aGVyZSBhbnkgZGF0YXNo
ZWV0cyBmb3IgdGhlc2UgZGV2aWNlcz8gQW55dGhpbmcgd2hpY2ggZG9jdW1lbnRzCj4gPj4gdGhl
IGxvd2VyIG5pYmJsZSByZWFsbHkgaXMgYSByZXZpc2lvbj8KPiA+Pgo+ID4+IEknbSBqdXN0IHRy
eWluZyB0byBhdm9pZCBmdXR1cmUgcHJvYmxlbXMgd2hlcmUgd2UgZmluZCBpdCBpcyBhY3R1YWxs
eQo+ID4+IGEgZGlmZmVyZW50IFBIWSwgbmVlZHMgaXRzIG93biBNQVRDSF9FWEFDVCBlbnRyeSwg
YW5kIHRoZW4gd2UgZmluZCB3ZQo+ID4+IGJyZWFrIGRldmljZXMgdXNpbmcgMHgwMTgwMzMwMiB3
aGljaCB3ZSBoYWQgbm8gaWRlYSBleGlzdHMsIGJ1dCBnb3QKPiA+PiBjb3ZlcmVkIGJ5IHRoaXMg
Y2hhbmdlLgo+ID4+Cj4gPiBUaGUgU0MyIHBsYXRmb3JtIGluaGVyaXRlZCBhIGxvdCBmcm9tIEcx
MkEsIHRoZXJlZm9yZSBpdCdzIHBsYXVzaWJsZQo+ID4gdGhhdCBpdCdzIHRoZSBzYW1lIFBIWS4g
QWxzbyB0aGUgdmVuZG9yIGRyaXZlciBmb3IgU0MyIGdpdmVzIGEgaGludAo+ID4gYXMgaXQgaGFz
IHRoZSBmb2xsb3dpbmcgY29tcGF0aWJsZSBmb3IgdGhlIFBIWToKPiA+Cj4gPiBjb21wYXRpYmxl
ID0gImV0aGVybmV0LXBoeS1pZDAxODAuMzMwMSIsICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMy
MiI7Cj4gPgo+ID4gQnV0IHlvdSdyZSByaWdodCwgSSBjYW4ndCBzYXkgZm9yIHN1cmUgYXMgSSBk
b24ndCBoYXZlIHRoZSBkYXRhc2hlZXRzLgo+Cj4gT24gRzEyQSAoJiBHWEwpLCB0aGUgUEhZIElE
IGlzIHNldCBpbiB0aGUgTURJTyBNVVggcmVnaXN0ZXJzLAo+IHBsZWFzZSBzZWU6Cj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL25ldC9tZGlv
L21kaW8tbXV4LW1lc29uLWcxMmEuYyNMMzYKPgo+IFNvIHlvdSBzaG91bGQgZWl0aGVyIGFkZCBz
dXBwb3J0IGZvciB0aGUgUEhZIG11eCBpbiBTQzIgb3IgY2hlY2sKPiB3aGF0IGlzIGluIHRoZSBF
VEhfUEhZX0NOVEwwIHJlZ2lzdGVyLgo+CgpJIHlvdSB3YW50IHRvIHJlYWQgdGhlIGV0aGVybmV0
IGlkLCB3ZSBjYW4gdXNlIHRoZSBmb2xsb3dpbmcgdG9vbAoKWzBdIGh0dHBzOi8vZ2l0aHViLmNv
bS93a3ovbWRpby10b29scwoKb20gbXkgb2Ryb2lkLW4yIGl0IHNob3cKYWxhcm1Ab2Ryb2lkLW4y
On4vbWRpby10b29scyQgc3VkbyBtZGlvIG1kaW9fbXV4LTAuMAogREVWICAgICAgUEhZLUlEICBM
SU5LCjB4MDAgIDB4MDAxY2M5MTYgIGRvd24KMHgwMSAgMHgwMDFjYzkxNiAgdXAKCi1BbmFuZAoK
PiBOZWlsCj4KPiA+Cj4gPj4gICAgICBBbmRyZXcKPiA+Cj4gPiBIZWluZXIKPgo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
