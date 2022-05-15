Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A63C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 May 2022 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJCLIWVhP65VxO6iPKCUPzFuEFE+RXenmbKlsvndtnQ=; b=WQ8D24lf8l0YNH
	X/+8lPNdN6tHCeadRUX9JCW6IZpD0S/P0CdI2H+n6Vc8CXMN1lCMkFB+l3+zJDZUsfFf5ywXoAmFC
	YGGN+9pvyNLjISb4oEP8LA52eHyY3AbSr+gBngGu2zbZNJWIn9/P085XcMBII5BeiTgeuObtgNDuO
	2TTQoW5DykJwRoVBtBcwnA+7sQmSQF1mQFURnCJ68XoPUmBaI9lVSHQz6wb34h2a24bqA0F1kce4h
	ZXrbkdT662NqExhlkSWZj+rUEC1tTDKwcbl1GmrUnV+7K2HCtXbc9YQ6zU2RulTyCk09a9QJezvUt
	a4+n8qPUa/QQ0vZamkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqL6I-00516W-27; Sun, 15 May 2022 20:44:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqL6F-00515O-6E
 for linux-amlogic@lists.infradead.org; Sun, 15 May 2022 20:44:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alarumbe) with ESMTPSA id 181AC1F40848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652647459;
 bh=NDTySiDmKSwj7gbdz9Iao713A5gVozGrjrvvWD1ujRM=;
 h=From:To:Cc:Subject:Date:From;
 b=VS+hV8xjEEUP1cNYl11UorWIjKRuRCWdQ6QVD1u6Ta25skEYG4AoEhHHZjMccleBT
 GxRi5xhKU5BVKHNjgRRNAsqYRwOWDM2ghQczEg6y8JB+W4Q2ThjXwMKBK9u6QKFWHL
 SpPssIdbFuLi5UPjdI75MFtLNglA2riOBIjxJnqrVqfTGdbDPZvQBlPXRddio+I4gv
 4z/k42nCszeAUqB/Bc/xbeohlyRhwXd0DkBBb9PgVsdOxDHNSEFqd3K9nGr/hKrSoP
 uPfyx4rtB6YAO3k/NWQsJg5RET/cGLogFcjPTm4cRLsQ2ayGC6WDvOoO6u9gJ1EnfD
 9mWYX8owjtUoQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: adrian.larumbe@collabora.com
Subject: [PATCH] drm/meson: fix HDMI2 420 display mode selection logic
Date: Sun, 15 May 2022 21:44:12 +0100
Message-Id: <20220515204412.2733803-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_134423_484110_B2723DFB 
X-CRM114-Status: UNSURE (   9.69  )
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

Q29tbWl0IGU2N2Y2MDM3YWUxYmUzNGIyYjY4ICgiZHJtL21lc29uOiBzcGxpdCBvdXQgZW5jb2Rl
ciBmcm9tCm1lc29uX2R3X2hkbWkiKSBpbnRyb2R1Y2VkIGEgbmV3IHdheSBvZiBjYWxjdWxhdGlu
ZyB0aGUgZGlzcGxheSdzIHBpeGVsCmNsb2NrLiBIb3dldmVyLCBpdCBsZWFkcyB0byB0aGUgd3Jv
bmcgdmFsdWUgYmVpbmcgcmVja29uZWQgZm9yIE9kcm9pZCBOMisKYm9hcmRzLCB3aGVyZSBjbG9j
ayBmcmVxdWVuY3kgaXMgbmV2ZXIgaGFsdmVkIHdoZW4gdGhlIGRpc3BsYXkncyB2aWRlb21vZGUK
c3VwcG9ydHMgWUNCQ1I0MjAgb3V0cHV0IGZvcm1hdC4KCkZpeCB0aGUgc2VsZWN0aW9uIGxvZ2lj
LgoKU2lnbmVkLW9mZi1ieTogQWRyacOhbiBMYXJ1bWJlIDxhZHJpYW4ubGFydW1iZUBjb2xsYWJv
cmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwppbmRleCA1Y2QyYjJlYmJiZDMuLjZjOTY0MGY0Yzgy
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCkBAIC0zODAsNyArMzgwLDcg
QEAgc3RhdGljIGludCBkd19oZG1pX3BoeV9pbml0KHN0cnVjdCBkd19oZG1pICpoZG1pLCB2b2lk
ICpkYXRhLAogCQkJIG1vZGUtPmNsb2NrID4gMzQwMDAwID8gNDAgOiAxMCk7CiAKIAlpZiAoZHJt
X21vZGVfaXNfNDIwX29ubHkoZGlzcGxheSwgbW9kZSkgfHwKLQkgICAgKCFpc19oZG1pMl9zaW5r
ICYmCisJICAgIChpc19oZG1pMl9zaW5rICYmCiAJICAgICBkcm1fbW9kZV9pc180MjBfYWxzbyhk
aXNwbGF5LCBtb2RlKSkpCiAJCW1vZGVfaXNfNDIwID0gdHJ1ZTsKIAotLSAKMi4zNS4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
