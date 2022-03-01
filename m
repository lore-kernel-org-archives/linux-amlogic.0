Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA07AC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 05:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SIH8a69kpjB+ye04/FUlY03m0ztuH/BQeXaJOIab15U=; b=p+QAi5KbXIbxFF
	/ldvEmM4fjtYrbjdefbIarU/JtMBmrmfKuSYxHxKtTTFpXuJZWvkteyy4gzbeaShV1opf1sLY6qZu
	kaEyxRRk858MknNEg0/3KCazHHd5hgh0m3zbf35cgS718OjrRvX8wpRjFxmLGlyHO48SJRgo2uFt0
	g7xouuLJKNesCQj+ldl43+rlZSZY/UMTlAY37Y/RwWqjkddyR5ybfsyEEIYyp3762fk1bz2zjriMj
	CmlSn9NZgXc0uipwriIa4Bkm6caIbCoc5n0sYOJrzLQSyzr4ZE0v9zeVlFXz1LPqR0TEtvY9iTvoa
	4FOu34CKlgqgexJXgl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOvDr-00F1S0-Bd; Tue, 01 Mar 2022 05:38:55 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOvDZ-00F1Is-P4; Tue, 01 Mar 2022 05:38:39 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Tue, 1 Mar 2022
 13:38:35 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] tty: serial: meson: Fixed an issue where pclk was turned on
 on probe but should be turned off on subsequent errors.
Date: Tue, 1 Mar 2022 13:37:38 +0800
Message-ID: <20220301053738.21163-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_213837_857769_EECC8F58 
X-CRM114-Status: GOOD (  11.47  )
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

Q2FsbCBjbGtfcHJlcGFyZV9lbmFibGUgaW4gdGhlIHByb2JlIGZ1bmN0aW9uIHRvIGVuYWJsZSBw
Y2xrLiBJZiB5b3UKZXhpdCB0aGUgcHJvYmUgZnVuY3Rpb24gbGF0ZXIgaW4gYW4gZXJyb3IsIGNh
bGwgY2xrX2Rpc2FibGVfdW5wcmVwYXJlCnRvIGRpc2FibGUgcGNsay4KCkZpeGVzOiA0NDAyM2I4
ZTFmMTQgKCJ0dHk6IHNlcmlhbDptZXNvbjogRGVzY3JpYmVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0
aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBjbG9jayBmcmFtZeKAnCkKUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpSZXBvcnRlZC1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdSBUdSA8
eXUudHVAYW1sb2dpYy5jb20+Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyB8
IDM3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI2
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5
L3NlcmlhbC9tZXNvbl91YXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCmlu
ZGV4IGJmNmJlNTQ2OGFhZi4uOTcyZjIxMGYzNDkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvbWVzb25fdWFydC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMK
QEAgLTc4MCwyOCArNzgwLDM3IEBAIHN0YXRpYyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gcmV0OwogCiAJaXJxID0gcGxhdGZvcm1f
Z2V0X2lycShwZGV2LCAwKTsKLQlpZiAoaXJxIDwgMCkKLQkJcmV0dXJuIGlycTsKKwlpZiAoaXJx
IDwgMCkgeworCQlyZXQgPSBpcnE7CisJCWdvdG8gZXJyX291dF9jbGtfZGlzYWJsZTsKKwl9CiAK
IAlvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwgImZpZm8tc2l6ZSIsICZm
aWZvc2l6ZSk7CiAKIAlpZiAobWVzb25fcG9ydHNbcGRldi0+aWRdKSB7CiAJCWRldl9lcnIoJnBk
ZXYtPmRldiwgInBvcnQgJWQgYWxyZWFkeSBhbGxvY2F0ZWRcbiIsIHBkZXYtPmlkKTsKLQkJcmV0
dXJuIC1FQlVTWTsKKwkJcmV0ID0gLUVCVVNZOworCQlnb3RvIGVycl9vdXRfY2xrX2Rpc2FibGU7
CiAJfQogCiAJcG9ydCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2Yoc3RydWN0IHVh
cnRfcG9ydCksIEdGUF9LRVJORUwpOwotCWlmICghcG9ydCkKLQkJcmV0dXJuIC1FTk9NRU07CisJ
aWYgKCFwb3J0KSB7CisJCXJldCA9IC1FTk9NRU07CisJCWdvdG8gZXJyX291dF9jbGtfZGlzYWJs
ZTsKKwl9CiAKIAlwb3J0LT5tZW1iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5k
ZXYsIHJlc19tZW0pOwotCWlmIChJU19FUlIocG9ydC0+bWVtYmFzZSkpCi0JCXJldHVybiBQVFJf
RVJSKHBvcnQtPm1lbWJhc2UpOworCWlmIChJU19FUlIocG9ydC0+bWVtYmFzZSkpIHsKKwkJcmV0
ID0gUFRSX0VSUihwb3J0LT5tZW1iYXNlKTsKKwkJZ290byBlcnJfb3V0X2Nsa19kaXNhYmxlOwor
CX0KIAogCXByaXZhdGVfZGF0YSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnBy
aXZhdGVfZGF0YSksCiAJCQkJICAgIEdGUF9LRVJORUwpOwotCWlmICghcHJpdmF0ZV9kYXRhKQot
CQlyZXR1cm4gLUVOT01FTTsKKwlpZiAoIXByaXZhdGVfZGF0YSkgeworCQlyZXQgPSAtRU5PTUVN
OworCQlnb3RvIGVycl9vdXRfY2xrX2Rpc2FibGU7CisJfQogCiAJaWYgKGRldmljZV9nZXRfbWF0
Y2hfZGF0YSgmcGRldi0+ZGV2KSkKIAkJcHJpdmF0ZV9kYXRhLT51c2VfeHRhbF9jbGsgPSB0cnVl
OwpAQCAtODIyLDcgKzgzMSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcmV0ID0gbWVzb25fdWFydF9wcm9iZV9jbG9ja3Mo
cG9ydCk7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJZ290byBlcnJfb3V0X2Nsa19kaXNh
YmxlOwogCiAJbWVzb25fcG9ydHNbcGRldi0+aWRdID0gcG9ydDsKIAlwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBwb3J0KTsKQEAgLTgzMSw5ICs4NDAsMTUgQEAgc3RhdGljIGludCBtZXNvbl91
YXJ0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbWVzb25fdWFydF9yZXNl
dChwb3J0KTsKIAogCXJldCA9IHVhcnRfYWRkX29uZV9wb3J0KCZtZXNvbl91YXJ0X2RyaXZlciwg
cG9ydCk7Ci0JaWYgKHJldCkKKwlpZiAocmV0KSB7CiAJCW1lc29uX3BvcnRzW3BkZXYtPmlkXSA9
IE5VTEw7CisJCWdvdG8gZXJyX291dF9jbGtfZGlzYWJsZTsKKwl9CisKKwlyZXR1cm4gMDsKIAor
ZXJyX291dF9jbGtfZGlzYWJsZToKKwljbGtfZGlzYWJsZV91bnByZXBhcmUocGNsayk7CiAJcmV0
dXJuIHJldDsKIH0KIAoKYmFzZS1jb21taXQ6IGQ0YWI1NDg3Y2M3N2E0MDUzZGM5MDcwYzU3NjFh
ZDk0YmYzOTc4MjUKLS0gCjIuMzMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
