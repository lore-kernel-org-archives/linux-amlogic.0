Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80476C7EE43
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCDj2L/cR1MSnAThoDQOCK/8Mmr2Bc8fqFQRUWjadmA=; b=thtU4Aco4DEe6J
	vv15WdAOz7iuZQ7tCkFupzax3cAzl69Hqi5C0cxQt9URqEJogr2sFUN15dhBENZcIpbBjIyl/57S9
	qCtxCP3DH81FH/Vsr1OcFhJ8kx5pcF9F5wI2Sd+PZRv6r7YQNhBhCkOuXyNhnTXX9vCEkBxhvI2ch
	zIjpc2NvdCbJ2s6sL2QWWxyn7sWLSNUySzDidR/8AHWYBWJEQaDkDgeB2k5jITJTiA5IwXrmt7OZg
	j8Y4SwKdU5hkg5JnmIlhM1Jg3o9bxuwVO9mtnkS+898+aSGVHlZ5YH/9sWtTSBjMfCCaWwAONYlhx
	NJY10FXkvxNmEFkjTjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fed-003kua-1p;
	Mon, 12 Jun 2023 11:24:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8feX-003kq0-2y
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 11:24:07 +0000
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B2146606EAD;
	Mon, 12 Jun 2023 12:24:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686569041;
	bh=yqMqNpyHVkgq4WKh8+eF7oS6FS05FaX9Qi/K1pSkMuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OZHBoW7A24+wIOKow0V9M960YH+OEywS/jyGMDkYZY+j+VK16dDREqWGBp29SHtJn
	 44g56TQBAfs7qppulTdDUxbsrLjZPAC4+EBoUUDKaamzuTKGeorWLbfz1jE5EtKZRD
	 hcCo2YG4UgfFGGBTxR/7YKD8lcSeGcp6IUcex381o8sPqtqNycQFCKupOch3+tczdv
	 dYG8EB0mPGFvJ6RxGmN7P1f+LZT++iYxAkVccluj1bNo5r4y+raoqa6DJQBv4tVaJi
	 KwQdDl/tK6QX/s0JQcfv7k4rtkv7Xc1giI9MD9AHybRbzYGKc88VPrZ/5n2leqVN+M
	 3SwQt8tw7lh8Q==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	rfoss@kernel.org,
	andrzej.hajda@intel.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v2 3/3] dw-hdmi: remove dead code and fix indentation
Date: Mon, 12 Jun 2023 12:23:54 +0100
Message-Id: <20230612112354.4034489-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_042406_115049_C3EBEB31 
X-CRM114-Status: UNSURE (   8.64  )
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

VGhlIGhkbWlfZGF0YW1hcCBlbnVtIGlzIG5vIGxvbmdlciBpbiB1c2UuIEFsc28gcmVpbmRlbnQg
ZW5hYmxlX2F1ZGlvJ3MKY2FsbCBwYXJhbXMuCgpTaWduZWQtb2ZmLWJ5OiBBZHJpw6FuIExhcnVt
YmUgPGFkcmlhbi5sYXJ1bWJlQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAyMiArKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IDNhNzg4MzE2ZTJlNS4uNjljMGU4
MGI4NTI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAt
NDksMjAgKzQ5LDYgQEAKIAogI2RlZmluZSBIRE1JMTRfTUFYX1RNRFNDTEsJMzQwMDAwMDAwCiAK
LWVudW0gaGRtaV9kYXRhbWFwIHsKLQlSR0I0NDRfOEIgPSAweDAxLAotCVJHQjQ0NF8xMEIgPSAw
eDAzLAotCVJHQjQ0NF8xMkIgPSAweDA1LAotCVJHQjQ0NF8xNkIgPSAweDA3LAotCVlDYkNyNDQ0
XzhCID0gMHgwOSwKLQlZQ2JDcjQ0NF8xMEIgPSAweDBCLAotCVlDYkNyNDQ0XzEyQiA9IDB4MEQs
Ci0JWUNiQ3I0NDRfMTZCID0gMHgwRiwKLQlZQ2JDcjQyMl84QiA9IDB4MTYsCi0JWUNiQ3I0MjJf
MTBCID0gMHgxNCwKLQlZQ2JDcjQyMl8xMkIgPSAweDEyLAotfTsKLQogc3RhdGljIGNvbnN0IHUx
NiBjc2NfY29lZmZfZGVmYXVsdFszXVs0XSA9IHsKIAl7IDB4MjAwMCwgMHgwMDAwLCAweDAwMDAs
IDB4MDAwMCB9LAogCXsgMHgwMDAwLCAweDIwMDAsIDB4MDAwMCwgMHgwMDAwIH0sCkBAIC04NTYs
MTAgKzg0MiwxMCBAQCBzdGF0aWMgdm9pZCBkd19oZG1pX2dwX2F1ZGlvX2VuYWJsZShzdHJ1Y3Qg
ZHdfaGRtaSAqaGRtaSkKIAogCWlmIChwZGF0YS0+ZW5hYmxlX2F1ZGlvKQogCQlwZGF0YS0+ZW5h
YmxlX2F1ZGlvKGhkbWksCi0JCQkJCSAgICBoZG1pLT5jaGFubmVscywKLQkJCQkJICAgIGhkbWkt
PnNhbXBsZV93aWR0aCwKLQkJCQkJICAgIGhkbWktPnNhbXBsZV9yYXRlLAotCQkJCQkgICAgaGRt
aS0+c2FtcGxlX25vbl9wY20pOworCQkJCSAgICBoZG1pLT5jaGFubmVscywKKwkJCQkgICAgaGRt
aS0+c2FtcGxlX3dpZHRoLAorCQkJCSAgICBoZG1pLT5zYW1wbGVfcmF0ZSwKKwkJCQkgICAgaGRt
aS0+c2FtcGxlX25vbl9wY20pOwogfQogCiBzdGF0aWMgdm9pZCBkd19oZG1pX2dwX2F1ZGlvX2Rp
c2FibGUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCi0tIAoyLjQwLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
