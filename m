Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545E5C7EE25
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BRbqe37XnsVv46qabBIgvBX+DaMpE2LBo889wfdorw0=; b=dm3962zJ2xiGqR
	YxfF5YG+WeuhnTnoa6j/Kuz850K3PiG1C4lvKrsth3BQMQAVRLjyAHlUZ5uJRociXaYrU9f2fa/tI
	OWcm++UctQftQSYeeZOKvJhmQAz0v9XHGQ1nBnvyN7qL/xuJMA5H3V3R10MHsJ+cBsX7zwxWfh31x
	IeVtURDRai5sri9eaMGsyd/1luKvlEjabVG88FTo1l92+xHeiQdUSDdsIaYBsfAqS3BN3BxcqB5zU
	yxOgaa0bUCOhKIkctiUxX4Y9S7sXtpJwgpgn6eLKm+LcxgS9jwJhLO20V0Ry8y0y5SxzVs2NHF+ey
	58HXJUHjqJb4e5UzftoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fea-003ksc-13;
	Mon, 12 Jun 2023 11:24:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8feX-003kpq-2s
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 11:24:07 +0000
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FCDF66003AC;
	Mon, 12 Jun 2023 12:24:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686569040;
	bh=Ol6uZvQw1JtPKUiDddroDlDWVO7F3Bn/r89VTUIuM0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=XzgDNAtcbxLhI11jPpvPnBrTg99f75HkMFWQ8SPyZWTBkwDbVuPokr/+VXMhTkAry
	 J18td5atC5IxOAohP3l4p6aMuY0xRmsHN7Czc2U2KohtfP7tQLPfCBuN9kbUDysXA0
	 C8ac5w2wx5oI4dZ/LNmfeAohEBAid2rP2L9DaD1xvKH3KBmNBoyNk+4tPo9ENHfOW7
	 f9xTgkT+nR26TgetY8sTjz/29cFAz2UYs/Zub8KP8AxSifiQUWeOJZApaMsZSs700+
	 ym0aMCxucCPH0cvQmjAjthitsbyFmI3KQII4Y69hkpucGVKhpFElyntezFfXyf+wli
	 4afDnN19A84Rg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	rfoss@kernel.org,
	andrzej.hajda@intel.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v2 0/3] Add additional YUV420 bus format check for dw-meson's bridge enable
Date: Mon, 12 Jun 2023 12:23:51 +0100
Message-Id: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_042406_070868_2CF4D745 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBpcyB2MiBvZjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjMwNTI4
MTQwMDAxLjEwNTcwODQtMS1hZHJpYW4ubGFydW1iZUBjb2xsYWJvcmEuY29tLwoKVGhlIG9ubHkg
ZGlmZmVyZW5jZSBpcyBoYXZpbmcgYWRkZWQgYW4gYWN0dWFsIGNvbW1pdCBtZXNzYWdlIHRvIHBh
dGNoCm51bWJlciAzIGluIHRoZSBzZXJpZXMuCgpBZHJpw6FuIExhcnVtYmUgKDMpOgogIGRybS9t
ZXNvbjogZHctaGRtaTogY2hhbmdlIFlVVjQyMCBzZWxlY3Rpb24gbG9naWMgYXQgY2xvY2sgc2V0
dXAKICBkdy1oZG1pOiB0cnVseSBlbmZvcmNlIDQyMC1vbmx5IGZvcm1hdHMgd2hlbiBkcm0gbW9k
ZSBkZW1hbmRzIGl0CiAgZHctaGRtaTogcmVtb3ZlIGRlYWQgY29kZSBhbmQgZml4IGluZGVudGF0
aW9uCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAzNSArKysr
KysrKystLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWku
YyAgICAgfCAgNCArLS0KIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAg
IHwgIDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25z
KC0pCgotLSAKMi40MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
