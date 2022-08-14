Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD1C25B06
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Aug 2022 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqUq2U7nj7bvyfo9G7iGy5eDuqJyqawYDm96PQrTeBM=; b=KX17RN3yp84BRt
	D7GvpEmI5j+Srsep41Q8Xin0Nci1uEQePWp/auwTQynjZ3ZxgGpDePtK7MBuusN02c/Idbtx6BoNm
	ZDzxHi2OnR6WGSBhdUiWEbjSfm+BGHC6Z4zvZRPlDXAlJAn6wtiBcBy3g8xj2u1ud2wdU0V+pNsye
	I3rQImnYlUE83bzmiFdclr71Gxs+KhybyfvdKT0rTslqAu0KM8DxegA3EhJ8uKV74l6MGo5lWHTeo
	cnoglX9hdxJ1ikrCaoLDnkPi48sDx+aTc7hJx0fO9O3IopK2/Ixz6Zh7zAkR53U8qwLBVa/0CmvEB
	oOeNHieOjYH5Hl0+Tzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFb0-007QCa-2v; Sun, 14 Aug 2022 15:32:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFZp-007PNi-Jq; Sun, 14 Aug 2022 15:30:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 205B460C05;
	Sun, 14 Aug 2022 15:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E18C433D6;
	Sun, 14 Aug 2022 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660491056;
	bh=YA7qGjAoZ0w68jbN59Y8bWwXYBlkSuhDhVnrXYHcvq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMF4rrtPsLxTsUC13FTY1pKYHw14XFUPrHdEEQeLJGMosSQKljhHyy32ML8ios2vj
	 if5zYbMBYZCs9255pPtoCNJ1K5uImyx6D7BIAXRj57mh+mi11Hb2vNfsEqpa3pcUYk
	 P4cuW08rZQxXQXesAB9pWXyx0sk10MSWhq5CaQQoPGEXYN7chZJKgM+Yq0+PCobCiC
	 TyaJoMasWYtBpBSuhiWWQOxIVpOQFP7OzGJe2aNCX6oQYRLdXW9polOaFPr1Z61hDw
	 yeGrCMGaB37aI7gwrW+1qT9FTL1vn+0koqfMqVd6NPKrCFmJ0LiEI8zv3knrHhNq2F
	 zD3Xlvlwv62/w==
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
Subject: [PATCH AUTOSEL 5.18 13/56] drm/meson: Fix overflow implicit truncation warnings
Date: Sun, 14 Aug 2022 11:29:43 -0400
Message-Id: <20220814153026.2377377-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153026.2377377-1-sashal@kernel.org>
References: <20220814153026.2377377-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_083057_762304_78772FB4 
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
