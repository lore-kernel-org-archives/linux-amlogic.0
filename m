Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D776083600
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h+Z9kN6l;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rIrFWJIp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mw/9VCzi2eEFqoooUfgJp450t+sb2i87YhD8L7rCO5A=; b=h+Z9kN6lyT0OLRFJpkZtHAQQlX
	HDskMLZ/4ZAuaMMltrrwjCHNkWoaTe0pMFu/gDjrn4yyGCzyDfAyJZ/HnVPnFJeVL32Fhim/GLIqx
	W59ielI2ynk3mkHLY7wARQZtUdlqzrajbMvHsURcqtMY7eI2SEUnc7pQhRoPDrNtb0v3UI7Y5517n
	u9imKq9XGoqF/JCJ0u2qXUwXr8I16JIkIAQBbwDBKejdIr+Z/IlbYvA6AXwCCbDdG73I9uFYFzn4r
	rkVY+G+hYpxEmrPmHI1bMEuOH4F3z1QA5cZWaOLTIQDh28cz8rnHWcpfhem0i419E/WeTOYL7WRAL
	RY6ZhHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH3K-0000000Bu1a-42We;
	Fri, 06 Nov 2026 10:20:10 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH3G-0000000BtxX-47T9;
	Fri, 06 Nov 2026 10:20:08 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJteX1864372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:20:00 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJteX1864372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960400;
	bh=3pN3R/UpUV10JfpQwTbJj5KhF2jJkL0dKbpgZQeGgeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rIrFWJIpUTZFKBF0D9Tv/kPHjQ4EgcwkRZHzoFXAyR/lLd43zhGdJo035EZP69irg
	 q/OHAlyf6d6595RAizJaYiuydSkhg3R6CW7cgK2YsTQ1vLcwybx+LZEcW0cFyhVBZe
	 8Cu3YNPDZEDxyxITCPh+V9MEc1lu6a34LwASfkZY=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 2/2] media: rc: meson-ir: allow the receiver to wake the system
Date: Fri,  6 Nov 2026 11:19:54 +0100
Message-ID: <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022007_350623_B0E35016 
X-CRM114-Status: GOOD (  17.59  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGUgc3VzcGVuZCBjYWxsYmFjayBzd2l0Y2hlcyB0aGUgZGVjb2RlciBvZmYsIHNvIG5vdGhp
bmcgaXMgbGVmdCB0bwpub3RpY2UgdGhlIHJlbW90ZSBhbmQgdGhlIHJlY2VpdmVyIGNhbiBuZXZl
ciB3YWtlIHRoZSBzeXN0ZW0gZnJvbQpzMmlkbGUsIHdoZXJlIG9ubHkgTGludXggaW50ZXJydXB0
cyBjYW4gd2FrZSB0aGUgQ1BVcy4KCldoZW4gdGhlIGRldmljZSBpcyBhIHdha2V1cCBzb3VyY2Us
IGtlZXAgdGhlIGRlY29kZXIgcnVubmluZyBhbmQgYXJtCml0cyBpbnRlcnJ1cHQgYXMgYSB3YWtl
IGludGVycnVwdCBpbnN0ZWFkLiBCb2FyZHMgd2l0aG91dCB0aGUKd2FrZXVwLXNvdXJjZSBwcm9w
ZXJ0eSBrZWVwIHRoZSBleGlzdGluZyBiZWhhdmlvdXIuCgpUaGlzIGRvZXMgbm90IGFmZmVjdCBz
dXNwZW5kIHRvIFJBTSBvbiBib2FyZHMgd2hvc2UgZmlybXdhcmUgd2F0Y2hlcwp0aGUgSVIgcmVj
ZWl2ZXIgaXRzZWxmIHdoaWxlIHRoZSBTb0MgaXMgZG93biwgYXMgb24gUzQgd2hlcmUgQkwzMSB3
YWtlcwp0aGUgYm9hcmQgb24gdGhlIHJlbW90ZSdzIHBvd2VyIGtleS4KClRlc3RlZCBvbiBhbiBT
OTA1VzIgYm9hcmQgaW4gczJpZGxlOiB0aGUgcG93ZXIga2V5IG9uIHRoZSByZW1vdGUgd2FrZXMK
aXQ7IHdpdGggd2FrZXVwIGRpc2FibGVkIGZvciB0aGUgcmVjZWl2ZXIgaXQgZG9lcyBub3QuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0
bG9vay5kZT4KLS0tCiBkcml2ZXJzL21lZGlhL3JjL21lc29uLWlyLmMgfCAxNyArKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3JjL21lc29uLWlyLmMgYi9kcml2ZXJzL21lZGlhL3JjL21lc29uLWlyLmMK
aW5kZXggMjcyZWJiMGQ5N2M4Li42YjViNWY3MWExYjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVk
aWEvcmMvbWVzb24taXIuYworKysgYi9kcml2ZXJzL21lZGlhL3JjL21lc29uLWlyLmMKQEAgLTE2
NSw2ICsxNjUsNyBAQCBzdHJ1Y3QgbWVzb25faXIgewogCWNvbnN0IHN0cnVjdCBtZXNvbl9pcl9w
YXJhbSAqcGFyYW07CiAJc3RydWN0IHJlZ21hcAkqcmVnOwogCXN0cnVjdCByY19kZXYJKnJjOwor
CWludAkJaXJxOwogCXNwaW5sb2NrX3QJbG9jazsKIH07CiAKQEAgLTQ3NSw2ICs0NzYsOCBAQCBz
dGF0aWMgaW50IG1lc29uX2lyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
aWYgKGlycSA8IDApCiAJCXJldHVybiBpcnE7CiAKKwlpci0+aXJxID0gaXJxOworCiAJaWYgKGly
LT5wYXJhbS0+c3VwcG9ydF9od19kZWNvZGVyKQogCQlpci0+cmMgPSBkZXZtX3JjX2FsbG9jYXRl
X2RldmljZSgmcGRldi0+ZGV2LAogCQkJCQkJIFJDX0RSSVZFUl9TQ0FOQ09ERSk7CkBAIC01MjMs
NiArNTI2LDggQEAgc3RhdGljIGludCBtZXNvbl9pcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCQlyZXR1cm4gcmV0OwogCX0KIAorCWRldmljZV9pbml0X3dha2V1cChkZXYs
IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAid2FrZXVwLXNvdXJjZSIpKTsKKwogCWRldl9p
bmZvKGRldiwgInJlY2VpdmVyIGluaXRpYWxpemVkXG4iKTsKIAogCXJldHVybiAwOwpAQCAtNTcx
LDYgKzU3Niw5IEBAIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgbWVzb25faXJfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgbWVzb25faXIgKmlyID0gZGV2X2dldF9kcnZk
YXRhKGRldik7CiAKKwlpZiAoZGV2aWNlX21heV93YWtldXAoZGV2KSkKKwkJZGlzYWJsZV9pcnFf
d2FrZShpci0+aXJxKTsKKwogCWlmIChpci0+cGFyYW0tPnN1cHBvcnRfaHdfZGVjb2RlcikKIAkJ
bWVzb25faXJfaHdfZGVjb2Rlcl9pbml0KGlyLT5yYywgJmlyLT5yYy0+ZW5hYmxlZF9wcm90b2Nv
bHMpOwogCWVsc2UKQEAgLTU4NCw2ICs1OTIsMTUgQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGlu
dCBtZXNvbl9pcl9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlzdHJ1Y3QgbWVzb25faXIg
KmlyID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAorCS8q
CisJICogTGVhdmUgdGhlIHJlY2VpdmVyIHJ1bm5pbmcgd2hlbiBpdCBpcyBtZWFudCB0byB3YWtl
IHRoZSBzeXN0ZW0gdXAsCisJICogb3RoZXJ3aXNlIHRoZXJlIGlzIG5vdGhpbmcgbGVmdCB0byBu
b3RpY2UgdGhlIHJlbW90ZS4KKwkgKi8KKwlpZiAoZGV2aWNlX21heV93YWtldXAoZGV2KSkgewor
CQllbmFibGVfaXJxX3dha2UoaXItPmlycSk7CisJCXJldHVybiAwOworCX0KKwogCXNwaW5fbG9j
a19pcnFzYXZlKCZpci0+bG9jaywgZmxhZ3MpOwogCXJlZ21hcF91cGRhdGVfYml0cyhpci0+cmVn
LCBJUl9ERUNfUkVHMSwgSVJfREVDX1JFRzFfRU5BQkxFLCAwKTsKIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZpci0+bG9jaywgZmxhZ3MpOwotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
