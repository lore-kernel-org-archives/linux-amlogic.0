Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A83606A33E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J0XJHGJJ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=SVo8vv/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a5CttEl2jIzM/xeCLhl6owcKM6FO2/zVJWQrdtRS9C8=; b=J0XJHGJJNt0hH7SWB68TUdyJYz
	al9y7MuIHK0RVrdt+mIK0zriddDf0zgxT6JE578jr9s1kU4aVEHVLe6g4PuJ1Dv1gJo6RzM0MnU0E
	mqwm8g0DYhGKW60fGd+zXCTDd4HXClSaKrdAswdQ4t2t3evF5CHze+P4wZBOSCoJg1M/te0P143Gq
	dFYe4KRcFXOrm3AO/W0fCpqrhitb5fslm1PrV3xKxJaOqGuOMNMwr9MEz/nXCdVyrXmfhkpNR+Rax
	8KwRI/IborV75IdivAHlapuKp1rDwn5uwG5smzZEibxzV9tBtVQH+bAdZbyh8cmnqfaP8Lj+5wIrD
	CSZbUY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTb-0000000C0EP-2tZY;
	Fri, 06 Nov 2026 10:47:19 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTV-0000000C05m-3XDm;
	Fri, 06 Nov 2026 10:47:15 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07I1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:07 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07I1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962027;
	bh=dS207nY+vKk8rnxpzl45dHmOZIC6VTVoDl1e+9+ycpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SVo8vv/GKms+n1faf6VXArc34kbT40bmzWU+cpItCaCxFgc/IjgHVqwJUyvZdi80K
	 Tf1wIDVJZRpyYQpYgmCO9KYfCou70gY88OeW+Ej5dFXbQXljBkYlCXvZM4+KphL0Yq
	 QSHq3PNhQ/fWkoJRLhJYyuJDpqQxIyx1uAMX3KEo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 03/10] arm64: dts: amlogic: meson-s4: add the PSCI CPU idle state
Date: Fri,  6 Nov 2026 11:46:52 +0100
Message-ID: <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024714_620080_8F9912A4 
X-CRM114-Status: GOOD (  11.46  )
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
CgpUaGUgZmlybXdhcmUgaW1wbGVtZW50cyBQU0NJIDEuMCB3aXRob3V0IE9TLWluaXRpYXRlZCBt
b2RlLiBBZGQgdGhlCmNvcmUgcG93ZXItZG93biBzdGF0ZSB0aGUgdmVuZG9yIGtlcm5lbCB1c2Vz
IChwb3dlciBzdGF0ZSAweDEwMDAwKS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4g
S8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tczQuZHRzaQppbmRleCA2NzVkYjAyYThkNWUuLjU3MjcwZmJmYjRhNyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKQEAgLTIyLDYgKzIyLDcgQEAg
Y3B1MDogY3B1QDAgewogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWEzNSI7CiAJCQlyZWcg
PSA8MHgwIDB4MD47CiAJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOworCQkJY3B1LWlkbGUtc3Rh
dGVzID0gPCZjcHVfc2xlZXA+OwogCQkJZC1jYWNoZS1saW5lLXNpemUgPSA8NjQ+OwogCQkJZC1j
YWNoZS1zaXplID0gPDB4ODAwMD47CiAJCQlkLWNhY2hlLXNldHMgPSA8MTI4PjsKQEAgLTM2LDYg
KzM3LDcgQEAgY3B1MTogY3B1QDEgewogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWEzNSI7
CiAJCQlyZWcgPSA8MHgwIDB4MT47CiAJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOworCQkJY3B1
LWlkbGUtc3RhdGVzID0gPCZjcHVfc2xlZXA+OwogCQkJZC1jYWNoZS1saW5lLXNpemUgPSA8NjQ+
OwogCQkJZC1jYWNoZS1zaXplID0gPDB4ODAwMD47CiAJCQlkLWNhY2hlLXNldHMgPSA8MTI4PjsK
QEAgLTUwLDYgKzUyLDcgQEAgY3B1MjogY3B1QDIgewogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29y
dGV4LWEzNSI7CiAJCQlyZWcgPSA8MHgwIDB4Mj47CiAJCQllbmFibGUtbWV0aG9kID0gInBzY2ki
OworCQkJY3B1LWlkbGUtc3RhdGVzID0gPCZjcHVfc2xlZXA+OwogCQkJZC1jYWNoZS1saW5lLXNp
emUgPSA8NjQ+OwogCQkJZC1jYWNoZS1zaXplID0gPDB4ODAwMD47CiAJCQlkLWNhY2hlLXNldHMg
PSA8MTI4PjsKQEAgLTY0LDYgKzY3LDcgQEAgY3B1MzogY3B1QDMgewogCQkJY29tcGF0aWJsZSA9
ICJhcm0sY29ydGV4LWEzNSI7CiAJCQlyZWcgPSA8MHgwIDB4Mz47CiAJCQllbmFibGUtbWV0aG9k
ID0gInBzY2kiOworCQkJY3B1LWlkbGUtc3RhdGVzID0gPCZjcHVfc2xlZXA+OwogCQkJZC1jYWNo
ZS1saW5lLXNpemUgPSA8NjQ+OwogCQkJZC1jYWNoZS1zaXplID0gPDB4ODAwMD47CiAJCQlkLWNh
Y2hlLXNldHMgPSA8MTI4PjsKQEAgLTgyLDYgKzg2LDI2IEBAIGwyOiBsMi1jYWNoZTAgewogCQkJ
Y2FjaGUtbGluZS1zaXplID0gPDY0PjsKIAkJCWNhY2hlLXNldHMgPSA8MTAyND47CiAJCX07CisK
KwkJLyoKKwkJICogVGhlIGZpcm13YXJlIHJlcG9ydHMgUFNDSSAxLjAgd2l0aG91dCBPU0ksIHNv
IHRoZSBwbGF0Zm9ybQorCQkgKiBpdHNlbGYgZGVjaWRlcyBob3cgZGVlcCB0byBnbyBhbmQgdGhl
IGtlcm5lbCBvbmx5IGhhcyB0aGlzCisJCSAqIG9uZSBjb3JlIHN0YXRlIHRvIG9mZmVyLiBUaGUg
c3VzcGVuZCBwYXJhbWV0ZXIgaXMgaW4gdGhlCisJCSAqIG9yaWdpbmFsIGZvcm1hdCAtIGJpdCAx
NiBhc2tzIGZvciBhIHBvd2VyIGRvd24gYXQgYWZmaW5pdHkKKwkJICogbGV2ZWwgMCAtIGFuZCBt
YXRjaGVzIHdoYXQgdGhlIHZlbmRvciBrZXJuZWwgcGFzc2VzLgorCQkgKi8KKwkJaWRsZS1zdGF0
ZXMgeworCQkJZW50cnktbWV0aG9kID0gInBzY2kiOworCisJCQljcHVfc2xlZXA6IGNwdS1zbGVl
cCB7CisJCQkJY29tcGF0aWJsZSA9ICJhcm0saWRsZS1zdGF0ZSI7CisJCQkJYXJtLHBzY2ktc3Vz
cGVuZC1wYXJhbSA9IDwweDAwMDEwMDAwPjsKKwkJCQlsb2NhbC10aW1lci1zdG9wOworCQkJCWVu
dHJ5LWxhdGVuY3ktdXMgPSA8NDAwMD47CisJCQkJZXhpdC1sYXRlbmN5LXVzID0gPDUwMDA+Owor
CQkJCW1pbi1yZXNpZGVuY3ktdXMgPSA8MTAwMDA+OworCQkJfTsKKwkJfTsKIAl9OwogCiAJdGlt
ZXIgewotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
