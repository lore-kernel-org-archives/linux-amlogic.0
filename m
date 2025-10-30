Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A07CCCF9F8
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 05:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eV3tLVSdyr/ka1WdCuRhGk4ksBjhtYVI5V9BD3m/eOY=; b=ujDDdxcyA2kClO
	23Pj/lYYkiQZjN60pST3jCJzpGjvA1ZD8/46hby4l4pLEUyxKkxzjMOqidv7fTmHzhv5sc3Dh6eAh
	42e5Yw1avo6TBEAM6GY3ym7RsRC5m6dXO5lUCtvbc6OE7RJ1j44FmLxKnAeaJ+/3D5xpNC1RQON7P
	LAbDz9NVclkj7BRcY+iYav7WbEGxjzZTT8Rwlac/rHkeI7CJgypHFRDdAJwntBIBte4HAa5FgxRCJ
	9utySMk9YeT/fW5hHKcukNGnm4ltX02dJzaIUbfFY6WqpBjC+jXfXLVbTRrzvDybOI9PoOaxGC7MD
	kUMMee/Zy+atZWTJgpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL9H-00000003V3A-3M5q;
	Thu, 30 Oct 2025 05:24:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL93-00000003Uvf-2W4X;
	Thu, 30 Oct 2025 05:24:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4916944953;
	Thu, 30 Oct 2025 05:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7FC5C116D0;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761801857;
	bh=ITtznf4V3PEOG09w+PdAv94v0LkRnn8G5sFFZCmhyck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZVSYNWZPkLnDYVbMBDi9vqQ7BEnDOH5Xdx1ZOQaQln6Nu62mSuMvbRO1LuGPraB8E
	 bhV8LVHREktlWtCPSAyukwhAQ48l0W8txy7SqyOSkf84xTn8EH3qBGYaq9m4WlO22W
	 9HS/mzufrkEdWTX4JtrJ3T8FC1eqe2uXty/T4P5OSvo8tlnzN3X9SwxJm0bbiNCI4M
	 oDHBhF78/5UnaJV4emf/FCMimW87bhsj24rQTjUEpkWgt7MvaKtaNnXUnTbfXHvkSU
	 PAODCMtoFvaTG14g74vpbuBYBCO7tT/udVPAKKx0XfAbdn9YCWZuNdJzPqNRsMMIoZ
	 27wFX4Ox0TFSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD02FCCF9F9;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 30 Oct 2025 13:24:14 +0800
Subject: [PATCH v2 4/5] clk: amlogic: Optimize PLL enable timing
MIME-Version: 1.0
Message-Id: <20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
In-Reply-To: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>, da@libre.computer
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761801855; l=2564;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=DjnEanujLZY4RuGc42rl8hj7g33ffwSvffDuoLJcxso=;
 b=sTga/WVc91PpMaP5RpP+aJzcq1fHbdkptD2tzxJ/anIj6LHmeSDy9p2tUGqkohJmzO2ldf8Bk
 OsA0vBqz2nqDsOLShEcZFUKNQw3jhmY3tuftag8o15yNCYsVdSJ+jvT
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_222421_700483_A297F442 
X-CRM114-Status: GOOD (  14.35  )
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

RnJvbTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+CgpsX2RldGVjdCBjb250cm9s
cyB0aGUgZW5hYmxlbWVudCBvZiB0aGUgUExMIGxvY2sgZGV0ZWN0aW9uIG1vZHVsZS4KSXQgc2hv
dWxkIHJlbWFpbiBkaXNhYmxlZCB3aGlsZSB0aGUgaW50ZXJuYWwgUExMIGNpcmN1aXRzIGFyZQpy
ZWFjaGluZyBhIHN0ZWFkeSBzdGF0ZTsgb3RoZXJ3aXNlLCB0aGUgbG9jayBzaWduYWwgbWF5IGJl
IGZhbHNlbHkKdHJpZ2dlcmVkIGhpZ2guCgpCZWZvcmUgZW5hYmxpbmcgdGhlIGludGVybmFsIHBv
d2VyIHN1cHBseSBvZiB0aGUgUExMLCBsX2RldGVjdCBzaG91bGQKYmUgZGlzYWJsZWQuIEFmdGVy
IHRoZSBQTEzigJlzIGludGVybmFsIGNpcmN1aXRzIGhhdmUgc3RhYmlsaXplZCwKbF9kZXRlY3Qg
c2hvdWxkIGJlIGVuYWJsZWQgdG8gcHJldmVudCBmYWxzZSBsb2NrIHNpZ25hbCB0cmlnZ2Vycy4K
CkN1cnJlbnRseSwgb25seSBBMSBzdXBwb3J0cyBib3RoIGxfZGV0ZWN0IGFuZCBjdXJyZW50X2Vu
LCBzbyB0aGlzCnBhdGNoIHdpbGwgb25seSBhZmZlY3QgQTEuCgpTaWduZWQtb2ZmLWJ5OiBDaHVh
biBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9tZXNvbi9jbGst
cGxsLmMgfCAyOCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvbWVzb24vY2xrLXBsbC5jIGIvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jCmluZGV4IDZj
Nzk0YWRiOGNjZC4uYzZlZWJkZTFmNTE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9j
bGstcGxsLmMKKysrIGIvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jCkBAIC0zODMsMzYgKzM4
MywzOCBAQCBzdGF0aWMgaW50IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3
KQogCWlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+cnN0KSkKIAkJbWVzb25fcGFybV93
cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAxKTsKIAorCS8qIERpc2FibGUgdGhlIFBMTCBsb2Nr
LWRldGVjdCBtb2R1bGUgKi8KKwlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmxfZGV0
ZWN0KSkKKwkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDEpOwor
CiAJLyogRW5hYmxlIHRoZSBwbGwgKi8KIAltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxs
LT5lbiwgMSk7CiAJLyogV2FpdCBmb3IgQmFuZGdhcCBhbmQgTERPIHRvIHBvd2VyIHVwIGFuZCBz
dGFiaWxpemUgKi8KIAl1ZGVsYXkoMjApOwogCi0JLyogVGFrZSB0aGUgcGxsIG91dCByZXNldCAq
LwotCWlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+cnN0KSkKLQkJbWVzb25fcGFybV93
cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAwKTsKLQotCS8qIFdhaXQgZm9yIFBMTCBsb29wIHN0
YWJpbGl6YXRpb24gKi8KLQl1ZGVsYXkoMjApOwotCiAJLyoKIAkgKiBDb21wYXJlZCB3aXRoIHRo
ZSBwcmV2aW91cyBTb0NzLCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQgbW9kdWxlCiAJICogaXMgbmV3
bHkgYWRkZWQgZm9yIEExLCBrZWVwIHRoZSBuZXcgcG93ZXItb24gc2VxdWVuY2UgdG8gZW5hYmxl
IHRoZQogCSAqIFBMTC4gVGhlIHNlcXVlbmNlIGlzOgotCSAqIDEuIGVuYWJsZSB0aGUgcGxsLCBk
ZWxheSBmb3IgMTB1cworCSAqIDEuIGVuYWJsZSB0aGUgcGxsLCBkZWxheSBmb3IgMjB1cwogCSAq
IDIuIGVuYWJsZSB0aGUgcGxsIHNlbGYtYWRhcHRpb24gY3VycmVudCBtb2R1bGUsIGRlbGF5IGZv
ciA0MHVzCiAJICogMy4gZW5hYmxlIHRoZSBsb2NrIGRldGVjdCBtb2R1bGUKIAkgKi8KIAlpZiAo
TUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmN1cnJlbnRfZW4pKSB7Ci0JCXVkZWxheSgxMCk7
CiAJCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmN1cnJlbnRfZW4sIDEpOwotCQl1
ZGVsYXkoNDApOworCQl1ZGVsYXkoMjApOwogCX0KIAotCWlmIChNRVNPTl9QQVJNX0FQUExJQ0FC
TEUoJnBsbC0+bF9kZXRlY3QpKSB7Ci0JCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwt
PmxfZGV0ZWN0LCAxKTsKKwkvKiBUYWtlIHRoZSBwbGwgb3V0IHJlc2V0ICovCisJaWYgKE1FU09O
X1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQorCQltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFw
LCAmcGxsLT5yc3QsIDApOworCisJLyogV2FpdCBmb3IgUExMIGxvb3Agc3RhYmlsaXphdGlvbiAq
LworCXVkZWxheSgyMCk7CisKKwkvKiBFbmFibGUgdGhlIGxvY2stZGV0ZWN0IG1vZHVsZSAqLwor
CWlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKQogCQltZXNvbl9wYXJt
X3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMCk7Ci0JfQogCiAJaWYgKG1lc29uX2Ns
a19wbGxfd2FpdF9sb2NrKGh3KSkgewogCQkvKiBkaXNhYmxlIFBMTCB3aGVuIFBMTCBsb2NrIGZh
aWxlZC4gKi8KCi0tIAoyLjQyLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
