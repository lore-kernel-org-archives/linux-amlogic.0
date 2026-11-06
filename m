Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78403606A337
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DJwut+HD;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=lwxYVCwA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qa4ENDXZO14Yx+Y/8Mr47EypoMRV4wT7oH/0wsOO9NY=; b=DJwut+HDbALhUND1rOdivjM0CF
	JXW/cUIIEFXYxM6mP6AFTKiTEqsyLURugDCFKiVfMX/SmlvS5PhHu9CZadA7j6yliuIT40uGqr8ge
	VtqwtPlDPf+LTnYTLMloBaIAKp9Ji5t0gj7KUi4M5Z2uepWdzWa4adYeIKnipUtV7VlQAIUwON/jB
	MNY900X+IG7MF/uQsGI8iD1zepIwDL7CYM+jt9+o/QzZ0d/rgiEEfJGJNeDTo2CDcjgW/EAcMubkc
	W98BsCjgwJGZLVq2YHQq9ZP2nrpxxs8CWBLV8AvYA1jZw7sYmp1pqJMgd44YswPEADJTZLoX1l7kW
	7DBPCZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2l-0000000BtcR-0Qk2;
	Fri, 06 Nov 2026 10:19:35 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2g-0000000BtZN-2fYh
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:19:33 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJFCW1863929
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:20 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJFCW1863929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960361;
	bh=7koREli4+xjzmjk3ChLYml3FXKdK9kUFDeJvo8/SOyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lwxYVCwAZ/2lhaSlRBelJzQMl97+uAnO23vVuSgBfG1ajHNf9a0y7zNrmJA36/pZV
	 qJFxCUoAiduIsio8TBeDJJwIr+5DKrot9Z8JnVCLorUggO683XHrf1mQTlcDHoMBg5
	 cMgVjJfGC8rFzh+/BicK3xNZDRpWuj9sbkyEOINA=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
Date: Fri,  6 Nov 2026 11:19:12 +0100
Message-ID: <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021930_844307_88F2E19F 
X-CRM114-Status: GOOD (  10.24  )
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
CgpUaGUgUzQgQ1BVIHNlbnNvciByZWFkcyBpdHMgY2FsaWJyYXRpb24gdGhyb3VnaCB0aGUgc2Vj
dXJlIG1vbml0b3IgYW5kCm90aGVyd2lzZSBtYXRjaGVzIHRoZSBUNyBzZXR1cCwgaW5jbHVkaW5n
IHRoZSBzZXBhcmF0ZSBidXMgYW5kCmZ1bmN0aW9uYWwgY2xvY2tzLCBzbyByZXVzZSB0aGUgVDcg
ZGF0YSBmb3IgaXQuIFRoZSBkcml2ZXIgYWxyZWFkeQplbmFibGVzIGV2ZXJ5IGNsb2NrIHRoZSBk
ZXZpY2UgdHJlZSBsaXN0cy4KCldpdGhvdXQgdGhlIGNhbGlicmF0aW9uIHRoZSBkcml2ZXIgcmVw
b3J0ZWQgYWJvdXQgLTE0NCBkZWdyZWVzIENlbHNpdXMKb24gYW4gUzkwNVcyIGJvYXJkOyB3aXRo
IGl0IHRoZSByZWFkaW5ncyBhcmUgcGxhdXNpYmxlIGFuZCBDUFUKdGhyb3R0bGluZyBlbmdhZ2Vz
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVy
QG91dGxvb2suZGU+Ci0tLQogZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIGIvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhl
cm1hbC5jCmluZGV4IDYwNzI4ZGU2OTY4YS4uNGMxMDdiMzEwMGMwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKKysrIGIvZHJpdmVycy90aGVybWFsL2FtbG9n
aWNfdGhlcm1hbC5jCkBAIC0yOTIsNiArMjkyLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG9mX2FtbG9naWNfdGhlcm1hbF9tYXRjaFtdID0gewogCQkuY29tcGF0aWJsZSA9
ICJhbWxvZ2ljLGExLWNwdS10aGVybWFsIiwKIAkJLmRhdGEgPSAmYW1sb2dpY190aGVybWFsX2Ex
X2NwdV9wYXJhbSwKIAl9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxzNC10aGVybWFs
IiwKKwkJLmRhdGEgPSAmYW1sb2dpY190aGVybWFsX3Q3X3BhcmFtLAorCX0sCiAJewogCQkuY29t
cGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LXRoZXJtYWwiLAogCQkuZGF0YSA9ICZhbWxvZ2ljX3RoZXJt
YWxfdDdfcGFyYW0sCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
