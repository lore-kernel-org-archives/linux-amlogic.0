Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6E606A320
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNJMncBV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=sJ/0pYiU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YC07Jx0ITZBKIRKMfb3fPMLZbTCjSgkTd9AxEvwjZxI=; b=cNJMncBVjIcTyroYhkLW9mk4P0
	Ex0Km2DkZBl+xSSIJ4MAhwrA6ibcya8CsE90PJZmfjWdlcYFOqxJzbt7t0/FvN0p/Avy0WEi8VNLb
	vPbKGRwxe1G1vjBFHDxadBwLwIM1yWYkGZeHaguHTo1W9GnqajdRSevWVYzERXMAlhos5/XZcKhdN
	L4Bl4S/9P3JasMCuHYhKk9QTUsbRyuKxFTXMf5Ax5u06hjtAppKheIqcF4pHsxeBQHvcguB7B2zwT
	YkNwlIJnGd6VQMKTmtKmo5hbse86jRo0GI2LcCLOsbnTF4eN06Ym9EVLIxXGrvUVoyO4DYa5LPZEG
	5H/9bnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nV-00000001L9h-0AzL;
	Sun, 25 Oct 2026 19:22:25 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nQ-00000001L3o-461L;
	Sun, 25 Oct 2026 19:22:22 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJM3W6516897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJM3W6516897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956129;
	bh=aavG+Y2s4PjGm/W+opxqBIodXCzZpQc9N4L8Umwz6mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sJ/0pYiUBw0uLkc7tCSDkD5iKbY3WsGi/M/wEy1pQr+FBLHrcwWkgbv9M6qDUoU9I
	 2Rid27tr7AC9U3bjYF1zXblJ1GdBZ35WlHykV7GRsL887tQl6V7Hkl+aeTnthA6RIj
	 69/Jbo5aaDqEEHo1zgIaQbvTHmv14Mzl5eARd4Ck=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: phy: amlogic,g12a-usb2-phy: add S4 compatible
Date: Sun, 25 Oct 2026 20:22:01 +0100
Message-ID: <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122221_378971_D238A03D 
X-CRM114-Status: UNSURE (   7.22  )
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
CgpUaGUgUzQgVVNCMiBQSFkgaXMgdGhlIEcxMkEvQTEgZGVzaWduIHdpdGggYSBmZXcgZGlmZmVy
ZW50IGFuYWxvZwpzZXR0aW5ncywgc28gaXQgbmVlZHMgaXRzIG93biBjb21wYXRpYmxlLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxv
b2suZGU+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9hbWxvZ2lj
LGcxMmEtdXNiMi1waHkueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9hbWxv
Z2ljLGcxMmEtdXNiMi1waHkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvYW1sb2dpYyxnMTJhLXVzYjItcGh5LnlhbWwKaW5kZXggMWEwYzQzNmI4N2EwLi41NDA1
OGQyZTYwNTMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aHkvYW1sb2dpYyxnMTJhLXVzYjItcGh5LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9hbWxvZ2ljLGcxMmEtdXNiMi1waHkueWFtbApAQCAtMTUsNiArMTUs
NyBAQCBwcm9wZXJ0aWVzOgogICAgIGVudW06CiAgICAgICAtIGFtbG9naWMsZzEyYS11c2IyLXBo
eQogICAgICAgLSBhbWxvZ2ljLGExLXVzYjItcGh5CisgICAgICAtIGFtbG9naWMsczQtdXNiMi1w
aHkKIAogICByZWc6CiAgICAgbWF4SXRlbXM6IDEKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
