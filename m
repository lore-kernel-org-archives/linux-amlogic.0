Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871BA60A260F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQmiMdRP;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=AYYgThW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RnFkB+PEmEa2lEl4xjDrgKINi3+M17kakhKm41EetOI=; b=OQmiMdRPPPW+4WONovpuhDY/wE
	0XFCmMptva7AqhuHaMBhehOqgJ+kGF9cl/DQ5zVbNPSTdsq/oZGzRTfMbuvtsLz2fwr2P2xjsdrCO
	NsrqHLo48X2TCzw99xFgkStT6nS3aBFyb4oXj4qeSqCzkOzn+MV0IgSapkFm0aJ/a4FZPB4lI9Tdi
	BAJWSKBupA8yUcC+rYxnlJH7kTMTyDa2OQl/90Cdq7aLZNAbVMx4Pa8q/iqagtQ70oXINDIi/b0rQ
	RPf/08Gw3w9S4mTWtT+V4+T6LminIx3kb4LB0J476Pze5SuXAkCnfqf2LSFwkWhqFS92uxE8iOO41
	qDbGsRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3of-00000001MLY-10Cj;
	Sun, 25 Oct 2026 19:23:37 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3ob-00000001MGW-33tl;
	Sun, 25 Oct 2026 19:23:36 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJNLM4517824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:26 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJNLM4517824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956207;
	bh=3QOSvIP5kH3TW/P9LSpPXkVX5tKHksdBlAOsewQ+L/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AYYgThW88D9XesaIb7XJlWRn+xspAo5OxjyYlUtH+L1FDuOzji8Y6zPN7354uMBB7
	 Mb2FpQmAIyD/DrcnVgY40xuMYAj7KXCD+uCvVhDYNkZjsIxqKghxLt+gOx3GFI2aqe
	 SInv28GCZLLj8FAGluS6KU4mowbviekjapbWsB/E=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
Date: Sun, 25 Oct 2026 20:23:19 +0100
Message-ID: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122334_158180_CD8A07F9 
X-CRM114-Status: GOOD (  15.57  )
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

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGUgc3VzcGVuZCBjYWxsYmFjayBzd2l0Y2hlcyB0aGUgZGVjb2RlciBvZmYsIHNvIG5vdGhp
bmcgaXMgbGVmdCB0bwpub3RpY2UgdGhlIHJlbW90ZSBhbmQgdGhlIHJlY2VpdmVyIGNhbiBuZXZl
ciB3YWtlIHRoZSBzeXN0ZW0uCgpXaGVuIHRoZSBkZXZpY2UgaXMgYSB3YWtldXAgc291cmNlLCBr
ZWVwIHRoZSBkZWNvZGVyIHJ1bm5pbmcgYW5kIGFybQppdHMgaW50ZXJydXB0IGFzIGEgd2FrZSBp
bnRlcnJ1cHQgaW5zdGVhZC4gQm9hcmRzIHdpdGhvdXQgdGhlCndha2V1cC1zb3VyY2UgcHJvcGVy
dHkga2VlcCB0aGUgZXhpc3RpbmcgYmVoYXZpb3VyLgoKVGVzdGVkIG9uIGFuIFM5MDVXMiBib2Fy
ZDogc3VzcGVuZCB0byBSQU0sIHRoZSBwb3dlciBrZXkgb24gdGhlIHJlbW90ZQpyZXN1bWVzIGl0
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVy
QG91dGxvb2suZGU+Ci0tLQogZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci5jIHwgMTcgKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci5jIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1p
ci5jCmluZGV4IDI3MmViYjBkOTdjOC4uNmI1YjVmNzFhMWI0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L21lZGlhL3JjL21lc29uLWlyLmMKKysrIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci5jCkBA
IC0xNjUsNiArMTY1LDcgQEAgc3RydWN0IG1lc29uX2lyIHsKIAljb25zdCBzdHJ1Y3QgbWVzb25f
aXJfcGFyYW0gKnBhcmFtOwogCXN0cnVjdCByZWdtYXAJKnJlZzsKIAlzdHJ1Y3QgcmNfZGV2CSpy
YzsKKwlpbnQJCWlycTsKIAlzcGlubG9ja190CWxvY2s7CiB9OwogCkBAIC00NzUsNiArNDc2LDgg
QEAgc3RhdGljIGludCBtZXNvbl9pcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCWlmIChpcnEgPCAwKQogCQlyZXR1cm4gaXJxOwogCisJaXItPmlycSA9IGlycTsKKwogCWlm
IChpci0+cGFyYW0tPnN1cHBvcnRfaHdfZGVjb2RlcikKIAkJaXItPnJjID0gZGV2bV9yY19hbGxv
Y2F0ZV9kZXZpY2UoJnBkZXYtPmRldiwKIAkJCQkJCSBSQ19EUklWRVJfU0NBTkNPREUpOwpAQCAt
NTIzLDYgKzUyNiw4IEBAIHN0YXRpYyBpbnQgbWVzb25faXJfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAkJcmV0dXJuIHJldDsKIAl9CiAKKwlkZXZpY2VfaW5pdF93YWtldXAo
ZGV2LCBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgIndha2V1cC1zb3VyY2UiKSk7CisKIAlk
ZXZfaW5mbyhkZXYsICJyZWNlaXZlciBpbml0aWFsaXplZFxuIik7CiAKIAlyZXR1cm4gMDsKQEAg
LTU3MSw2ICs1NzYsOSBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IG1lc29uX2lyX3Jlc3Vt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IG1lc29uX2lyICppciA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOwogCisJaWYgKGRldmljZV9tYXlfd2FrZXVwKGRldikpCisJCWRpc2FibGVf
aXJxX3dha2UoaXItPmlycSk7CisKIAlpZiAoaXItPnBhcmFtLT5zdXBwb3J0X2h3X2RlY29kZXIp
CiAJCW1lc29uX2lyX2h3X2RlY29kZXJfaW5pdChpci0+cmMsICZpci0+cmMtPmVuYWJsZWRfcHJv
dG9jb2xzKTsKIAllbHNlCkBAIC01ODQsNiArNTkyLDE1IEBAIHN0YXRpYyBfX21heWJlX3VudXNl
ZCBpbnQgbWVzb25faXJfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJc3RydWN0IG1lc29u
X2lyICppciA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAK
KwkvKgorCSAqIExlYXZlIHRoZSByZWNlaXZlciBydW5uaW5nIHdoZW4gaXQgaXMgbWVhbnQgdG8g
d2FrZSB0aGUgc3lzdGVtIHVwLAorCSAqIG90aGVyd2lzZSB0aGVyZSBpcyBub3RoaW5nIGxlZnQg
dG8gbm90aWNlIHRoZSByZW1vdGUuCisJICovCisJaWYgKGRldmljZV9tYXlfd2FrZXVwKGRldikp
IHsKKwkJZW5hYmxlX2lycV93YWtlKGlyLT5pcnEpOworCQlyZXR1cm4gMDsKKwl9CisKIAlzcGlu
X2xvY2tfaXJxc2F2ZSgmaXItPmxvY2ssIGZsYWdzKTsKIAlyZWdtYXBfdXBkYXRlX2JpdHMoaXIt
PnJlZywgSVJfREVDX1JFRzEsIElSX0RFQ19SRUcxX0VOQUJMRSwgMCk7CiAJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmaXItPmxvY2ssIGZsYWdzKTsKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
