Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE6B606A326
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DwQpxwM/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=syxGUENS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HVE1SHM7vBFx22ulEfQPzKF5LPzZ5SeTzil+pGfqFew=; b=DwQpxwM/Q9vCl1YZkMp/nErUWw
	Ll/ecmFMqgb/QeAcb6JEf/DXz4+/CoHC9pVtOi+OCEbr9hNi+t4i+utzikwYTk2Ab/PtjzaGlFaXw
	fMtJaNY4Jn2SI03h7l6OvKp/JlfKO2GP9BWh+lo1Z+9BgSwHAyFKTwK6LWE1+yKOCXkugwsDPUAO5
	URrzmkL5A+i0YEQnpWjiLemKZfk15PqvACjuV7jCN4bx6+9wt28gkcCoVQ1hz4rnZ3yccw+IFx2c9
	9WLjs9PuQ1emtgBcygjLx8zIANxmEdv/iSlUhGh6vX8N6Lc+GSIXuSdKM6NHGszdoEzaNZy6+N6+o
	hGEnZ1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nM-00000001L0d-3is1;
	Sun, 25 Oct 2026 19:22:16 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nJ-00000001Kwt-3ojb;
	Sun, 25 Oct 2026 19:22:15 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJM3W5516897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJM3W5516897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956127;
	bh=ndUblt3nJlZZl1MwBVzDwhzSLV3QQxoKhFCgCQeYDIA=;
	h=From:To:Cc:Subject:Date;
	b=syxGUENSBkiwYcHFahGPQ0HhNtrVW2Kly/KX3MoG82QvZEH/zzw9LayEQGmRQfTNS
	 PVHl8jq0Aq3LJ7hXhJTazNQ3z9tX7SD86xnMlQJAkF+Qfi0phYA1EDzeSvRZG2irkx
	 qu5JDU5CeeFNKODtXv7hLHA9hPUKQPtuKDmn1CNs=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] phy: amlogic: meson-g12a-usb2: add S4 support
Date: Sun, 25 Oct 2026 20:22:00 +0100
Message-ID: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122214_115175_BDDFC7C2 
X-CRM114-Status: UNSURE (   9.21  )
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
CgpUaGUgUzQgVVNCMiBQSFkgaXMgdGhlIEExIGRlc2lnbiB3aXRoIGRpZmZlcmVudCBhbmFsb2cg
dHJpbXMgYW5kIGFuCmV4dHJhIGRpc2Nvbm5lY3QgdGhyZXNob2xkOyB3aXRob3V0IGl0cyBQTUEg
dXBkYXRlIGJpdCB0aGUgaG9zdCBzZWVzIG5vCnJvb3QgcG9ydHMuIEFkZCBhIGNvbXBhdGlibGUg
YW5kIHRoZSBTNCBzZXR0aW5ncyBmcm9tIHRoZSB2ZW5kb3IgZHJpdmVyLgoKVGVzdGVkOiBib3Ro
IGhvc3QgcG9ydHMgZW51bWVyYXRlIGtleWJvYXJkcywgbWljZSwgaHVicyBhbmQgc3RvcmFnZS4K
ClRvb2wgdXNlIChEb2N1bWVudGF0aW9uL3Byb2Nlc3MvZ2VuZXJhdGVkLWNvbnRlbnQucnN0KToK
VGhpcyB3b3JrIHdhcyBkb25lIHdpdGggdGhlIGhlbHAgb2YgYW4gQUkgY29kaW5nIGFzc2lzdGFu
dCwgQ2xhdWRlCihBbnRocm9waWMpLCB1c2VkIHRocm91Z2ggQ2xhdWRlIENvZGUgb3ZlciBtYW55
IHNlc3Npb25zLiBJdCBkaWQgYSBsYXJnZQpwYXJ0IG9mIHRoZSBoYW5kcy1vbiB3b3JrOiBpdCBy
ZWFkIHRoZSB2ZW5kb3Iga2VybmVsIGFuZCB0aGUgZmlybXdhcmUKaW50ZXJmYWNlcywgcHJvYmVk
IHJlZ2lzdGVycyBvbiB0aGUgYm9hcmQsIGRyYWZ0ZWQgdGhlIGNvZGUgYW5kIHRoZQpjaGFuZ2Vs
b2dzLCBhbmQgcmFuIHRoZSBidWlsZHMsIGNoZWNrcGF0Y2gsIGR0X2JpbmRpbmdfY2hlY2sgYW5k
IHRoZQp0ZXN0cyBvbiB0aGUgaGFyZHdhcmUuIEkgZGlyZWN0ZWQgdGhlIHdvcmssIHJldmlld2Vk
IGV2ZXJ5IGNoYW5nZSBhbmQKdGhlIGZpbmFsIHBhdGNoZXMsIGFuZCB0YWtlIHJlc3BvbnNpYmls
aXR5IGZvciB0aGVtLiBUaGVyZSBpcyBubyBzaW5nbGUKcHJvbXB0IHRvIHF1b3RlOyB0aGUgc2Vz
c2lvbnMgd2VyZSBvZiB0aGUgZm9ybSAiZmluZCBvdXQgd2h5IFggZmFpbHMgb24KdGhpcyBib2Fy
ZCwgZml4IGl0LCB0ZXN0IGl0IG9uIHRoZSBib3giLgoKVGVzdGVkIG9uIGFuIEFtZWRpYXRlY2gg
WDk4USBUViBib3ggKEFtbG9naWMgUzkwNVcyLCBTNCBmYW1pbHksIDIgR2lCKSwKdmVuZG9yIFUt
Qm9vdCBhbmQgQkwzMS9PUC1URUUsIExpbnV4IDcuMyBwbHVzIHRoaXMgd29yay4KCkNocmlzdGlh
biBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMik6CiAgZHQtYmluZGluZ3M6IHBoeTogYW1sb2dpYyxn
MTJhLXVzYjItcGh5OiBhZGQgUzQgY29tcGF0aWJsZQogIHBoeTogYW1sb2dpYzogbWVzb24tZzEy
YS11c2IyOiBhZGQgUzQgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9waHkvYW1sb2dpYyxnMTJhLXVz
YjItcGh5LnlhbWwgICB8ICAxICsKIGRyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uLWcxMmEt
dXNiMi5jICAgICB8IDY1ICsrKysrKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDkg
aW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDdiZTRiYzUyZmQ5
ZTBlNTVkYzlhMmUwMjMyYjg5NDI3ZDJjNGI2MTQKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
