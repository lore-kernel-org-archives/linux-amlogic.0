Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E400C606A32D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cf1SjlEj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=OYwM95U8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Achcn/klv1xd0Nkh31Fq0+58uKiUSr3UETA2jPudG/g=; b=Cf1SjlEjzmO1BjinJc3oTH9LcB
	ex808iJ7NoEhHnCJHeZ4QgYj66HqseB77x9zCUhi0dEO+a7xCAQVGWjKOmxafJOd/BoU7bHNgv/xN
	vYwpA+KQTXgiC1q9kP86laW8JbA7Fsckl03e41owqL7/r9OfsoUhz1fMfPOMzmvv7tdapbB8O9PYH
	ZG+KFgb0Hms4jP4Wxn0vJpAAOdEkiODzsF/JSUw3tgUqCY5Cdf7QdmyY5DOtqBbavzq44dpQ8frWO
	dEqbicA7RNDVMgSonyvpS1v0ARbb/ubnlissWaHyUK+uwk9N/8DOkaiEjN0JLIIWGHDVP33oWJQ7R
	AompkUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTY-0000000C0A3-1kVm;
	Fri, 06 Nov 2026 10:47:16 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTT-0000000C04P-1Sg7;
	Fri, 06 Nov 2026 10:47:12 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07G1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07G1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962025;
	bh=l0jN2vxhDmORp4GLdhkPY56EqVBT5d3pZVuo+G3Wp9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYwM95U8OEeisUcEYNxeMFXwSJ1huiIuGXaz2YK6u/TLpn/YT+sPSdJSzl+HWRQ2Z
	 xPW1H6Y/19u0h0uZLA75+9JupZti8eFk1NZvUDD5ntXqYoQKCkPj8Ey8hiOS/LLywT
	 HeTs6CUJke5eehCbPduT59xK7tpsHcxYngBLQWAs=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 01/10] dt-bindings: arm: amlogic: add the Amediatech X98Q
Date: Fri,  6 Nov 2026 11:46:50 +0100
Message-ID: <20261106104659.54656-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024711_552340_31D295AE 
X-CRM114-Status: UNSURE (   7.88  )
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
CgpUaGUgQW1lZGlhdGVjaCBYOThRIGlzIGEgVFYgYm94IGJ1aWx0IGFyb3VuZCB0aGUgQW1sb2dp
YyBTOTA1VzIsIGEKbWVtYmVyIG9mIHRoZSBTNCBmYW1pbHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKaW5kZXggOWY3M2EwMDU0ZmIy
Li45YjM1ZGM3MWU4MzEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYW1sb2dpYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYW1sb2dpYy55YW1sCkBAIC0yNTQsNiArMjU0LDEzIEBAIHByb3BlcnRpZXM6CiAg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxzODA1eDIKICAgICAgICAgICAtIGNvbnN0OiBhbWxv
Z2ljLHM0CiAKKyAgICAgIC0gZGVzY3JpcHRpb246IEJvYXJkcyB3aXRoIHRoZSBBbWxvZ2ljIE1l
c29uIFM0IFM5MDVXMiBTb0MKKyAgICAgICAgaXRlbXM6CisgICAgICAgICAgLSBlbnVtOgorICAg
ICAgICAgICAgICAtIGFtZWRpYXRlY2gseDk4cQorICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMs
czkwNXcyCisgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxzNAorCiAgICAgICAtIGRlc2NyaXB0
aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbiBTNCBTOTA1WTQgU29DCiAgICAgICAg
IGl0ZW1zOgogICAgICAgICAgIC0gZW51bToKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
