Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998A8C7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxVECQUYe9q827SFWyeW4RX4+42Hj0BGZeFf3ypUAkc=; b=svSiuYQMMWKeco
	ei/U0UtbYlkgE8rotMGPlVkU2s8pXcX7dZ1nhmeagiueoVuyjJeFPhJ+qbL1XeMbi7m08yRfPatVv
	mtJbCldU5GU4qqF6l1A6nTL5eIBFITFS99XyoVmvnrPLcLtXO6YIvsOAnZKp7TpAaizL970qOTmQs
	BGrcBCBGfw8opXs4UgQ0Uz3L+VP+R094Oe5v2M237xVDqUMKBBPbut6YyG2X9ckQKIcUXYTDpw69d
	yrreUWVy685cPxzl257KwlRdQ3qs82JtPz/mFyzsXrxrnot403sLGQMtFlk8erNPUUWHcVrxVwu+5
	KB6vrgdUvm1Z7MkTFFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fec-003ku3-2a;
	Mon, 12 Jun 2023 11:24:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8feX-003kpy-2l
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 11:24:07 +0000
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F2CEA6606E9D;
	Mon, 12 Jun 2023 12:24:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686569041;
	bh=cBP6h0Qj6xzi3ai4GIcJimJ3/B31KfrcJ0WCXAN8SKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CKsga2UY5qkVj7HGWMbLxQLWmXmQrpAYewgxB3/bBuCrjjkXgQVssiPXceqGlBuK0
	 PuroSuBmGX8TV0DxDBYWemQypis+HP9pMCRE9UuLqD9O6rCssEhrSqM/TEsfqaf2po
	 s6wb+X0W9215nBGKLkyKtIPOPyix2HehAC0ah4/nhp4fhIC7tTfm686YF+NBmdeOji
	 /5CTsJjf9EgDaQz8TI3b7F7+oOTK+t/oK0A+D1TqROF7QShpwofs3NYX471UBCQNHa
	 VGN2g3nFZLZQa1nvL07TE1K0QsBPgUULykkCVON+8EXiXgxH2c6XAHiQ5ET8as4HM/
	 Zo89QxXeDrTcg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	rfoss@kernel.org,
	andrzej.hajda@intel.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v2 2/3] dw-hdmi: truly enforce 420-only formats when drm mode demands it
Date: Mon, 12 Jun 2023 12:23:53 +0100
Message-Id: <20230612112354.4034489-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_042406_071264_82C52055 
X-CRM114-Status: UNSURE (   9.35  )
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
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IGU2YTQ1
NmI3MjYxMC4uM2E3ODgzMTZlMmU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
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
