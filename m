Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B4DC77B7E
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmywRo/1AXVwIQ5TmZjeiBzuYx3ffVXSvdgHsDo7MNA=; b=mg896PJTUU2qHH
	BEqcjXVqmQG9erSejPfo2ar8cCwYo3RKo+/etOXIqJb9Q0fQ/HuDaOUmCNOC+NXxuz190DtY/cyd2
	3g7whB/yTfiAqAYnm01EKoSoJdZRsViOxKUQCw5hzUtdDKeNUESN142B4zTaBi5eFuXYBlRAuNRji
	Zu34n7247zti2iURpvfcYbalnkZVeTXJNxDBzXPZrhWZ/Ftl9CgYw0UWW62w4T2PGzsczMBw54KgV
	Hw0f1E8q9Jp4AaildF3IAfP2JMLoQUosw9uu6EwGeZzv0lDUP52d4WFDtasXq6cFtVq4Br9Gi6stI
	X2u6h10O53Wy/z+Xjuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3GwR-007krg-13;
	Sun, 28 May 2023 14:00:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3GwO-007kqO-32
	for linux-amlogic@lists.infradead.org;
	Sun, 28 May 2023 14:00:14 +0000
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB0DE6605703;
	Sun, 28 May 2023 15:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685282409;
	bh=WAUfQLx2Jieo3ZVT9QyOs1XdimqsQfzrhTGzzHuNnqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UsaflhS5AUD3IUDGG6mJOWvSWM0RdyCm9XK+eqwZkw9l/nH4lpxycPGbEg9/MeXXG
	 ZhGm1aTOxrXsJmtyOqzR8ryyu9rm7Ffyg2ojaXsWTmW3S7+GIQhZd5aLZhhrYeSyup
	 QbrL9PRvSt9mTXrPanRbAoMa/5mEpFqdZA7Rcz+iCu1RYZpMc4nkb4ye9olrJO9HQI
	 TOWDh7RVXQCzrGf6+wGRfc2CNJQ69oSjCh4NLhTnHOocDLc1Wrtcd6Xn94AI4WZuQt
	 vNdeTydpq+nBvYtasHTIYBf11AxAFFh3D9g2OMPjhTShg570rvsAKLDBsOvBPh+isy
	 MiQWbMOR/KVow==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	rfoss@kernel.org,
	andrzej.hajda@intel.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH 3/3] dw-hdmi: remove dead code and fix indentation
Date: Sun, 28 May 2023 15:00:01 +0100
Message-Id: <20230528140001.1057084-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_070013_123187_AE3AFAB5 
X-CRM114-Status: UNSURE (   8.41  )
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

U2lnbmVkLW9mZi1ieTogQWRyacOhbiBMYXJ1bWJlIDxhZHJpYW4ubGFydW1iZUBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMjIg
KysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YwppbmRleCAxYWZiOGYyNjAzYTAuLjBhY2NmYjUxNTA5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKQEAgLTQ5LDIwICs0OSw2IEBACiAKICNkZWZpbmUgSERN
STE0X01BWF9UTURTQ0xLCTM0MDAwMDAwMAogCi1lbnVtIGhkbWlfZGF0YW1hcCB7Ci0JUkdCNDQ0
XzhCID0gMHgwMSwKLQlSR0I0NDRfMTBCID0gMHgwMywKLQlSR0I0NDRfMTJCID0gMHgwNSwKLQlS
R0I0NDRfMTZCID0gMHgwNywKLQlZQ2JDcjQ0NF84QiA9IDB4MDksCi0JWUNiQ3I0NDRfMTBCID0g
MHgwQiwKLQlZQ2JDcjQ0NF8xMkIgPSAweDBELAotCVlDYkNyNDQ0XzE2QiA9IDB4MEYsCi0JWUNi
Q3I0MjJfOEIgPSAweDE2LAotCVlDYkNyNDIyXzEwQiA9IDB4MTQsCi0JWUNiQ3I0MjJfMTJCID0g
MHgxMiwKLX07Ci0KIHN0YXRpYyBjb25zdCB1MTYgY3NjX2NvZWZmX2RlZmF1bHRbM11bNF0gPSB7
CiAJeyAweDIwMDAsIDB4MDAwMCwgMHgwMDAwLCAweDAwMDAgfSwKIAl7IDB4MDAwMCwgMHgyMDAw
LCAweDAwMDAsIDB4MDAwMCB9LApAQCAtODU2LDEwICs4NDIsMTAgQEAgc3RhdGljIHZvaWQgZHdf
aGRtaV9ncF9hdWRpb19lbmFibGUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCiAKIAlpZiAocGRhdGEt
PmVuYWJsZV9hdWRpbykKIAkJcGRhdGEtPmVuYWJsZV9hdWRpbyhoZG1pLAotCQkJCQkgICAgaGRt
aS0+Y2hhbm5lbHMsCi0JCQkJCSAgICBoZG1pLT5zYW1wbGVfd2lkdGgsCi0JCQkJCSAgICBoZG1p
LT5zYW1wbGVfcmF0ZSwKLQkJCQkJICAgIGhkbWktPnNhbXBsZV9ub25fcGNtKTsKKwkJCQkgICAg
aGRtaS0+Y2hhbm5lbHMsCisJCQkJICAgIGhkbWktPnNhbXBsZV93aWR0aCwKKwkJCQkgICAgaGRt
aS0+c2FtcGxlX3JhdGUsCisJCQkJICAgIGhkbWktPnNhbXBsZV9ub25fcGNtKTsKIH0KIAogc3Rh
dGljIHZvaWQgZHdfaGRtaV9ncF9hdWRpb19kaXNhYmxlKHN0cnVjdCBkd19oZG1pICpoZG1pKQot
LSAKMi40MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
