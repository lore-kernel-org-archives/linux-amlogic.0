Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAD606D81C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LWxW9OOj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=GsX/eEPc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JN3uE7h9khAanphTGeJs7pzBeRUq427T7p39QZy/R+c=; b=LWxW9OOjIeum5NrdG7wl+ACixA
	vAMXrqbhtEwMxYwqNKymSeaQLxddErCmgpBRzRWuoJQ6+j/dETpCmA4nlEYpqhoSSs5ZDgg8Y53po
	e4eRa4PoVXf6ZZVs7J4lB/OzlarprD3xtaqjmF+nX4kxmnQdMecXdyzl/iW5XmOCbi9zHVGZujgpW
	d0a2QOe5Pq9C9Hy5F67nE6AqVXxKMKOkzWT6FgMmgaHTD++P6qo9BzQFF0uWnki/c76uqW38z+CQP
	0H63UYi+2Cua77s6fDc9pUlRxRI8hszJTL61hzkQF8+Mboeui/w4opug9fsQaawiaB8JSlXEMoTO+
	GN+wRkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2o-0000000Btfg-1baO;
	Fri, 06 Nov 2026 10:19:38 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2g-0000000BtZQ-3uEX
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:19:35 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJFCU1863929
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:17 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJFCU1863929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960358;
	bh=ARtDCbvM7wnTY2BVBSnKcT77iq7yVWGwS7A3lz5iolY=;
	h=From:To:Cc:Subject:Date;
	b=GsX/eEPc4iPvQvkA6eX4tszgiT9kL8+ZiB23z9UIGaQzhzuqhbP0O9C9smdwBnFdY
	 TdcW1lKTU0ebwdTo5IE4OiRIcGxsE2kXUQtS4PB0VUNPjjXzY1bqIj8zBEMWYrG6hX
	 jwXLwFR26SAWphze31FY+GvuEvtl8jALgJGZXV4A=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 0/3] thermal/drivers/amlogic: add S4 support
Date: Fri,  6 Nov 2026 11:19:10 +0100
Message-ID: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021931_298898_28B685D7 
X-CRM114-Status: GOOD (  10.63  )
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
CgpUaGUgUzQgdGVtcGVyYXR1cmUgc2Vuc29ycyBhcmUgdGhlIEcxMkEgZGVzaWduIHdpdGggdGhl
IGNhbGlicmF0aW9uIHJlYWQKdGhyb3VnaCB0aGUgc2VjdXJlIG1vbml0b3IsIGFzIG9uIFQ3LCBz
byB0aGV5IHJldXNlIHRoZSBUNyBkYXRhIG9uIHRvcCBvZgpSb25hbGQgQ2xhdmVhdSdzIHNlY3Vy
ZSBtb25pdG9yIGNhbGlicmF0aW9uIHN1cHBvcnQuIFdpdGhvdXQgY2FsaWJyYXRpb24KdGhlIENQ
VSBzZW5zb3IgcmVwb3J0ZWQgYWJvdXQgLTE0NCBkZWdyZWVzIENlbHNpdXMuCgpQYXRjaCAzIG1h
a2VzIHRoZSBleHBlY3RlZCBmaXJzdCBwcm9iZSBkZWZlcnJhbCAodGhlIHNlY3VyZSBtb25pdG9y
CnByb2JlcyBsYXRlcikgcXVpZXQuCgpDaGFuZ2VzIGluIHYyOgotIENvbXBhdGlibGUgcmVuYW1l
ZCBmcm9tIGFtbG9naWMsczQtY3B1LXRoZXJtYWwgdG8gYW1sb2dpYyxzNC10aGVybWFsOgogIGFz
IG9uIFQ3IHRoZSBzZW5zb3IgaW5kZXggaXMgdGhlIHNlY3VyZSBtb25pdG9yIHBoYW5kbGUgYXJn
dW1lbnQsIHNvCiAgb25lIGNvbXBhdGlibGUgY292ZXJzIHRoZSBDUFUgYW5kIHRoZSBERFIgc2Vu
c29yLgotIFRoZSBiaW5kaW5nIHRha2VzIHRoZSBidXMgY2xvY2sgKHRzX3BsbCAvIHRzX2Rkcikg
YmVzaWRlcyB0aGUKICBmdW5jdGlvbmFsIGNsb2NrLCBuYW1lZCwgbGlrZSBUNzsgdGhlIGRyaXZl
ciByZXVzZXMgdGhlIFQ3IGRhdGEuCi0gUGF0Y2ggMzogUmV2aWV3ZWQtYnkgZnJvbSBOZWlsLgot
IExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEwMjUxOTIyNDQuMjA5
MjU2LTEtY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQKClRvb2wgdXNl
IChEb2N1bWVudGF0aW9uL3Byb2Nlc3MvZ2VuZXJhdGVkLWNvbnRlbnQucnN0KToKVGhpcyB3b3Jr
IHdhcyBkb25lIHdpdGggdGhlIGhlbHAgb2YgYW4gQUkgY29kaW5nIGFzc2lzdGFudCwgQ2xhdWRl
CihBbnRocm9waWMpLCB1c2VkIHRocm91Z2ggQ2xhdWRlIENvZGUgb3ZlciBtYW55IHNlc3Npb25z
LiBJdCBkaWQgYSBsYXJnZQpwYXJ0IG9mIHRoZSBoYW5kcy1vbiB3b3JrOiBpdCByZWFkIHRoZSB2
ZW5kb3Iga2VybmVsIGFuZCB0aGUgZmlybXdhcmUKaW50ZXJmYWNlcywgcHJvYmVkIHJlZ2lzdGVy
cyBvbiB0aGUgYm9hcmQsIGRyYWZ0ZWQgdGhlIGNvZGUgYW5kIHRoZQpjaGFuZ2Vsb2dzLCBhbmQg
cmFuIHRoZSBidWlsZHMsIGNoZWNrcGF0Y2gsIGR0X2JpbmRpbmdfY2hlY2sgYW5kIHRoZQp0ZXN0
cyBvbiB0aGUgaGFyZHdhcmUuIEkgZGlyZWN0ZWQgdGhlIHdvcmssIHJldmlld2VkIGV2ZXJ5IGNo
YW5nZSBhbmQKdGhlIGZpbmFsIHBhdGNoZXMsIGFuZCB0YWtlIHJlc3BvbnNpYmlsaXR5IGZvciB0
aGVtLiBUaGVyZSBpcyBubyBzaW5nbGUKcHJvbXB0IHRvIHF1b3RlOyB0aGUgc2Vzc2lvbnMgd2Vy
ZSBvZiB0aGUgZm9ybSAiZmluZCBvdXQgd2h5IFggZmFpbHMgb24KdGhpcyBib2FyZCwgZml4IGl0
LCB0ZXN0IGl0IG9uIHRoZSBib3giLgoKVGVzdGVkIG9uIGFuIEFtZWRpYXRlY2ggWDk4USBUViBi
b3ggKEFtbG9naWMgUzkwNVcyLCBTNCBmYW1pbHksIDIgR2lCKSwKdmVuZG9yIFUtQm9vdCBhbmQg
QkwzMS9PUC1URUUsIExpbnV4IDcuMyBwbHVzIHRoaXMgd29yay4KCkNocmlzdGlhbiBTdGVmYW4g
S8O2dsOpci1EcmF4bCAoMyk6CiAgZHQtYmluZGluZ3M6IHRoZXJtYWw6IGFtbG9naWM6IGFkZCBT
NAogIHRoZXJtYWwvZHJpdmVycy9hbWxvZ2ljOiBhZGQgUzQgc3VwcG9ydAogIHRoZXJtYWwvZHJp
dmVycy9hbWxvZ2ljOiBkbyBub3QgbG9nIHRoZSBzZWN1cmUgbW9uaXRvciBkZWZlcnJhbCBhcyBh
bgogICAgZXJyb3IKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhl
cm1hbC55YW1sICB8ICA1ICsrKystCiBkcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMg
ICAgICAgICAgICAgICAgICAgICB8IDExICsrKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDdiZTRiYzUyZmQ5
ZTBlNTVkYzlhMmUwMjMyYjg5NDI3ZDJjNGI2MTQKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
