Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFDFC28B2F
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Mar 2025 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrTiaXozMvK4yXF+H0Q/ELA26AuyCThZgpImCGVx1tU=; b=MgsVX6pNSPyFmB
	wzBFpd/SN053xj9M/2dDQdYm3jt/zQD1t4EGJSJg/sfLwrgRmLF9xUmMmXT8m4X9HvJMuIFctSpJF
	o20UgsDYKo8LpkX2aVTgnLe7c2dzR02yc42DXubdaZHxeYEN143zMEre0fLmcDFQ6hvZIol9C06Nm
	JQJczc2HQXacYB2nRaDYlNmvZd3qtentI+jGAFi+xgF6fYF1h2gyrUWPMwICQZPBmrO3aG3UWWhWJ
	7nAf9HoH7vJCZaJn8XDfOgeIkj92QazBzfra3Vk48t1Tip/eGJgx0SBmBPcDzK+/pX9097VYqxeWj
	EPwV84ueXqlgqm0pNmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGZK-00000000ZLx-32kD;
	Sun, 09 Mar 2025 13:19:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGW4-00000000YeF-0NG1;
	Sun, 09 Mar 2025 13:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3B305C0FD7;
	Sun,  9 Mar 2025 13:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B359C4CEEE;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741526185;
	bh=SHZtBJAG+o4RRVLthnCajXIZ2+BgK5nZRZEOGGpVBTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SvCqKlbfwXeyDko/+0Omsj8qcKAQkuW6rNS3mPgph6cbliD8/8NMhmYpelLlWtuCt
	 aTA9g8ENErDnNm7Ox5uM9roljunATr3VCeWbysQEHsFmcECBjG/Nk3YLIz2sX33tji
	 o6dY7XVcmc9zs+A2Xml8tsG+skgyJD58te3KK0ZxRv6G4xYiVckTlJ5Yrobaxe3G61
	 2N+r0evPNfjs+IOElIoxgSd06o3y6sxnR1b0pTtcPdPN3wSVqaSS0gN1tocm7QNmk6
	 9yrWGSyDry1G3EHzWBwl8TLHtVsl+CVxY9jnNj1qSl83vtXjpMZ2WgCdod/HSLH6oM
	 qwU67IxL7886w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0F8C35FF1;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Mar 2025 14:16:21 +0100
Subject: [PATCH 2/2] arm64: dts: amlogic: Add Ogoos AM3
MIME-Version: 1.0
Message-Id: <20250309-ugoos-am3-v1-2-38cab5a4725b@posteo.net>
References: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
In-Reply-To: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741526184; l=4569;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=r2xd+Ae/jy3p72pJ06WqDTpZeVRV52iMgB3vroAEsT0=;
 b=HT0H/WdaPMebTfWtVNUzbITgKdjZOBqvnQAfEt/VLbNCnctGgaFBwEt6w1YtFQVcwUvL0AMce
 JFmBOWaKuP6BjVG2dzUrKBhmNKXu3cq7x1RqdhhvLMVbjcE9hofvn8J
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_061628_253194_20F45A6D 
X-CRM114-Status: GOOD (  17.63  )
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
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKVGhlIFVnb29zIEFNMyBp
cyBhIHNtYWxsIHNldC10b3AgYm94IGJhc2VkIG9uIHRoZSBBbWxvZ2ljIFM5MTIgU29DLAp3aXRo
IGEgYm9hcmQgZGVzaWduIHRoYXQgaXMgdmVyeSBjbG9zZSB0byB0aGUgUTIweCBkZXZlbG9wbWVu
dCBib2FyZHMuClRoZSBNTUMgbWF4LWZyZXF1ZW5jeSBwcm9wZXJ0aWVzIGFyZSBjb3BpZWQgZnJv
bSB0aGUgZG93bnN0cmVhbSBkZXZpY2UKdHJlZS4KCiAgaHR0cHM6Ly91Z29vcy5jb20vdWdvb3Mt
YW0zLTE2ZwoKVGhlIGZvbGxvd2luZyBmdW5jdGlvbmFsaXR5IGhhcyBiZWVuIHRlc3RlZCBhbmQg
aXMga25vd24gdG8gd29yazoKIC0gZGVidWcgc2VyaWFsIHBvcnQKIC0gInVwZGF0ZSIgYnV0dG9u
IGluc2lkZSB0aGUgY2FzZQogLSBVU0IgaG9zdCBtb2RlLCBvbiBhbGwgdGhyZWUgcG9ydHMKIC0g
SERNSSB2aWRlby9hdWRpbyBvdXRwdXQKIC0gZU1NQywgTWljcm9TRCwgYW5kIFNESU8gV0xBTgog
LSBTL1BESUYgYXVkaW8gb3V0cHV0CiAtIEV0aGVybmV0CiAtIEluZnJhcmVkIHJlbW90ZSBjb250
cm9sIGlucHV0CgpUaGUgZm9sbG93aW5nIGZ1bmN0aW9uYWxpdHkgZG9lc24ndCBzZWVtIHRvIHdv
cms6CiAtIFVTQiByb2xlIHN3aXRjaGluZyBhbmQgZGV2aWNlIG1vZGUgb24gdGhlICJPVEciIHBv
cnQKIC0gY2FzZSBMRUQKClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAgICAg
ICAgICAgfCAgMSArCiAuLi4vYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC1wMjN4LXEy
MHguZHRzaSB8ICAyICstCiAuLi4vYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tdWdv
b3MtYW0zLmR0cyB8IDk1ICsrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
OTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9N
YWtlZmlsZQppbmRleCAyZmJkYTg0MTljNjVhMzA1NjQxMGFjNDVjYTNkZGFjZWI2OWVhNGY1Li5i
ZjJiYzE0NTI4YmZhMjdlOGQ2YWUyNzMwMDg1ZmMzNTZkNmM2ZGQ4IDEwMDY0NAotLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL01ha2VmaWxlCkBAIC03Niw2ICs3Niw3IEBAIGR0Yi0kKENPTkZJR19BUkNIX01F
U09OKSArPSBtZXNvbi1neG0tcTIwMC5kdGIKIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBt
ZXNvbi1neG0tcTIwMS5kdGIKIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0t
cmJveC1wcm8uZHRiCiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXM5MTIt
bGlicmV0ZWNoLXBjLmR0YgorZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS11
Z29vcy1hbTMuZHRiCiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXZlZ2Et
czk2LmR0YgogZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS13ZXRlay1jb3Jl
Mi5kdGIKIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zNC1zODA1eDItYXEyMjIu
ZHRiCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gtcDIz
eC1xMjB4LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gtcDIzeC1x
MjB4LmR0c2kKaW5kZXggNDVjY2RkZDFhYWYwNTQ2NjMyYzgxYTUyYzg5MTdhOTIzYmVhZTg4My4u
NDIyM2IyNmY3ZDBmM2FhNDdlNDJlOTQzNGQyNGY3M2IyMDQ0MTk4MSAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LXAyM3gtcTIweC5kdHNpCisrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC1wMjN4LXEyMHguZHRzaQpAQCAtOTcs
NyArOTcsNyBAQCBzZGlvX3B3cnNlcTogc2Rpby1wd3JzZXEgewogCQljbG9jay1uYW1lcyA9ICJl
eHRfY2xvY2siOwogCX07CiAKLQljdmJzLWNvbm5lY3RvciB7CisJY3Zic19jb25uZWN0b3I6IGN2
YnMtY29ubmVjdG9yIHsKIAkJY29tcGF0aWJsZSA9ICJjb21wb3NpdGUtdmlkZW8tY29ubmVjdG9y
IjsKIAogCQlwb3J0IHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1neG0tdWdvb3MtYW0zLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1neG0tdWdvb3MtYW0zLmR0cwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi5jNDEzNzM2ZjQwOTZkZjg3MjczMTE4NDRk
ZTM1MmRlYmQ4OWNkZmI5Ci0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWd4bS11Z29vcy1hbTMuZHRzCkBAIC0wLDAgKzEsOTUgQEAKKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvKgorICogQ29weXJpZ2h0IChDKSAyMDI1IEou
IE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+CisgKgorICogRGVidWcgVUFSVCAoMy4zViwg
MTE1MjAwIGJhdWQpIGF0IHRoZSBjb3JuZXIgb2YgdGhlIGJvYXJkOgorICogICAoNCkgKDMpICgy
KSBbMV0KKyAqICAgVmNjIFJYRCBUWEQgR05ECisgKi8KKworL2R0cy12MS87CisKKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9pbnB1dC9pbnB1dC5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2FtbG9naWMsbWVzb24tZzEyYS1ncGlvLWludGMuaD4KKworI2luY2x1
ZGUgIm1lc29uLWd4bS5kdHNpIgorI2luY2x1ZGUgIm1lc29uLWd4LXAyM3gtcTIweC5kdHNpIgor
CisvIHsKKwljb21wYXRpYmxlID0gInVnb29zLGFtMyIsICJhbWxvZ2ljLHM5MTIiLCAiYW1sb2dp
YyxtZXNvbi1neG0iOworCW1vZGVsID0gIlVnb29zIEFNMyI7CisKKwlhZGMta2V5cyB7CisJCWNv
bXBhdGlibGUgPSAiYWRjLWtleXMiOworCQlpby1jaGFubmVscyA9IDwmc2FyYWRjIDA+OworCQlp
by1jaGFubmVsLW5hbWVzID0gImJ1dHRvbnMiOworCQlrZXl1cC10aHJlc2hvbGQtbWljcm92b2x0
ID0gPDE3MTAwMDA+OworCisJCWJ1dHRvbi1mdW5jdGlvbiB7CisJCQlsYWJlbCA9ICJVcGRhdGUi
OworCQkJbGludXgsY29kZSA9IDxLRVlfVkVORE9SPjsKKwkJCXByZXNzLXRocmVzaG9sZC1taWNy
b3ZvbHQgPSA8MTAwMDA+OworCQl9OworCX07Cit9OworCismY3Zic19jb25uZWN0b3IgeworCS8q
IE5vdCB1c2VkIG9uIHRoaXMgYm9hcmQgKi8KKwlzdGF0dXMgPSAiZGlzYWJsZWQiOworfTsKKwor
JmV0aG1hYyB7CisJcGluY3RybC0wID0gPCZldGhfcGlucz47CisJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKKworCS8qIFNlbGVjdCBleHRlcm5hbCBQSFkgYnkgZGVmYXVsdCAqLworCXBoeS1o
YW5kbGUgPSA8JmV4dGVybmFsX3BoeT47CisKKwlhbWxvZ2ljLHR4LWRlbGF5LW5zID0gPDI+Owor
CisJLyogRXh0ZXJuYWwgUEhZIGlzIGluIFJHTUlJICovCisJcGh5LW1vZGUgPSAicmdtaWkiOwor
CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmV4dGVybmFsX21kaW8geworCWV4dGVybmFsX3Bo
eTogZXRoZXJuZXQtcGh5QDAgeworCQkvKiBSZWFsdGVrIFJUTDgyMTFGICgweDAwMWNjOTE2KSAq
LworCQlyZWcgPSA8MD47CisKKwkJcmVzZXQtYXNzZXJ0LXVzID0gPDEwMDAwPjsKKwkJcmVzZXQt
ZGVhc3NlcnQtdXMgPSA8ODAwMDA+OworCQlyZXNldC1ncGlvcyA9IDwmZ3BpbyBHUElPWl8xNCBH
UElPX0FDVElWRV9MT1c+OworCisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9faW50Yz47CisJ
CS8qIE1BQ19JTlRSIG9uIEdQSU9aXzE1ICovCisJCWludGVycnVwdHMgPSA8MjUgSVJRX1RZUEVf
TEVWRUxfTE9XPjsKKwl9OworfTsKKworJmkyY19CIHsKKwlzdGF0dXMgPSAib2theSI7CisJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8JmkyY19iX3BpbnM+OworCisJ
cnRjOiBydGNANTEgeworCQljb21wYXRpYmxlID0gImhhb3l1LGh5bTg1NjMiOworCQlyZWcgPSA8
MHg1MT47CisJCSNjbG9jay1jZWxscyA9IDwwPjsKKwl9OworfTsKKworLyogV0xBTjogQXRoZXJv
cyAxMGsgKFFDQTkzNzcpICovCismc2RfZW1tY19hIHsKKwltYXgtZnJlcXVlbmN5ID0gPDIwMDAw
MDAwMD47Cit9OworCismc2Rpb19wd3JzZXEgeworCXJlc2V0LWdwaW9zID0gPCZncGlvIEdQSU9Y
XzYgR1BJT19BQ1RJVkVfSElHSD47Cit9OworCisvKiBlTU1DICovCismc2RfZW1tY19jIHsKKwlt
YXgtZnJlcXVlbmN5ID0gPDEwMDAwMDAwMD47Cit9OwoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2
NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
