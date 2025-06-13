Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4EC71148
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jun 2025 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3msKfCXcA/dU/Pp5jNs/haagce09gNOCt8mOd9neKo=; b=CQTLujYkbk1FpK
	mOX3SOjSer9UkyuPiinPNM+W8nHDoKcuCPfcDz3dl7cWs/3c7+I/CKWvITmNfCbtlc5GjC04pWdL6
	NMmTJG0hc4F0odNlyqTbbxE2urzic4iDFz4c11bXrbLa7TRoRTimvTd7JHi43r2d+bFgTg/wAOCVW
	fr3aoOtycQkSyt88rM85lStS102re+jVNiDPRqiyth61HL+O0O8JFhL843432IuGFDD7v8k/D4uH+
	GEUwPoMhSdaF6MHDjkjLcEBEh9FoOeqhYP7oWHacJPC8KAe9kmqNRWgm+vxwN3bQFunp/iJVT5qeX
	n+ojIkS5mvjGxttDvQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4l5-0000000GYYe-0JZX;
	Fri, 13 Jun 2025 13:47:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cu-0000000GVV6-3Lyh;
	Fri, 13 Jun 2025 13:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=t0U01zrim3Zbqcil3O4HFI2BkOpjanGCCkoqKewv0vk=; b=MEKK3WGXtvEK4WZrS6mzXTXD0K
	Or9mSVq0oOXf6dbgkEpPoNyckphFJJ4mdaaZQRKpCNOWuvoyAihoBmjsWlW4lYTuv9BUUofiSU/cT
	1tFZG6qXlcQ8jNQoevgehcWGx7lUQ4C6Pq/D0iW9kViQoJioSAUY+MAIUkXyGWzvcYffaGjQVgZmB
	49EohgAyKJ+5fWXOwq/rbvDAS8mc85UGtfBL4UE5ovAAsPl57vKmFywDPnC5Ev5jrujfpbFFreSr5
	gTPWjwpQviXsatpL657GKXAprnCTl9bZbfh9KrUoUrriLvQTF7ubPLMJ60SiIb5SVGB98BPRjSR+W
	I+fzt3wA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cs-000000030hb-0eai;
	Fri, 13 Jun 2025 13:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47A555C697C;
	Fri, 13 Jun 2025 13:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90679C4CEEF;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=TH0hgxyh5i3gv/6kqXf5Rz6s4iXGUSUXb14mkxEA5pc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SgFY64J2G7OvEznEUgDW5TKPZBLxZxJIOtNPq38iXO+cYayvQvhUCz1VqkicWLscZ
	 zltE3AgMrlyMGGjTpMpInqpTcK9VBVUOxsfLN4JI/t9m2QxGeQKZNZyBo5q+/38ovF
	 M6mpxDTc2xNSMIJIijdgQchI2rvC8Oh5rcy/dOkhTG0mlj6cacJfmLzYYxFrlh+45b
	 lj1f0h/J972WYKwqh8RfZRBM89yzHvHrjkFCJ6SqEY12mActDWAOTu2lvyHRLAIHKf
	 pJNnRSDD9AkulyRmZdXWA0anIgpwxYlRhxZ1oxuHel1bBmdTWIj7GG+Mds18ojquA5
	 kttIMW+8YTuAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8185DC71151;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Jun 2025 15:39:14 +0200
Subject: [PATCH v3 2/2] arm64: dts: amlogic: Add Ugoos AM3
MIME-Version: 1.0
Message-Id: <20250613-ugoos-am3-v3-2-f8a43e6bbfdb@posteo.net>
References: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
In-Reply-To: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=4767;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=eeJa1pnKTo6xuMFOpShBZIU9ngPVs1Np32jvFt+1klM=;
 b=YFPM/fT/9mGlgV5aDi8wMRvX9l0IZXutthl2o4gOiuo7TL+9G+quyg78GmlyMbevHzbHknBk1
 ElPxI6fEwMTC3drHI4+kccHZMJ7ombo7DLCIs4NFBHtTZYdSe6J3hrO
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_143922_492855_C24D0BAB 
X-CRM114-Status: GOOD (  17.72  )
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
cnQKIC0gY2FzZSBMRUQKClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcg
PG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVy
IDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQoKVjM6Ci0gQWRkIE1hcnRpbidzIGFuZCBOZWlsJ3MgUi1i
IHRhZ3MKClYyOgotIEZpeCB2ZW5kb3IgbmFtZSBpbiBwYXRjaCBzdWJqZWN0Ci0gUmVtb3ZlIGlu
Y29ycmVjdCBvdmVycmlkZSBvZiBTRElPIHB3cnNlcSByZXNldCBsaW5lCi0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgMSArCiAuLi4vYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC1wMjN4LXEyMHguZHRzaSB8ICAyICstCiAuLi4v
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tdWdvb3MtYW0zLmR0cyB8IDkxICsrKysr
KysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtl
ZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQppbmRleCAxNWU3OTAx
YzEyNjg3Njk2NGI4NThkMmFmYWFhYTVhNWM4NmYxYzIyLi42MTlkY2U3OWIwMjA0ZDI4NmQxZjQ1
NDQzZmQ2ODFjOWI1OGU3ZjJkIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvTWFrZWZpbGUKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCkBA
IC04MCw2ICs4MCw3IEBAIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tcTIw
MC5kdGIKIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tcTIwMS5kdGIKIGR0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tcmJveC1wcm8uZHRiCiBkdGItJChD
T05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXM5MTItbGlicmV0ZWNoLXBjLmR0YgorZHRi
LSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS11Z29vcy1hbTMuZHRiCiBkdGItJChD
T05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXZlZ2Etczk2LmR0YgogZHRiLSQoQ09ORklH
X0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS13ZXRlay1jb3JlMi5kdGIKIGR0Yi0kKENPTkZJR19B
UkNIX01FU09OKSArPSBtZXNvbi1zNC1zODA1eDItYXEyMjIuZHRiCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gtcDIzeC1xMjB4LmR0c2kgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gtcDIzeC1xMjB4LmR0c2kKaW5kZXggNmRhMTMx
NmQ5N2M2MGM4NDQ1NDc3Mzc1YmRkYjE2MWZjMGM2YTdmNC4uYjRmODhlZDYyNzNiOGYwZGI5NTZk
MTYzNDUxZWE2ODU1YzQ1ZmU0OCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWd4LXAyM3gtcTIweC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1neC1wMjN4LXEyMHguZHRzaQpAQCAtOTcsNyArOTcsNyBAQCBzZGlvX3B3cnNl
cTogc2Rpby1wd3JzZXEgewogCQljbG9jay1uYW1lcyA9ICJleHRfY2xvY2siOwogCX07CiAKLQlj
dmJzLWNvbm5lY3RvciB7CisJY3Zic19jb25uZWN0b3I6IGN2YnMtY29ubmVjdG9yIHsKIAkJY29t
cGF0aWJsZSA9ICJjb21wb3NpdGUtdmlkZW8tY29ubmVjdG9yIjsKIAogCQlwb3J0IHsKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tdWdvb3MtYW0zLmR0
cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tdWdvb3MtYW0zLmR0cwpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwLi5iYTg3MWYzZjUzYmI5OWI0N2IzMjViYWUyMjhiNTliNzIyYzUxMjNiCi0tLSAv
ZGV2L251bGwKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS11Z29v
cy1hbTMuZHRzCkBAIC0wLDAgKzEsOTEgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCisvKgorICogQ29weXJpZ2h0IChDKSAyMDI1IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBv
c3Rlby5uZXQ+CisgKgorICogRGVidWcgVUFSVCAoMy4zViwgMTE1MjAwIGJhdWQpIGF0IHRoZSBj
b3JuZXIgb2YgdGhlIGJvYXJkOgorICogICAoNCkgKDMpICgyKSBbMV0KKyAqICAgVmNjIFJYRCBU
WEQgR05ECisgKi8KKworL2R0cy12MS87CisKKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnB1dC9p
bnB1dC5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FtbG9n
aWMsbWVzb24tZzEyYS1ncGlvLWludGMuaD4KKworI2luY2x1ZGUgIm1lc29uLWd4bS5kdHNpIgor
I2luY2x1ZGUgIm1lc29uLWd4LXAyM3gtcTIweC5kdHNpIgorCisvIHsKKwljb21wYXRpYmxlID0g
InVnb29zLGFtMyIsICJhbWxvZ2ljLHM5MTIiLCAiYW1sb2dpYyxtZXNvbi1neG0iOworCW1vZGVs
ID0gIlVnb29zIEFNMyI7CisKKwlhZGMta2V5cyB7CisJCWNvbXBhdGlibGUgPSAiYWRjLWtleXMi
OworCQlpby1jaGFubmVscyA9IDwmc2FyYWRjIDA+OworCQlpby1jaGFubmVsLW5hbWVzID0gImJ1
dHRvbnMiOworCQlrZXl1cC10aHJlc2hvbGQtbWljcm92b2x0ID0gPDE3MTAwMDA+OworCisJCWJ1
dHRvbi1mdW5jdGlvbiB7CisJCQlsYWJlbCA9ICJVcGRhdGUiOworCQkJbGludXgsY29kZSA9IDxL
RVlfVkVORE9SPjsKKwkJCXByZXNzLXRocmVzaG9sZC1taWNyb3ZvbHQgPSA8MTAwMDA+OworCQl9
OworCX07Cit9OworCismY3Zic19jb25uZWN0b3IgeworCS8qIE5vdCB1c2VkIG9uIHRoaXMgYm9h
cmQgKi8KKwlzdGF0dXMgPSAiZGlzYWJsZWQiOworfTsKKworJmV0aG1hYyB7CisJcGluY3RybC0w
ID0gPCZldGhfcGlucz47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKworCS8qIFNlbGVj
dCBleHRlcm5hbCBQSFkgYnkgZGVmYXVsdCAqLworCXBoeS1oYW5kbGUgPSA8JmV4dGVybmFsX3Bo
eT47CisKKwlhbWxvZ2ljLHR4LWRlbGF5LW5zID0gPDI+OworCisJLyogRXh0ZXJuYWwgUEhZIGlz
IGluIFJHTUlJICovCisJcGh5LW1vZGUgPSAicmdtaWkiOworCisJc3RhdHVzID0gIm9rYXkiOwor
fTsKKworJmV4dGVybmFsX21kaW8geworCWV4dGVybmFsX3BoeTogZXRoZXJuZXQtcGh5QDAgewor
CQkvKiBSZWFsdGVrIFJUTDgyMTFGICgweDAwMWNjOTE2KSAqLworCQlyZWcgPSA8MD47CisKKwkJ
cmVzZXQtYXNzZXJ0LXVzID0gPDEwMDAwPjsKKwkJcmVzZXQtZGVhc3NlcnQtdXMgPSA8ODAwMDA+
OworCQlyZXNldC1ncGlvcyA9IDwmZ3BpbyBHUElPWl8xNCBHUElPX0FDVElWRV9MT1c+OworCisJ
CWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9faW50Yz47CisJCS8qIE1BQ19JTlRSIG9uIEdQSU9a
XzE1ICovCisJCWludGVycnVwdHMgPSA8MjUgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKwl9OworfTsK
KworJmkyY19CIHsKKwlzdGF0dXMgPSAib2theSI7CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKKwlwaW5jdHJsLTAgPSA8JmkyY19iX3BpbnM+OworCisJcnRjOiBydGNANTEgeworCQljb21w
YXRpYmxlID0gImhhb3l1LGh5bTg1NjMiOworCQlyZWcgPSA8MHg1MT47CisJCSNjbG9jay1jZWxs
cyA9IDwwPjsKKwl9OworfTsKKworLyogV0xBTjogQXRoZXJvcyAxMGsgKFFDQTkzNzcpICovCism
c2RfZW1tY19hIHsKKwltYXgtZnJlcXVlbmN5ID0gPDIwMDAwMDAwMD47Cit9OworCisvKiBlTU1D
ICovCismc2RfZW1tY19jIHsKKwltYXgtZnJlcXVlbmN5ID0gPDEwMDAwMDAwMD47Cit9OwoKLS0g
CjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
