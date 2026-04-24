Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05209FED3D8
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmHkgzkXXFGns+LvyjQe0M1uQRlYCWbNY+AE7EMHUoI=; b=3ic63Th/IcrWWc
	pFgEaINEao0teaV2ksVa4JxS61YoUOUPyxx70EwSTGuG4TCIMlRHtpPz7A3VRk3R/v3L23+Y1jISj
	UDXycHC8TCyqf2vK+BwyclIknGF5tOKJi630uIhS+H1f/Gn8QOkbBDF6fLbJbsdFHrrz45NdfRRvV
	TokWfzXzBdISvqBzk/f7rKeC2Z+sLrSmFlleha4A2Ng7vujM/QGuCEm2hbNfswO21rRlY0G9+aRYn
	82gTLIWRTaNEotdHHfF4tkAHeub+NlgwNcfy0EMb0uYBCExtzQ1JP21912NrbShe40AAVs32IRyV6
	1ZqTFBcFfFn3/ufTtX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHOF-0000000DJFl-3p0S;
	Fri, 24 Apr 2026 14:20:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHO7-0000000DJ5B-0FW0;
	Fri, 24 Apr 2026 14:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66961446C7;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16AC9C2BCC9;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777040410;
	bh=2gEhgE6eM8dxMcqF24Eax09Dv0dPGF6ZpfZqtWdTtl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X7xLkVjgoJS0orljQNUUQlFj/pNakk4EsVho8fpjoXH3TiOaLfH2c2/vfhuX66a4G
	 QI9t4+sfzcENez3/u0u55SnHvn+l7MqjlTh+l+T2VnS1s/P3RPoOUCUC2RvfBYFBpF
	 PLH+Y+xsT6xcxjFpnwCEyHRCixZUUeiMh5wXeCI/Qyq0GOCU1YYT1PCZDUiSwbLIXx
	 R8Xxc0mgKMfCgVh8Pj6GMYaIDdw5whA66Oik5Xg5Zii8Trtf4Rux2kNX2hNLLFg6k0
	 qHBW8jKA4CJM789FCZkOqHckWWEBnPlwrQEEbxtlSEvRlfoayA7plEBI/k9gXgDwqA
	 M7SMJA7xcHuTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E821FED3D4;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 24 Apr 2026 16:17:35 +0200
Subject: [PATCH v5 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
MIME-Version: 1.0
Message-Id: <20260424-add-mcu-fan-khadas-vim4-v5-4-afcfa7157b23@aliel.fr>
References: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
In-Reply-To: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5119;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=6yBuoANmof/0UzpsxBYYuaeY9Bsvyi5B4REa1sHSYxE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+brGiEGjlcJ5mcEFJzDdlhKphc+C99t+dgkbIdHi/vHF
 kaDjbc7SlkYxLgYZMUUWfrnWp54d/noma971FNg5rAygQ3h4hSAiXAkMPxiFi2euPrRJPupkeUm
 je/6JHjVVF9vzzv89oPR6SSdme1WjAwbHSvn6+nNNLwYGVtyQfq5GKdtvlvJVJcKLodUo+id1zg
 A
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_072011_185104_1246CA43 
X-CRM114-Status: GOOD (  13.97  )
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
IGNvbXBhdGlibGUgc3RyaW5nICJraGFkYXMsdmltNC1tY3UiLgoKUmV2aWV3ZWQtYnk6IE5laWwg
QXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb25h
bGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KLS0tCiBkcml2ZXJzL21mZC9r
aGFkYXMtbWN1LmMgfCAxMDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9raGFkYXMtbWN1LmMgYi9kcml2ZXJzL21mZC9r
aGFkYXMtbWN1LmMKaW5kZXggYmE5ODFhNzg4NjkyMS4uYjM2YjNiM2FiNzNjMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jCisrKyBiL2RyaXZlcnMvbWZkL2toYWRhcy1tY3Uu
YwpAQCAtNzUsMTUgKzc1LDkxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBr
aGFkYXNfbWN1X3JlZ21hcF9jb25maWcgPSB7CiAJLmNhY2hlX3R5cGUJPSBSRUdDQUNIRV9NQVBM
RSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga2hhZGFzX21jdV9mYW5fcGRhdGEga2hhZGFz
X21jdV9mYW5fcGRhdGEgPSB7CisJLmZhbl9yZWcJPSBLSEFEQVNfTUNVX0NNRF9GQU5fU1RBVFVT
X0NUUkxfUkVHLAorCS5tYXhfbGV2ZWwJPSAzLAorfTsKKwogc3RhdGljIHN0cnVjdCBtZmRfY2Vs
bCBraGFkYXNfbWN1X2Zhbl9jZWxsc1tdID0gewogCS8qIFZJTTEvMiBSZXYxMysgYW5kIFZJTTMg
b25seSAqLwotCXsgLm5hbWUgPSAia2hhZGFzLW1jdS1mYW4tY3RybCIsIH0sCisJeworCQkubmFt
ZSA9ICJraGFkYXMtbWN1LWZhbi1jdHJsIiwKKwkJLnBsYXRmb3JtX2RhdGEgPSAma2hhZGFzX21j
dV9mYW5fcGRhdGEsCisJCS5wZGF0YV9zaXplICAgID0gc2l6ZW9mKGtoYWRhc19tY3VfZmFuX3Bk
YXRhKSwKKwl9LAogfTsKIAogc3RhdGljIHN0cnVjdCBtZmRfY2VsbCBraGFkYXNfbWN1X2NlbGxz
W10gPSB7CiAJeyAubmFtZSA9ICJraGFkYXMtbWN1LXVzZXItbWVtIiwgfSwKIH07CiAKK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qga2hhZGFzX21jdV9kYXRhIGtoYWRhc19tY3VfZGF0YSA9IHsKKwkucmVn
bWFwX2NvbmZpZwk9ICZraGFkYXNfbWN1X3JlZ21hcF9jb25maWcsCisJLmNlbGxzCQk9IGtoYWRh
c19tY3VfY2VsbHMsCisJLm5jZWxscwkJPSBBUlJBWV9TSVpFKGtoYWRhc19tY3VfY2VsbHMpLAor
CS5mYW5fY2VsbHMJPSBraGFkYXNfbWN1X2Zhbl9jZWxscywKKwkubmZhbl9jZWxscwk9IEFSUkFZ
X1NJWkUoa2hhZGFzX21jdV9mYW5fY2VsbHMpLAorfTsKKworc3RhdGljIGJvb2wga2hhZGFzX21j
dV92aW00X3JlZ192b2xhdGlsZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCByZWcp
Cit7CisJc3dpdGNoIChyZWcpIHsKKwljYXNlIEtIQURBU19NQ1VfUFdSX09GRl9DTURfUkVHOgor
CWNhc2UgS0hBREFTX01DVV9WSU00X1JFU1RfQ09ORl9SRUc6CisJY2FzZSBLSEFEQVNfTUNVX1dP
TF9JTklUX1NUQVJUX1JFRzoKKwljYXNlIEtIQURBU19NQ1VfVklNNF9MRURfT05fUkFNX1JFRzoK
KwljYXNlIEtIQURBU19NQ1VfVklNNF9GQU5fQ1RSTF9SRUc6CisJY2FzZSBLSEFEQVNfTUNVX1ZJ
TTRfV0RUX0VOX1JFRzoKKwljYXNlIEtIQURBU19NQ1VfVklNNF9TWVNfUlNUX1JFRzoKKwkJcmV0
dXJuIHRydWU7CisJZGVmYXVsdDoKKwkJcmV0dXJuIGZhbHNlOworCX0KK30KKworc3RhdGljIGJv
b2wga2hhZGFzX21jdV92aW00X3JlZ193cml0ZWFibGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNp
Z25lZCBpbnQgcmVnKQoreworCXN3aXRjaCAocmVnKSB7CisJY2FzZSBLSEFEQVNfTUNVX1ZFUlNJ
T05fMF9SRUc6CisJY2FzZSBLSEFEQVNfTUNVX1ZFUlNJT05fMV9SRUc6CisJY2FzZSBLSEFEQVNf
TUNVX1NIVVRET1dOX05PUk1BTF9TVEFUVVNfUkVHOgorCQlyZXR1cm4gZmFsc2U7CisJZGVmYXVs
dDoKKwkJcmV0dXJuIHRydWU7CisJfQorfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9j
b25maWcga2hhZGFzX21jdV92aW00X3JlZ21hcF9jb25maWcgPSB7CisJLnJlZ19iaXRzCT0gOCwK
KwkucmVnX3N0cmlkZQk9IDEsCisJLnZhbF9iaXRzCT0gOCwKKwkubWF4X3JlZ2lzdGVyCT0gS0hB
REFTX01DVV9WSU00X1NZU19SU1RfUkVHLAorCS52b2xhdGlsZV9yZWcJPSBraGFkYXNfbWN1X3Zp
bTRfcmVnX3ZvbGF0aWxlLAorCS53cml0ZWFibGVfcmVnCT0ga2hhZGFzX21jdV92aW00X3JlZ193
cml0ZWFibGUsCisJLmNhY2hlX3R5cGUJPSBSRUdDQUNIRV9NQVBMRSwKK307CisKK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qga2hhZGFzX21jdV9mYW5fcGRhdGEga2hhZGFzX3ZpbTRfZmFuX3BkYXRhID0g
eworCS5mYW5fcmVnCT0gS0hBREFTX01DVV9WSU00X0ZBTl9DVFJMX1JFRywKKwkubWF4X2xldmVs
CT0gMHg2NCwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2NlbGwga2hhZGFzX21jdV92
aW00X2NlbGxzW10gPSB7CisJeworCQkubmFtZQkJPSAia2hhZGFzLW1jdS1mYW4tY3RybCIsCisJ
CS5wbGF0Zm9ybV9kYXRhCT0gJmtoYWRhc192aW00X2Zhbl9wZGF0YSwKKwkJLnBkYXRhX3NpemUJ
PSBzaXplb2Yoa2hhZGFzX3ZpbTRfZmFuX3BkYXRhKSwKKwl9LAorfTsKKworc3RhdGljIGNvbnN0
IHN0cnVjdCBraGFkYXNfbWN1X2RhdGEga2hhZGFzX3ZpbTRfbWN1X2RhdGEgPSB7CisJLnJlZ21h
cF9jb25maWcJPSAma2hhZGFzX21jdV92aW00X3JlZ21hcF9jb25maWcsCisJLmNlbGxzCQk9IE5V
TEwsCisJLm5jZWxscwkJPSAwLAorCS5mYW5fY2VsbHMJPSBraGFkYXNfbWN1X3ZpbTRfY2VsbHMs
CisJLm5mYW5fY2VsbHMJPSBBUlJBWV9TSVpFKGtoYWRhc19tY3VfdmltNF9jZWxscyksCit9Owor
CiBzdGF0aWMgaW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkK
IHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7CkBAIC05NCwyOCArMTcwLDM1
IEBAIHN0YXRpYyBpbnQga2hhZGFzX21jdV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
KQogCWlmICghZGRhdGEpCiAJCXJldHVybiAtRU5PTUVNOwogCisJZGRhdGEtPmRhdGEgPSBpMmNf
Z2V0X21hdGNoX2RhdGEoY2xpZW50KTsKKwlpZiAoIWRkYXRhLT5kYXRhKQorCQlyZXR1cm4gLUVJ
TlZBTDsKKwogCWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQsIGRkYXRhKTsKIAogCWRkYXRhLT5k
ZXYgPSBkZXY7CiAKLQlkZGF0YS0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50
LCAma2hhZGFzX21jdV9yZWdtYXBfY29uZmlnKTsKKwlkZGF0YS0+cmVnbWFwID0gZGV2bV9yZWdt
YXBfaW5pdF9pMmMoY2xpZW50LAorCQkJCQkgICAgIGRkYXRhLT5kYXRhLT5yZWdtYXBfY29uZmln
KTsKIAlpZiAoSVNfRVJSKGRkYXRhLT5yZWdtYXApKSB7CiAJCXJldCA9IFBUUl9FUlIoZGRhdGEt
PnJlZ21hcCk7CiAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIHJlZ2lzdGVyIG1h
cDogJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmV0ID0gZGV2bV9tZmRfYWRk
X2RldmljZXMoZGV2LCBQTEFURk9STV9ERVZJRF9OT05FLAotCQkJCSAgIGtoYWRhc19tY3VfY2Vs
bHMsCi0JCQkJICAgQVJSQVlfU0laRShraGFkYXNfbWN1X2NlbGxzKSwKLQkJCQkgICBOVUxMLCAw
LCBOVUxMKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCWlmIChkZGF0YS0+ZGF0YS0+Y2Vs
bHMgJiYgZGRhdGEtPmRhdGEtPm5jZWxscykgeworCQlyZXQgPSBkZXZtX21mZF9hZGRfZGV2aWNl
cyhkZXYsIFBMQVRGT1JNX0RFVklEX05PTkUsCisJCQkJCSAgIGRkYXRhLT5kYXRhLT5jZWxscywK
KwkJCQkJICAgZGRhdGEtPmRhdGEtPm5jZWxscywKKwkJCQkJICAgTlVMTCwgMCwgTlVMTCk7CisJ
CWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KIAogCWlmIChvZl9wcm9wZXJ0eV9wcmVzZW50
KGRldi0+b2Zfbm9kZSwgIiNjb29saW5nLWNlbGxzIikpCiAJCXJldHVybiBkZXZtX21mZF9hZGRf
ZGV2aWNlcyhkZXYsIFBMQVRGT1JNX0RFVklEX05PTkUsCi0JCQkJCSAgICBraGFkYXNfbWN1X2Zh
bl9jZWxscywKLQkJCQkJICAgIEFSUkFZX1NJWkUoa2hhZGFzX21jdV9mYW5fY2VsbHMpLAorCQkJ
CQkgICAgZGRhdGEtPmRhdGEtPmZhbl9jZWxscywKKwkJCQkJICAgIGRkYXRhLT5kYXRhLT5uZmFu
X2NlbGxzLAogCQkJCQkgICAgTlVMTCwgMCwgTlVMTCk7CiAKIAlyZXR1cm4gMDsKQEAgLTEyMyw3
ICsyMDYsOCBAQCBzdGF0aWMgaW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCkKIAogI2lmZGVmIENPTkZJR19PRgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQga2hhZGFzX21jdV9vZl9tYXRjaFtdID0gewotCXsgLmNvbXBhdGlibGUgPSAia2hhZGFz
LG1jdSIsIH0sCisJeyAuY29tcGF0aWJsZSA9ICJraGFkYXMsbWN1IiwgLmRhdGEgPSAma2hhZGFz
X21jdV9kYXRhIH0sCisJeyAuY29tcGF0aWJsZSA9ICJraGFkYXMsdmltNC1tY3UiLCAuZGF0YSA9
ICZraGFkYXNfdmltNF9tY3VfZGF0YSB9LAogCXt9LAogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIGtoYWRhc19tY3Vfb2ZfbWF0Y2gpOwoKLS0gCjIuNDkuMAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
