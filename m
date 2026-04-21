Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4C5F8FA6A
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAWO1A1XfZZ/hLm2gnfAYKoQ7XQ13Euygq4+kIPjxGc=; b=zsoaxqduP86EAn
	LfT3CKXUvyUf/nV1XU5jeQsjMUOaRTk9WoxRY1mSkq1EKhvdodxRjIq+u4ZNwwT2nNZw5xT2qLVDV
	Hmr6al8NlBODcyguEMQCpLRrf1xnN/lVhWJ3VCHxJGywstkJPuK7oC+Z7vtih0018qUCKFt/zGOWP
	AtIccVYIgUcjjW+bD7GdXpHAcVJ4qilhUpU1A7OCDm+cyxE0LhgQ82iuhQucYm1Hj7AzULU8T12r2
	fFAJTEd/ExlrA/8IaczopmDrfrratwF/ZyskzSUdNKLpWHfSA91nu36MHAoO1ZRFSl5WzY/LkklA+
	9BnVZjADO0yU86BA331g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cd-00000008XWS-3jhn;
	Tue, 21 Apr 2026 11:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cV-00000008XNh-2cTy;
	Tue, 21 Apr 2026 11:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C6AF44711;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B026C2BCFB;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776772222;
	bh=odAoM8bR38tg1pjBTSYT0vl1GuFdOGNZovrdJ1Zz77U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZFAe4zvG/Eema/9q47BhavdPtW979VmDlLIZZvlIa7ta9i+W/exBVSDDV38xG6sPK
	 0W1Cc/M6/f7lwCdm2pxlgttPymXRDvKLekSpAoTjFICcoA8Ln0d85NimbTCgPiDwNz
	 Mt2qQ3VKMyJcUHR8nswOLEyuTaBvk0IzzKTkCnhrq1xdx2wu0PWAwgaA/IuVpuhqfO
	 FSAQpivB6YVfwVECtu+im0nfP3jf87vpVgjhCCxXs0JlxM1sb2QqKs0Z+VHnsF/GVa
	 yB+dHnolftbdDLgxroKKS94ebB/zNDjj69nlU0pA9mGH+pY4z3hePVcwgPqt9zKDjl
	 UAchXb6NUrtKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE26F8FA62;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 21 Apr 2026 13:49:21 +0200
Subject: [PATCH v4 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
MIME-Version: 1.0
Message-Id: <20260421-add-mcu-fan-khadas-vim4-v4-4-447114a28f2d@aliel.fr>
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5062;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=emjopVGd5uVLfwcqEy71jr1NYUE1/T1lgxk1RfDuCzk=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+bzlNIHOg4v+wuXSIYnds27kZz09LzFZiXeV0JZKRGf/
 BJ2rl7YUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAExE4zzD/9KCQ0n7jFjedGWY
 bBQ98VXBcTfvVynr/8uuFSucqyr4/JSRoWsNI2vdjOcrkk7uDs46prmlYUan9lz2dM2TSnEqidn
 XeQA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_045023_742498_68759EBA 
X-CRM114-Status: GOOD (  14.84  )
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpSZWZhY3Rv
ciBwcm9iZSgpIHRvIHVzZSBwZXItdmFyaWFudCBraGFkYXNfbWN1X2RhdGEKaW5zdGVhZCBvZiBo
YXJkY29kZWQgZ2xvYmFscy4KCkFkZCBkZWRpY2F0ZWQgcmVnbWFwIGNvbmZpZ3VyYXRpb24gYW5k
IGRldmljZSBkYXRhIGZvciB0aGUgVklNNCBNQ1UsCndpdGggaXRzIG93biB2b2xhdGlsZS93cml0
ZWFibGUgcmVnaXN0ZXJzLgoKQWRkIHRoZSBmYW4gY29udHJvbCByZWdpc3RlcgooMOKAkzEwMCBs
ZXZlbHMgdnMgMOKAkzMgZm9yIHByZXZpb3VzIHN1cHBvcnRlZCBib2FyZHMpLgoKQWRkIGEgbmV3
IGNvbXBhdGlibGUgc3RyaW5nICJraGFkYXMsdmltNC1tY3UiLgoKU2lnbmVkLW9mZi1ieTogUm9u
YWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Ci0tLQogZHJpdmVycy9tZmQv
a2hhZGFzLW1jdS5jIHwgMTA2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jIGIvZHJpdmVycy9tZmQv
a2hhZGFzLW1jdS5jCmluZGV4IGJhOTgxYTc4ODY5MjEuLmIzNmIzYjNhYjczYzAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbWZkL2toYWRhcy1tY3UuYworKysgYi9kcml2ZXJzL21mZC9raGFkYXMtbWN1
LmMKQEAgLTc1LDE1ICs3NSw5MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcg
a2hhZGFzX21jdV9yZWdtYXBfY29uZmlnID0gewogCS5jYWNoZV90eXBlCT0gUkVHQ0FDSEVfTUFQ
TEUsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGtoYWRhc19tY3VfZmFuX3BkYXRhIGtoYWRh
c19tY3VfZmFuX3BkYXRhID0geworCS5mYW5fcmVnCT0gS0hBREFTX01DVV9DTURfRkFOX1NUQVRV
U19DVFJMX1JFRywKKwkubWF4X2xldmVsCT0gMywKK307CisKIHN0YXRpYyBzdHJ1Y3QgbWZkX2Nl
bGwga2hhZGFzX21jdV9mYW5fY2VsbHNbXSA9IHsKIAkvKiBWSU0xLzIgUmV2MTMrIGFuZCBWSU0z
IG9ubHkgKi8KLQl7IC5uYW1lID0gImtoYWRhcy1tY3UtZmFuLWN0cmwiLCB9LAorCXsKKwkJLm5h
bWUgPSAia2hhZGFzLW1jdS1mYW4tY3RybCIsCisJCS5wbGF0Zm9ybV9kYXRhID0gJmtoYWRhc19t
Y3VfZmFuX3BkYXRhLAorCQkucGRhdGFfc2l6ZSAgICA9IHNpemVvZihraGFkYXNfbWN1X2Zhbl9w
ZGF0YSksCisJfSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgbWZkX2NlbGwga2hhZGFzX21jdV9jZWxs
c1tdID0gewogCXsgLm5hbWUgPSAia2hhZGFzLW1jdS11c2VyLW1lbSIsIH0sCiB9OwogCitzdGF0
aWMgY29uc3Qgc3RydWN0IGtoYWRhc19tY3VfZGF0YSBraGFkYXNfbWN1X2RhdGEgPSB7CisJLnJl
Z21hcF9jb25maWcJPSAma2hhZGFzX21jdV9yZWdtYXBfY29uZmlnLAorCS5jZWxscwkJPSBraGFk
YXNfbWN1X2NlbGxzLAorCS5uY2VsbHMJCT0gQVJSQVlfU0laRShraGFkYXNfbWN1X2NlbGxzKSwK
KwkuZmFuX2NlbGxzCT0ga2hhZGFzX21jdV9mYW5fY2VsbHMsCisJLm5mYW5fY2VsbHMJPSBBUlJB
WV9TSVpFKGtoYWRhc19tY3VfZmFuX2NlbGxzKSwKK307CisKK3N0YXRpYyBib29sIGtoYWRhc19t
Y3VfdmltNF9yZWdfdm9sYXRpbGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcmVn
KQoreworCXN3aXRjaCAocmVnKSB7CisJY2FzZSBLSEFEQVNfTUNVX1BXUl9PRkZfQ01EX1JFRzoK
KwljYXNlIEtIQURBU19NQ1VfVklNNF9SRVNUX0NPTkZfUkVHOgorCWNhc2UgS0hBREFTX01DVV9X
T0xfSU5JVF9TVEFSVF9SRUc6CisJY2FzZSBLSEFEQVNfTUNVX1ZJTTRfTEVEX09OX1JBTV9SRUc6
CisJY2FzZSBLSEFEQVNfTUNVX1ZJTTRfRkFOX0NUUkxfUkVHOgorCWNhc2UgS0hBREFTX01DVV9W
SU00X1dEVF9FTl9SRUc6CisJY2FzZSBLSEFEQVNfTUNVX1ZJTTRfU1lTX1JTVF9SRUc6CisJCXJl
dHVybiB0cnVlOworCWRlZmF1bHQ6CisJCXJldHVybiBmYWxzZTsKKwl9Cit9CisKK3N0YXRpYyBi
b29sIGtoYWRhc19tY3VfdmltNF9yZWdfd3JpdGVhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5z
aWduZWQgaW50IHJlZykKK3sKKwlzd2l0Y2ggKHJlZykgeworCWNhc2UgS0hBREFTX01DVV9WRVJT
SU9OXzBfUkVHOgorCWNhc2UgS0hBREFTX01DVV9WRVJTSU9OXzFfUkVHOgorCWNhc2UgS0hBREFT
X01DVV9TSFVURE9XTl9OT1JNQUxfU1RBVFVTX1JFRzoKKwkJcmV0dXJuIGZhbHNlOworCWRlZmF1
bHQ6CisJCXJldHVybiB0cnVlOworCX0KK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBf
Y29uZmlnIGtoYWRhc19tY3VfdmltNF9yZWdtYXBfY29uZmlnID0geworCS5yZWdfYml0cwk9IDgs
CisJLnJlZ19zdHJpZGUJPSAxLAorCS52YWxfYml0cwk9IDgsCisJLm1heF9yZWdpc3Rlcgk9IEtI
QURBU19NQ1VfVklNNF9TWVNfUlNUX1JFRywKKwkudm9sYXRpbGVfcmVnCT0ga2hhZGFzX21jdV92
aW00X3JlZ192b2xhdGlsZSwKKwkud3JpdGVhYmxlX3JlZwk9IGtoYWRhc19tY3VfdmltNF9yZWdf
d3JpdGVhYmxlLAorCS5jYWNoZV90eXBlCT0gUkVHQ0FDSEVfTUFQTEUsCit9OworCitzdGF0aWMg
Y29uc3Qgc3RydWN0IGtoYWRhc19tY3VfZmFuX3BkYXRhIGtoYWRhc192aW00X2Zhbl9wZGF0YSA9
IHsKKwkuZmFuX3JlZwk9IEtIQURBU19NQ1VfVklNNF9GQU5fQ1RSTF9SRUcsCisJLm1heF9sZXZl
bAk9IDB4NjQsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIGtoYWRhc19tY3Vf
dmltNF9jZWxsc1tdID0geworCXsKKwkJLm5hbWUJCT0gImtoYWRhcy1tY3UtZmFuLWN0cmwiLAor
CQkucGxhdGZvcm1fZGF0YQk9ICZraGFkYXNfdmltNF9mYW5fcGRhdGEsCisJCS5wZGF0YV9zaXpl
CT0gc2l6ZW9mKGtoYWRhc192aW00X2Zhbl9wZGF0YSksCisJfSwKK307CisKK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qga2hhZGFzX21jdV9kYXRhIGtoYWRhc192aW00X21jdV9kYXRhID0geworCS5yZWdt
YXBfY29uZmlnCT0gJmtoYWRhc19tY3VfdmltNF9yZWdtYXBfY29uZmlnLAorCS5jZWxscwkJPSBO
VUxMLAorCS5uY2VsbHMJCT0gMCwKKwkuZmFuX2NlbGxzCT0ga2hhZGFzX21jdV92aW00X2NlbGxz
LAorCS5uZmFuX2NlbGxzCT0gQVJSQVlfU0laRShraGFkYXNfbWN1X3ZpbTRfY2VsbHMpLAorfTsK
Kwogc3RhdGljIGludCBraGFkYXNfbWN1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQp
CiB7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2OwpAQCAtOTQsMjggKzE3MCwz
NSBAQCBzdGF0aWMgaW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCkKIAlpZiAoIWRkYXRhKQogCQlyZXR1cm4gLUVOT01FTTsKIAorCWRkYXRhLT5kYXRhID0gaTJj
X2dldF9tYXRjaF9kYXRhKGNsaWVudCk7CisJaWYgKCFkZGF0YS0+ZGF0YSkKKwkJcmV0dXJuIC1F
SU5WQUw7CisKIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBkZGF0YSk7CiAKIAlkZGF0YS0+
ZGV2ID0gZGV2OwogCi0JZGRhdGEtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVu
dCwgJmtoYWRhc19tY3VfcmVnbWFwX2NvbmZpZyk7CisJZGRhdGEtPnJlZ21hcCA9IGRldm1fcmVn
bWFwX2luaXRfaTJjKGNsaWVudCwKKwkJCQkJICAgICBkZGF0YS0+ZGF0YS0+cmVnbWFwX2NvbmZp
Zyk7CiAJaWYgKElTX0VSUihkZGF0YS0+cmVnbWFwKSkgewogCQlyZXQgPSBQVFJfRVJSKGRkYXRh
LT5yZWdtYXApOwogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhbGxvY2F0ZSByZWdpc3RlciBt
YXA6ICVkXG4iLCByZXQpOwogCQlyZXR1cm4gcmV0OwogCX0KIAotCXJldCA9IGRldm1fbWZkX2Fk
ZF9kZXZpY2VzKGRldiwgUExBVEZPUk1fREVWSURfTk9ORSwKLQkJCQkgICBraGFkYXNfbWN1X2Nl
bGxzLAotCQkJCSAgIEFSUkFZX1NJWkUoa2hhZGFzX21jdV9jZWxscyksCi0JCQkJICAgTlVMTCwg
MCwgTlVMTCk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwlpZiAoZGRhdGEtPmRhdGEtPmNl
bGxzICYmIGRkYXRhLT5kYXRhLT5uY2VsbHMpIHsKKwkJcmV0ID0gZGV2bV9tZmRfYWRkX2Rldmlj
ZXMoZGV2LCBQTEFURk9STV9ERVZJRF9OT05FLAorCQkJCQkgICBkZGF0YS0+ZGF0YS0+Y2VsbHMs
CisJCQkJCSAgIGRkYXRhLT5kYXRhLT5uY2VsbHMsCisJCQkJCSAgIE5VTEwsIDAsIE5VTEwpOwor
CQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CiAKIAlpZiAob2ZfcHJvcGVydHlfcHJlc2Vu
dChkZXYtPm9mX25vZGUsICIjY29vbGluZy1jZWxscyIpKQogCQlyZXR1cm4gZGV2bV9tZmRfYWRk
X2RldmljZXMoZGV2LCBQTEFURk9STV9ERVZJRF9OT05FLAotCQkJCQkgICAga2hhZGFzX21jdV9m
YW5fY2VsbHMsCi0JCQkJCSAgICBBUlJBWV9TSVpFKGtoYWRhc19tY3VfZmFuX2NlbGxzKSwKKwkJ
CQkJICAgIGRkYXRhLT5kYXRhLT5mYW5fY2VsbHMsCisJCQkJCSAgICBkZGF0YS0+ZGF0YS0+bmZh
bl9jZWxscywKIAkJCQkJICAgIE5VTEwsIDAsIE5VTEwpOwogCiAJcmV0dXJuIDA7CkBAIC0xMjMs
NyArMjA2LDggQEAgc3RhdGljIGludCBraGFkYXNfbWN1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQpCiAKICNpZmRlZiBDT05GSUdfT0YKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGtoYWRhc19tY3Vfb2ZfbWF0Y2hbXSA9IHsKLQl7IC5jb21wYXRpYmxlID0gImtoYWRh
cyxtY3UiLCB9LAorCXsgLmNvbXBhdGlibGUgPSAia2hhZGFzLG1jdSIsIC5kYXRhID0gJmtoYWRh
c19tY3VfZGF0YSB9LAorCXsgLmNvbXBhdGlibGUgPSAia2hhZGFzLHZpbTQtbWN1IiwgLmRhdGEg
PSAma2hhZGFzX3ZpbTRfbWN1X2RhdGEgfSwKIAl7fSwKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxF
KG9mLCBraGFkYXNfbWN1X29mX21hdGNoKTsKCi0tIAoyLjQ5LjAKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
