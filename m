Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8159BC77B75
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzzO962a3ygGwgtQucwjebYRUkJ5IGarjkJT6vIeUMg=; b=N3XrUtfAE8hP4D
	zLA/TF2wqMUUvAq3/c8lvVIDDevZPTaqPXOaqZL2uqzzhC0hylTYpI9MeOpYoHQt1ua3bGtwwt1n5
	3Im7FBZ6ePeNiypEfablq/J3veNEz+harjadUV3gZWkn7fo0IDWK3eKzyVLlwEo3LGsrUpxDvVHAN
	KwYoSWrDIRAILFOQeDUmxHFBOqn8U9KXEzswKWm+6YmIos4Ip9bSg2kJOdKP01zsVcYSek6PaiRIo
	Ar5dCk1G2WXrDwpT1HsAMCAY0CjIWoKnoesZOj3mFo0gxB43dCC70eM0JKzOloP13prCygzXlyqVb
	yIqg8niQJSWcVV43sjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxP1K-00BS5N-0i;
	Fri, 12 May 2023 09:25:02 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxP1G-00BS1f-0N;
	Fri, 12 May 2023 09:25:00 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 336505FD6C;
	Fri, 12 May 2023 12:24:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683883489;
	bh=GSEauJwVGUEtIex83oapmFFrZA/IEWwkf1cUksaKAB4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=HwAVtUfxIBjXUmqEw6DXyfdhs3UkCGZ1U8bvRnXX3P5zY8p9PsB4ZjaxKvJp5PIz8
	 hf4DvesPGAVcQ+ad8Fk5KmdBzbkPPAwp4rTOl+PPXJN2FE+Vn3gBDi8L5Ah9Nh4JpS
	 PoTs+M6y6Ww+tUyGMrDi4NoSjAVzz8kdTN7YOTR64G2UGZJwo4ZGQyUnxjovlVswRB
	 PEq4/5Y5SXfbswkoxgl36wArRw5TQOLotHUOYY9qCEXp7RquwLEYiAFyiYp85/jXq4
	 n5R1d2jjeWbPWhjYUUrho2xTop6z/8SEYKhaEERCpEfm7RpbARdOLO0I7QywrWDNqN
	 E7KhFwMxOuYtw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 12 May 2023 12:24:46 +0300 (MSK)
Date: Fri, 12 May 2023 12:24:46 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin =?utf-8?Q?Hundeb=C3=B8ll?= <martin@geanix.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <stable@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] pinctrl: meson-axg: add missing GPIOA_18 gpio
 group
Message-ID: <20230512092446.kxrjvk73xqpfdmjf@CAB-WSD-L081021>
References: <20230512064925.133516-1-martin@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512064925.133516-1-martin@geanix.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/12 06:31:00 #21267308
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_022458_329953_9553DB4D 
X-CRM114-Status: GOOD (  15.69  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMDg6NDk6MjVBTSArMDIwMCwgTWFydGluIEh1bmRlYsO4
bGwgd3JvdGU6Cj4gV2l0aG91dCB0aGlzLCB0aGUgZ3BpbyBjYW5ub3QgYmUgZXhwbGljaXRseSBt
dXgnZWQgdG8gaXRzIGdwaW8gZnVuY3Rpb24uCj4gCj4gRml4ZXM6IDgzYzU2NjgwNmE2OGEgKCJw
aW5jdHJsOiBtZXNvbi1heGc6IEFkZCBuZXcgcGluY3RybCBkcml2ZXIgZm9yIE1lc29uIEFYRyBT
b0MiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogTWFydGlu
IEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgoKUmV2aWV3ZWQtYnk6IERtaXRyeSBSb2tv
c292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+Cgo+IC0tLQo+IENoYW5nZXMgc2luY2UgZmly
c3QgbWFpbDoKPiAgKiBBZGRlZCBDYzogc3RhYmxlIHRvIGNvbW1pdCBtZXNzYWdlCj4gICogRXhw
YW5kZWQgVG86IGFuZCBDYzogd2l0aCBmdWxsIGxpc3QgZnJvbSBnZXRfbWFpbnRhaW5lcnMucGwK
PiAKPiAgZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtbWVzb24tYXhnLmMgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLWF4Zy5jIGIvZHJpdmVycy9waW5jdHJsL21lc29u
L3BpbmN0cmwtbWVzb24tYXhnLmMKPiBpbmRleCA3YmZlY2RmYmExNzcuLmQyNDlhMDM1YzJiOSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1heGcuYwo+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLWF4Zy5jCj4gQEAgLTQw
MCw2ICs0MDAsNyBAQCBzdGF0aWMgc3RydWN0IG1lc29uX3BteF9ncm91cCBtZXNvbl9heGdfcGVy
aXBoc19ncm91cHNbXSA9IHsKPiAgCUdQSU9fR1JPVVAoR1BJT0FfMTUpLAo+ICAJR1BJT19HUk9V
UChHUElPQV8xNiksCj4gIAlHUElPX0dST1VQKEdQSU9BXzE3KSwKPiArCUdQSU9fR1JPVVAoR1BJ
T0FfMTgpLAo+ICAJR1BJT19HUk9VUChHUElPQV8xOSksCj4gIAlHUElPX0dST1VQKEdQSU9BXzIw
KSwKPiAgCj4gLS0gCj4gMi4zNC4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKLS0gClRoYW5rIHlvdSwKRG1pdHJ5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
