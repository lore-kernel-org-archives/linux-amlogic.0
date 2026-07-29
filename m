Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639C0C53200
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwRdge/PahJ7b84NYUR//oJKcgwPT0wmf5+2p647Jl0=; b=qSt14RuEOL2XrU
	adPtgzmW4BgdR7J1bpTWVDr7sm25sxjjv5hG2vmk2RZP6heySrERMWmJjsXy1358VfzTnCcs+1imG
	zGqazZ3NDPi9/QS0BuLHGjeom8t8DptKN58VtLSohKSe3162x9UMvYcF5ETtvwzO0zKz8uVeVCOpa
	VL5RLVaFKOrke1QrqEiL5q7FuDuOkgMRwqkfQXxiKl9mqrwZdcDCHeY6IVW3bAURTlIOr7N3ZQaNN
	MKybSLrKc+Am4lDpqnEP0FFXc4fKoNu9N1W5Ao4fRwWXGMYGdN+Bbec1F2CBNCdJofU2/jkWrzCWJ
	/MtwoK9LuJb+F0LJgIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8ZS-00000008lrz-0jsp;
	Wed, 29 Jul 2026 17:59:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8ZQ-00000008lrI-3HbN
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 17:59:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A11840C01;
	Wed, 29 Jul 2026 17:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B772F1F000E9;
	Wed, 29 Jul 2026 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785347996;
	bh=Afr8AYMx3BMn2gSwsRKx+oiaoVXcclqbOn2L0f9Bohs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k0TlBh850067w6GKBvF0eJQhok/oWcwB7gCBx3JSKxmovtZIDAfdvZ/96oXuq7jiX
	 EyQiTuzDC0EyUcjNxNcYZ5OplID+bhCpgPS6w4hAnBp/6xHsirjcEb96HqVPIC36kx
	 doOZ5ckF5RiD1oMkrNp88NpeEviAsW+Y6kvJP5bSHpMj1+kCbeSrsl6K1hXH64chPa
	 lWZnuSAQJ+A3cBIQcD39McX5nMkxPMJ8vh+3LhwLlCJHQo1taEI+a64bM1K9s/4Lc2
	 q5QWaxEyeeQcYztm77vOM7W3gaFTKVSQD6abZ4GJ5sUm5DylHp1bF2cDlxTh/aZoZo
	 2an1kMHsQOtug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260729175134.92909-4-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
 <20260729175134.92909-4-robazzalberto@gmail.com>
Date: Wed, 29 Jul 2026 17:59:55 +0000
Message-Id: <20260729175955.B772F1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFBpbiBtdWx0aXBsZXhp
bmcgY29uZmxpY3Qgb24gR1BJT1hfMTYgYmV0d2VlbiBXaS1GaSByZXNldCBhbmQgUFdNIGNsb2Nr
LgotIFtMb3ddIFRoZSBMRUQgbm9kZSBmYWlscyB0byBvdmVycmlkZSB0aGUgbGVnYWN5ICdsYWJl
bCcgcHJvcGVydHksIHJlc3VsdGluZyBpbiBpbmNvcnJlY3Qgc3lzZnMgbmFtaW5nLgotLQoKLS0t
IFBhdGNoIFszXTogW1BBVENIIHY1IDMvM10gYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIHN1cHBv
cnQgZm9yIE9yYmJlYyBab3JhIFAxIC0tLQpjb21taXQgOTI4NzliNjRmYzk1MTBkNzE2NDkyYzg2
Yzc5ZWMzZTdmMGVhYWQyZgpBdXRob3I6IEFsYmVydG8gUm9iYXp6YSA8cm9iYXp6YWxiZXJ0b0Bn
bWFpbC5jb20+Cgphcm02NDogZHRzOiBhbWxvZ2ljOiBhZGQgc3VwcG9ydCBmb3IgT3JiYmVjIFpv
cmEgUDEKClRoZSBPcmJiZWMgWm9yYSBQMSBpcyBhbiBBMzExRCAoTWVzb24gRzEyQikgYm9hcmQg
d2l0aCAyLzQgR2lCIEREUjQsCmFuIEFtcGFrIEFQNjI1NiBjb21ibyBtb2R1bGUgKEJyb2FkY29t
IEJDTTQzNDU2IFdpLUZpIG92ZXIgU0RJTyBhbmQKQkNNNDM0NUM1IEJsdWV0b290aCBvdmVyIFVB
UlRfQSkuCkFjY29yZGluZyB0byB0aGUgb3JpZ2luYWwgTGludXggZHRzLCB0aGUgYm9hcmQgaXMg
YSBtb2RkZWQgdmVyc2lvbgpvZiB0aGUgT0RST0lELU4yLCB3aXRoIEFtbG9naWMgQTMxMUQgaW5z
dGVhZCBvZiB0aGUgb3JpZ2luYWwgUzkyMlgKYW5kIFdpRmkgYW5kIEJsdWV0b290aCBzdXBwb3J0
LgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmIt
em9yYS1wMS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi16b3Jh
LXAxLmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLXpvcmEtcDEuZHRzCgpbIC4uLiBd
Cgo+ICsJbGVkcyB7Cj4gKwkJLyogU3RhdHVzIGxlZCBvbiBab3JhIGlzIGFjdHVhbGx5IGdyZWVu
LCBzYW1lIHBpbiBhcyBOMiwgYnV0IHJldmVyc2VkIHBvbGFyaXR5ICovCj4gKwkJbGVkLWJsdWUg
ewo+ICsJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9TVEFUVVM7Cj4gKwkJCWNvbG9yID0gPExF
RF9DT0xPUl9JRF9HUkVFTj47Cj4gKwkJCWdwaW9zID0gPCZncGlvX2FvIEdQSU9BT18xMSBHUElP
X0FDVElWRV9MT1c+Owo+ICsJCX07Cj4gKwl9OwoKW1NldmVyaXR5OiBMb3ddCklzIHRoaXMgbGVk
LWJsdWUgbm9kZSBtaXNzaW5nIGEgL2RlbGV0ZS1wcm9wZXJ0eS8gZm9yIHRoZSBsYWJlbD8KClRo
ZSBkZXZpY2UgdHJlZSBpbmNsdWRlcyBtZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpIHdoaWNoIGRl
ZmluZXMgYSBsYWJlbApwcm9wZXJ0eSBmb3IgbGVkLWJsdWUuIFdoZW4gdGhlIExFRCBzdWJzeXN0
ZW0gcGFyc2VzIHRoaXMgaW4KbGVkX3BhcnNlX2Z3bm9kZV9wcm9wcygpLCBpdCByZWFkcyB0aGUg
aW5oZXJpdGVkIGxhYmVsIGFuZCByZXR1cm5zCmltbWVkaWF0ZWx5LCBpZ25vcmluZyB0aGUgbmV3
bHkgYWRkZWQgY29sb3IgYW5kIGZ1bmN0aW9uIHByb3BlcnRpZXMuCgpXaWxsIHRoaXMgY2F1c2Ug
dGhlIExFRCB0byBhcHBlYXIgYXMgJ24yOmJsdWUnIGluIHN5c2ZzIGluc3RlYWQgb2YgdGhlCmlu
dGVuZGVkIGNvbG9yLWJhc2VkIG5hbWU/Cgo+ICsKPiArCXNkaW9fcHdyc2VxOiBzZGlvLXB3cnNl
cSB7Cj4gKwkJY29tcGF0aWJsZSA9ICJtbWMtcHdyc2VxLXNpbXBsZSI7Cj4gKwkJcmVzZXQtZ3Bp
b3MgPSA8JmdwaW8gR1BJT1hfMTYgR1BJT19BQ1RJVkVfTE9XPjsKPiArCQljbG9ja3MgPSA8JmNs
b2NrXzMyNzY4PjsKPiArCQljbG9jay1uYW1lcyA9ICJleHRfY2xvY2siOwo+ICsJfTsKPiArCj4g
KwljbG9ja18zMjc2ODogY2xvY2stMzI3Njggewo+ICsJCWNvbXBhdGlibGUgPSAicHdtLWNsb2Nr
IjsKPiArCQkjY2xvY2stY2VsbHMgPSA8MD47Cj4gKwkJY2xvY2stZnJlcXVlbmN5ID0gPDMyNzY4
PjsKPiArCQlwd21zID0gPCZwd21fZWYgMCAzMDUxOCAwPjsKPiArCX07Cj4gKwo+ICsJc291bmQg
ewo+ICsJCW1vZGVsID0gIlpPUkEtUDEiOwo+ICsJfTsKPiArfTsKPiArCj4gKyZwd21fZWYgewo+
ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsJcGluY3RybC0wID0gPCZwd21fZV9waW5zPjsKPiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gK307CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhp
cyBwaW4gY29uZmlndXJhdGlvbiBjcmVhdGUgYSBtdWx0aXBsZXhpbmcgY29uZmxpY3Qgb24gR1BJ
T1hfMTY/CgpUaGUgc2Rpb19wd3JzZXEgbm9kZSByZXF1ZXN0cyBHUElPWF8xNiBhcyBhIHN0YW5k
YXJkIEdQSU8gZm9yIHRoZSByZXNldApzZXF1ZW5jZS4gSG93ZXZlciwgcHdtX2VmIHJlcXVlc3Rz
IHRoZSBwd21fZV9waW5zIHBpbmN0cmwgZ3JvdXAuIEJhc2VkIG9uCmRyaXZlcnMvcGluY3RybC9t
ZXNvbi9waW5jdHJsLW1lc29uLWcxMmEuYywgcHdtX2VfcGlucyBtYXBzIGRpcmVjdGx5IHRvCkdQ
SU9YXzE2LgoKU2luY2UgdGhlIHBpbmN0cmwgc3Vic3lzdGVtIHByZXZlbnRzIGNvbmN1cnJlbnQg
Y2xhaW1zIG9mIHRoZSBzYW1lIHBpbiBmb3IKZGlmZmVyZW50IGZ1bmN0aW9ucywgd2lsbCBvbmUg
b2YgdGhlc2UgaW5pdGlhbGl6YXRpb25zIGZhaWwgYW5kIHByZXZlbnQKV2ktRmkgZnJvbSB3b3Jr
aW5nPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDcyOTE3NTEzNC45MjkwOS0xLXJvYmF6emFsYmVydG9AZ21haWwuY29tP3BhcnQ9
MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
