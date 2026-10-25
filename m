Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E813606A31F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rXNFBzwx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=CDTaCsvR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IV2UVr4M1RatDbPWbupLnxT30AaJNg5tGN18sgXdPiY=; b=rXNFBzwxYfw9tXIkmmkCS9/vL5
	qJBmqE3yygB7a6W+qvKm8mNAhUSkoO2A93sl1Y+GqFbFnwcroqSWum0WRQm1tnQC/22ynufZh2VpE
	BvulBkz6Yd4C0AsonP546YkiXewZTGy/lRqTQdCIWaKSeR7d2o0OBr7ZjhOCNK4xQLKd8stc1XHUg
	fOVzVafIzF36ohYico5eE7+7d0uoi31yhVRyEkTpQqor5hv+SD5bDXOiFA+EKgv83GeOy6gTu6G5D
	lakHLQ3hKe2v8PJiruuhbP5m2lwxawVQwwgdOnNJfKtDy64LE3e1JYKVjMSUa6J6zxtPviqXdLANC
	pFxJa3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o8-00000001LsW-10Zt;
	Sun, 25 Oct 2026 19:23:04 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o3-00000001Ln3-2p34
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Oct 2026 19:23:03 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMjmd517433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:48 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMjmd517433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956169;
	bh=/KrjoMZQWqp+zJ+I/5Z/0i9WZXMZ7iZpapqeU3pEo34=;
	h=From:To:Cc:Subject:Date;
	b=CDTaCsvRD0/5b8RX4QfpitsUqvyrqLWsotN9K90ScDW2a2L+M0xwdMHcEAWw3ZWa3
	 JKdiIIPMYGrxIrk7KwbH0u9L5vDSUXpii/oVeYJk1DI4JlOi8Sdl+oaAfNQ335p9mV
	 IxbyN/luo+UkOaPsDKP/Xmf0YU529nfzGj6tme/U=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/3] thermal/drivers/amlogic: add S4 support
Date: Sun, 25 Oct 2026 20:22:41 +0100
Message-ID: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122259_922550_B421DA41 
X-CRM114-Status: UNSURE (   9.38  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGUgUzQgQ1BVIHNlbnNvciBpcyB0aGUgRzEyQSBkZXNpZ24gd2l0aCB0aGUgY2FsaWJyYXRp
b24gcmVhZCB0aHJvdWdoCnRoZSBzZWN1cmUgbW9uaXRvciwgYXMgb24gVDcsIHNvIGl0IHJldXNl
cyB0aGUgVDcgZGF0YSBvbiB0b3Agb2YgUm9uYWxkCkNsYXZlYXUncyBzZWN1cmUgbW9uaXRvciBj
YWxpYnJhdGlvbiBzdXBwb3J0LiBXaXRob3V0IGNhbGlicmF0aW9uIHRoZQpzZW5zb3IgcmVwb3J0
ZWQgYWJvdXQgLTE0NCBkZWdyZWVzIENlbHNpdXMuCgpQYXRjaCAzIG1ha2VzIHRoZSBleHBlY3Rl
ZCBmaXJzdCBwcm9iZSBkZWZlcnJhbCAodGhlIHNlY3VyZSBtb25pdG9yCnByb2JlcyBsYXRlcikg
cXVpZXQuCgpUb29sIHVzZSAoRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2dlbmVyYXRlZC1jb250ZW50
LnJzdCk6ClRoaXMgd29yayB3YXMgZG9uZSB3aXRoIHRoZSBoZWxwIG9mIGFuIEFJIGNvZGluZyBh
c3Npc3RhbnQsIENsYXVkZQooQW50aHJvcGljKSwgdXNlZCB0aHJvdWdoIENsYXVkZSBDb2RlIG92
ZXIgbWFueSBzZXNzaW9ucy4gSXQgZGlkIGEgbGFyZ2UKcGFydCBvZiB0aGUgaGFuZHMtb24gd29y
azogaXQgcmVhZCB0aGUgdmVuZG9yIGtlcm5lbCBhbmQgdGhlIGZpcm13YXJlCmludGVyZmFjZXMs
IHByb2JlZCByZWdpc3RlcnMgb24gdGhlIGJvYXJkLCBkcmFmdGVkIHRoZSBjb2RlIGFuZCB0aGUK
Y2hhbmdlbG9ncywgYW5kIHJhbiB0aGUgYnVpbGRzLCBjaGVja3BhdGNoLCBkdF9iaW5kaW5nX2No
ZWNrIGFuZCB0aGUKdGVzdHMgb24gdGhlIGhhcmR3YXJlLiBJIGRpcmVjdGVkIHRoZSB3b3JrLCBy
ZXZpZXdlZCBldmVyeSBjaGFuZ2UgYW5kCnRoZSBmaW5hbCBwYXRjaGVzLCBhbmQgdGFrZSByZXNw
b25zaWJpbGl0eSBmb3IgdGhlbS4gVGhlcmUgaXMgbm8gc2luZ2xlCnByb21wdCB0byBxdW90ZTsg
dGhlIHNlc3Npb25zIHdlcmUgb2YgdGhlIGZvcm0gImZpbmQgb3V0IHdoeSBYIGZhaWxzIG9uCnRo
aXMgYm9hcmQsIGZpeCBpdCwgdGVzdCBpdCBvbiB0aGUgYm94Ii4KClRlc3RlZCBvbiBhbiBBbWVk
aWF0ZWNoIFg5OFEgVFYgYm94IChBbWxvZ2ljIFM5MDVXMiwgUzQgZmFtaWx5LCAyIEdpQiksCnZl
bmRvciBVLUJvb3QgYW5kIEJMMzEvT1AtVEVFLCBMaW51eCA3LjMgcGx1cyB0aGlzIHdvcmsuCgpD
aHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgKDMpOgogIGR0LWJpbmRpbmdzOiB0aGVybWFs
OiBhbWxvZ2ljOiBhZGQgdGhlIFM0IENQVSBzZW5zb3IKICB0aGVybWFsL2RyaXZlcnMvYW1sb2dp
YzogYWRkIFM0IHN1cHBvcnQKICB0aGVybWFsL2RyaXZlcnMvYW1sb2dpYzogZG8gbm90IGxvZyB0
aGUgc2VjdXJlIG1vbml0b3IgZGVmZXJyYWwgYXMgYW4KICAgIGVycm9yCgogLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbCAgfCAgMSArCiBkcml2ZXJz
L3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgICAgICAgICAgICAgICAgICAgICB8IDExICsrKysr
KystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CgpiYXNlLWNvbW1pdDogN2JlNGJjNTJmZDllMGU1NWRjOWEyZTAyMzJiODk0MjdkMmM0YjYxNAot
LSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
