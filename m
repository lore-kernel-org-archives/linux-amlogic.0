Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E118606D81C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ETS4+B9d;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=oncnZ1qS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HizfqvKAIrCtJZmVvQ+xjhrGNC1SNYbSqsjei9h67O4=; b=ETS4+B9d2SWUNs+fUSAE4hKL9M
	+laRByQPT5c4PL2vC0WgZfV9hBGlcabk4FVhz7V5jdFYAW8kaCBa2aYT1hCNB4WgHoEQ7D360AMey
	gKOO3jjako/tEYrf3QKlNBmZoFJ4rGWAR23RH+8Yc69ITw0QW+hsMhIwJ8m8xgzD0ZFiG/YV7N8Rf
	fS7MXH8O0cWA/0WcMXYIRy0eMWbZPt22s142qXNpiXVDfi2s6/HqLX2lJOSqu6/9Hk/GGO4hoOZJ9
	OjW5bdLj9kcJpk0Wr+ZMkGOBoHzSc5M6OogD0ULhdI2Amrpk25pEo2nJzYCOsYqQKJ9+/xoak8T3h
	g9RpHK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTc-0000000C0HU-416X;
	Fri, 06 Nov 2026 10:47:20 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTX-0000000C05r-2HwA;
	Fri, 06 Nov 2026 10:47:17 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07J1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07J1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962028;
	bh=82iJO7WRa04zutkAoZphTeLb3e8+2bJ7l1tF4w09Ihc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oncnZ1qSDRZOdVEusRVZDdnhTra8wKQ1Z3CJTGEiVhUDEhX0BC1f9VJo/brhcY0KL
	 Ze6XC0dDT53QB6SReVUcnrJ032fks7HXdGXdPxw/ZUSFcOurosS0WZLqxwnYr0UDnU
	 N1tTPXOw4D2MptDPDPHkghCn0vHaTlBGmqySeiLo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 04/10] arm64: dts: amlogic: meson-s4: use the S4 secure monitor compatible
Date: Fri,  6 Nov 2026 11:46:53 +0100
Message-ID: <20261106104659.54656-5-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024715_952295_25060525 
X-CRM114-Status: GOOD (  10.64  )
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
CgpVc2UgdGhlIFM0IHNwZWNpZmljIGNvbXBhdGlibGUgZm9yIHRoZSBzZWN1cmUgbW9uaXRvciwg
c28gdGhhdCB0aGUKZHJpdmVyIGNhbiBhcHBseSB0aGUgUzQgcG93ZXItb2ZmIHNlcXVlbmNlLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91
dGxvb2suZGU+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCmluZGV4IDU3MjcwZmJmYjRh
Ny4uNzkzYzdiYjk1MTJlIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tczQuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQu
ZHRzaQpAQCAtMTM1LDcgKzEzNSw3IEBAIHh0YWw6IHh0YWwtY2xrIHsKIAogCWZpcm13YXJlIHsK
IAkJc206IHNlY3VyZS1tb25pdG9yIHsKLQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1n
eGJiLXNtIjsKKwkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zNC1zbSIsICJhbWxvZ2lj
LG1lc29uLWd4YmItc20iOwogCiAJCQlwd3JjOiBwb3dlci1jb250cm9sbGVyIHsKIAkJCQljb21w
YXRpYmxlID0gImFtbG9naWMsbWVzb24tczQtcHdyYyI7Ci0tIAoyLjU2LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
