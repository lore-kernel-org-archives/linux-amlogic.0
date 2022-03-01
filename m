Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063C7C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 05:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gDb4jlOOi1gmkNTIVhNDYDMEgzBpYAu171rEnHBJoZU=; b=oA3z0lEI4MvSuc
	+c2GyBHkTEoO7OaLAQHhf7d9EkTCiLdooXmRK5UdzpEJd/Myy5UEBbk6il0mRtlcL9zU1NXQU2uuA
	SFlFmUpBgWl9eWtsxCfB1FSUncGbVYAw9j6e2GR7rf+eIltx/wNF8uQEEcOfHqPYZqcYXSbORx+JV
	vvkIQRPFykWCRNdNARgJMR2RsJlMq/0ajEWDyCgc+gAqK5UxT8FAzj31QGsb9hvefHsMuARyvSmjP
	xlZh8xyjX5I32CehXDqD4CK4LpFqIacu/G1Qx8QoevzsPow1KkbSYCI4mNQJwNyt8vnhmeJs96p/4
	PvtHKIBVp7KyflcacOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOv9o-00F0Aa-Ac; Tue, 01 Mar 2022 05:34:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOv9d-00F08t-6f; Tue, 01 Mar 2022 05:34:34 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Tue, 1 Mar 2022
 13:34:28 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH V3] tty: serial: meson: Fix the compile link error reported by
 kernel test robot
Date: Tue, 1 Mar 2022 13:33:44 +0800
Message-ID: <20220301053344.29171-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_213433_256562_C1EAFFC8 
X-CRM114-Status: GOOD (  13.04  )
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

RGVzY3JpYmVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNp
bmcgYSBjbG9jawpmcmFtZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0IFJv
Ym90IGNvbXBpbGF0aW9uIGVycm9yCmR1ZSB0byBDT01NT05fQ0xLIGRlcGVuZGVuY3kuCgpGaXhl
czogKCJ0dHk6IHNlcmlhbDptZXNvbjogRGVzY3JpYmVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUg
VUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBjbG9jayBmcmFtZeKAnCkKUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpSZXBvcnRlZC1ieTogRGFuIENhcnBl
bnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdSBUdSA8eXUu
dHVAYW1sb2dpYy5jb20+Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgICAgICB8ICAx
ICsKIGRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCAzNyArKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgYi9k
cml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwppbmRleCBlOTUyZWM1YzdhN2MuLmEwZjJiODJmYzE4
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKKysrIGIvZHJpdmVycy90
dHkvc2VyaWFsL0tjb25maWcKQEAgLTIwMCw2ICsyMDAsNyBAQCBjb25maWcgU0VSSUFMX0tHREJf
Tk1JCiBjb25maWcgU0VSSUFMX01FU09OCiAJdHJpc3RhdGUgIk1lc29uIHNlcmlhbCBwb3J0IHN1
cHBvcnQiCiAJZGVwZW5kcyBvbiBBUkNIX01FU09OIHx8IENPTVBJTEVfVEVTVAorCWRlcGVuZHMg
b24gQ09NTU9OX0NMSwogCXNlbGVjdCBTRVJJQUxfQ09SRQogCWhlbHAKIAkgIFRoaXMgZW5hYmxl
cyB0aGUgZHJpdmVyIGZvciB0aGUgb24tY2hpcCBVQVJUcyBvZiB0aGUgQW1sb2dpYwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3Nlcmlh
bC9tZXNvbl91YXJ0LmMKaW5kZXggYmY2YmU1NDY4YWFmLi45NzJmMjEwZjM0OTIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKKysrIGIvZHJpdmVycy90dHkvc2Vy
aWFsL21lc29uX3VhcnQuYwpAQCAtNzgwLDI4ICs3ODAsMzcgQEAgc3RhdGljIGludCBtZXNvbl91
YXJ0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiByZXQ7CiAK
IAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwotCWlmIChpcnEgPCAwKQotCQlyZXR1
cm4gaXJxOworCWlmIChpcnEgPCAwKSB7CisJCXJldCA9IGlycTsKKwkJZ290byBlcnJfb3V0X2Ns
a19kaXNhYmxlOworCX0KIAogCW9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2Rl
LCAiZmlmby1zaXplIiwgJmZpZm9zaXplKTsKIAogCWlmIChtZXNvbl9wb3J0c1twZGV2LT5pZF0p
IHsKIAkJZGV2X2VycigmcGRldi0+ZGV2LCAicG9ydCAlZCBhbHJlYWR5IGFsbG9jYXRlZFxuIiwg
cGRldi0+aWQpOwotCQlyZXR1cm4gLUVCVVNZOworCQlyZXQgPSAtRUJVU1k7CisJCWdvdG8gZXJy
X291dF9jbGtfZGlzYWJsZTsKIAl9CiAKIAlwb3J0ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYs
IHNpemVvZihzdHJ1Y3QgdWFydF9wb3J0KSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFwb3J0KQotCQly
ZXR1cm4gLUVOT01FTTsKKwlpZiAoIXBvcnQpIHsKKwkJcmV0ID0gLUVOT01FTTsKKwkJZ290byBl
cnJfb3V0X2Nsa19kaXNhYmxlOworCX0KIAogCXBvcnQtPm1lbWJhc2UgPSBkZXZtX2lvcmVtYXBf
cmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzX21lbSk7Ci0JaWYgKElTX0VSUihwb3J0LT5tZW1iYXNl
KSkKLQkJcmV0dXJuIFBUUl9FUlIocG9ydC0+bWVtYmFzZSk7CisJaWYgKElTX0VSUihwb3J0LT5t
ZW1iYXNlKSkgeworCQlyZXQgPSBQVFJfRVJSKHBvcnQtPm1lbWJhc2UpOworCQlnb3RvIGVycl9v
dXRfY2xrX2Rpc2FibGU7CisJfQogCiAJcHJpdmF0ZV9kYXRhID0gZGV2bV9remFsbG9jKCZwZGV2
LT5kZXYsIHNpemVvZigqcHJpdmF0ZV9kYXRhKSwKIAkJCQkgICAgR0ZQX0tFUk5FTCk7Ci0JaWYg
KCFwcml2YXRlX2RhdGEpCi0JCXJldHVybiAtRU5PTUVNOworCWlmICghcHJpdmF0ZV9kYXRhKSB7
CisJCXJldCA9IC1FTk9NRU07CisJCWdvdG8gZXJyX291dF9jbGtfZGlzYWJsZTsKKwl9CiAKIAlp
ZiAoZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpKQogCQlwcml2YXRlX2RhdGEtPnVz
ZV94dGFsX2NsayA9IHRydWU7CkBAIC04MjIsNyArODMxLDcgQEAgc3RhdGljIGludCBtZXNvbl91
YXJ0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlyZXQgPSBtZXNvbl91
YXJ0X3Byb2JlX2Nsb2Nrcyhwb3J0KTsKIAlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCQlnb3Rv
IGVycl9vdXRfY2xrX2Rpc2FibGU7CiAKIAltZXNvbl9wb3J0c1twZGV2LT5pZF0gPSBwb3J0Owog
CXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHBvcnQpOwpAQCAtODMxLDkgKzg0MCwxNSBAQCBz
dGF0aWMgaW50IG1lc29uX3VhcnRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAltZXNvbl91YXJ0X3Jlc2V0KHBvcnQpOwogCiAJcmV0ID0gdWFydF9hZGRfb25lX3BvcnQoJm1l
c29uX3VhcnRfZHJpdmVyLCBwb3J0KTsKLQlpZiAocmV0KQorCWlmIChyZXQpIHsKIAkJbWVzb25f
cG9ydHNbcGRldi0+aWRdID0gTlVMTDsKKwkJZ290byBlcnJfb3V0X2Nsa19kaXNhYmxlOworCX0K
KworCXJldHVybiAwOwogCitlcnJfb3V0X2Nsa19kaXNhYmxlOgorCWNsa19kaXNhYmxlX3VucHJl
cGFyZShwY2xrKTsKIAlyZXR1cm4gcmV0OwogfQogCgpiYXNlLWNvbW1pdDogYzJmYWY3MzdhYmZi
MTBmODhmMmQyNjEyZDU3M2U5ZWRjM2M0MmMzNwotLSAKMi4zMy4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
