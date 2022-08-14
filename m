Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBEAC25B06
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Aug 2022 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqUq2U7nj7bvyfo9G7iGy5eDuqJyqawYDm96PQrTeBM=; b=DSnP4h6wBVwysf
	WwgdBCRB2tcmCwF7KT4FU1Y2Lc22ofds5Maua3fhoEjIPlaL0IdhoejDMlZYRSdZcuu0/y3BUSfvI
	dDKizXu8cgaDtwP/PrQpo+6SZZ396bM+3LPvXnZKUy5ybJhSqcVAmDcJ+4a1BVz0iSXg/KJlxfuuK
	nrYGotnQDiurTwi3LLzFri2VtlGbe7pXq1ro5YWJ3RjRkjn3y2kUtVqe2LIoyD5j4S0JCV3iVWN6y
	1dKGtWepG0ljYmxQrU+ZP6e6Jy+yF4sRcG7SEk1WT+b+9tgNOEGxbR04jxxIj0jhE0V7L8Ycd+6vN
	gzzczm2Dctg/cqRsazOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFXU-007Nb0-Fu; Sun, 14 Aug 2022 15:28:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFXQ-007NXs-24; Sun, 14 Aug 2022 15:28:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9B6C4B80B56;
	Sun, 14 Aug 2022 15:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13163C433C1;
	Sun, 14 Aug 2022 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660490904;
	bh=YA7qGjAoZ0w68jbN59Y8bWwXYBlkSuhDhVnrXYHcvq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcjjkT8a2k5GNJqgfNzG7IJi66sGYlyF60wMBeEvh+IEICM+D/ghPMiZfC7ZcAv80
	 dEOdjMU4A9XqjxkH/tgRaUlzlmD4baUPvJPK65OR95vkbpA8Kut89nnanI5GVKM41t
	 N0g47N/n7+55Jf8gjTrS0cAlAuh7LcyN4ioOtiNZjhxMezXuICGSOo+ADsqVQMmea9
	 fJYL+TAoU86fT9ZeYWOSN/Ax5eP1uBvLMunT/Bp0eIlP6pOSevXIIX0LCd3MbA6f16
	 l8/FKcLUsL98sxzCYo7r4fIDC04436GOMTGhnf8FUWlKwhUCEiQBnDpT+ZRi7qyitS
	 PMDSCG0KmgMOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	kernel test robot <lkp@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Sasha Levin <sashal@kernel.org>,
	airlied@linux.ie,
	daniel@ffwll.ch,
	khilman@baylibre.com,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 16/64] drm/meson: Fix overflow implicit truncation warnings
Date: Sun, 14 Aug 2022 11:23:49 -0400
Message-Id: <20220814152437.2374207-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814152437.2374207-1-sashal@kernel.org>
References: <20220814152437.2374207-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_082829_305240_31312018 
X-CRM114-Status: GOOD (  11.44  )
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

RnJvbTogU2FpIFByYWthc2ggUmFuamFuIDxxdWljX3NhaXByYWthQHF1aWNpbmMuY29tPgoKWyBV
cHN0cmVhbSBjb21taXQgOTg2OTJmNTJjNTg4MjI1MDM0Y2JmZjQ1ODYyMmMyYzA2ZGZjYjU0NCBd
CgpGaXggLVdvdmVyZmxvdyB3YXJuaW5ncyBmb3IgZHJtL21lc29uIGRyaXZlciB3aGljaCBpcyBh
IHJlc3VsdApvZiBtb3ZpbmcgYXJtNjQgY3VzdG9tIE1NSU8gYWNjZXNzb3IgbWFjcm9zIHRvIGFz
bS1nZW5lcmljIGZ1bmN0aW9uCmltcGxlbWVudGF0aW9ucyBnaXZpbmcgYSBib251cyB0eXBlLWNo
ZWNraW5nIG5vdyBhbmQgdW5jb3ZlcmluZyB0aGVzZQpvdmVyZmxvdyB3YXJuaW5ncy4KCmRyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92aXUuYzogSW4gZnVuY3Rpb24g4oCYbWVzb25fdml1X2lu
aXTigJk6CmRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaDoxODI2OjQ4OiBl
cnJvcjogbGFyZ2UgaW50ZWdlciBpbXBsaWNpdGx5IHRydW5jYXRlZCB0byB1bnNpZ25lZCB0eXBl
IFstV2Vycm9yPW92ZXJmbG93XQogI2RlZmluZSAgVklVX09TRF9CTEVORF9SRU9SREVSKGRlc3Qs
IHNyYykgICAgICAoKHNyYykgPDwgKGRlc3QgKiA0KSkKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgpkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdml1
LmM6NDcyOjE4OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYVklVX09TRF9CTEVORF9S
RU9SREVS4oCZCiAgIHdyaXRlbF9yZWxheGVkKFZJVV9PU0RfQkxFTkRfUkVPUkRFUigwLCAxKSB8
CiAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYWkgUHJha2Fz
aCBSYW5qYW4gPHF1aWNfc2FpcHJha2FAcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgpDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Q2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2
aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92
aXUuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fdml1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdml1LmMKaW5k
ZXggMjU5ZjNlNmJlYzkwLi5iYjdlMTA5NTM0ZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl92aXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdml1
LmMKQEAgLTQ2OSwxNyArNDY5LDE3IEBAIHZvaWQgbWVzb25fdml1X2luaXQoc3RydWN0IG1lc29u
X2RybSAqcHJpdikKIAkJCXByaXYtPmlvX2Jhc2UgKyBfUkVHKFZEMl9JRjBfTFVNQV9GSUZPX1NJ
WkUpKTsKIAogCWlmIChtZXNvbl92cHVfaXNfY29tcGF0aWJsZShwcml2LCBWUFVfQ09NUEFUSUJM
RV9HMTJBKSkgewotCQl3cml0ZWxfcmVsYXhlZChWSVVfT1NEX0JMRU5EX1JFT1JERVIoMCwgMSkg
fAotCQkJICAgICAgIFZJVV9PU0RfQkxFTkRfUkVPUkRFUigxLCAwKSB8Ci0JCQkgICAgICAgVklV
X09TRF9CTEVORF9SRU9SREVSKDIsIDApIHwKLQkJCSAgICAgICBWSVVfT1NEX0JMRU5EX1JFT1JE
RVIoMywgMCkgfAotCQkJICAgICAgIFZJVV9PU0RfQkxFTkRfRElOX0VOKDEpIHwKLQkJCSAgICAg
ICBWSVVfT1NEX0JMRU5EMV9ESU4zX0JZUEFTU19UT19ET1VUMSB8Ci0JCQkgICAgICAgVklVX09T
RF9CTEVORDFfRE9VVF9CWVBBU1NfVE9fQkxFTkQyIHwKLQkJCSAgICAgICBWSVVfT1NEX0JMRU5E
X0RJTjBfQllQQVNTX1RPX0RPVVQwIHwKLQkJCSAgICAgICBWSVVfT1NEX0JMRU5EX0JMRU4yX1BS
RU1VTFRfRU4oMSkgfAotCQkJICAgICAgIFZJVV9PU0RfQkxFTkRfSE9MRF9MSU5FUyg0KSwKLQkJ
CSAgICAgICBwcml2LT5pb19iYXNlICsgX1JFRyhWSVVfT1NEX0JMRU5EX0NUUkwpKTsKKwkJdTMy
IHZhbCA9ICh1MzIpVklVX09TRF9CTEVORF9SRU9SREVSKDAsIDEpIHwKKwkJCSAgKHUzMilWSVVf
T1NEX0JMRU5EX1JFT1JERVIoMSwgMCkgfAorCQkJICAodTMyKVZJVV9PU0RfQkxFTkRfUkVPUkRF
UigyLCAwKSB8CisJCQkgICh1MzIpVklVX09TRF9CTEVORF9SRU9SREVSKDMsIDApIHwKKwkJCSAg
KHUzMilWSVVfT1NEX0JMRU5EX0RJTl9FTigxKSB8CisJCQkgICh1MzIpVklVX09TRF9CTEVORDFf
RElOM19CWVBBU1NfVE9fRE9VVDEgfAorCQkJICAodTMyKVZJVV9PU0RfQkxFTkQxX0RPVVRfQllQ
QVNTX1RPX0JMRU5EMiB8CisJCQkgICh1MzIpVklVX09TRF9CTEVORF9ESU4wX0JZUEFTU19UT19E
T1VUMCB8CisJCQkgICh1MzIpVklVX09TRF9CTEVORF9CTEVOMl9QUkVNVUxUX0VOKDEpIHwKKwkJ
CSAgKHUzMilWSVVfT1NEX0JMRU5EX0hPTERfTElORVMoNCk7CisJCXdyaXRlbF9yZWxheGVkKHZh
bCwgcHJpdi0+aW9fYmFzZSArIF9SRUcoVklVX09TRF9CTEVORF9DVFJMKSk7CiAKIAkJd3JpdGVs
X3JlbGF4ZWQoT1NEX0JMRU5EX1BBVEhfU0VMX0VOQUJMRSwKIAkJCSAgICAgICBwcml2LT5pb19i
YXNlICsgX1JFRyhPU0QxX0JMRU5EX1NSQ19DVFJMKSk7Ci0tIAoyLjM1LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
