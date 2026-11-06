Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C586606A326
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Huv+zrHC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Dg5FUOzi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=caHTFrLpF57itYJ+HSItpGHuG4JpfaVSAVqHwZEwUnY=; b=Huv+zrHClTEw4kXybPggqzQejS
	z9QkGYfjd9DF4/wByR0rRJu3yxN3gWGnWShsKZM4/uZrUyQxULxu/ci4CbyEgWRrTvvQNCkRneFaJ
	/UzWrcuVdJrLnOGBiHuaZiHUpyM5C5iFex/ojo269oPNxT2RO9+VteH1oC+WxfG9LAvpWMfFy8pSX
	J+sD8A1qdCA/u9o2LTbGmd7vLJ4hRKErHbtf0NlYORr7ye1K+0mKVHJLR7dAJT2+QL9IFT3ydWnGa
	y/o+XwAFuYDt7R6KDqR5h6ASN0Etn++7w5f/2tHK0VuTcK38uCQ1oIn0221Z8aJFufmSU87xTSDRa
	1EHgSNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2K-0000000BtFi-3ZpR;
	Fri, 06 Nov 2026 10:19:08 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2H-0000000BtDD-3w5D;
	Fri, 06 Nov 2026 10:19:07 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIuWx1863787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:18:58 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIuWx1863787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960339;
	bh=F4kxI2wTIfu/23csmBMbHSFlb5/hs/tMnDMridnsP8g=;
	h=From:To:Cc:Subject:Date;
	b=Dg5FUOzil4AS5QZyyF2Ev4vE4NF6Xx0p36U1Lk/oDYXgSAhE2riRKS+CYTUDBfNCh
	 xPaPXp9RbEtggDvq5QL/46wBWB+nPRIHWSL94C+tCjS3ZANIX0KIa2pVXQH/HRV5pH
	 MItaJMffzdxUZ0rpMd7qnt0hu3Q5kkRa6FQdk/Dw=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 0/2] firmware: meson: sm: make power-off work on S4
Date: Fri,  6 Nov 2026 11:18:52 +0100
Message-ID: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021906_312810_2CD6C794 
X-CRM114-Status: GOOD (  14.33  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpPbiBTNCB0aGUgZmlybXdhcmUgaW1wbGVtZW50cyBQU0NJIFNZU1RFTV9PRkYgYXMgRERSIHNl
bGYtcmVmcmVzaCwgYW5kCnRoZSBwb3dlciBrZXkgdGhlbiByZXN1bWVzIGludG8gYSBrZXJuZWwg
dGhhdCBpcyBnb25lLCBzbyB0aGUgYm9hcmQKaGFuZ3MgdW50aWwgaXQgaXMgdW5wbHVnZ2VkLiBU
aGUgdmVuZG9yIGtlcm5lbCBzZXRzIGEgZmlybXdhcmUgc2h1dGRvd24KZmxhZyBmaXJzdCBhbmQg
dGFrZXMgdGhlIHNlY29uZGFyeSBDUFVzIGRvd24gdGhyb3VnaCBQU0NJOyBkbyB0aGUgc2FtZSwK
a2V5ZWQgb24gYSBuZXcgYW1sb2dpYyxtZXNvbi1zNC1zbSBjb21wYXRpYmxlLgoKVGVzdGVkOiBw
b3dlcm9mZiBmb2xsb3dlZCBieSB0aGUgcmVtb3RlJ3MgcG93ZXIga2V5IGNvbGQtYm9vdHMgdGhl
IGJveC4KCkNoYW5nZXMgaW4gdjI6Ci0gVXNlIHJlbW92ZV9jcHUoKSBpbnN0ZWFkIG9mIGZyZWV6
ZV9zZWNvbmRhcnlfY3B1cygpLCB3aGljaCBpcyBub3QKICBhdmFpbGFibGUgd2l0aG91dCBDT05G
SUdfUE1fU0xFRVBfU01QIGFuZCBub3QgZXhwb3J0ZWQgKHJlcG9ydGVkIGJ5CiAgdGhlIGtlcm5l
bCB0ZXN0IHJvYm90IGFuZCB0aGUgU2FzaGlrbyBBSSByZXZpZXcpLgotIE9uZSBwb3dlci1vZmYg
cHJlcGFyZSBoYW5kbGVyIHRoYXQgZG9lcyBib3RoIHN0ZXBzIGluIG9yZGVyLCBpbnN0ZWFkCiAg
b2YgdHdvLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEwMjUx
OTIxNDQuMjA4OTU0LTEtY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQK
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
biBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMik6CiAgZHQtYmluZGluZ3M6IGZpcm13YXJlOiBhbWxv
Z2ljLG1lc29uLWd4YmItc206IGFkZCBhbWxvZ2ljLG1lc29uLXM0LXNtCiAgZmlybXdhcmU6IG1l
c29uOiBzbTogbWFrZSBwb3dlci1vZmYgd29yayBvbiBTNAoKIC4uLi9maXJtd2FyZS9hbWxvZ2lj
LG1lc29uLWd4YmItc20ueWFtbCAgICAgICB8ICA0ICsrLQogZHJpdmVycy9maXJtd2FyZS9tZXNv
bi9tZXNvbl9zbS5jICAgICAgICAgICAgIHwgMzEgKysrKysrKysrKysrKysrKysrKwogaW5jbHVk
ZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oICAgICAgIHwgIDEgKwogMyBmaWxlcyBj
aGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgoKYmFzZS1jb21taXQ6IDdi
ZTRiYzUyZmQ5ZTBlNTVkYzlhMmUwMjMyYjg5NDI3ZDJjNGI2MTQKLS0gCjIuNTYuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
