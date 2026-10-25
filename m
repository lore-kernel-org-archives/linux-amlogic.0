Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE660A2629
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbblyr53;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=tsVaIKep
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X6NouLAGVBhJK9L+lffHjWI+VmQA4o+pdBPidrYms2o=; b=qbblyr53LZ1nR46NVzFeSm+Ld7
	X0mOycSf09YZVCvQNhw2eNmMU0Evqx7Wh3MRGu2XeILtXjlevIo9ldGkHg3PQFzvRNhZslPLifnVE
	8vaF6kuhGiGY5tDdzCvFYTqr2UU0pN9OOpQP4o2DL+z9ObahC3LSfv/Ve6KzTPo4SGhMy+yzSXUwx
	cccJx4av0gFsJ6AwaU2ZyyKd21EBUYBbSHm79iuu0hhzb0Wu8rU3vd/NnWhC1P+EmC2A2s5hXQhe/
	L6LHmsbk57ma9Us/TW9waV18hX/HpLhBHZ5CrPeIRLw2nURsSP3fE28S5ImqiQ8pfUkgKoRpLKH11
	cx+YsN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pc-00000001MqE-2fS6;
	Sun, 25 Oct 2026 19:24:36 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pR-00000001Mfl-2v4A;
	Sun, 25 Oct 2026 19:24:27 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ic518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:14 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ic518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956255;
	bh=ATBSQE1rK03tfhlx9ZBM3Qt5G3xkGBtafMvYQuYfRrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tsVaIKepp2MnexAwiif/LrEC0hzKnB9vMRhJxeZ4J9AGHFASOMRjz0qcvIZ7iVnHC
	 jKGtbSdMc4ToVMliNgwcCSyy8ilayyRUKGoHtX7wLSmrvLilg6lYvpW7EgJDxp5l+n
	 qbPwBerCmxbYahDvxiB0yFDGhMq65tOeT0acrOyU=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 3/7] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
Date: Sun, 25 Oct 2026 20:24:00 +0100
Message-ID: <20261025192404.209695-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122426_110042_806049FF 
X-CRM114-Status: GOOD (  10.64  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+CgpUaGUgUzQgcmVx
dWlyZXMgYWRkaXRpb25hbCBjbG9jayBjb250cm9sIGJpdHMgdG8gYmUgdHVybiBvbiB3aGlsZSBl
bmFibGVkLgpUaGUgUzQgaGFzIDggVERNIGxhbmVzLCBpbnN0ZWFkIG9mIDQgb24gcHJldmlvdXMg
U29DLgpVcGRhdGUgdGhlIHdpZGdldCBhY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IEppZWJp
bmcgQ2hlbiA8amllYmluZy5jaGVuQGFtbG9naWMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBzb3VuZC9z
b2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMgYi9zb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fj
b2RlYy5jCmluZGV4IDIxOTQxZWU1NTJjNS4uMjA0YmY4NjU0ZDJlIDEwMDY0NAotLS0gYS9zb3Vu
ZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jCisrKyBiL3NvdW5kL3NvYy9tZXNvbi9nMTJhLXRv
YWNvZGVjLmMKQEAgLTQxLDYgKzQxLDkgQEAKICNkZWZpbmUgIENUUkwwX0JDTEtfU0VMX0xTQgkJ
NAogI2RlZmluZSAgQ1RSTDBfTUNMS19TRUwJCQlHRU5NQVNLKDIsIDApCiAKKyNkZWZpbmUgQ1RS
TDBfQkNMS19FTkFCTEVfU0hJRlQJCTMwCisjZGVmaW5lIENUUkwwX01DTEtfRU5BQkxFX1NISUZU
CQkyOQorCiAjZGVmaW5lIFRPQUNPREVDX09VVF9DSE1BWAkJMgogCiBzdHJ1Y3QgZzEyYV90b2Fj
b2RlYyB7CkBAIC0xNDEsNiArMTQ0LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19k
YXBtX3dpZGdldCBzbTFfdG9hY29kZWNfd2lkZ2V0c1tdID0gewogCQkJICAgICZnMTJhX3RvYWNv
ZGVjX291dF9lbmFibGUpLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1f
d2lkZ2V0IHM0X3RvYWNvZGVjX3dpZGdldHNbXSA9IHsKKwlTTkRfU09DX0RBUE1fTVVYKCJTUkMi
LCBUT0FDT0RFQ19DVFJMMCwgQ1RSTDBfQkNMS19FTkFCTEVfU0hJRlQsIDAsCisJCQkgJnNtMV90
b2Fjb2RlY19tdXgpLAorCVNORF9TT0NfREFQTV9TV0lUQ0goIk9VVCBFTiIsIFRPQUNPREVDX0NU
UkwwLCBDVFJMMF9NQ0xLX0VOQUJMRV9TSElGVCwgMCwKKwkJCSAgICAmZzEyYV90b2Fjb2RlY19v
dXRfZW5hYmxlKSwKK307CisKIHN0YXRpYyBpbnQgZzEyYV90b2Fjb2RlY19pbnB1dF9od19wYXJh
bXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCiAJCQkJCSBzdHJ1Y3Qgc25k
X3BjbV9od19wYXJhbXMgKnBhcmFtcywKIAkJCQkJIHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpKQpA
QCAtMjM0LDYgKzI0NCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcg
c20xX3RvYWNvZGVjX2NvbnRyb2xzW10gPSB7CiAJU09DX1NJTkdMRSgiTGFuZSBTZWxlY3QiLCBU
T0FDT0RFQ19DVFJMMCwgQ1RSTDBfTEFORV9TRUxfU00xLCAzLCAwKSwKIH07CiAKK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBzNF90b2Fjb2RlY19jb250cm9sc1tdID0gewor
CVNPQ19TSU5HTEUoIkxhbmUgU2VsZWN0IiwgVE9BQ09ERUNfQ1RSTDAsIENUUkwwX0xBTkVfU0VM
X1NNMSwgNywgMCksCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50
X2RyaXZlciBnMTJhX3RvYWNvZGVjX2NvbXBvbmVudF9kcnYgPSB7CiAJLnByb2JlCQkJPSBnMTJh
X3RvYWNvZGVjX2NvbXBvbmVudF9wcm9iZSwKIAkuY29udHJvbHMJCT0gZzEyYV90b2Fjb2RlY19j
b250cm9scywKQEAgLTI1Niw2ICsyNzAsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudF9kcml2ZXIgc20xX3RvYWNvZGVjX2NvbXBvbmVudF9kcnYgPSB7CiAJLmVuZGlh
bm5lc3MJCT0gMSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnRf
ZHJpdmVyIHM0X3RvYWNvZGVjX2NvbXBvbmVudF9kcnYgPSB7CisJLnByb2JlCQkJPSBzbTFfdG9h
Y29kZWNfY29tcG9uZW50X3Byb2JlLAorCS5jb250cm9scwkJPSBzNF90b2Fjb2RlY19jb250cm9s
cywKKwkubnVtX2NvbnRyb2xzCQk9IEFSUkFZX1NJWkUoczRfdG9hY29kZWNfY29udHJvbHMpLAor
CS5kYXBtX3dpZGdldHMJCT0gczRfdG9hY29kZWNfd2lkZ2V0cywKKwkubnVtX2RhcG1fd2lkZ2V0
cwk9IEFSUkFZX1NJWkUoczRfdG9hY29kZWNfd2lkZ2V0cyksCisJLmRhcG1fcm91dGVzCQk9IGcx
MmFfdG9hY29kZWNfcm91dGVzLAorCS5udW1fZGFwbV9yb3V0ZXMJPSBBUlJBWV9TSVpFKGcxMmFf
dG9hY29kZWNfcm91dGVzKSwKKwkuZW5kaWFubmVzcwkJPSAxLAorfTsKKwogc3RhdGljIGNvbnN0
IHN0cnVjdCByZWdtYXBfY29uZmlnIGcxMmFfdG9hY29kZWNfcmVnbWFwX2NmZyA9IHsKIAkucmVn
X2JpdHMJPSAzMiwKIAkudmFsX2JpdHMJPSAzMiwKQEAgLTI3Niw2ICszMDEsMTMgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBnMTJhX3RvYWNvZGVjX21hdGNoX2RhdGEgc20xX3RvYWNvZGVjX21hdGNo
X2RhdGEgPSB7CiAJLmZpZWxkX2JjbGtfc2VsCT0gUkVHX0ZJRUxEKFRPQUNPREVDX0NUUkwwLCA0
LCA2KSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZzEyYV90b2Fjb2RlY19tYXRjaF9kYXRh
IHM0X3RvYWNvZGVjX21hdGNoX2RhdGEgPSB7CisJLmNvbXBvbmVudF9kcnYJPSAmczRfdG9hY29k
ZWNfY29tcG9uZW50X2RydiwKKwkuZmllbGRfZGF0X3NlbAk9IFJFR19GSUVMRChUT0FDT0RFQ19D
VFJMMCwgMTksIDIwKSwKKwkuZmllbGRfbHJjbGtfc2VsID0gUkVHX0ZJRUxEKFRPQUNPREVDX0NU
UkwwLCAxMiwgMTQpLAorCS5maWVsZF9iY2xrX3NlbAk9IFJFR19GSUVMRChUT0FDT0RFQ19DVFJM
MCwgNCwgNiksCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBnMTJhX3Rv
YWNvZGVjX29mX21hdGNoW10gPSB7CiAJewogCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGcxMmEt
dG9hY29kZWMiLApAQCAtMjg1LDYgKzMxNywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBnMTJhX3RvYWNvZGVjX29mX21hdGNoW10gPSB7CiAJCS5jb21wYXRpYmxlID0gImFt
bG9naWMsc20xLXRvYWNvZGVjIiwKIAkJLmRhdGEgPSAmc20xX3RvYWNvZGVjX21hdGNoX2RhdGEs
CiAJfSwKKwl7CisJCS5jb21wYXRpYmxlID0gImFtbG9naWMsczQtdG9hY29kZWMiLAorCQkuZGF0
YSA9ICZzNF90b2Fjb2RlY19tYXRjaF9kYXRhLAorCX0sCiAJe30KIH07CiBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCBnMTJhX3RvYWNvZGVjX29mX21hdGNoKTsKLS0gCjIuNTYuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
