Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21FACDB47E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=OML+0/05PnKedg063DxFmgJoBCxrJ2s5ZLzc0x0Up38=; b=MJ/xijiEyvjpMY
	GE0eTEz6H2gRLWzYJn9rZVWtBjqwWOuoYxchKan82FS4Em0osik3H0za+7rvZSqaUE/MYKZP/Cn46
	bnrttIrK2OrWXiPjUvARRTrO7ZvUygZ+P+fh+8uLOKYU17rYM3rY0T81tg5R9oR2VOBPFd05x1rDO
	mjszcEqIBcRD8GDojy4tzH9dj5jl4KaaJCmIcnldmD9WAqjl/IeDyQVQ9gWIiLm+5Z5vGTw41Da98
	1IfoZNrqSEgUUSXPnn3lzn9Ar8Nxt+jmUGDmcojyPdPcO6p/bjguBnQQ/lfnr5qcEehxn3QauVawb
	ZwmU2WosYyJj+EELmJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt2r-000gCy-2J;
	Thu, 12 Oct 2023 10:35:57 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt2o-000gBt-0Y
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Oct 2023 10:35:55 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231012103552euoutp01bcb2c2fc749d938d647231243f4ab1d2~NVcg0ANQj2461624616euoutp01Y
	for <linux-amlogic@lists.infradead.org>; Thu, 12 Oct 2023 10:35:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231012103552euoutp01bcb2c2fc749d938d647231243f4ab1d2~NVcg0ANQj2461624616euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1697106952;
	bh=pRocOWbLmFkX14j8M3e9FXIWgY1BV92Y54Jshph52MQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=R0RYOkVlS5jd0T3ErYhS0xURXI2jbAHFCbWpowwTsK4dn57TmEd5WKkKWs1QWE2tW
	 f1GpB2GbN7ejZ68ztx74Q5C+iWq8To70Fm+6A3N2fs9vpJx2rByz8Z4PM9/nGaxo6k
	 Fcbv91Sndjh5PUFyETuwtH4yOItgF2QnC2VR24Vg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20231012103552eucas1p2b5f69a8dd430fbcbe529fe2168ae0f5c~NVcgQMWSW2556325563eucas1p2b;
	Thu, 12 Oct 2023 10:35:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 3F.F1.42423.80CC7256; Thu, 12
	Oct 2023 11:35:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231012103551eucas1p2422c1c7ace26714addeaadde8b645d4b~NVcf4gfvZ2496324963eucas1p2d;
	Thu, 12 Oct 2023 10:35:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231012103551eusmtrp18c9206812519c6889542bdfcede1ba8d~NVcf3n8qD2245122451eusmtrp1R;
	Thu, 12 Oct 2023 10:35:51 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-41-6527cc08435e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 5D.76.10549.70CC7256; Thu, 12
	Oct 2023 11:35:51 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231012103551eusmtip12ca3011d9adb466532462fccc090cf97~NVcfQs1Fy2518625186eusmtip1L;
	Thu, 12 Oct 2023 10:35:51 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jiucheng Xu
	<jiucheng.xu@amlogic.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
	Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
	Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] perf/amlogic: add missing MODULE_DEVICE_TABLE
Date: Thu, 12 Oct 2023 12:35:43 +0200
Message-Id: <20231012103543.3381326-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djPc7ocZ9RTDTom8lm8eXSE2eLUuzlM
	Fj/btzBZLJjNbbHp8TVWi8u75rBZrD1yl91i6fWLTBbHFp1ksXi/8xajRcsdUwdujyNrVjN6
	rJm3htHj/Y1Wdo+nEyaze2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAzissmJTUnsyy1SN8u
	gSujd5dewSPWiu7N31kbGH+ydDFyckgImEi0zuxmArGFBFYwSkyZytzFyAVkf2GU2PBgFSOE
	85lR4t+Vi0wwHTP+H4GqWs4oMeHcBza4lrv/HrGBVLEJGEp0ve0Cs0UEsiUmvfwE1sEscJlJ
	4u6Pi4wgCWEBO4nHWxaCFbEIqEpMOPaTFcTmFbCXuPV4GyPEOnmJ/QfPMkPEBSVOznwCdjgz
	ULx562ywoRICVzgkfl64AfWRi0TXop1QtwpLvDq+hR3ClpE4PbmHBaKhnVFiwe/7TBDOBEaJ
	hue3oNZZS9w59wvoJA6gFZoS63fpQ4QdJToXnGAFCUsI8EnceCsIcQSfxKRt05khwrwSHW1C
	ENVqErOOr4Nbe/DCJWYI20Oid/J9dkhgx0rMetfGPIFRYRaS12YheW0Wwg0LGJlXMYqnlhbn
	pqcWG+allusVJ+YWl+al6yXn525iBKat0/+Of9rBOPfVR71DjEwcjIcYJTiYlUR4H2WqpArx
	piRWVqUW5ccXleakFh9ilOZgURLnVU2RTxUSSE8sSc1OTS1ILYLJMnFwSjUwCdgsSjZa+U1C
	x9jkjm5Q1lnzSraHjauDpjIc2Lkh6YdGZMolbrY2SQ3B5le8kgZGvXkH2YUcpHgtF6zPPvAl
	xmORuKfknDIuXUGtw6ZnK0JuL9owK4G7IOFe4ZI1u2/zXP5wX21+XMZhn/byPNf/HzQmbAi3
	/b/l6I9lL7QWh3xniVlnISli3GDDUffGN+VeeY+ciRR/z8SUKepGyyde5JM4sdnZ3+W3XmV9
	qpmVuNSLXwY7kme+S6nrqS9UfLtCwPnCN0EF2xNHY6LVp01tiDK8+6C0Kapv+0VBMYsl+75G
	LlmY0L+2PfdF6gseFY/SxHnBEnwvD0yx+WiQy6hV8tSnr4JD78BBvj9+7EosxRmJhlrMRcWJ
	AJW0tPXKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e/4XV32M+qpBjc6TSzePDrCbHHq3Rwm
	i5/tW5gsFszmttj0+BqrxeVdc9gs1h65y26x9PpFJotji06yWLzfeYvRouWOqQO3x5E1qxk9
	1sxbw+jx/kYru8fTCZPZPTat6mTzuHNtD5vH5iX1Hn1bVjF6fN4kF8AZpWdTlF9akqqQkV9c
	YqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfRu0uv4BFrRffm76wNjD9Z
	uhg5OSQETCRm/D/C3MXIxSEksJRR4vqbDjaIhIzEyWkNrBC2sMSfa11sEEWfGCW+3tzMDpJg
	EzCU6HrbBdYgIpArcax9PVgRs8BNJol7z3aAdQsL2Ek83rIQrIhFQFViwrGfYHFeAXuJW4+3
	MUJskJfYf/AsM0RcUOLkzCdg5zEDxZu3zmaewMg3C0lqFpLUAkamVYwiqaXFuem5xYZ6xYm5
	xaV56XrJ+bmbGIHxsu3Yz807GOe9+qh3iJGJg/EQowQHs5II76NMlVQh3pTEyqrUovz4otKc
	1OJDjKZA901klhJNzgdGbF5JvKGZgamhiZmlgamlmbGSOK9nQUeikEB6YklqdmpqQWoRTB8T
	B6dUA1PboYgXx9c/fHpU47buVc7pe5o3mLdU61ycM3un982A9Q2P/jNEpk5Pba01Ddx+qTbh
	2vn3elOKEiuPfnRjW7Hk+6v7zcuK2J8Lv1j9Mmz+6jM+u+QcLx1hahLh4Mk9UtYzdZ24q03w
	D9Y5Z6IDAxzdVRiYWTYnM2wVWm2592t72QbHiUdyJ1jvE+Z7MfvYy6BHGwUCAhrP7c7KrHSY
	nifz2uDrpI1cs5zN5TnPK2gUv7vqIhzItILr+v3XK/7/qH9xk9VONswiw7Duc+aWDWK/tVYl
	mz41mzSr/difz0HR+ySZtp+bEMtzgnHPopp/x2TeFp7rMdiovOL347K3df6TNP2r7lYqRajO
	Cz58h32HEktxRqKhFnNRcSIA9c9qeSADAAA=
X-CMS-MailID: 20231012103551eucas1p2422c1c7ace26714addeaadde8b645d4b
X-Msg-Generator: CA
X-RootMTR: 20231012103551eucas1p2422c1c7ace26714addeaadde8b645d4b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231012103551eucas1p2422c1c7ace26714addeaadde8b645d4b
References: <CGME20231012103551eucas1p2422c1c7ace26714addeaadde8b645d4b@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_033554_476244_CD1AEDBE 
X-CRM114-Status: GOOD (  11.16  )
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

Add missing MODULE_DEVICE_TABLE macro to let this driver to be
automatically loaded as module.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/perf/amlogic/meson_g12_ddr_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
index 8b643888d503..15d52ab3276a 100644
--- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
+++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
@@ -377,6 +377,7 @@ static const struct of_device_id meson_ddr_pmu_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, meson_ddr_pmu_dt_match);
 
 static struct platform_driver g12_ddr_pmu_driver = {
 	.probe = g12_ddr_pmu_probe,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
