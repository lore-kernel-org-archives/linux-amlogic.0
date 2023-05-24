Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C6C77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cylRFTX2IvZryarub55ZWcUaAmV3+nzrDtw1D+zMGdU=; b=Dp8u5nizU2R9Ix
	PQKg6cASpztm/FLSNbK7kXxvBDldq7W8NBFsaworAjVXnv+SMpoQ1mg1hzWRF6KQaPkHLpVPyU0h9
	qs5AsilqmAs5/ERB+dzFF4/U0+l0Z20vnp1pkLKlI/Yf49g5KP9RgWwAX15G49iAe7EjpL15hmSml
	gwGG7QAMTFlx5GzKk5j++LT3E+Tb5vkGR8C5R5DheloScMieXFs6UmLfxiSVQP9p4fMUguMNpqz/a
	l92ROm5RcBJRjlClkBfbdYkZawQWPGx+aXH44xl6u8FiSfni2P7ra0dQ9DuAc3pEm4LwH0rRcAsLt
	0OY8GlcjTqwDe6r4p+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ttG-00ES74-0b;
	Wed, 24 May 2023 19:11:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ttD-00ES4i-0b;
	Wed, 24 May 2023 19:11:16 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-510e90d785fso2493516a12.2;
        Wed, 24 May 2023 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684955468; x=1687547468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85PLd9OKU13wDsb8wLcpS9vIt9NW9f/X1/AhbPGEAG8=;
        b=b9FeqMxd6ZIzpLr4Pfztjzy+++imXnaOWtMlQq7c8pOVU+gAH+3oSlNynHD5v+PDoe
         CTe6TsNYuhuWALKHLrFAu3Wnr5CaAD76dHwjAWDVnkQjWwwZQJF4BiuxS8StJiLTXfNT
         Ujk5Q4f+RnukFXvO+YAu1bTG3boBQc2rnSksX0bcEBExgciYRzN8VvqVZOACBpmRyF8v
         xhfvIShOc2G0RXQDwy5GjFkOOMQ7PMJC1jbshW20bE8+jSisLBIyj8T6uaDRQcNsawod
         xmLEPFZz2sloHWOCTUsLVoKoXF8c9JFK2E/PYmn/AIl2acsHC4m3B7FDuDvAfgjycxCo
         VbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684955468; x=1687547468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85PLd9OKU13wDsb8wLcpS9vIt9NW9f/X1/AhbPGEAG8=;
        b=ce1mK8u5BGXs0L/4NRfpbwN+wSsm1c2khPkXpaTV2w1oa3bbeGWyjvNlDP5M1zARTn
         V8YbnN8fzG93gE0zF9lSWi9G3Sz0xKw4gdOF5PpRwi0A3AV6nEaOeiBTYxha3ZFuXr3U
         agL59570Xrdn3rvBgQlCMwIScFddLDwiz1gC6NN/n9t50Cg6sdTVFeumgCUu+AVVDtyW
         fVp1o5DopR9kjASA/JjqVlRxsa21jXA1ZKc2Pmflw59PLq63Zx4aTkuRzRSqpBLRtH+n
         M7BtVdNqgerecG+uYG6aKEBgEas3h/2GfdHmzHrQtLt4Wdb5VXO+zRoo/TPSUkqxlMV9
         p5jA==
X-Gm-Message-State: AC+VfDya8iaoKGLlFeOQdULpMHwVu2VHrc1yeESxqBBJHIA8SCxhgKxF
	olpPWw4+siOd1Vzff5lwwwM=
X-Google-Smtp-Source: ACHHUZ7EupZuYIVvL1viWsa0karFPihZ6a8yEROlmm/o2ClM0XYp84OVrrKqrymy/4ewZsy+XCS3Sg==
X-Received: by 2002:a17:907:6d81:b0:94d:69e0:6098 with SMTP id sb1-20020a1709076d8100b0094d69e06098mr19825586ejc.45.1684955468186;
        Wed, 24 May 2023 12:11:08 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id b2-20020aa7c6c2000000b005066cadcc54sm212302eds.43.2023.05.24.12.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:11:07 -0700 (PDT)
Message-ID: <8e4b2ebb-9dd9-5d30-673e-7794a50fd8b1@gmail.com>
Date: Wed, 24 May 2023 21:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] pwm: pwm-meson: fix handling of period/duty if greater
 than UINT_MAX
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
 <CAFBinCCeh1eUo1=pfqmp4F7UsuKZ--cja-16mCqBhV-cgodzqw@mail.gmail.com>
 <f6b93fcc-ca5a-43ae-729d-38338ba411bc@gmail.com>
 <CAFBinCDdDcFaekrdC33_cO_TngRhMTgqgpFR2ELjEcavd-8SyA@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAFBinCDdDcFaekrdC33_cO_TngRhMTgqgpFR2ELjEcavd-8SyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_121115_225988_25D97532 
X-CRM114-Status: GOOD (  12.74  )
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

T24gMjMuMDUuMjAyMyAyMjo1MSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBNb24s
IE1heSAxNSwgMjAyMyBhdCAxMDozMuKAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBn
bWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAwOC4wNS4yMDIzIDIxOjQ2LCBNYXJ0aW4gQmx1bWVu
c3RpbmdsIHdyb3RlOgo+Pj4gT24gV2VkLCBNYXkgMywgMjAyMyBhdCA5OjU44oCvUE0gSGVpbmVy
IEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBzdGF0ZS0+
cGVyaW9kL2R1dHkgYXJlIG9mIHR5cGUgdTY0LCBhbmQgaWYgdGhlaXIgdmFsdWUgaXMgZ3JlYXRl
ciB0aGFuCj4+Pj4gVUlOVF9NQVgsIHRoZW4gdGhlIGNhc3QgdG8gdWludCB3aWxsIGNhdXNlIHBy
b2JsZW1zLiBGaXggdGhpcyBieQo+Pj4+IGNoYW5naW5nIHRoZSB0eXBlIG9mIHRoZSByZXNwZWN0
aXZlIGxvY2FsIHZhcmlhYmxlcyB0byB1NjQuCj4+Pj4KPj4+PiBGaXhlczogYjc5YzM2NzBlMTIw
ICgicHdtOiBtZXNvbjogRG9uJ3QgZHVwbGljYXRlIHRoZSBwb2xhcml0eSBpbnRlcm5hbGx5IikK
Pj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+Pj4+IFN1Z2dlc3RlZC1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+Pj4gUmV2aWV3
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+Cj4+Cj4+IE5vdCBzdXJlIGFib3V0IHRoZSBwcm9jZXNzIGluIHB3bSBzdWJzeXN0ZW06
IFdoZW4gd2lsbCB0aGVzZSBwYXRjaGVzIG1ha2UKPj4gaXQgdG8gbGludXgtbmV4dD8gQmVjYXVz
ZSBJJ2QgbGlrZSB0byBzdWJtaXQgZm9sbG93LXVwcyB3aXRoIGEgZGVwZW5kZW5jeQo+PiBvbmx5
IGFmdGVyIHBlbmRpbmcgcGF0Y2hlcyBoYXZlIGJlZW4gYXBwbGllZC4KPiBJJ20gYWxzbyBub3Qg
c3VyZS4gUGVyc29uYWxseSBJIHdvdWxkIHRha2UgYWxsIHBhdGNoZXMgdGhhdCBmaXggdGhlCj4g
ZXhpc3RpbmcgZHJpdmVyIGNvZGUsIGJ1bmRsZSB0aGVtIGludG8gYSBzZXJpZXMgYW5kIHJlLXNl
bmQgdGhhdAo+IChjb2xsZWN0aW5nIGFsbCBSZXZpZXdlZC1ieSwgZXRjLiBhbG9uZyB0aGUgd2F5
KS4gVGhlIGlkZWEgaXMgdG8gbWFrZQo+IFRoaWVycnkncyBsaWZlIGVhc2llciBhcyBoZSBqdXN0
IGhhcyB0byBhcHBseSB0aGUgc2VyaWVzIChubyBuZWVkIHRvCj4gd29ycnkgYWJvdXQgdGhlIHBh
dGNoIG9yZGVyLCAuLi4pLgoKU291bmRzIGxpa2UgYSBwbGFuLCBJIHRoaW5rIEknbGwgZm9sbG93
IHRoaXMgc3VnZ2VzdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
