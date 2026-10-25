Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA4A606A31A
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HfcKtLou;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rdiPjhtI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o12cXXkOUIcrJCb166WWNbY4cMewaEdxu2sq3BVhGwY=; b=HfcKtLouZ9DUtuw6fGS+VYS0gA
	tTzu5RG9vlucVnvlzVkkogSXDLhD79tgmDRfr4dWyAdkQB5ockb6KghxU6RDeg3OxwHLkknNuvMaW
	k34BBWBAvE80+3MwLuxWnCzbKY32vDvaEy0g08S5BOS6/r4sSDMnMmj24L1Cna+hO5usYua+a1MGH
	RwqoGMDERZLg7EHTxhldpbr5SV9bD6fpMCqkzgII4lqQmdX45iv8YDtXxbLm9qnbf8+Dvh1Oe/5nO
	8hZp3p+zUNDDJAfHM7c4ea1WB1dQFt19OVAN1Eix4T0oVKgMNnGrKKGTfJoK7kGcK+cJ9DU8nybzr
	Wwupbsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nC-00000001Ks8-2LTP;
	Sun, 25 Oct 2026 19:22:06 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3n6-00000001Kmh-0reh;
	Sun, 25 Oct 2026 19:22:01 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJLko5516701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:53 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJLko5516701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956113;
	bh=0X/tbl9Q4g7QTtyNOjf8kZ22NcdZe6K4eZsTNrclaaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rdiPjhtIbDhRZnlN+dcIhs9BQnfv7mzxnz4QZfouvzZGAl2c819HPQaSMMUMGQPBu
	 LXYjxl59cPYtVUuATW/WOJ9o4X3nTS9B8E6ejduu2VqAPCyNk2afCKxwSokWbCc/Pm
	 lkv6KvlQU2qWArd66gl5AO/PzL3u3RsshxfBLwzY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
Date: Sun, 25 Oct 2026 20:21:44 +0100
Message-ID: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122200_796319_AC0A515D 
X-CRM114-Status: GOOD (  15.61  )
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
CgpPbiBTNCB0aGUgZmlybXdhcmUgaW1wbGVtZW50cyBQU0NJIFNZU1RFTV9PRkYgYXMgRERSIHNl
bGYtcmVmcmVzaC4gQQpwcmVzcyBvZiB0aGUgcG93ZXIga2V5IGFmdGVyd2FyZHMganVtcHMgYmFj
ayB0byB0aGUga2VybmVsIHJlc3VtZQphZGRyZXNzLCB3aGVyZSBub3RoaW5nIGlzIHdhaXRpbmcs
IGFuZCB0aGUgYm9hcmQgaGFuZ3MgdW50aWwgaXQgaXMKdW5wbHVnZ2VkLgoKVGhlIHZlbmRvciBr
ZXJuZWwgYXZvaWRzIHRoaXMgaW4gdHdvIHN0ZXBzLCBib3RoIG5lZWRlZDoKCiAtIHNldCB0aGUg
ZmlybXdhcmUgc2h1dGRvd24gZmxhZyAoU01DIDB4ODIwMDAwNDIsIGFyZ3VtZW50IDEpIHJpZ2h0
CiAgIGJlZm9yZSBTWVNURU1fT0ZGLCB3aGljaCBtYWtlcyB0aGUgZmlybXdhcmUgY29sZC1ib290
IG9uIHRoZSBwb3dlcgogICBrZXkgaW5zdGVhZCBvZiByZXN1bWluZzsKIC0gdGFrZSB0aGUgc2Vj
b25kYXJ5IENQVXMgZG93biB0aHJvdWdoIFBTQ0kgQ1BVX09GRiBmaXJzdC4gV2l0aCB0aGVtCiAg
IG9ubHkgcGFya2VkIGluIHRoZSBrZXJuZWwsIHRoZSBmaXJtd2FyZSB3YWtlLXVwIHBhdGggaGFu
Z3MgYXMgd2VsbC4KClJlZ2lzdGVyIGEgcG93ZXItb2ZmIHByZXBhcmUgaGFuZGxlciB0aGF0IHN0
b3BzIHRoZSBzZWNvbmRhcnkgQ1BVcyBhbmQKYSBoaWdoIHByaW9yaXR5IHBvd2VyLW9mZiBoYW5k
bGVyIHRoYXQgc2V0cyB0aGUgZmxhZywgZm9yIHRoZQphbWxvZ2ljLG1lc29uLXM0LXNtIGNvbXBh
dGlibGUgb25seS4KClRlc3RlZCBvbiBhbiBTOTA1VzIgYm9hcmQ6IHBvd2Vyb2ZmIGZvbGxvd2Vk
IGJ5IHRoZSBwb3dlciBrZXkKY29sZC1ib290cyB0aGUgYm9hcmQuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBk
cml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgICAgICAgfCA0NiArKysrKysrKysrKysr
KysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmggfCAg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgYi9kcml2ZXJzL2Zpcm13YXJlL21lc29uL21l
c29uX3NtLmMKaW5kZXggYWI5NzUxYTU5YjU1Li41NDEwMzg2NjAzYzcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYworKysgYi9kcml2ZXJzL2Zpcm13YXJlL21l
c29uL21lc29uX3NtLmMKQEAgLTEwLDYgKzEwLDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2FybS1z
bWNjYy5oPgogI2luY2x1ZGUgPGxpbnV4L2J1Zy5oPgorI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgog
I2luY2x1ZGUgPGxpbnV4L2lvLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVk
ZSA8bGludXgvb2YuaD4KQEAgLTE3LDYgKzE4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9wcmludGsuaD4KICNpbmNsdWRlIDxsaW51eC9w
cm9wZXJ0eS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPgogI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KICAjaW5jbHVkZSA8bGludXgvc2xhYi5o
PgpAQCAtNDgsNiArNTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX3NtX2NoaXAgZ3hi
Yl9jaGlwID0gewogCQlDTUQoU01fVEhFUk1BTF9DQUxJQl9SRUFELAkweDgyMDAwMDQ3KSwKIAkJ
Q01EKFNNX0ExX1BXUkNfU0VULAkJMHg4MjAwMDA5MyksCiAJCUNNRChTTV9BMV9QV1JDX0dFVCwJ
CTB4ODIwMDAwOTUpLAorCQlDTUQoU01fU0VUX1BPV0VST0ZGX0ZMQUcsCTB4ODIwMDAwNDIpLAog
CQl7IC8qIHNlbnRpbmVsICovIH0sCiAJfSwKIH07CkBAIC0zMDMsNiArMzA2LDQ1IEBAIHN0YXRp
YyBzdHJ1Y3QgYXR0cmlidXRlICptZXNvbl9zbV9zeXNmc19hdHRyc1tdID0gewogfTsKIEFUVFJJ
QlVURV9HUk9VUFMobWVzb25fc21fc3lzZnMpOwogCisvKgorICogVGhlIFM0IGZpcm13YXJlIGlt
cGxlbWVudHMgUFNDSSBTWVNURU1fT0ZGIGFzIEREUiBzZWxmLXJlZnJlc2g6IG9uIHRoZQorICog
cG93ZXIga2V5IGl0IGp1bXBzIGJhY2sgdG8gdGhlIGtlcm5lbCBpbnN0ZWFkIG9mIGJvb3Rpbmcs
IHdoaWNoIGhhbmdzIHRoZQorICogYm9hcmQuIFNldHRpbmcgdGhlIHNodXRkb3duIGZsYWcgZmly
c3QgbWFrZXMgaXQgY29sZC1ib290IGluc3RlYWQsIGFuZCB0aGUKKyAqIHNlY29uZGFyeSBDUFVz
IG11c3QgaGF2ZSBiZWVuIHRha2VuIGRvd24gdGhyb3VnaCBQU0NJIENQVV9PRkYgYmVmb3JlaGFu
ZCwKKyAqIG90aGVyd2lzZSB0aGUgd2FrZS11cCBwYXRoIGhhbmdzIGFzIHdlbGwuCisgKi8KK3N0
YXRpYyBpbnQgbWVzb25fc21fcG93ZXJfb2ZmX3ByZXBhcmUoc3RydWN0IHN5c19vZmZfZGF0YSAq
ZGF0YSkKK3sKKwlpZiAoZnJlZXplX3NlY29uZGFyeV9jcHVzKDApKQorCQlwcl93YXJuKCJtZXNv
bi1zbTogZmFpbGVkIHRvIHN0b3Agc2Vjb25kYXJ5IENQVXNcbiIpOworCisJcmV0dXJuIE5PVElG
WV9ET05FOworfQorCitzdGF0aWMgaW50IG1lc29uX3NtX3Bvd2VyX29mZihzdHJ1Y3Qgc3lzX29m
Zl9kYXRhICpkYXRhKQoreworCW1lc29uX3NtX2NhbGwoZGF0YS0+Y2JfZGF0YSwgU01fU0VUX1BP
V0VST0ZGX0ZMQUcsIE5VTEwsIDEsIDAsIDAsIDAsIDApOworCisJcmV0dXJuIE5PVElGWV9ET05F
OworfQorCitzdGF0aWMgaW50IG1lc29uX3NtX3JlZ2lzdGVyX3Bvd2VyX29mZihzdHJ1Y3QgZGV2
aWNlICpkZXYsCisJCQkJICAgICAgIHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZSAqZncpCit7CisJ
aW50IHJldDsKKworCXJldCA9IGRldm1fcmVnaXN0ZXJfc3lzX29mZl9oYW5kbGVyKGRldiwgU1lT
X09GRl9NT0RFX1BPV0VSX09GRl9QUkVQQVJFLAorCQkJCQkgICAgU1lTX09GRl9QUklPX0RFRkFV
TFQsCisJCQkJCSAgICBtZXNvbl9zbV9wb3dlcl9vZmZfcHJlcGFyZSwgTlVMTCk7CisJaWYgKHJl
dCkKKwkJcmV0dXJuIHJldDsKKworCS8qIFJ1biBiZWZvcmUgdGhlIFBTQ0kgaGFuZGxlciwgd2hp
Y2ggbmV2ZXIgcmV0dXJucyAqLworCXJldHVybiBkZXZtX3JlZ2lzdGVyX3N5c19vZmZfaGFuZGxl
cihkZXYsIFNZU19PRkZfTU9ERV9QT1dFUl9PRkYsCisJCQkJCSAgICAgU1lTX09GRl9QUklPX0hJ
R0gsCisJCQkJCSAgICAgbWVzb25fc21fcG93ZXJfb2ZmLCBmdyk7Cit9CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX3NtX2lkc1tdID0gewogCXsgLmNvbXBhdGlibGUg
PSAiYW1sb2dpYyxtZXNvbi1neGJiLXNtIiwgLmRhdGEgPSAmZ3hiYl9jaGlwIH0sCiAJeyAvKiBz
ZW50aW5lbCAqLyB9LApAQCAtMzQzLDYgKzM4NSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBtZXNv
bl9zbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChkZXZtX29mX3Bs
YXRmb3JtX3BvcHVsYXRlKGRldikpCiAJCWdvdG8gdW5tYXBfb3V0X2Jhc2U7CiAKKwlpZiAob2Zf
ZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2RlLCAiYW1sb2dpYyxtZXNvbi1zNC1zbSIp
ICYmCisJICAgIG1lc29uX3NtX3JlZ2lzdGVyX3Bvd2VyX29mZihkZXYsIGZ3KSkKKwkJZGV2X3dh
cm4oZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIHBvd2VyLW9mZiBoYW5kbGVyc1xuIik7CisKIAlw
cl9pbmZvKCJzZWN1cmUtbW9uaXRvciBlbmFibGVkXG4iKTsKIAogCXJldHVybiAwOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oIGIvaW5jbHVkZS9s
aW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCmluZGV4IDNlYmMyYmQ5YTk3Ni4uM2YyZmEx
NjBlMzJmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3Nt
LmgKKysrIGIvaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCkBAIC0xNSw2
ICsxNSw3IEBAIGVudW0gewogCVNNX1RIRVJNQUxfQ0FMSUJfUkVBRCwKIAlTTV9BMV9QV1JDX1NF
VCwKIAlTTV9BMV9QV1JDX0dFVCwKKwlTTV9TRVRfUE9XRVJPRkZfRkxBRywKIH07CiAKIHN0cnVj
dCBtZXNvbl9zbV9maXJtd2FyZTsKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
