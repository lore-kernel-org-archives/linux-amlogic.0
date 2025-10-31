Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAF1CCF9FF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8H4GJXNbxZI+3d3QYzeW17F2tWOjNkSAoZlNFOkfOA=; b=t8iVAVKeqQjod9
	qqHRWK9ymliqfcdTMaImQqHSjOh3eQkZM+8/QiXqa8bQwjjzfTBnCVL8/lm8xeWEn8IoiwxOFq8fz
	gGW2FOltc042dQEesIIgcMLccE4FqoLlRPJThWkC+aSWxxOh1y+L9N1pNwQBGl95BMhZVYC9wMICU
	pl6LhAZ0lXpb9vxkzOJlzh4MX0otbcEyVoR0fBPp5QtOGy8f6ERdMoYv+5Od3Y6Jn5SseN/QrA3sl
	txlIr4q72x2syCLYIXGlIYx9LrVVBixzOqTMA983ZJMrbq6YhJ5fGwJd9MpnnwfiNqg4MoLzk8kYT
	Y7ZWrmrcSHEYMnzAKBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDW-00000005bgS-3PhP;
	Fri, 31 Oct 2025 08:10:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDR-00000005bep-15Pl;
	Fri, 31 Oct 2025 08:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45021612A4;
	Fri, 31 Oct 2025 08:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9AF6C19424;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898232;
	bh=6ESWC7weu+fkakS/P318zzkxwK20bhDH2SY7HZ3vBd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TA0APZqYRrCONMPdDPvTaxyKas30+zpO3qlC5h0QacSccmboZAZwOmgto7v+aINr0
	 RquKFP8xA1ZM4h0z6SJ8CaDXbEyDhB8nfvBsJTFCs4O/gvlv5MTS2fC0BCJS/H8TUm
	 8upEULcZZcKPynxXnmfgMD92mVO6+jyGkFsRfZ7aCIuFZGSSGpGUlkTYJHRGYoEZ0/
	 0K8YwZQF4J4kiqlhiO9iFiiL8j6FzUn7R3zoE8YmjSSiQDwHrh2qvYQMYM+CsKqPZT
	 fFursmhuoa7zdd7nUr7yXo3QbqaQZKFg91r9m8W/gZ/9qyQ3rYlZPOc/KywCo3snA+
	 NZFAGnBDl2k5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1091CCFA00;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 31 Oct 2025 16:10:11 +0800
Subject: [PATCH v3 4/4] clk: amlogic: Optimize PLL enable timing
MIME-Version: 1.0
Message-Id: <20251031-optimize_pll_driver-v3-4-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761898227; l=2090;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=3bVoQCKgnuZ/IY+cWp9z2timk+2eNG6PU6hMfKQ9QKc=;
 b=PaR4cC+nx1zlBGR24Xc20vUT2lEJgJbv9J7AWiZu9QbNIDq2BkxtlT0lPMVoKhLR7ofEt/Xpz
 XzFQVzImYksCF6+t+rElWpS5+OSqL/J/xLPNCqFmzWFOpoFoJvkbaTD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
IGZhbHNlbHkKdHJpZ2dlcmVkIGhpZ2guCgpBIDIwIHVzIGRlbGF5IGhhcyBiZWVuIGFkZGVkIGJl
Zm9yZSBlbmFibGluZyB0aGUgUExMLCBzbyB0aGVyZeKAmXMgbm8KbmVlZCBmb3IgYW4gYWRkaXRp
b25hbCAxMCB1cyBkZWxheSBiZWZvcmUgZW5hYmxpbmcgY3VycmVudF9lbi4KCkN1cnJlbnRseSwg
b25seSBBMSBzdXBwb3J0cyBib3RoIGxfZGV0ZWN0IGFuZCBjdXJyZW50X2VuLCBzbyB0aGlzCnBh
dGNoIHdpbGwgb25seSBhZmZlY3QgQTEuCgpTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFu
LmxpdUBhbWxvZ2ljLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgfCAxMiAr
KysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jIGIvZHJpdmVycy9j
bGsvbWVzb24vY2xrLXBsbC5jCmluZGV4IGNkYjM5YTcyM2JkMC4uYzliOTQxYWRmNjg4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKKysrIGIvZHJpdmVycy9jbGsvbWVz
b24vY2xrLXBsbC5jCkBAIC0zODMsNiArMzgzLDEwIEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX3Bs
bF9lbmFibGUoc3RydWN0IGNsa19odyAqaHcpCiAJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgm
cGxsLT5yc3QpKQogCQltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5yc3QsIDEpOwog
CisJLyogRGlzYWJsZSB0aGUgUExMIGxvY2stZGV0ZWN0IG1vZHVsZSAqLworCWlmIChNRVNPTl9Q
QVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKQorCQltZXNvbl9wYXJtX3dyaXRlKGNsay0+
bWFwLCAmcGxsLT5sX2RldGVjdCwgMSk7CisKIAkvKiBFbmFibGUgdGhlIHBsbCAqLwogCW1lc29u
X3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmVuLCAxKTsKIApAQCAtNDAxLDIwICs0MDUsMTgg
QEAgc3RhdGljIGludCBtZXNvbl9jbGtfcGxsX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKIAkg
KiBDb21wYXJlZCB3aXRoIHRoZSBwcmV2aW91cyBTb0NzLCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQg
bW9kdWxlCiAJICogaXMgbmV3bHkgYWRkZWQgZm9yIEExLCBrZWVwIHRoZSBuZXcgcG93ZXItb24g
c2VxdWVuY2UgdG8gZW5hYmxlIHRoZQogCSAqIFBMTC4gVGhlIHNlcXVlbmNlIGlzOgotCSAqIDEu
IGVuYWJsZSB0aGUgcGxsLCBkZWxheSBmb3IgMTB1cworCSAqIDEuIGVuYWJsZSB0aGUgcGxsLCBk
ZWxheSBmb3IgMjB1cwogCSAqIDIuIGVuYWJsZSB0aGUgcGxsIHNlbGYtYWRhcHRpb24gY3VycmVu
dCBtb2R1bGUsIGRlbGF5IGZvciA0MHVzCiAJICogMy4gZW5hYmxlIHRoZSBsb2NrIGRldGVjdCBt
b2R1bGUKIAkgKi8KIAlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmN1cnJlbnRfZW4p
KSB7Ci0JCXVkZWxheSgxMCk7CiAJCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmN1
cnJlbnRfZW4sIDEpOwogCQl1ZGVsYXkoNDApOwogCX0KIAotCWlmIChNRVNPTl9QQVJNX0FQUExJ
Q0FCTEUoJnBsbC0+bF9kZXRlY3QpKSB7Ci0JCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZw
bGwtPmxfZGV0ZWN0LCAxKTsKKwkvKiBFbmFibGUgdGhlIGxvY2stZGV0ZWN0IG1vZHVsZSAqLwor
CWlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKQogCQltZXNvbl9wYXJt
X3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMCk7Ci0JfQogCiAJaWYgKG1lc29uX2Ns
a19wbGxfd2FpdF9sb2NrKGh3KSkgewogCQkvKiBkaXNhYmxlIFBMTCB3aGVuIFBMTCBsb2NrIGZh
aWxlZC4gKi8KCi0tIAoyLjQyLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
