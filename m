Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D32C7EE23
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ot4Jd6XNAbhlVn2BYdYycNMvsitVT3iAhR/8FHJd8uQ=; b=A8lZYppWNmmtzg
	MSB0MJByrfDr+ujH1nh0Zfb/o/eto0VvolCEuxt4TmlXxjY22v3o47q6xQx/JXDjALjPHXGI1Z+mg
	Gca9428H7jprTdEvopjPh5nousi4skIbd83rdVKpN1l+5lLOiYViRWEUxW0kzaKBzvg5w3DjsnxS9
	82FmjzylesFUxbDhy/6RUwqE4GCWxi3yfFKwvYfCtcOxmga0tZQi6rxw2jB+Z5B2nuD/yXdV8TT5Y
	PBphf6mmhNw/PMdqREU+l/zkCjxKyEqxCm6r/qvWG9Ys6eZeC7r1s3+K3iXT5G9RdtBwBMvw36pdh
	aSRI57DjuXCWyEJ6StCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3GwU-007ksD-0n;
	Sun, 28 May 2023 14:00:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3GwO-007kqN-3C
	for linux-amlogic@lists.infradead.org;
	Sun, 28 May 2023 14:00:15 +0000
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D44966031F4;
	Sun, 28 May 2023 15:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685282409;
	bh=AsSXYHUkFyBX1xgopDi8EBlEKBrTYKvlfNS5sqv9JVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kAhAaQYozMNIKdNTBTlcc6WGY8wUBBc4pzekU+PtDLhwE4CI9IsCDKkG/nfcTxIZW
	 GfkjgIovEGLmpMTH8aEDspjs3aqOXDSyi30INr0hz6z10f8klkk2GS4mgL0Qhed9bD
	 tggd6+JQyD6xUekLw/1xXD2OWgSCYtLi1JePs1+XM1ws4+jdcU747kvjy/RQl3aRR5
	 z2pkiM9FtmmpqhYm5Nz8e8MSFva+8N0WZWVEGcvriNjr+ffsxL5DUoFv58N3K90mgx
	 Y0OmCDT3AD2dPQBMxkkGstsv5MBLvl8pfSH+R+34wb0QEuGce00yXqBkvNkatFGT5i
	 YkCMK0mt7NThw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	rfoss@kernel.org,
	andrzej.hajda@intel.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH 2/3] dw-hdmi: truly enforce 420-only formats when drm mode demands it
Date: Sun, 28 May 2023 15:00:00 +0100
Message-Id: <20230528140001.1057084-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_070013_157547_3733EADD 
X-CRM114-Status: UNSURE (   9.18  )
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

VGhlIGN1cnJlbnQgb3V0cHV0IGJ1cyBmb3JtYXQgc2VsZWN0aW9uIGxvZ2ljIGlzIGVuZm9yY2lu
ZyBZVVY0MjAgZXZlbgp3aGVuIHRoZSBkcm0gbW9kZSBhbGxvd3MgZm9yIG90aGVyIGJ1cyBmb3Jt
YXRzIGFzIHdlbGwuCkZpeCBpdCBieSBhZGRpbmcgY2hlY2sgZm9yIDQyMC1vbmx5IGRybSBtb2Rl
cy4KClNpZ25lZC1vZmYtYnk6IEFkcmnDoW4gTGFydW1iZSA8YWRyaWFuLmxhcnVtYmVAY29sbGFi
b3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8
IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IGQ1OWE1
NDdmOWNiMi4uMWFmYjhmMjYwM2EwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYwpAQCAtMjcxMCw5ICsyNzEwLDEwIEBAIHN0YXRpYyB1MzIgKmR3X2hkbWlfYnJp
ZGdlX2F0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Us
CiAJCS8qIERlZmF1bHQgOGJpdCBmYWxsYmFjayAqLwogCQlvdXRwdXRfZm10c1tpKytdID0gTUVE
SUFfQlVTX0ZNVF9VWVlWWVk4XzBfNVgyNDsKIAotCQkqbnVtX291dHB1dF9mbXRzID0gaTsKLQot
CQlyZXR1cm4gb3V0cHV0X2ZtdHM7CisJCWlmIChkcm1fbW9kZV9pc180MjBfb25seShpbmZvLCBt
b2RlKSkgeworCQkJKm51bV9vdXRwdXRfZm10cyA9IGk7CisJCQlyZXR1cm4gb3V0cHV0X2ZtdHM7
CisJCX0KIAl9CiAKIAkvKgotLSAKMi40MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
