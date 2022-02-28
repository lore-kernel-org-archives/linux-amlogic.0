Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE81C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kg0M6PbiPSvecAS0sKIyq3efNM2aVsJpEQHcqsXsIy0=; b=lRiD8Wcn2tfsg/
	5nctuxFKKY8pILqx5k0zw/RPQR6v3Sfv1vrExhZiS7+MtFFwbM84sEAcMVVVXXL8Oo5WNraANcPKy
	SU0yaimgQFZXw753oFBUgitf+gXO6AvO4H40hjJUJNqaUj21891LrTCb1l97B8fuJP6lAJh37LUqg
	fuWSPN0XOLWOnKQBkiY3JABO/Y24yvOp7ty1BL1TTeLma1OIsmv1JROVPOhJT0+HX747dDqmzBmdU
	qfcMsT8gbMyYURG+IjpXreRKaCm7TJvU0xBD9ckRzRdBoJs5VDL7fT74KA5HfnE29KvnXYRfC5XdC
	xNBe+LE0ZSAurgYzeO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOby0-00BDBX-3v; Mon, 28 Feb 2022 09:05:16 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nObxc-00BD4o-34; Mon, 28 Feb 2022 09:04:53 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 28 Feb 2022
 17:04:47 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH V2] tty: serial: meson: Fix the compile link error reported by
 kernel test robot
Date: Mon, 28 Feb 2022 17:03:51 +0800
Message-ID: <20220228090351.9976-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_010452_162459_4D5F9653 
X-CRM114-Status: GOOD (  12.87  )
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
czogNDQwMjNiOGUxZjE0ICgidHR5OiBzZXJpYWw6bWVzb246IERlc2NyaWJlcyB0aGUgY2FsY3Vs
YXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sgZnJhbWXigJwp
ClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KUmVwb3J0ZWQt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1i
eTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9LY29u
ZmlnICAgICAgfCAgMSArCiBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMzcgKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3Nlcmlh
bC9LY29uZmlnIGIvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKaW5kZXggZTk1MmVjNWM3YTdj
Li5hMGYyYjgyZmMxOGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCisr
KyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCkBAIC0yMDAsNiArMjAwLDcgQEAgY29uZmln
IFNFUklBTF9LR0RCX05NSQogY29uZmlnIFNFUklBTF9NRVNPTgogCXRyaXN0YXRlICJNZXNvbiBz
ZXJpYWwgcG9ydCBzdXBwb3J0IgogCWRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RF
U1QKKwlkZXBlbmRzIG9uIENPTU1PTl9DTEsKIAlzZWxlY3QgU0VSSUFMX0NPUkUKIAloZWxwCiAJ
ICBUaGlzIGVuYWJsZXMgdGhlIGRyaXZlciBmb3IgdGhlIG9uLWNoaXAgVUFSVHMgb2YgdGhlIEFt
bG9naWMKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCmluZGV4IGJmNmJlNTQ2OGFhZi4uOTcyZjIxMGYz
NDkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCisrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKQEAgLTc4MCwyOCArNzgwLDM3IEBAIHN0YXRp
YyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQly
ZXR1cm4gcmV0OwogCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAoaXJx
IDwgMCkKLQkJcmV0dXJuIGlycTsKKwlpZiAoaXJxIDwgMCkgeworCQlyZXQgPSBpcnE7CisJCWdv
dG8gZXJyX291dF9jbGtfZGlzYWJsZTsKKwl9CiAKIAlvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2
LT5kZXYub2Zfbm9kZSwgImZpZm8tc2l6ZSIsICZmaWZvc2l6ZSk7CiAKIAlpZiAobWVzb25fcG9y
dHNbcGRldi0+aWRdKSB7CiAJCWRldl9lcnIoJnBkZXYtPmRldiwgInBvcnQgJWQgYWxyZWFkeSBh
bGxvY2F0ZWRcbiIsIHBkZXYtPmlkKTsKLQkJcmV0dXJuIC1FQlVTWTsKKwkJcmV0ID0gLUVCVVNZ
OworCQlnb3RvIGVycl9vdXRfY2xrX2Rpc2FibGU7CiAJfQogCiAJcG9ydCA9IGRldm1fa3phbGxv
YygmcGRldi0+ZGV2LCBzaXplb2Yoc3RydWN0IHVhcnRfcG9ydCksIEdGUF9LRVJORUwpOwotCWlm
ICghcG9ydCkKLQkJcmV0dXJuIC1FTk9NRU07CisJaWYgKCFwb3J0KSB7CisJCXJldCA9IC1FTk9N
RU07CisJCWdvdG8gZXJyX291dF9jbGtfZGlzYWJsZTsKKwl9CiAKIAlwb3J0LT5tZW1iYXNlID0g
ZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlc19tZW0pOwotCWlmIChJU19FUlIo
cG9ydC0+bWVtYmFzZSkpCi0JCXJldHVybiBQVFJfRVJSKHBvcnQtPm1lbWJhc2UpOworCWlmIChJ
U19FUlIocG9ydC0+bWVtYmFzZSkpIHsKKwkJcmV0ID0gUFRSX0VSUihwb3J0LT5tZW1iYXNlKTsK
KwkJZ290byBlcnJfb3V0X2Nsa19kaXNhYmxlOworCX0KIAogCXByaXZhdGVfZGF0YSA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnByaXZhdGVfZGF0YSksCiAJCQkJICAgIEdGUF9L
RVJORUwpOwotCWlmICghcHJpdmF0ZV9kYXRhKQotCQlyZXR1cm4gLUVOT01FTTsKKwlpZiAoIXBy
aXZhdGVfZGF0YSkgeworCQlyZXQgPSAtRU5PTUVNOworCQlnb3RvIGVycl9vdXRfY2xrX2Rpc2Fi
bGU7CisJfQogCiAJaWYgKGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KSkKIAkJcHJp
dmF0ZV9kYXRhLT51c2VfeHRhbF9jbGsgPSB0cnVlOwpAQCAtODIyLDcgKzgzMSw3IEBAIHN0YXRp
YyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJ
cmV0ID0gbWVzb25fdWFydF9wcm9iZV9jbG9ja3MocG9ydCk7CiAJaWYgKHJldCkKLQkJcmV0dXJu
IHJldDsKKwkJZ290byBlcnJfb3V0X2Nsa19kaXNhYmxlOwogCiAJbWVzb25fcG9ydHNbcGRldi0+
aWRdID0gcG9ydDsKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwb3J0KTsKQEAgLTgzMSw5
ICs4NDAsMTUgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJbWVzb25fdWFydF9yZXNldChwb3J0KTsKIAogCXJldCA9IHVhcnRfYWRk
X29uZV9wb3J0KCZtZXNvbl91YXJ0X2RyaXZlciwgcG9ydCk7Ci0JaWYgKHJldCkKKwlpZiAocmV0
KSB7CiAJCW1lc29uX3BvcnRzW3BkZXYtPmlkXSA9IE5VTEw7CisJCWdvdG8gZXJyX291dF9jbGtf
ZGlzYWJsZTsKKwl9CisKKwlyZXR1cm4gMDsKIAorZXJyX291dF9jbGtfZGlzYWJsZToKKwljbGtf
ZGlzYWJsZV91bnByZXBhcmUocGNsayk7CiAJcmV0dXJuIHJldDsKIH0KIAoKYmFzZS1jb21taXQ6
IGMyZmFmNzM3YWJmYjEwZjg4ZjJkMjYxMmQ1NzNlOWVkYzNjNDJjMzcKLS0gCjIuMzMuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
