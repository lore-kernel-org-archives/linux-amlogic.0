Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5615EC35FFB
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 19:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZfyH+NwUp63oihxSXFPr6jVzuGwDHSRKnoHJcRRohs=; b=Bp18Ie9c51uBK6
	MmJpMmTczjIZf7hbNj9I4d4Pt66DMwecrCZJJQauFXuO6XHICV73u6ir7eRchVzEouVNsuHqWQPAL
	qCgbQpQbU36GStmFRipkmMd3WSMgVQ7cepyv32VX5CdLkDnUnwJEb+UAbSxip5UPMzwf04gQCPYM7
	pz6OaPJ2d95hWtFPlquCIAl/BRf86ANUAIN7p2HwMWB+1Y95S9JEX9vTKj+safk0X5riZup2D0GK5
	GUTrmnqBBINPkSPs2bWFyeo7Wwco63u7OjLm9GZ78Jt9/qCrA9myrZa7tYw0175FSNUmNh54gTcO8
	rINISkGX+aWHhxrpsdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuzA2-00000009zPw-1PSs;
	Wed, 19 Mar 2025 19:33:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuz8k-00000009z7P-1Y9k;
	Wed, 19 Mar 2025 19:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D68A15C5662;
	Wed, 19 Mar 2025 19:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC9CC4CEE9;
	Wed, 19 Mar 2025 19:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742412705;
	bh=VODwfrt3KkmAokRohu16X/E2z/gn8CoM6Tx6tZBecgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FRcNIWSbdFL6ogJKYQrak6++QXliKtGGMtBDVpGiltFURLpOVSvomSH3a+ZRn17vL
	 exSOA9FVCudmB9omE2RjE8n+4/mbB0lrZkX/NpEiYH7awxdfpZZntktdXINEhoSYSO
	 yuLTmyBrCSdva9QtFhkI8K15tyc1UmXhnNY77RjEFtEifY0HADzfchJQCxwZHWRJee
	 kiJtwy/6PZP1wNEDPcW2xi9ffpJh2az7ftbPwSZ4ins6nlZ+ydZNAiaUPF2nkIS8Se
	 6LqJSUCjPqvYdmQqqf7qFsZNl8M7xNB42I7YlKaS5THpGK8T+iT2/LH2ZUEXzKSdnB
	 Oujpr5hTY7z1g==
Message-ID: <7084e271-8546-4a49-9eb8-ee3f647c529a@kernel.org>
Date: Wed, 19 Mar 2025 20:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-2-686867fad719@amlogic.com>
 <20250319-daffy-classy-kangaroo-023e1f@krzk-bin>
 <9ae73d75-9c59-4255-8924-b456c86cbc01@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9ae73d75-9c59-4255-8924-b456c86cbc01@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_123146_489851_1EA94E4A 
X-CRM114-Status: GOOD (  16.38  )
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

T24gMTkvMDMvMjAyNSAxMTowOSwgSmllYmluZyBDaGVuIHdyb3RlOgo+IAo+IOWcqCAyMDI1LzMv
MTkgMTY6MjIsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+PiBbWW91IGRvbid0IG9mdGVu
IGdldCBlbWFpbCBmcm9tIGtyemtAa2VybmVsLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0
YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4+
Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBPbiBXZWQsIE1hciAxOSwgMjAyNSBhdCAwMzow
NDo0NVBNICswODAwLCBqaWViaW5nIGNoZW4gd3JvdGU6Cj4+PiBBZGQgY2xvY2sgSURzIGZvciB0
aGUgbWNsayBwYWRzIGZvdW5kIG9uIHM0IFNvQ3MKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBqaWVi
aW5nIGNoZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gICBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL2F4Zy1hdWRpby1jbGtjLmggfCAxMSArKysrKysrKysrKwo+PiBU
aGlzIGJlbG9uZ3MgdG8gdGhlIGJpbmRpbmcgcGF0Y2gsIHVzdWFsbHkuCj4+Cj4+IEFueXdheSAt
IGRvIG5vdCBhc2sgdXMgdG8gZG8gdGhlIHdvcmsgdHdpY2UuCj4+Cj4+IDxmb3JtIGxldHRlcj4K
Pj4gVGhpcyBpcyBhIGZyaWVuZGx5IHJlbWluZGVyIGR1cmluZyB0aGUgcmV2aWV3IHByb2Nlc3Mu
Cj4+Cj4+IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFuZCBmb3Jnb3QgdG8gYWRk
IGl0Lgo+Pgo+PiBJZiB5b3UgZG8gbm90IGtub3cgdGhlIHByb2Nlc3MsIGhlcmUgaXMgYSBzaG9y
dCBleHBsYW5hdGlvbjoKPj4gUGxlYXNlIGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1ieS9UZXN0ZWQt
YnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3Cj4+IHZlcnNpb25zIG9mIHBhdGNoc2V0LCB1bmRlciBv
ciBhYm92ZSB5b3VyIFNpZ25lZC1vZmYtYnkgdGFnLCB1bmxlc3MKPj4gcGF0Y2ggY2hhbmdlZCBz
aWduaWZpY2FudGx5IChlLmcuIG5ldyBwcm9wZXJ0aWVzIGFkZGVkIHRvIHRoZSBEVAo+PiBiaW5k
aW5ncykuIFRhZyBpcyAicmVjZWl2ZWQiLCB3aGVuIHByb3ZpZGVkIGluIGEgbWVzc2FnZSByZXBs
aWVkIHRvIHlvdQo+PiBvbiB0aGUgbWFpbGluZyBsaXN0LiBUb29scyBsaWtlIGI0IGNhbiBoZWxw
IGhlcmUuIEhvd2V2ZXIsIHRoZXJlJ3Mgbm8KPj4gbmVlZCB0byByZXBvc3QgcGF0Y2hlcyAqb25s
eSogdG8gYWRkIHRoZSB0YWdzLiBUaGUgdXBzdHJlYW0gbWFpbnRhaW5lcgo+PiB3aWxsIGRvIHRo
YXQgZm9yIHRhZ3MgcmVjZWl2ZWQgb24gdGhlIHZlcnNpb24gdGhleSBhcHBseS4KPj4KPj4gUGxl
YXNlIHJlYWQ6Cj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEyLXJjMy9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDU3Nwo+
Pgo+PiBJZiBhIHRhZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2UsIHBsZWFzZSBzdGF0ZSB3aHkg
YW5kIHdoYXQgY2hhbmdlZC4KPj4gPC9mb3JtIGxldHRlcj4KPiAKPiB0aGFua3MgZm9yIHlvdXIg
cmVtaW5kCgpBcmUgeW91IGdvaW5nIHRvIGRvIGFueXRoaW5nIG9yIHlvdSBhcmUgZ29pbmcgdG8g
aWdub3JlIHVzPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
