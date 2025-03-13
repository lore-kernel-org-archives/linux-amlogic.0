Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0155BC35FF3
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Mar 2025 23:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GK9Fm0di4QrGYKcb7waeoJtnjOxNlvFpjQLwYNX3DeM=; b=AOhL8vH3iDvkHs
	NO+Ftuy020k9dlnrh2VzwaGYGMO8JwA94N/6Dhz0sLGL/oU4tja0BRmCXQa8mpjNeefLJprOzll9F
	7Y4p53zrKNf6GT/Ws3uw26trxLxD+KR5enSbzt6EwVg/dXsr2utgIl/I31djraCdDPQtJNZ2gvsgB
	HkmYBaKWd7ABqQUqdUWFVxeVp+R1FwBCRpg25IHi9VE31Ilw8d0R0ylTEce0YjY0itbk0FHGHgw91
	uv2gSwT02LPZGKhtjRp3YJIwcaz5i1bOwjO6Nd3M9Q/etITi6oll7UzmheDTwLQwmXX5q2h91FGyJ
	40qNLcvPU5S4xaGDvK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsriz-0000000CgOM-2KkK;
	Thu, 13 Mar 2025 23:12:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrhe-0000000CgFW-0XrJ;
	Thu, 13 Mar 2025 23:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA4D05C0F92;
	Thu, 13 Mar 2025 23:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34D95C4CEE5;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907461;
	bh=1YMIKyMyiIHxQT9I7V2KJ6dMxmvfNZry8pelzl171bk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WRivEGXLxLFhUVLhb8SVLsLpNF5wTkbdJSqFqyyt/rBP6V3/P62tkW38b1A3YXoCt
	 WoEd8ReVQPFO3sD4JZsXYhbT64HNKzn8PHtsUjZk2xSIXvFKHY4ViBNKUjC9VGn7z9
	 x+cZE4CYVTJqlHUr5Knv8ng+xxMKhDttGCmDjN+3HCnSRUJOsgpqypVkkAt4/fe5MG
	 1gq6aUoUQ/YUsHU3FjmS3A2IF9Rbps5GY/PI0G6+pmfr62dg1VLUJbZHPSUzO7Du2R
	 2OuoWRP6JvGGGcYmbDDYxOweHHPTukHrsOEGidsK3g6PFyYBZmbg933xMq1MTlF35M
	 Ula9PhlWrvvpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289C9C35FF6;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 14 Mar 2025 00:11:00 +0100
Subject: [PATCH v2 2/2] arm64: dts: amlogic: Add Ugoos AM3
MIME-Version: 1.0
Message-Id: <20250314-ugoos-am3-v2-2-422104b0cec5@posteo.net>
References: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
In-Reply-To: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741907460; l=4596;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=m3invKokLgdJ1eCdXuhwHYci6oBGOULnHFVI8Wy8tiI=;
 b=h5PCF4nsdbjTbwVFveX7lFEADyFz+xxk+07lMMMq6sLw/WUAvtmvQjLPr91KEmOCSjRsUAvKy
 uwyGgJ5YPgnBYGmkPOb8gWawgVEoEbBrfGGWI2N4hsP9SLcMLXum8OY
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161102_283191_568C5DA5 
X-CRM114-Status: GOOD (  17.09  )
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
by5uZXQ+Ci0tLQoKVjI6Ci0gRml4IHZlbmRvciBuYW1lIGluIHBhdGNoIHN1YmplY3QKLSBSZW1v
dmUgaW5jb3JyZWN0IG92ZXJyaWRlIG9mIFNESU8gcHdyc2VxIHJlc2V0IGxpbmUKLS0tCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAxICsKIC4u
Li9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LXAyM3gtcTIweC5kdHNpIHwgIDIgKy0K
IC4uLi9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS11Z29vcy1hbTMuZHRzIHwgOTEg
KysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCmluZGV4IDJm
YmRhODQxOWM2NWEzMDU2NDEwYWM0NWNhM2RkYWNlYjY5ZWE0ZjUuLmJmMmJjMTQ1MjhiZmEyN2U4
ZDZhZTI3MzAwODVmYzM1NmQ2YzZkZDggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9NYWtlZmlsZQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZp
bGUKQEAgLTc2LDYgKzc2LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4
bS1xMjAwLmR0YgogZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS1xMjAxLmR0
YgogZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS1yYm94LXByby5kdGIKIGR0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tczkxMi1saWJyZXRlY2gtcGMuZHRi
CitkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXVnb29zLWFtMy5kdGIKIGR0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tdmVnYS1zOTYuZHRiCiBkdGItJChD
T05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXdldGVrLWNvcmUyLmR0YgogZHRiLSQoQ09O
RklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXM0LXM4MDV4Mi1hcTIyMi5kdGIKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC1wMjN4LXEyMHguZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC1wMjN4LXEyMHguZHRzaQppbmRleCA0
NWNjZGRkMWFhZjA1NDY2MzJjODFhNTJjODkxN2E5MjNiZWFlODgzLi40MjIzYjI2ZjdkMGYzYWE0
N2U0MmU5NDM0ZDI0ZjczYjIwNDQxOTgxIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tZ3gtcDIzeC1xMjB4LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWd4LXAyM3gtcTIweC5kdHNpCkBAIC05Nyw3ICs5Nyw3IEBAIHNkaW9f
cHdyc2VxOiBzZGlvLXB3cnNlcSB7CiAJCWNsb2NrLW5hbWVzID0gImV4dF9jbG9jayI7CiAJfTsK
IAotCWN2YnMtY29ubmVjdG9yIHsKKwljdmJzX2Nvbm5lY3RvcjogY3Zicy1jb25uZWN0b3Igewog
CQljb21wYXRpYmxlID0gImNvbXBvc2l0ZS12aWRlby1jb25uZWN0b3IiOwogCiAJCXBvcnQgewpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS11Z29vcy1h
bTMuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS11Z29vcy1hbTMu
ZHRzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAuLmJhODcxZjNmNTNiYjk5YjQ3YjMyNWJhZTIyOGI1OWI3MjJjNTEyM2IK
LS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3ht
LXVnb29zLWFtMy5kdHMKQEAgLTAsMCArMSw5MSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMjUgSi4gTmV1c2Now6RmZXIgPGou
bmVAcG9zdGVvLm5ldD4KKyAqCisgKiBEZWJ1ZyBVQVJUICgzLjNWLCAxMTUyMDAgYmF1ZCkgYXQg
dGhlIGNvcm5lciBvZiB0aGUgYm9hcmQ6CisgKiAgICg0KSAoMykgKDIpIFsxXQorICogICBWY2Mg
UlhEIFRYRCBHTkQKKyAqLworCisvZHRzLXYxLzsKKworI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
cHV0L2lucHV0Lmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
YW1sb2dpYyxtZXNvbi1nMTJhLWdwaW8taW50Yy5oPgorCisjaW5jbHVkZSAibWVzb24tZ3htLmR0
c2kiCisjaW5jbHVkZSAibWVzb24tZ3gtcDIzeC1xMjB4LmR0c2kiCisKKy8geworCWNvbXBhdGli
bGUgPSAidWdvb3MsYW0zIiwgImFtbG9naWMsczkxMiIsICJhbWxvZ2ljLG1lc29uLWd4bSI7CisJ
bW9kZWwgPSAiVWdvb3MgQU0zIjsKKworCWFkYy1rZXlzIHsKKwkJY29tcGF0aWJsZSA9ICJhZGMt
a2V5cyI7CisJCWlvLWNoYW5uZWxzID0gPCZzYXJhZGMgMD47CisJCWlvLWNoYW5uZWwtbmFtZXMg
PSAiYnV0dG9ucyI7CisJCWtleXVwLXRocmVzaG9sZC1taWNyb3ZvbHQgPSA8MTcxMDAwMD47CisK
KwkJYnV0dG9uLWZ1bmN0aW9uIHsKKwkJCWxhYmVsID0gIlVwZGF0ZSI7CisJCQlsaW51eCxjb2Rl
ID0gPEtFWV9WRU5ET1I+OworCQkJcHJlc3MtdGhyZXNob2xkLW1pY3Jvdm9sdCA9IDwxMDAwMD47
CisJCX07CisJfTsKK307CisKKyZjdmJzX2Nvbm5lY3RvciB7CisJLyogTm90IHVzZWQgb24gdGhp
cyBib2FyZCAqLworCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cit9OworCismZXRobWFjIHsKKwlwaW5j
dHJsLTAgPSA8JmV0aF9waW5zPjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCisJLyog
U2VsZWN0IGV4dGVybmFsIFBIWSBieSBkZWZhdWx0ICovCisJcGh5LWhhbmRsZSA9IDwmZXh0ZXJu
YWxfcGh5PjsKKworCWFtbG9naWMsdHgtZGVsYXktbnMgPSA8Mj47CisKKwkvKiBFeHRlcm5hbCBQ
SFkgaXMgaW4gUkdNSUkgKi8KKwlwaHktbW9kZSA9ICJyZ21paSI7CisKKwlzdGF0dXMgPSAib2th
eSI7Cit9OworCismZXh0ZXJuYWxfbWRpbyB7CisJZXh0ZXJuYWxfcGh5OiBldGhlcm5ldC1waHlA
MCB7CisJCS8qIFJlYWx0ZWsgUlRMODIxMUYgKDB4MDAxY2M5MTYpICovCisJCXJlZyA9IDwwPjsK
KworCQlyZXNldC1hc3NlcnQtdXMgPSA8MTAwMDA+OworCQlyZXNldC1kZWFzc2VydC11cyA9IDw4
MDAwMD47CisJCXJlc2V0LWdwaW9zID0gPCZncGlvIEdQSU9aXzE0IEdQSU9fQUNUSVZFX0xPVz47
CisKKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpb19pbnRjPjsKKwkJLyogTUFDX0lOVFIgb24g
R1BJT1pfMTUgKi8KKwkJaW50ZXJydXB0cyA9IDwyNSBJUlFfVFlQRV9MRVZFTF9MT1c+OworCX07
Cit9OworCismaTJjX0IgeworCXN0YXR1cyA9ICJva2F5IjsKKwlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmaTJjX2JfcGlucz47CisKKwlydGM6IHJ0Y0A1MSB7CisJ
CWNvbXBhdGlibGUgPSAiaGFveXUsaHltODU2MyI7CisJCXJlZyA9IDwweDUxPjsKKwkJI2Nsb2Nr
LWNlbGxzID0gPDA+OworCX07Cit9OworCisvKiBXTEFOOiBBdGhlcm9zIDEwayAoUUNBOTM3Nykg
Ki8KKyZzZF9lbW1jX2EgeworCW1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsKK307CisKKy8q
IGVNTUMgKi8KKyZzZF9lbW1jX2MgeworCW1heC1mcmVxdWVuY3kgPSA8MTAwMDAwMDAwPjsKK307
CgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2YjY3NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
