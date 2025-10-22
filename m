Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4225CCCD1BE
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Oct 2025 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qr8q7sBIgDrOiflMG3+ThLTj9c0ARFAZTLpRf/V/7U8=; b=yYGUSqYMfA3/E8
	hofaB+FYcdLBB5qG8g2iiBI+RPermP1RipxvzlUJtqUSivfx2MnqqmsfW4lhmxbbYFhfJAeJ05KnZ
	Rgi+zyBG+g8Klu5qbrQALeb6TGbvGdqChFk6gv7wCS5+aTyhMy7/9lyTupljLD7zA1d5lFV1PNg50
	fL/ggoo6IvoksEHy16xKHfkJo1KmIh1299UouF6NwybuOVN1obd35VFsfGR6Xaiw8b8HrnX43iRt5
	4T9L0TwKxnljtLtuugPEebF+vhEBOzC25mvJ7grGb+GaHELUtrG2GqlshX+UCcK3NoDkK73DQsww1
	+fzNgi+TrDKSxgf3Pr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoQ-00000001lEV-2VS7;
	Wed, 22 Oct 2025 06:59:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoJ-00000001l8q-1GTp;
	Wed, 22 Oct 2025 06:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0FB6490FD;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ACB6C113D0;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761116342;
	bh=tNpHlIQUBTD9AQUIV9HOebg+Mv18j60jJ2qTKmd3Clc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f1fLx0DeQTCDXFzWn9RNlHFljJGeP+4/aI4o4AbDw3WEYh9/dZChmaImw4Avn3otF
	 Tu09h3sQ00nFFvTc95+87SwvpKOq65UPG1MM/SH1ZwSqf9mYhujhYECftsAI7XLHmM
	 6+PGGSlVeew2zF33q8xTkqWM95445oQxTB4cQVXUYhgYxXtkRzxQTd56moc/X4jic4
	 +/w97Cw2AHUS4YxWB5sOKMDkafgw48224tYobLD7AVEFK1oBSi/f+Axq0i9ECovy0w
	 KBUN3oJRQZd9g0WJbqzgX8twg8BGvliyDmJxkqulFyjAHXVPf3I20mFcZCqN0Lk6+e
	 TRWveLQqWyDVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E48DCCD1BE;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Wed, 22 Oct 2025 14:58:52 +0800
Subject: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
MIME-Version: 1.0
Message-Id: <20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
In-Reply-To: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761116340; l=4402;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=bsdTchbiRzU7fQnKSjIW161Jtz+ZayPt5sUS3k0V7QU=;
 b=AEy5PXpFUMdDMXW6q9jCnGv15v8j0xAtKltUNJgWlUAFVhON3sKl2AoUsoePKRadfRMVcNgjv
 Qj49HwbWa0bDBPIE1TIVUT3cZvV2sp/7ONf6SARkAIpNAB4XiYubxvF
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_235903_400161_BA1DCA73 
X-CRM114-Status: GOOD (  16.01  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+CgpBbWxvZ2ljIFBMTCBsb2Nr
aW5nIHByb2NlZHVyZSBzaGFsbCBmb2xsb3cgdGhpcyB0aW1pbmcgc2VxdWVuY2U6CjEgQXNzZXJ0
IHJlc2V0IHNpZ25hbDogRW5zdXJlcyBQTEwgY2lyY3VpdHMgZW50ZXIga25vd24gaW5pdGlhbCBz
dGF0ZS4KMiBEZWFzc2VydCBsb2NrLWRldGVjdCBzaWduYWw6IEF2b2lkIGxvY2sgc2lnbmFsIGZh
bHNlIHRyaWdnZXJpbmcuCjMgQXNzZXJ0IGVuYWJsZSBzaWduYWw6IFBvd2VycyB1cCBQTEwgc3Vw
cGx5Lgo0IHVkZWxheSgyMCk6IFdhaXQgZm9yIEJhbmRnYXAgYW5kIExETyB0byBwb3dlciB1cCBh
bmQgc3RhYmlsaXplLgo1IEVuYWJsZSBzZWxmLWFkYXB0YXRpb24gY3VycmVudCBtb2R1bGUgKE9w
dGlvbmFsKS4KNiBEZWFzc2VydCByZXNldCBzaWduYWw6IFJlbGVhc2VzIFBMTCB0byBiZWdpbiBu
b3JtYWwgb3BlcmF0aW9uLgo3IHVkZWxheSgyMCk6IFdhaXQgZm9yIFBMTCBsb29wIHN0YWJpbGl6
YXRpb24uCjggQXNzZXJ0IGxvY2stZGV0ZWN0IHNpZ25hbDogbG9jayBkZXRlY3Rpb24gY2lyY3Vp
dCBzdGFydHMgdG8gd29yay4KOSBNb25pdG9yIGxvY2sgc3RhdHVzIHNpZ25hbDogV2FpdCBmb3Ig
UExMIGxvY2sgY29tcGxldGlvbi4KMTAgSWYgdGhlIFBMTCBmYWlscyB0byBsb2NrLCBpdCBzaG91
bGQgYmUgZGlzYWJsZWQsIFRoaXMgbWFrZXMgdGhlCmxvZ2ljIG1vcmUgY29tcGxldGUsIGFuZCBh
bHNvIGhlbHBzIHNhdmUgdW5uZWNlc3NhcnkgcG93ZXIgY29uc3VtcHRpb24Kd2hlbiB0aGUgUExM
IGlzIG1hbGZ1bmN0aW9uaW5nLgoKU2lnbmVkLW9mZi1ieTogQ2h1YW4gTGl1IDxjaHVhbi5saXVA
YW1sb2dpYy5jb20+Ci0tLQogZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jIHwgNjggKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NDAgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvbWVzb24vY2xrLXBsbC5jIGIvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jCmluZGV4IGIw
N2UxZWIxOWQxMi4uMjZjODNkYjQ4N2U4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9j
bGstcGxsLmMKKysrIGIvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jCkBAIC0zNTMsNiArMzUz
LDIzIEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BjaWVfcGxsX2VuYWJsZShzdHJ1Y3QgY2xrX2h3
ICpodykKIAlyZXR1cm4gLUVJTzsKIH0KIAorc3RhdGljIHZvaWQgbWVzb25fY2xrX3BsbF9kaXNh
YmxlKHN0cnVjdCBjbGtfaHcgKmh3KQoreworCXN0cnVjdCBjbGtfcmVnbWFwICpjbGsgPSB0b19j
bGtfcmVnbWFwKGh3KTsKKwlzdHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhICpwbGwgPSBtZXNvbl9j
bGtfcGxsX2RhdGEoY2xrKTsKKworCS8qIFB1dCB0aGUgcGxsIGlzIGluIHJlc2V0ICovCisJaWYg
KE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQorCQltZXNvbl9wYXJtX3dyaXRlKGNs
ay0+bWFwLCAmcGxsLT5yc3QsIDEpOworCisJLyogRGlzYWJsZSB0aGUgcGxsICovCisJbWVzb25f
cGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDApOworCisJLyogRGlzYWJsZSBQTEwgaW50
ZXJuYWwgc2VsZi1hZGFwdGlvbiBjdXJyZW50IG1vZHVsZSAqLworCWlmIChNRVNPTl9QQVJNX0FQ
UExJQ0FCTEUoJnBsbC0+Y3VycmVudF9lbikpCisJCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAs
ICZwbGwtPmN1cnJlbnRfZW4sIDApOworfQorCiBzdGF0aWMgaW50IG1lc29uX2Nsa19wbGxfZW5h
YmxlKHN0cnVjdCBjbGtfaHcgKmh3KQogewogCXN0cnVjdCBjbGtfcmVnbWFwICpjbGsgPSB0b19j
bGtfcmVnbWFwKGh3KTsKQEAgLTM2Niw1MyArMzgzLDQ4IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xr
X3BsbF9lbmFibGUoc3RydWN0IGNsa19odyAqaHcpCiAJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJM
RSgmcGxsLT5yc3QpKQogCQltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5yc3QsIDEp
OwogCisJLyogRGlzYWJsZSB0aGUgUExMIGxvY2stZGV0ZWN0IG1vZHVsZSAqLworCWlmIChNRVNP
Tl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKQorCQltZXNvbl9wYXJtX3dyaXRlKGNs
ay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMSk7CisKIAkvKiBFbmFibGUgdGhlIHBsbCAqLwogCW1l
c29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmVuLCAxKTsKLQotCS8qIFRha2UgdGhlIHBs
bCBvdXQgcmVzZXQgKi8KLQlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkpCi0J
CW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMCk7CisJLyogV2FpdCBmb3Ig
QmFuZGdhcCBhbmQgTERPIHRvIHBvd2VyIHVwIGFuZCBzdGFiaWxpemUgKi8KKwl1ZGVsYXkoMjAp
OwogCiAJLyoKIAkgKiBDb21wYXJlZCB3aXRoIHRoZSBwcmV2aW91cyBTb0NzLCBzZWxmLWFkYXB0
aW9uIGN1cnJlbnQgbW9kdWxlCiAJICogaXMgbmV3bHkgYWRkZWQgZm9yIEExLCBrZWVwIHRoZSBu
ZXcgcG93ZXItb24gc2VxdWVuY2UgdG8gZW5hYmxlIHRoZQogCSAqIFBMTC4gVGhlIHNlcXVlbmNl
IGlzOgotCSAqIDEuIGVuYWJsZSB0aGUgcGxsLCBkZWxheSBmb3IgMTB1cworCSAqIDEuIGVuYWJs
ZSB0aGUgcGxsLCBlbnN1cmUgYSBtaW5pbXVtIGRlbGF5IG9mIDEwzrxzCiAJICogMi4gZW5hYmxl
IHRoZSBwbGwgc2VsZi1hZGFwdGlvbiBjdXJyZW50IG1vZHVsZSwgZGVsYXkgZm9yIDQwdXMKIAkg
KiAzLiBlbmFibGUgdGhlIGxvY2sgZGV0ZWN0IG1vZHVsZQogCSAqLwogCWlmIChNRVNPTl9QQVJN
X0FQUExJQ0FCTEUoJnBsbC0+Y3VycmVudF9lbikpIHsKLQkJdWRlbGF5KDEwKTsKIAkJbWVzb25f
cGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMSk7Ci0JCXVkZWxheSg0MCk7
Ci0JfQotCi0JaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpIHsKLQkJ
bWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDEpOwotCQltZXNvbl9w
YXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMCk7CisJCXVkZWxheSgyMCk7CiAJ
fQogCi0JaWYgKG1lc29uX2Nsa19wbGxfd2FpdF9sb2NrKGh3KSkKLQkJcmV0dXJuIC1FSU87CisJ
LyogVGFrZSB0aGUgcGxsIG91dCByZXNldCAqLworCWlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUo
JnBsbC0+cnN0KSkKKwkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAwKTsK
IAotCXJldHVybiAwOwotfQorCS8qIFdhaXQgZm9yIFBMTCBsb29wIHN0YWJpbGl6YXRpb24gKi8K
Kwl1ZGVsYXkoMjApOwogCi1zdGF0aWMgdm9pZCBtZXNvbl9jbGtfcGxsX2Rpc2FibGUoc3RydWN0
IGNsa19odyAqaHcpCi17Ci0Jc3RydWN0IGNsa19yZWdtYXAgKmNsayA9IHRvX2Nsa19yZWdtYXAo
aHcpOwotCXN0cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEgKnBsbCA9IG1lc29uX2Nsa19wbGxfZGF0
YShjbGspOworCS8qIEVuYWJsZSB0aGUgbG9jay1kZXRlY3QgbW9kdWxlICovCisJaWYgKE1FU09O
X1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpCisJCW1lc29uX3Bhcm1fd3JpdGUoY2xr
LT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsKIAotCS8qIFB1dCB0aGUgcGxsIGlzIGluIHJlc2V0
ICovCi0JaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQotCQltZXNvbl9wYXJt
X3dyaXRlKGNsay0+bWFwLCAmcGxsLT5yc3QsIDEpOworCWlmIChtZXNvbl9jbGtfcGxsX3dhaXRf
bG9jayhodykpIHsKKwkJLyogZGlzYWJsZSBQTEwgd2hlbiBQTEwgbG9jayBmYWlsZWQuICovCisJ
CW1lc29uX2Nsa19wbGxfZGlzYWJsZShodyk7CisJCXByX3dhcm4oIiVzOiBQTEwgbG9jayBmYWls
ZWQhISFcbiIsIGNsa19od19nZXRfbmFtZShodykpOwogCi0JLyogRGlzYWJsZSB0aGUgcGxsICov
Ci0JbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDApOworCQlyZXR1cm4gLUVJ
TzsKKwl9CiAKLQkvKiBEaXNhYmxlIFBMTCBpbnRlcm5hbCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQg
bW9kdWxlICovCi0JaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5jdXJyZW50X2VuKSkK
LQkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMCk7CisJcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9zZXRfcmF0ZShzdHJ1Y3QgY2xr
X2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAoKLS0gCjIuNDIuMAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
