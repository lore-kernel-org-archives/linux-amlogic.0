Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE0606A329
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XbfsPT9I;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=fZJlgvdp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hZU2rlCVgU55+cXtePW79x5j0+WUDBKk1e6S2Hmgfbo=; b=XbfsPT9IyD3KUsMe3g2UkaNy6x
	KDBYCVbDEEp1nPvx1AThy3F6c6kIV8Lo1waJb7DT/lvPYB0YeM5Rq9db6FobDmcQbpivLGLnVMQlo
	yCS1R7831KxJlsaeccK89Eo5GqEBaImCYeRGpA7VPLW9ZY3qISOEnFCR/abtg6PkkybJ2A6Vxlqf+
	VPusnbit2C4auKkEoXrn1CT7Hn2tOmBesIWBuXtgbwVFek89EXx67Nej9rLYy8Qs3jeW0UumCMH3e
	7YRERq33PFiGJRM5gXnCG9B3hnKfEQb95aZQ/4IvF11jFe/Tl9kl456LHwMsA6cs4fJZ0ZbkUC9nO
	ZcqC+RRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o8-00000001Lsh-22HI;
	Sun, 25 Oct 2026 19:23:04 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o3-00000001Ln2-2Nkd
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Oct 2026 19:23:03 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMjme517433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:49 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMjme517433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956170;
	bh=CaHVn40SG9XkdMVUx/YoBhUJDWHNChhywgvcaAYGaI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fZJlgvdpxyYxNc12n2n9D6pfNR1T8TB8UiKJqLOdIQymdvKBVTRnwYXmi1yhziFrO
	 uXxvdcdTqiGshVtc7AezgIU2yXqgYSB9cSm34eqhLPGAqQLhjYBbQYeQBtP3bFzPMc
	 bFp1q44VRXpW4sWXwkf8hcKsndanG+yXilhv1g8Y=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/3] dt-bindings: thermal: amlogic: add the S4 CPU sensor
Date: Sun, 25 Oct 2026 20:22:42 +0100
Message-ID: <20261025192244.209256-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122259_822308_8B7D4EBA 
X-CRM114-Status: UNSURE (   8.23  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGUgUzQgQ1BVIHRlbXBlcmF0dXJlIHNlbnNvciBpcyB0aGUgRzEyQSBkZXNpZ24sIGJ1dCBs
aWtlIG9uIFQ3IGl0cwpjYWxpYnJhdGlvbiB2YWx1ZSBpcyBvbmx5IGF2YWlsYWJsZSB0aHJvdWdo
IHRoZSBzZWN1cmUgbW9uaXRvcjogdGhlCmFvLXNlY3VyZSByZWdpc3RlciB1c2VkIG9uIEcxMkEg
aG9sZHMgdW5yZWxhdGVkIGRhdGEgb24gUzQuIEFkZCBhCmNvbXBhdGlibGUgZm9yIGl0OyBpdCB0
YWtlcyBhIHNpbmdsZSBjbG9jayBhbmQgdGhlIHNlY3VyZSBtb25pdG9yCnBoYW5kbGUgd2l0aCB0
aGUgc2Vuc29yIGluZGV4LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6ly
LURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhlcm1hbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwKaW5kZXggZTcy
Y2IzOWFjNjM1Li41ZDk2NmFiNGQ4MjAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhlcm1hbC55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhlcm1hbC55YW1sCkBA
IC0yMyw2ICsyMyw3IEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxn
MTJhLXRoZXJtYWwKICAgICAgIC0gZW51bToKICAgICAgICAgICAtIGFtbG9naWMsYTEtY3B1LXRo
ZXJtYWwKKyAgICAgICAgICAtIGFtbG9naWMsczQtY3B1LXRoZXJtYWwKICAgICAgICAgICAtIGFt
bG9naWMsdDctdGhlcm1hbAogCiAgIHJlZzoKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
