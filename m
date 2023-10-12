Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBE0CDB46E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=dYKOyueuiOCHlSlLH+Oq/c44cXIeSXoKlSRjRVp4euA=; b=Aekk2jf0kOLv8V
	fV+Li3mUYE6NsCf2/pYCEDaKuVEsPCVZYZgR4pKN7FqNlgEpBGcwYYBzuX0rzKFr6WWrKrLjOk0pi
	hPtaGIv+P18PdB6g3x4B2X8POYOnIMeJKb14o/8cCcQhpAwnbgcOuJrAdpAWtnFWPm1Y2aWJdqNS5
	CZ/dkjFPoL6k9OWqhrMKikePrL6MlO7ZhpA5i24eifm8oxU/0MhK1BFeM9hN7hYhAHHdj/9D4IfQ1
	zDG1+l4eE6NbeYh9uJYy4BtHr0u1Kag1QkBPal1NlKrkWQw9BvusZkethRVZmYG7NMMq2axaWig/B
	EBFLiAPwrBkixtC+tYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt2d-000gAf-16;
	Thu, 12 Oct 2023 10:35:43 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt2Y-000g9F-1k
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Oct 2023 10:35:42 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231012103532euoutp014e01bc7cb91dd9af8596009c5ad94b8c~NVcNtTwTT2440324403euoutp01u
	for <linux-amlogic@lists.infradead.org>; Thu, 12 Oct 2023 10:35:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231012103532euoutp014e01bc7cb91dd9af8596009c5ad94b8c~NVcNtTwTT2440324403euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1697106932;
	bh=vZ6q5ULxdh0t0IrN2RtBejM5no6tzpOqogEIP27ked8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PukFaw6DcM0ynvCe3UczXFE/N+z+QyxNvin4LT/oiPqxHbpEloS/LOg0DT4nbRL4y
	 GqfwDQOujfWR7lz0hF1cpZaLdt1Gq6rUU2Yo9ebstbQ9/3lgOUcmSfMk58UWPfgF02
	 cq6b8h5LM5zJechJHkTMxqnnjWMAnDmZYX5zhIDY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20231012103532eucas1p2ed42cf43d90b50b42220fb371f36719c~NVcNf0Ejp2545425454eucas1p2b;
	Thu, 12 Oct 2023 10:35:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 15.F8.37758.4FBC7256; Thu, 12
	Oct 2023 11:35:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20231012103531eucas1p1f370bddcb690aa421498e961f4081f2b~NVcNN9K8G3023930239eucas1p1P;
	Thu, 12 Oct 2023 10:35:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231012103531eusmtrp27df298802da261f0feee022569fb4ef4~NVcNNbROS2357523575eusmtrp2q;
	Thu, 12 Oct 2023 10:35:31 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-a8-6527cbf4e7cd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 0C.72.25043.3FBC7256; Thu, 12
	Oct 2023 11:35:31 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231012103531eusmtip25bf41ad9fefdd2f6b8d5833e9a3d5fbb~NVcM0v_A93168831688eusmtip2K;
	Thu, 12 Oct 2023 10:35:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: cec: meson: always include meson sub-directory in
 Makefile
Date: Thu, 12 Oct 2023 12:35:25 +0200
Message-Id: <20231012103525.3381314-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduznOd0vp9VTDRb8Y7e4OPMui8WC2dwW
	l3fNYbPo2bCV1WLtkbvsFss2/WFyYPPYtKqTzWPzknqPvi2rGD0+b5LzOPX1M3sAaxSXTUpq
	TmZZapG+XQJXxu7vMxgLOtkrtu+/wNjA2M3WxcjBISFgIrFzs2kXIxeHkMAKRon7Z46zQThf
	GCXO/Z3P2sXICeR8ZpRYcB7MBmnY0P6DCaJoOaPE1RdnEDruf9nFBFLFJmAo0fW2iw3EFhFI
	kng67w0zSBGzQBujxP6Hx5lBEsICIRL33s4Ha2ARUJV4u3U5WAOvgL3Ejyf3GSHWyUvsP3iW
	GSIuKHFy5hMWEJsZKN68dTbYUAmBqRwSh07+YIZocJE4tOwX1K3CEq+Ob2GHsGUk/u+czwTR
	0A70z+/7UM4ERomG57eg1llL3Dn3Cxw0zAKaEut36UOEHSX+rL3OCgkxPokbbwUhjuCTmLRt
	OjNEmFeio00IolpNYtbxdXBrD164BHWah8SFF9vYIUEaK3Fy4RHGCYwKs5C8NgvJa7MQbljA
	yLyKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjML2c/nf86w7GFa8+6h1iZOJgPMQowcGs
	JML7KFMlVYg3JbGyKrUoP76oNCe1+BCjNAeLkjivaop8qpBAemJJanZqakFqEUyWiYNTqoHJ
	mPFVopXdeWGjHiPHnZPl7Cz6JUrKr75Y/X3iVJNpE57NeGEy8/FeVqVGxo0BezfqsQeeiVi1
	QYxvatar5RF6zx2EdrJO3X6hsiSTOyAiT5Iloqjg5onz7rVN8ZO7dPuv8vfm9Gv9yl+lc3KZ
	QuDUbf3Bl8VfsdQdnflj4t6jnmaLU6qYPeWql1uLvuho7PVQfHlkggd73KsegSsXI4V6vv9n
	W/Nvrjabvba8zMH/Jwxn/fl5ysVM6FJFjN9/l4CYaf92SL876BzTdZzrxI2pDE/yJb8nvXwt
	JS5recCy+tTHwPvHDQ5mG2/9yqe34iu3um3qcfdd229wByVJ7Nq24EtM6i6ZDS11bSoHH4kr
	sRRnJBpqMRcVJwIATfK7zp4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsVy+t/xe7qfT6unGvw7YmxxceZdFosFs7kt
	Lu+aw2bRs2Erq8XaI3fZLZZt+sPkwOaxaVUnm8fmJfUefVtWMXp83iTncerrZ/YA1ig9m6L8
	0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jN3fZzAWdLJX
	bN9/gbGBsZuti5GTQ0LARGJD+w+mLkYuDiGBpYwSjdunMUIkZCROTmtghbCFJf5c62KDKPrE
	KPFw8RawIjYBQ4mut11gk0QEUiQWT7zDCFLELNDBKPHq0jGWLkYODmGBIIkdi8JBalgEVCXe
	bl0OVs8rYC/x48l9qGXyEvsPnmWGiAtKnJz5hAXEZgaKN2+dzTyBkW8WktQsJKkFjEyrGEVS
	S4tz03OLjfSKE3OLS/PS9ZLzczcxAsN627GfW3Ywrnz1Ue8QIxMH4yFGCQ5mJRHeR5kqqUK8
	KYmVValF+fFFpTmpxYcYTYHum8gsJZqcD4ysvJJ4QzMDU0MTM0sDU0szYyVxXs+CjkQhgfTE
	ktTs1NSC1CKYPiYOTqkGpirNyy/ZKjO0fhwWXl686fkcV0uNjg39aZHtz9XOSV68VKMdJTRr
	KufiF7vWuTkvidyfuvW/UW1YB7es4g1WDvbjfnpHnbXl/CM75viadb79F5Xb/ipKccvG4uXM
	c1122+e5b+r2mJU1KelGhPalyR8D04I1jCsfTN5aZCCtPVmsP/NP9oOFLwSrWha3FyiwXEk1
	K2tc+XP3ufJzpxpn9OvYHM7qXW8jeruqZ9mq0qWVU5M8lnqydXYuNrVcalxa8SJ2ykPljd85
	vhfKly399XaK0aYTy6I6NjRzKGi3NbNMWLPP/1+0wGMugWePV/Td63/La3XzfLPt4iXhr9e9
	2rKs8a2RkNUD1uo35W1VSizFGYmGWsxFxYkAgR5yhvQCAAA=
X-CMS-MailID: 20231012103531eucas1p1f370bddcb690aa421498e961f4081f2b
X-Msg-Generator: CA
X-RootMTR: 20231012103531eucas1p1f370bddcb690aa421498e961f4081f2b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231012103531eucas1p1f370bddcb690aa421498e961f4081f2b
References: <CGME20231012103531eucas1p1f370bddcb690aa421498e961f4081f2b@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_033539_185008_2072FA4B 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

'meson' directory contains two separate drivers, so it should be added
to Makefile compilation hierarchy unconditionally, because otherwise the
meson-ao-cec-g12a won't be compiled if meson-ao-cec is not selected.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/cec/platform/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/Makefile b/drivers/media/cec/platform/Makefile
index 26d2bc778394..a51e98ab4958 100644
--- a/drivers/media/cec/platform/Makefile
+++ b/drivers/media/cec/platform/Makefile
@@ -6,7 +6,7 @@
 # Please keep it in alphabetic order
 obj-$(CONFIG_CEC_CROS_EC) += cros-ec/
 obj-$(CONFIG_CEC_GPIO) += cec-gpio/
-obj-$(CONFIG_CEC_MESON_AO) += meson/
+obj-y += meson/
 obj-$(CONFIG_CEC_SAMSUNG_S5P) += s5p/
 obj-$(CONFIG_CEC_SECO) += seco/
 obj-$(CONFIG_CEC_STI) += sti/
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
