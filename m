Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8A60A2631
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aI7Lfb1Q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=ITNqoDhO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fLH0W0SaHfXZSw2BvoAywQeeg6PqzjN0oqQUIreSfQA=; b=aI7Lfb1QZIxMKDTSjhbiip7zni
	RfI42lUVSbIvCgSI/YEDB/D8SPk2Sb2KgoumcKyiqfEV7eijM2S8NUjvFk/Sqazh28vKiWpueU0cC
	boJnI26+JzTm0zU1bm52t9hPhHJtRXIfz1ikpn+el6JA+pkvvjfChbHEjz5wdoDF+E7Ij3GW32jqu
	cr/0Ea/jL7X2Fy7eSlGxhvIxHDHZq75ZD8G/sMWwyDDrS4aXiXH7LMdOYkN35o0TmCvjxdVRAa8OL
	Z/yM80yxwv1ddTKm+JEI2pCiqaY7okizE/4KqmXRfPt5OTHvvK0XCvSISR11lcK8er5PirwLic6jL
	f3ul+0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nt-00000001LbL-44au;
	Sun, 25 Oct 2026 19:22:49 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3ng-00000001LJu-104a;
	Sun, 25 Oct 2026 19:22:38 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMK13517096
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:29 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMK13517096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956149;
	bh=67zqypIqeW8ZVZEfVBlJG12FCXsLePvvX660ZE95YLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ITNqoDhOUAXftehRFmmWEEKsPEp1AUpYIsRdLzzpVvubibgqbLuLTZs9/q4DrjicR
	 KLCGI5zrd8VOREbmRcQDaiAc2SqsY+gY8nL3zDS3WL/B3D2lkTGQkWawQFmNnzmVBw
	 zsX6rpjfRENOYh824M4G7JeqeYz7YpWAVLuaxSV0=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 3/4] firmware: meson: sm: add the CPU speed bin call
Date: Sun, 25 Oct 2026 20:22:18 +0100
Message-ID: <20261025192219.209137-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122236_493599_CA6F9C38 
X-CRM114-Status: UNSURE (   9.84  )
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
CgpBbWxvZ2ljIFNvQ3MgYXJlIGJpbm5lZCBhdCBtYW51ZmFjdHVyaW5nIHRpbWUgYW5kIHRoZSBi
aW4gc2VsZWN0cyB0aGUKQ1BVIHZvbHRhZ2UgY3VydmUuIE9uIFM0IGl0IGNhbiBvbmx5IGJlIHJl
YWQgdGhyb3VnaCB0aGUgc2VjdXJlIG1vbml0b3IKKFNNQyAweDgyMDAwMDg4LCBhcmd1bWVudDog
Y2x1c3RlciBpZCksIHdoaWNoIHJldHVybnMgdGhlIGJpbiBpbmRleC4KCkFkZCB0aGUgY29tbWFu
ZCBzbyB0aGF0IGEgY3B1ZnJlcSBkcml2ZXIgY2FuIHBpY2sgdGhlIHJpZ2h0IGN1cnZlLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxv
b2suZGU+Ci0tLQogZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jICAgICAgIHwgMSAr
CiBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmggfCAxICsKIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9t
ZXNvbi9tZXNvbl9zbS5jIGIvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCmluZGV4
IDU0MTAzODY2MDNjNy4uNTQwNzczODg3ZmU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJl
L21lc29uL21lc29uX3NtLmMKKysrIGIvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5j
CkBAIC01MSw2ICs1MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fc21fY2hpcCBneGJi
X2NoaXAgPSB7CiAJCUNNRChTTV9BMV9QV1JDX1NFVCwJCTB4ODIwMDAwOTMpLAogCQlDTUQoU01f
QTFfUFdSQ19HRVQsCQkweDgyMDAwMDk1KSwKIAkJQ01EKFNNX1NFVF9QT1dFUk9GRl9GTEFHLAkw
eDgyMDAwMDQyKSwKKwkJQ01EKFNNX0dFVF9DUFVfU1BFRURfQklOLAkweDgyMDAwMDg4KSwKIAkJ
eyAvKiBzZW50aW5lbCAqLyB9LAogCX0sCiB9OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9m
aXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oIGIvaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9t
ZXNvbl9zbS5oCmluZGV4IDNmMmZhMTYwZTMyZi4uOWQxMTgzMmJmNjM4IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKKysrIGIvaW5jbHVkZS9saW51
eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCkBAIC0xNiw2ICsxNiw3IEBAIGVudW0gewogCVNN
X0ExX1BXUkNfU0VULAogCVNNX0ExX1BXUkNfR0VULAogCVNNX1NFVF9QT1dFUk9GRl9GTEFHLAor
CVNNX0dFVF9DUFVfU1BFRURfQklOLAogfTsKIAogc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlOwot
LSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
