Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8E60A260B
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NiKJKm57;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=DL6Qz0tC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4MAh8PG9lKZvDvrmkWqhwXoiYmSz2fIeyoOfRzNxMSY=; b=NiKJKm57M/IAKcVqb5FLBS/NxK
	2uRHolI45JLa6c+1s2cFPNqT9UgULdVylsi1huHMLn8TgsOJW7I2YWxgqtA94EIGj3WOF8vmDHF/Y
	YQAWCkp4tCIFMHEvB6AC2E929lbs0oTlfCHGJIifRV6cTNKjwCFlFyVvB95w+IXw45pqYDGffeq89
	gJrGLwZT401eX1CUKgSJ3e9tHZTbPjkeZItbNjN6TNWxQ3eOiBOImMa6m6kj7SVgdtFmgDcTa2N76
	bJIxcO7cBoKAvjcVZqeRCqIoOhBuGT2ZU30j8LoBCKn3oCbwCGYsPu0zioYznX0KEAGN1pxuOL763
	bDVrz8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3ob-00000001MID-48Rh;
	Sun, 25 Oct 2026 19:23:33 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3oY-00000001MFV-28Tb;
	Sun, 25 Oct 2026 19:23:32 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJNLM2517824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:23 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJNLM2517824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956204;
	bh=YR/ku/r1CH8uzsMyeZ4ooLK7adqbWucR46itDUvHlpQ=;
	h=From:To:Cc:Subject:Date;
	b=DL6Qz0tCwB4AP8LGGALNfCsKLicBE0SY/XdMy+SM6I7QHDoH4PUFv4skdG8sp7XCN
	 9RubkfJTZIwneMweoCuvsS2Qo/ntrsd7G+DxC7N312Y9h/owYLsikI8TQSfBNqE2fu
	 uH8QXRXUwL1sg9JiZsnvZcjRgaTX67+7VTDHkDSs=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] media: rc: meson-ir: wake the system from the remote
Date: Sun, 25 Oct 2026 20:23:17 +0100
Message-ID: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122330_714489_163E43E7 
X-CRM114-Status: UNSURE (   7.93  )
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
CgpUaGUgc3VzcGVuZCBjYWxsYmFjayBzd2l0Y2hlcyB0aGUgZGVjb2RlciBvZmYsIHNvIGEgcmVt
b3RlIGNhbiBuZXZlcgp3YWtlIHRoZSBzeXN0ZW0uIFdpdGggdGhlIHdha2V1cC1zb3VyY2UgcHJv
cGVydHksIGtlZXAgdGhlIGRlY29kZXIKcnVubmluZyBhbmQgYXJtIGl0cyBpbnRlcnJ1cHQgYXMg
YSB3YWtlIHNvdXJjZSBpbnN0ZWFkLgoKVGVzdGVkOiBzdXNwZW5kIHRvIFJBTSBvbiBhbiBTOTA1
VzIgYm94LCByZXN1bWVkIGJ5IHRoZSByZW1vdGUuCgpUb29sIHVzZSAoRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL2dlbmVyYXRlZC1jb250ZW50LnJzdCk6ClRoaXMgd29yayB3YXMgZG9uZSB3aXRoIHRo
ZSBoZWxwIG9mIGFuIEFJIGNvZGluZyBhc3Npc3RhbnQsIENsYXVkZQooQW50aHJvcGljKSwgdXNl
ZCB0aHJvdWdoIENsYXVkZSBDb2RlIG92ZXIgbWFueSBzZXNzaW9ucy4gSXQgZGlkIGEgbGFyZ2UK
cGFydCBvZiB0aGUgaGFuZHMtb24gd29yazogaXQgcmVhZCB0aGUgdmVuZG9yIGtlcm5lbCBhbmQg
dGhlIGZpcm13YXJlCmludGVyZmFjZXMsIHByb2JlZCByZWdpc3RlcnMgb24gdGhlIGJvYXJkLCBk
cmFmdGVkIHRoZSBjb2RlIGFuZCB0aGUKY2hhbmdlbG9ncywgYW5kIHJhbiB0aGUgYnVpbGRzLCBj
aGVja3BhdGNoLCBkdF9iaW5kaW5nX2NoZWNrIGFuZCB0aGUKdGVzdHMgb24gdGhlIGhhcmR3YXJl
LiBJIGRpcmVjdGVkIHRoZSB3b3JrLCByZXZpZXdlZCBldmVyeSBjaGFuZ2UgYW5kCnRoZSBmaW5h
bCBwYXRjaGVzLCBhbmQgdGFrZSByZXNwb25zaWJpbGl0eSBmb3IgdGhlbS4gVGhlcmUgaXMgbm8g
c2luZ2xlCnByb21wdCB0byBxdW90ZTsgdGhlIHNlc3Npb25zIHdlcmUgb2YgdGhlIGZvcm0gImZp
bmQgb3V0IHdoeSBYIGZhaWxzIG9uCnRoaXMgYm9hcmQsIGZpeCBpdCwgdGVzdCBpdCBvbiB0aGUg
Ym94Ii4KClRlc3RlZCBvbiBhbiBBbWVkaWF0ZWNoIFg5OFEgVFYgYm94IChBbWxvZ2ljIFM5MDVX
MiwgUzQgZmFtaWx5LCAyIEdpQiksCnZlbmRvciBVLUJvb3QgYW5kIEJMMzEvT1AtVEVFLCBMaW51
eCA3LjMgcGx1cyB0aGlzIHdvcmsuCgpDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgKDIp
OgogIGR0LWJpbmRpbmdzOiBtZWRpYTogYW1sb2dpYyxtZXNvbjYtaXI6IGFsbG93IHdha2V1cC1z
b3VyY2UKICBtZWRpYTogcmM6IG1lc29uLWlyOiBhbGxvdyB0aGUgcmVjZWl2ZXIgdG8gd2FrZSB0
aGUgc3lzdGVtCgogLi4uL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsbWVzb242LWlyLnlhbWwgICAg
ICAgfCAgMiArKwogZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci5jICAgICAgICAgICAgICAgICAg
ICAgfCAxNyArKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspCgoKYmFzZS1jb21taXQ6IDdiZTRiYzUyZmQ5ZTBlNTVkYzlhMmUwMjMyYjg5NDI3ZDJjNGI2
MTQKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
