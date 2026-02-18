Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43A8E9A02C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9I/KNPhfoI2zAmhZuAkVQtMxjTqf0+9RvKOL1SXQj4=; b=IHHcL8fi2iTba5
	pLb+MU6SFNFXq44jL382jC8dTl2kxUxnk/hI5+XAnYuSWqjERZoZcgPxrwL7U7eS3cQD5SXTu831v
	ZxD2K5p5tIkHD3oWbnKAaTtAW62wYI1BQqqhJdynUj2S+LEC+lMDP8UcnYKZrrBrDsrzjqYtgDrCC
	LjEbHJKXQLM5T3SCU8U/1EhXq47MTxWPhCVjEFlkZixMLkaOIlE/W2wzKohPXATZ1pKdBkSNmoLr9
	0kiAujb6SYTvc6Ep64hIW2aItlVd5tFjORaalNYRahyr45b0sJeD6wnGXW/guKu2ujOOcEgfAH3Rd
	zq2sYS+jPG5AafmS/sTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnO9-0000000AJxD-41Fz;
	Wed, 18 Feb 2026 19:39:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnO8-0000000AJwo-17Hr
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 19:39:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8429043B56;
	Wed, 18 Feb 2026 19:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF78C116D0;
	Wed, 18 Feb 2026 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771443547;
	bh=NzbIsmjObZ1OO7Q+OaE1b5Bf4ezXavlaqQd3CWFVMfQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=TvHmEyn3C5Gsp1d90B5hABpFRwzd9RFB5yjLevVnbp9ZVng6L30dlIDSAgloVAPij
	 BH0B5lZBG5rop/i5sAmx9Ag1xtVPJGYfIRTrl2tzB/8r1BFsvjbYcIGPFaUG2wwm9l
	 W2bbEOrjKqqpck1/EucOY9Bo1a7reLYFGOTxkPbzOxZtFkX6pMR1+1UsFDkJ4G+UC+
	 AB3nKU4QOSvgu+lCRm/sWPMYsuwnZTI7FnezG0X9hVH0FXzykXW7TxiOxwFVgG03cJ
	 PDwIKyyqS5bluJPL99mloGnrw8cFNoxQaLSl0q06Z5ExtNMyN2zSthEUEKiTNLGeOn
	 mP16MOBJ++JNg==
Message-ID: <837e6519-da8e-45dc-8c90-3fbf087e4317@kernel.org>
Date: Wed, 18 Feb 2026 20:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-amlogic@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <20260218105611.36216-1-linux-kernel-dev@aliel.fr>
 <594f4fcc-ad88-4969-b9e5-98061fd5b73c@kernel.org>
 <1j8qcp6ed1.fsf@starbuckisacylon.baylibre.com>
 <fc25180a-859a-45da-b3f8-7ccb2e4d73cf@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <fc25180a-859a-45da-b3f8-7ccb2e4d73cf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_113908_397202_B5AC6F85 
X-CRM114-Status: GOOD (  11.93  )
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

T24gMTgvMDIvMjAyNiAyMDozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxOC8w
Mi8yMDI2IDIwOjI4LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBPbiBtZXIuIDE4IGbDqXZyLiAy
MDI2IGF0IDIwOjE3LCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pgo+Pj4gT24gMTgvMDIvMjAyNiAxMTo1NiwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4+Pj4g
QWRkIFBMTCBmb3IgdGhlIGNsb2NrIGNvbnRyb2xsZXIgb2YgdGhlIEFtbG9naWMgVDcgU29DIGZh
bWlseS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJu
ZWwtZGV2QGFsaWVsLmZyPgo+Pj4+IC0tLQo+Pj4+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L2FtbG9naWMsdDctcGxsLWNsa2MuaCB8IDE2ICsrKysrKysrKysrKysrKysKPj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBTbyB5b3UgaWdub3JlZCBteSBjb21t
ZW50cz8KPj4+Cj4+PiBBbmQgdGhhdCdzIHYyLCBub3QgdjEuIFlvdSBzZW50IHYxIGFuZCBHT1Qg
dGhlIGNvbW1lbnRzLgo+Pgo+PiBJIHRoaW5rIHRoaXMgd2FzIHN0aWxsIHYxIGFuZCBpZiB5b3Ug
bG9vayBhdCB0aW1lc3RhbXBzLCBQYXRjaCAxIHdhcyBzZW50Cj4gCj4gTm8KPiAKPj4gYmVmb3Jl
IHlvdXIgZmlyc3QgcmVwbHksIHRoZW4gdGhlcmUgaXMgbG90IG9mIHRpbWUgYmV0d2VlbiB0aGUg
ZGlmZmVyZW50Cj4+IHBhdGNoZXMgLSBwcm9iYWJseSBkb25lIG1hbnVhbGx5ICAuLi4gYXQgcGF0
Y2ggNiAodGhlIG9uZSB5b3UndmUKPj4gY29tbWVudGVkIGZpc3QpIHdhcyBzZW50IHR3aWNlLgo+
IAo+IDEuIHYxOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIxODEwMTcyOC4z
NTQ5Ny0xLWxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnIvCj4gV2VkLCAxOCBGZWIgMjAyNiAxMTox
NzoyNiArMDEwMAo+IAo+IDIuIE15IHJlcGx5IDUgbWludXRlcyBsYXRlcjoKPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvYTg0OGZhNDMtNmE0Ni00ZmQ2LTg2YTQtOTZhYWY4MmUyYTAyQGtl
cm5lbC5vcmcvCj4gV2VkLCAxOCBGZWIgMjAyNiAxMToyMToxMyArMDEwMAkKPiAKPiAzLiBUaGlz
IHBhdGNoIHNlbmQgaGFsZiBhbiBob3VyIGxhdGVyOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDIxODEwNTYxMS4zNjIxNi0xLWxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnIvCj4g
V2VkLCAxOCBGZWIgMjAyNiAqMTE6NTY6MDkqICswMTAwCQoKQWgsIGFuZCBJIGZvcmdvdCB0byBt
ZW50aW9uIC0gYXV0aG9yIHJlcGxpZWQgdG8gbWUgaW4gcHJpdmF0ZSBhdDoKV2VkLCAxOCBGZWIg
MjAyNiAxMToyODoyMyArMDEwMAoKU28gQkVGT1JFIHRoaXMgd2FzIHNlbnQsIHRodXMgaGUgYWxy
ZWFkeSByZWNlaXZlZCBteSBmaXJzdCByZXBseSB0byB2MQphbmQgdGhpcyBoYWQgdG8gYmUgY29u
c2Npb3VzIHNlbmRpbmcgb2YgbmV4dCB2ZXJzaW9uLCB0aHVzIHYyLgoKPiAKPiBhZnRlciBJIGFs
cmVhZHkgcHJvdmlkZWQgZmVlZGJhY2sgYWJvdXQgd3JvbmcgdGhyZWFkaW5nLgo+IAo+IAo+IEJl
c3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
