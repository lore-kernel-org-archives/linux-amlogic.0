Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C507606D828
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=asx95T/+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=WDiuIdwm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=baBMnji0rhF5v9d0fyjiyWTpy+fgcoTGP2f6j/LPvd0=; b=asx95T/+1Qdh9UVGYU4GRi/xwU
	PaLpNAeYfe4EDyfWCvT4mowpHN9OZMmE5jRb6fKr4bu7OfkvxV8gFq7GM+rgx+8mH9d/7mtX94aoM
	c+U98yCrBEub7sP8oCbKtf8Ic8364VCXWbE3oOCzjWMv3wk1GuTq9fQQscNlqne2dU5OodZxyndjw
	08DUaOi/NBX8qE/ZSCJb+2HbPt4uOKsZYPWnhAXMEliOB/9r2gexIgYh9uuh005h1HvaIpaWjg0tC
	MupMTWCrjdZnjieKiuAOQTnqYQkwIUsC0UIi+HzNF9gtOrGlFtmWl6xw1EYgfRWDmAhc4rMf2LCY7
	TfaRyL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTl-0000000C0ZO-1ZCG;
	Fri, 06 Nov 2026 10:47:29 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTc-0000000C0D3-0Fxj;
	Fri, 06 Nov 2026 10:47:24 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07O1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:13 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07O1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962034;
	bh=pPs+LFjQd4/vwzx0cx5k8n7Xns8+xDNlOq6HRQ/nnB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WDiuIdwm8UFous+4e6je7OsE/8ufj1XtOgyvdnUxhllJALqtuVpEksTgZHay5aGN2
	 OSUw31Y4Evz4a9e98UBjvLW2OBd38tJ2O2r6cA+qKRwc50nhkulAKp0Gczk+44weBF
	 7rfLXx9GIzn+uaIW0S+fA31LeNfKiUyl4zfxnncc=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC controller
Date: Fri,  6 Nov 2026 11:46:58 +0100
Message-ID: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024720_390893_A06795C6 
X-CRM114-Status: UNSURE (   8.61  )
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
CgpBZGQgdGhlIEFPX0NFQ19BIGNvbnRyb2xsZXIgYW5kIGl0cyBwaW4gZ3JvdXAuCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5k
ZT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDI0ICsr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKaW5kZXggMTU1OTk3NjQ5
ZGMzLi5kZDUxZTc4NmQyOWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1zNC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1z
NC5kdHNpCkBAIC03NDcsNiArNzQ3LDE0IEBAIG11eCB7CiAJCQkJCX07CiAJCQkJfTsKIAorCQkJ
CWFvX2NlY19hX3BpbnM6IGFvLWNlYy1hIHsKKwkJCQkJbXV4IHsKKwkJCQkJCWdyb3VwcyA9ICJh
b19jZWNfYSI7CisJCQkJCQlmdW5jdGlvbiA9ICJhb19jZWNfYSI7CisJCQkJCQliaWFzLWRpc2Fi
bGU7CisJCQkJCX07CisJCQkJfTsKKwogCQkJfTsKIAogCQkJZ3Bpb19pbnRjOiBpbnRlcnJ1cHQt
Y29udHJvbGxlckA0MDgwIHsKQEAgLTk3MCw2ICs5NzgsMjIgQEAgc2VjX2FvOiBhby1zZWN1cmVA
MTAyMjAgewogCQkJCWFtbG9naWMsaGFzLWNoaXAtaWQ7CiAJCQl9OwogCisJCQljZWNfYTogY2Vj
QDQ0MDAwIHsKKwkJCQljb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3gtYW8tY2VjIjsKKwkJ
CQlyZWcgPSA8MHgwIDB4NDQwMDAgMHgwIDB4MTQ+OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSAxNzkgSVJRX1RZUEVfRURHRV9SSVNJTkc+OworCQkJCWNsb2NrcyA9IDwmY2xrY19wZXJpcGhz
IENMS0lEX0NFQ0FfMzJLX0NMS09VVD47CisJCQkJY2xvY2stbmFtZXMgPSAiY29yZSI7CisJCQkJ
YXNzaWduZWQtY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfQ0VDQV8zMktfRElWPiwKKwkJ
CQkJCSAgPCZjbGtjX3BlcmlwaHMgQ0xLSURfQ0VDQV8zMktfU0VMX1BSRT4sCisJCQkJCQkgIDwm
Y2xrY19wZXJpcGhzIENMS0lEX0NFQ0FfMzJLX1NFTD47CisJCQkJYXNzaWduZWQtY2xvY2stcGFy
ZW50cyA9IDwwPiwKKwkJCQkJCQkgPCZjbGtjX3BlcmlwaHMgQ0xLSURfQ0VDQV8zMktfRElWPiwK
KwkJCQkJCQkgPCZjbGtjX3BlcmlwaHMgQ0xLSURfQ0VDQV8zMktfU0VMX1BSRT47CisJCQkJYXNz
aWduZWQtY2xvY2stcmF0ZXMgPSA8MzI3Njg+LCA8MD4sIDwwPjsKKwkJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOworCQkJfTsKKwogCQkJaXI6IGlyQDg0MDQwIHsKIAkJCQljb21wYXRpYmxlID0gImFt
bG9naWMsbWVzb24tczQtaXIiOwogCQkJCXJlZyA9IDwweDAgMHg4NDA0MCAweDAgMHgzMD47Ci0t
IAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
