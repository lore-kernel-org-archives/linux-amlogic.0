Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6FD606D829
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ot+C1yId;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=dCSUZjxD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7pymtSSOBsjnxoAmMDYk7NR/9hbOtLrDAb9K+HIs3Oc=; b=Ot+C1yIdl9+bGHrldwpd19Vp2G
	swK3lA0F3dES9YLRiy4ZriajEsLMHRd1TfDWDmTbgBZJM/OL81AiGYvBYJy98XWPJFpDCxHOOsBOd
	KbGcpYl89DeBHB8/XPE9uXWA0D2R2DEK1Hs6FG2iQeB9LHO/47hvALxO0fFguFeXH6OuJ5po/pWkz
	RCjO2W9Q2pkpaLAIu0EqG2itJ9TDK2JTwCZaVn6p+CBECnJHRJHPdUtCHkpRgKKnDNq3b9dz1PXgR
	QptWPg63AUmF/js0wn1qWUFbbRcFUulGY7qufWHMepU4mv2K6VyAwyqn0D18wWj8Ketl/3/3cPJ75
	Io/pSEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTd-0000000C0Jj-3TaO;
	Fri, 06 Nov 2026 10:47:21 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTY-0000000C06i-1I1R;
	Fri, 06 Nov 2026 10:47:18 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07K1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:09 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07K1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962029;
	bh=TlLop1f5KLIoXxFGbo5pP4WCmCI9XMrzolGtBjxYqxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dCSUZjxD1QrtEmx1pU2Gc2RTo4R42OPJhTa97VP7hTZnmS6Swf7aBXFQJu8qPa70B
	 dwatHvO2BfEleR7En2RKeVPqmvqxxKUujbeaHWaorhx2y2VrEnGMyOQeV1oYMZxSG5
	 mxNBPws9phn6tbSsb3QXYhZpBF19L+RKVH3LOV0w=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 05/10] arm64: dts: amlogic: meson-s4: add the Mali GPU
Date: Fri,  6 Nov 2026 11:46:54 +0100
Message-ID: <20261106104659.54656-6-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024716_716195_8B2B0CB3 
X-CRM114-Status: GOOD (  12.52  )
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
CgpBZGQgdGhlIE1hbGktRzMxIEdQVSB3aXRoIGl0cyBvcGVyYXRpbmcgcG9pbnRzLiBUaGUgR1BV
IHJhaWwgaXMgbm90CnN3aXRjaGFibGUsIHNvIGl0IHNjYWxlcyBieSBmcmVxdWVuY3kgb25seSwg
b3ZlciB0aGUgZml4ZWQgZmNsayBkZXJpdmVkCnJhdGVzIHRoZSB2ZW5kb3IgRFZGUyB0YWJsZSB1
c2VzIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJh
eGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tczQuZHRzaSB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1zNC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0
LmR0c2kKaW5kZXggNzkzYzdiYjk1MTJlLi42OTEwNWM4YWJmMTIgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCkBAIC0xMjYsNiArMTI2LDQwIEBAIHZydGM6IHJ0
Y0BmZTAxMDI4OCB7CiAJCXJlZyA9IDwweDAgMHhmZTAxMDI4OCAweDAgMHg0PjsKIAl9OwogCisJ
LyoKKwkgKiBUaGUgTWFsaSByYWlsIGlzIG5vdCBzd2l0Y2hhYmxlIG9uIHRoaXMgU29DLCBzbyB0
aGUgR1BVIHNjYWxlcyBieQorCSAqIGZyZXF1ZW5jeSBhbG9uZS4gRXZlcnkgcmF0ZSBoZXJlIGlz
IG9uZSBvZiB0aGUgZml4ZWQgZmNsayBkaXZpZGVycywKKwkgKiBvcHRpb25hbGx5IGhhbHZlZCBv
ciBxdWFydGVyZWQgYnkgdGhlIG1hbGkgZGl2aWRlciwgd2hpY2ggaXMgd2hhdAorCSAqIHRoZSB2
ZW5kb3IgRFZGUyB0YWJsZSB1c2VzIGFzIHdlbGwuIEl0cyA4NTAgTUh6IHBvaW50IGlzIGxlZnQg
b3V0CisJICogYmVjYXVzZSBpdCBuZWVkcyBHUDAgUExMLCBhbmQgdGhlIG1hbGkgbXV4IGlzIG5v
dCBhbGxvd2VkIHRvCisJICogcmVwcm9ncmFtIGl0cyBwYXJlbnRzLgorCSAqLworCWdwdV9vcHBf
dGFibGU6IG9wcC10YWJsZS1ncHUgeworCQljb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2ludHMt
djIiOworCisJCW9wcC0xMjQ5OTk5OTggeworCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwxMjQ5OTk5
OTg+OworCQl9OworCQlvcHAtMjQ5OTk5OTk2IHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MjQ5
OTk5OTk2PjsKKwkJfTsKKwkJb3BwLTI4NTcxNDI4MSB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQg
PDI4NTcxNDI4MT47CisJCX07CisJCW9wcC0zOTk5OTk5OTQgeworCQkJb3BwLWh6ID0gL2JpdHMv
IDY0IDwzOTk5OTk5OTQ+OworCQl9OworCQlvcHAtNDk5OTk5OTkyIHsKKwkJCW9wcC1oeiA9IC9i
aXRzLyA2NCA8NDk5OTk5OTkyPjsKKwkJfTsKKwkJb3BwLTY2NjY2NjY1NiB7CisJCQlvcHAtaHog
PSAvYml0cy8gNjQgPDY2NjY2NjY1Nj47CisJCX07CisJCW9wcC03OTk5OTk5ODggeworCQkJb3Bw
LWh6ID0gL2JpdHMvIDY0IDw3OTk5OTk5ODg+OworCQl9OworCX07CisKIAl4dGFsOiB4dGFsLWNs
ayB7CiAJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwogCQljbG9jay1mcmVxdWVuY3kgPSA8
MjQwMDAwMDA+OwpAQCAtMTY0LDYgKzE5OCwyNyBAQCBzb2MgewogCQkjc2l6ZS1jZWxscyA9IDwy
PjsKIAkJcmFuZ2VzOwogCisJCWdwdTogZ3B1QGZlNDAwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAi
YW1sb2dpYyxtZXNvbi1nMTJhLW1hbGkiLCAiYXJtLG1hbGktYmlmcm9zdCI7CisJCQlyZWcgPSA8
MHgwIDB4ZmU0MDAwMDAgMHgwIDB4NDAwMDA+OworCQkJaW50ZXJydXB0LW5hbWVzID0gImpvYiIs
ICJtbXUiLCAiZ3B1IjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNDYgSVJRX1RZUEVfTEVW
RUxfSElHSD4sCisJCQkJICAgICA8R0lDX1NQSSAxNDUgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJ
CQkJICAgICA8R0lDX1NQSSAxNDQgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkvKgorCQkJICog
Q0xLSURfTUFMSSBpcyBvbmx5IHRoZSBzeXN0ZW0gYnVzIGdhdGUuIFRoZSBjb3JlIGlzCisJCQkg
KiBmZWQgYnkgdGhlIGdsaXRjaC1mcmVlIG1hbGkgbXV4LCB3aGljaCBpcyB0aGUgY2xvY2sKKwkJ
CSAqIHRoZSBPUFAgdGFibGUgc2NhbGVzLgorCQkJICovCisJCQljbG9ja3MgPSA8JmNsa2NfcGVy
aXBocyBDTEtJRF9NQUxJX1NFTD4sCisJCQkJIDwmY2xrY19wZXJpcGhzIENMS0lEX01BTEk+Owor
CQkJY2xvY2stbmFtZXMgPSAiY29yZSIsICJidXMiOworCQkJcmVzZXRzID0gPCZyZXNldCBSRVNF
VF9NQUxJX0FQQj4sIDwmcmVzZXQgUkVTRVRfTUFMST47CisJCQlvcGVyYXRpbmctcG9pbnRzLXYy
ID0gPCZncHVfb3BwX3RhYmxlPjsKKwkJCSNjb29saW5nLWNlbGxzID0gPDI+OworCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKwkJfTsKKwogCQlnaWM6IGludGVycnVwdC1jb250cm9sbGVyQGZmZjAx
MDAwIHsKIAkJCWNvbXBhdGlibGUgPSAiYXJtLGdpYy00MDAiOwogCQkJI2ludGVycnVwdC1jZWxs
cyA9IDwzPjsKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
