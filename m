Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D802D606A329
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eiwlCZS3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=e+I20grL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OLRUgTlhnrwUxTP7vnEBzyA4TemdZfoLlyf9bze1SRI=; b=eiwlCZS3I2DobEERODnHEwi/01
	ymffw1dZK1Mq2h9446uCTABZ0aH+mjNJC280+rALe3M4uKX3/hiWvuvIROuDA03JpcrK0Y7mwW7va
	iMVMig3OoOf1PzuI8PUqx8bhoLQODnZmM5npQnxt93nRYjKfwEpD6PJQw2U49hef9dBbI1ssoG4OR
	sm9bZej2CHS1ZG3KllLUnzoEUYER/6XMiwlJIN8mgndBDaCqdSsAuG88T0z+e1TvWXBQsxWtg27Y6
	UKEvKnQbq+gs/QiGLg8hNMzDp4tR+RvE0o9QZgBpgsPYccytxs+dWzOUHQbRFRDdRyZ2EPOwt4VZr
	GdUy2qKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2O-0000000BtK5-1UQb;
	Fri, 06 Nov 2026 10:19:12 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2L-0000000BtFa-3SOF;
	Fri, 06 Nov 2026 10:19:11 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIuX11863787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:02 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIuX11863787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960342;
	bh=FQyyOJeI2Mbet+u86QRL7Xi1ZkmhZ27qXA46SycGnFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e+I20grLGd86uiKasozl/mnJLOHUxrDTCHuOc/NeGDAH0wZaQku++hAwGEzxF+L9Y
	 aM+krN8L/c7skFfIfdqqR+LZqIsXdZJDFqFjIrdeJV9DRdC8vGdsPtbBj2n0hCItso
	 QqJaOWZRmoQ7wrrXWrvp3SQVycro7cqFP/BstzYY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 2/2] firmware: meson: sm: make power-off work on S4
Date: Fri,  6 Nov 2026 11:18:54 +0100
Message-ID: <20261106101854.46569-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021910_216570_9E29F210 
X-CRM114-Status: GOOD (  17.30  )
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
Z3MgYXMgd2VsbC4KClJlZ2lzdGVyIGEgcG93ZXItb2ZmIHByZXBhcmUgaGFuZGxlciB0aGF0IGRv
ZXMgYm90aCwgZm9yIHRoZQphbWxvZ2ljLG1lc29uLXM0LXNtIGNvbXBhdGlibGUgb25seS4gSXQg
b2ZmbGluZXMgdGhlIHNlY29uZGFyeSBDUFVzCndpdGggcmVtb3ZlX2NwdSgpOiBtYWNoaW5lX3Bv
d2VyX29mZigpIGxhdGVyIG9ubHkgcGFya3MgdGhlbSB3aXRoCnNtcF9zZW5kX3N0b3AoKSwgYW5k
IENQVSBob3RwbHVnIG5vIGxvbmdlciB3b3JrcyBhdCB0aGF0IHBvaW50LgoKVGVzdGVkIG9uIGFu
IFM5MDVXMiBib2FyZDogcG93ZXJvZmYgZm9sbG93ZWQgYnkgdGhlIHBvd2VyIGtleQpjb2xkLWJv
b3RzIHRoZSBib2FyZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1E
cmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KIGRyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVz
b25fc20uYyAgICAgICB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGlu
dXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMzIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25f
c20uYyBiL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwppbmRleCBhYjk3NTFhNTli
NTUuLmRlMGM4ZTgwOWM1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNv
bl9zbS5jCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwpAQCAtMTAsNiAr
MTAsNyBAQAogCiAjaW5jbHVkZSA8bGludXgvYXJtLXNtY2NjLmg+CiAjaW5jbHVkZSA8bGludXgv
YnVnLmg+CisjaW5jbHVkZSA8bGludXgvY3B1Lmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4KICNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgpAQCAtMTcsNiAr
MTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxp
bnV4L3ByaW50ay5oPgogI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+CisjaW5jbHVkZSA8bGlu
dXgvcmVib290Lmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9z
aXplcy5oPgogICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CkBAIC00OCw2ICs1MCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbWVzb25fc21fY2hpcCBneGJiX2NoaXAgPSB7CiAJCUNNRChTTV9USEVS
TUFMX0NBTElCX1JFQUQsCTB4ODIwMDAwNDcpLAogCQlDTUQoU01fQTFfUFdSQ19TRVQsCQkweDgy
MDAwMDkzKSwKIAkJQ01EKFNNX0ExX1BXUkNfR0VULAkJMHg4MjAwMDA5NSksCisJCUNNRChTTV9T
RVRfUE9XRVJPRkZfRkxBRywJMHg4MjAwMDA0MiksCiAJCXsgLyogc2VudGluZWwgKi8gfSwKIAl9
LAogfTsKQEAgLTMwMyw2ICszMDYsMjggQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKm1lc29u
X3NtX3N5c2ZzX2F0dHJzW10gPSB7CiB9OwogQVRUUklCVVRFX0dST1VQUyhtZXNvbl9zbV9zeXNm
cyk7CiAKKy8qCisgKiBUaGUgUzQgZmlybXdhcmUgaW1wbGVtZW50cyBQU0NJIFNZU1RFTV9PRkYg
YXMgRERSIHNlbGYtcmVmcmVzaDogb24gdGhlCisgKiBwb3dlciBrZXkgaXQganVtcHMgYmFjayB0
byB0aGUga2VybmVsIGluc3RlYWQgb2YgYm9vdGluZywgd2hpY2ggaGFuZ3MgdGhlCisgKiBib2Fy
ZC4gU2V0dGluZyB0aGUgc2h1dGRvd24gZmxhZyBmaXJzdCBtYWtlcyBpdCBjb2xkLWJvb3QgaW5z
dGVhZCwgYW5kIHRoZQorICogc2Vjb25kYXJ5IENQVXMgbXVzdCBoYXZlIGJlZW4gdGFrZW4gZG93
biB0aHJvdWdoIFBTQ0kgQ1BVX09GRiBiZWZvcmVoYW5kLAorICogb3RoZXJ3aXNlIHRoZSB3YWtl
LXVwIHBhdGggaGFuZ3MgYXMgd2VsbC4gbWFjaGluZV9wb3dlcl9vZmYoKSBvbmx5IHBhcmtzCisg
KiB0aGVtLCBzbyBvZmZsaW5lIHRoZW0gaGVyZSwgd2hpbGUgQ1BVIGhvdHBsdWcgc3RpbGwgd29y
a3MuCisgKi8KK3N0YXRpYyBpbnQgbWVzb25fc21fcG93ZXJfb2ZmX3ByZXBhcmUoc3RydWN0IHN5
c19vZmZfZGF0YSAqZGF0YSkKK3sKKwl1bnNpZ25lZCBpbnQgY3B1LCBwcmltYXJ5ID0gY3B1bWFz
a19maXJzdChjcHVfb25saW5lX21hc2spOworCisJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpIHsK
KwkJaWYgKGNwdSAhPSBwcmltYXJ5ICYmIHJlbW92ZV9jcHUoY3B1KSkKKwkJCXByX3dhcm4oIm1l
c29uLXNtOiBmYWlsZWQgdG8gc3RvcCBDUFUldVxuIiwgY3B1KTsKKwl9CisKKwltZXNvbl9zbV9j
YWxsKGRhdGEtPmNiX2RhdGEsIFNNX1NFVF9QT1dFUk9GRl9GTEFHLCBOVUxMLCAxLCAwLCAwLCAw
LCAwKTsKKworCXJldHVybiBOT1RJRllfRE9ORTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbWVzb25fc21faWRzW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LG1lc29uLWd4YmItc20iLCAuZGF0YSA9ICZneGJiX2NoaXAgfSwKIAl7IC8qIHNlbnRpbmVsICov
IH0sCkBAIC0zNDMsNiArMzY4LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IG1lc29uX3NtX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKGRldm1fb2ZfcGxhdGZvcm1fcG9w
dWxhdGUoZGV2KSkKIAkJZ290byB1bm1hcF9vdXRfYmFzZTsKIAorCWlmIChvZl9kZXZpY2VfaXNf
Y29tcGF0aWJsZShkZXYtPm9mX25vZGUsICJhbWxvZ2ljLG1lc29uLXM0LXNtIikgJiYKKwkgICAg
ZGV2bV9yZWdpc3Rlcl9zeXNfb2ZmX2hhbmRsZXIoZGV2LCBTWVNfT0ZGX01PREVfUE9XRVJfT0ZG
X1BSRVBBUkUsCisJCQkJCSAgU1lTX09GRl9QUklPX0RFRkFVTFQsCisJCQkJCSAgbWVzb25fc21f
cG93ZXJfb2ZmX3ByZXBhcmUsIGZ3KSkKKwkJZGV2X3dhcm4oZGV2LCAiZmFpbGVkIHRvIHJlZ2lz
dGVyIHRoZSBwb3dlci1vZmYgaGFuZGxlclxuIik7CisKIAlwcl9pbmZvKCJzZWN1cmUtbW9uaXRv
ciBlbmFibGVkXG4iKTsKIAogCXJldHVybiAwOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9m
aXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oIGIvaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9t
ZXNvbl9zbS5oCmluZGV4IDNlYmMyYmQ5YTk3Ni4uM2YyZmExNjBlMzJmIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKKysrIGIvaW5jbHVkZS9saW51
eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCkBAIC0xNSw2ICsxNSw3IEBAIGVudW0gewogCVNN
X1RIRVJNQUxfQ0FMSUJfUkVBRCwKIAlTTV9BMV9QV1JDX1NFVCwKIAlTTV9BMV9QV1JDX0dFVCwK
KwlTTV9TRVRfUE9XRVJPRkZfRkxBRywKIH07CiAKIHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZTsK
LS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
