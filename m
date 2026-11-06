Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1633606D80D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cn1A78nf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=kat0nvxk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z4BJqkqkrfQ/VX8SYJPU/c36ugy9qQsfDLckKNDpraE=; b=cn1A78nf8OyaHC9UOJjM07jCFm
	ZPXDjrA2rXJlYPqNuvx3tzD8c0v+4BMBnGMUytkD7jO8h1Uk4tMZNnzPsp5+F40RgYFy1hCgoS+jD
	SLmmjWOKWXOqoatdHXFIhkQWqmaqQeCZYH6cEd3h36iT9iY01+BLWycGHSIh4N82SogsQtZj8NIiN
	MoebADjGbvB6ygJOTZvABxQwEamjNJTqcz/tEsEC9OuBjthb8clQov1sckpC9nn7K2+s07o6yFcnO
	26SHul7ewHHmbdj7dELIb2YJv6DgJGOMWmzRR4MlDHGLSyo3npNcfL9r1bNRg8K57cCVybqoiRkAq
	AofFWnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTc-0000000C0Fy-0ugX;
	Fri, 06 Nov 2026 10:47:20 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTU-0000000C05M-3wy2;
	Fri, 06 Nov 2026 10:47:16 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07H1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07H1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962026;
	bh=+g9463WTbWJYWWZfyXkIqbJXILiV4EfzrhMlVFy+tgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kat0nvxkt6KdsrhA9+sloBt61oXZPE6eXY1/h+Nwn3bwRh5IbIsd36ZfeZRw9N+dN
	 Xm75dvO1h05flE3AbKAYfHXnd8pxxovVKFS49LGuD+r9KLv11wgmLVv6tZrBJjJwB8
	 tT28uMffzcMYG/Dc9+KQmIevGuKK56Ppk7PcBTu8=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 02/10] arm64: dts: amlogic: meson-s4: describe the CPU caches
Date: Fri,  6 Nov 2026 11:46:51 +0100
Message-ID: <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024714_632047_B3C9C058 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
CgpEZXNjcmliZSB0aGUgcGVyLWNvcmUgTDEgY2FjaGVzIGFuZCB0aGUgc2hhcmVkIDUxMiBLaUIg
TDIgY2FjaGUsIHdpdGgKdGhlIGdlb21ldHJ5IHRoZSBjb3JlcyByZXBvcnQgaW4gQ0NTSURSX0VM
MSBvbiBhbiBTOTA1VzIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXIt
RHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tczQuZHRzaSB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1zNC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LXM0LmR0c2kKaW5kZXggMmE2ZmJkNTMwODM2Li42NzVkYjAyYThkNWUgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCkBAIC0yMiw2ICsyMiwxMyBAQCBjcHUwOiBj
cHVAMCB7CiAJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTM1IjsKIAkJCXJlZyA9IDwweDAg
MHgwPjsKIAkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7CisJCQlkLWNhY2hlLWxpbmUtc2l6ZSA9
IDw2ND47CisJCQlkLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKKwkJCWQtY2FjaGUtc2V0cyA9IDwx
Mjg+OworCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8NjQ+OworCQkJaS1jYWNoZS1zaXplID0gPDB4
ODAwMD47CisJCQlpLWNhY2hlLXNldHMgPSA8MjU2PjsKKwkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8
JmwyPjsKIAkJfTsKIAogCQljcHUxOiBjcHVAMSB7CkBAIC0yOSw2ICszNiwxMyBAQCBjcHUxOiBj
cHVAMSB7CiAJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTM1IjsKIAkJCXJlZyA9IDwweDAg
MHgxPjsKIAkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7CisJCQlkLWNhY2hlLWxpbmUtc2l6ZSA9
IDw2ND47CisJCQlkLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKKwkJCWQtY2FjaGUtc2V0cyA9IDwx
Mjg+OworCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8NjQ+OworCQkJaS1jYWNoZS1zaXplID0gPDB4
ODAwMD47CisJCQlpLWNhY2hlLXNldHMgPSA8MjU2PjsKKwkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8
JmwyPjsKIAkJfTsKIAogCQljcHUyOiBjcHVAMiB7CkBAIC0zNiw2ICs1MCwxMyBAQCBjcHUyOiBj
cHVAMiB7CiAJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTM1IjsKIAkJCXJlZyA9IDwweDAg
MHgyPjsKIAkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7CisJCQlkLWNhY2hlLWxpbmUtc2l6ZSA9
IDw2ND47CisJCQlkLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKKwkJCWQtY2FjaGUtc2V0cyA9IDwx
Mjg+OworCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8NjQ+OworCQkJaS1jYWNoZS1zaXplID0gPDB4
ODAwMD47CisJCQlpLWNhY2hlLXNldHMgPSA8MjU2PjsKKwkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8
JmwyPjsKIAkJfTsKIAogCQljcHUzOiBjcHVAMyB7CkBAIC00Myw2ICs2NCwyMyBAQCBjcHUzOiBj
cHVAMyB7CiAJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTM1IjsKIAkJCXJlZyA9IDwweDAg
MHgzPjsKIAkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7CisJCQlkLWNhY2hlLWxpbmUtc2l6ZSA9
IDw2ND47CisJCQlkLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKKwkJCWQtY2FjaGUtc2V0cyA9IDwx
Mjg+OworCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8NjQ+OworCQkJaS1jYWNoZS1zaXplID0gPDB4
ODAwMD47CisJCQlpLWNhY2hlLXNldHMgPSA8MjU2PjsKKwkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8
JmwyPjsKKwkJfTsKKworCQkvKiBHZW9tZXRyeSBhcyBDQ1NJRFJfRUwxIHJlcG9ydHMgaXQgb24g
UzkwNVcyLiAqLworCQlsMjogbDItY2FjaGUwIHsKKwkJCWNvbXBhdGlibGUgPSAiY2FjaGUiOwor
CQkJY2FjaGUtbGV2ZWwgPSA8Mj47CisJCQljYWNoZS11bmlmaWVkOworCQkJY2FjaGUtc2l6ZSA9
IDwweDgwMDAwPjsgLyogTDIuIDUxMiBLQiAqLworCQkJY2FjaGUtbGluZS1zaXplID0gPDY0PjsK
KwkJCWNhY2hlLXNldHMgPSA8MTAyND47CiAJCX07CiAJfTsKIAotLSAKMi41Ni4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
