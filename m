Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A036BC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:07:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A08F20665
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ct2wPhlm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hGMCcT8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A08F20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:Message-Id:Date:Subject:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=kMDi6NvpngJxLMCO+CtxxDMroJUfrLUGZopaXM6zWsM=; b=Ct2wPhlmypC3TSmeVY4Uo0ZUNi
	EvbYGxusVITnVJ5hrHt1Up8449ZCz9EDmZw2ZcXhSyEg8tEKzb4ihEDnWNTWHedVF5H/bq44BRXUq
	/FMHdaqa+FKTOuUJPEBVRISq+wzevDJGM8GvmcXliOjg2LFCkUxAv3LGYMQMAOdscEXo0Pkv9sl/Y
	RCj4DJz5JxnqCk1PK94YndGkOb27rPQXpg3QCYlIfx2UmSaHdp2QrJ+ttw7c48VjNLjWB/DK8j/mm
	Q4drbIUK7YNSnzM25LnjaqKJr+lS45hfhl0gfO4ujF+acHu50SMbbKExoymY0quPoG9O175ze/JTE
	Ly0O3A3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBe6C-0001ho-9g; Fri, 28 Aug 2020 13:07:20 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBe69-0001gp-VA
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 13:07:19 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200828130715euoutp02903d2c1f5a36bebe71ffbac95d80c6b3~vcHPTX5nM1285412854euoutp02F
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 13:07:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200828130715euoutp02903d2c1f5a36bebe71ffbac95d80c6b3~vcHPTX5nM1285412854euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598620035;
 bh=NnSR6KpXMzjkk1wzGR33M6iWIlXpcOAe3kk+qj+qB+4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=hGMCcT8PgBi3YIontvxdBk3nW7cA2o7WJu+mJWkHg1TXYiSvKP9HV3Y8jY3b/qHyB
 5FSA81gW74Dktpa796sr621xl9a+vU2sd+QQUnm3kbqg6oSSpAyaqRW3CJ6NKyhiuv
 7uvTDo/8+YJ8dJFWl2rKeTpVWmAQnv+Ta0yWBSnY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200828130715eucas1p246140a05e1cd43922fbd9bef628d20af~vcHO8U_G00754707547eucas1p2q;
 Fri, 28 Aug 2020 13:07:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 92.06.06456.381094F5; Fri, 28
 Aug 2020 14:07:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200828130714eucas1p26b45e68ee12ca6c31b0ebe62bf699ba7~vcHOjg-7B1068210682eucas1p2P;
 Fri, 28 Aug 2020 13:07:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200828130714eusmtrp13a412918e8e2928b42cccf3fe798a393~vcHOizK8z0481104811eusmtrp1V;
 Fri, 28 Aug 2020 13:07:14 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-80-5f490183fdc7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.CA.06314.281094F5; Fri, 28
 Aug 2020 14:07:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200828130714eusmtip14b2df8adfb89d3bb54984db5839e7ede~vcHOB5hcD1484014840eusmtip1h;
 Fri, 28 Aug 2020 13:07:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH] clk: meson: g12a: mark fclk_div2 as CLK_IGNORE_UNUSED
Date: Fri, 28 Aug 2020 15:07:07 +0200
Message-Id: <20200828130707.9045-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42LZduzned1mRs94g2WvWS02zljPavHm0RFm
 i5/tW5gsFszmtvjYc4/V4vKuOWwWa4/cZbc4tugki8WhvmiLf9c2sjhweby/0cru8XTCZHaP
 Tas62Tw2L6n36NuyitHj8ya5ALYoLpuU1JzMstQifbsErow9K8+xFeziqOhd9Zm5gfEdWxcj
 J4eEgIlE24HVQDYXh5DACkaJWdOmMEI4Xxgl5m66xwLhfGaUWPa6nwWmZem+e6wQieWMEjN6
 JiG07D1yAayKTcBQouttF9gSEYEEid/f5jOBFDEL7GWSePToMiNIQljATaK7fyuYzSKgKjHj
 zSOwBl4BG4mVWzpYIdbJS6zecIAZpFlC4DWbxJQP15ghEi4SV7ach7pJWOLV8S3sELaMxOnJ
 PSwQDc2MEg/PrWWHcHoYJS43zWCEqLKWuHPuF9A6DqCbNCXW79KHCDtK3J28jwUkLCHAJ3Hj
 rSBImBnInLRtOjNEmFeio00IolpNYtbxdXBrD164BFXiIXFzYyhIWEggVuLi0jvMExjlZiGs
 WsDIuIpRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwYZz+d/zTDsavl5IOMQpwMCrx8O7Y
 5x4vxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8xotexgoJpCeW
 pGanphakFsFkmTg4pRoYfaP1lnvenrVVSvq5xirZLzprjiVXcO9jXpL5eeqMTaFGtxaG6ai1
 t0fM85/49NbEiLOtcw+vfxI649tqxif7DsS6ajQ1rw+tEDfWmib0TUXua8TiYvuQkt/mm1oy
 Gu8HJl3dclFwbZJE3g3fZQ4eWvJnzd8cNGCZ0/98bUf71P2m0gq80++IKrEUZyQaajEXFScC
 ANRsgI4UAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsVy+t/xu7pNjJ7xBjtfqVlsnLGe1eLNoyPM
 Fj/btzBZLJjNbfGx5x6rxeVdc9gs1h65y25xbNFJFotDfdEW/65tZHHg8nh/o5Xd4+mEyewe
 m1Z1snlsXlLv0bdlFaPH501yAWxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehl7Vp5jK9jFUdG76jNzA+M7ti5GTg4JAROJpfvusYLYQgJLGSXe
 byiBiMtInJzWwAphC0v8udYFVM8FVPOJUeLYmnPsIAk2AUOJrrddYINEBJIklp/dCVbELHCQ
 SWJC0wmwImEBN4nu/q2MIDaLgKrEjDePwBp4BWwkVm7pgNogL7F6wwHmCYw8CxgZVjGKpJYW
 56bnFhvqFSfmFpfmpesl5+duYgSG6bZjPzfvYLy0MfgQowAHoxIP74597vFCrIllxZW5hxgl
 OJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCrR8IrOUaHI+MIbySuINTQ3NLSwNzY3Njc0s
 lMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwTntbkL7QX7Ku/+MkZlNznVTurFmze83Y/p88
 U3/p1e5nywXLJ3cWpPWxN/K8jE1/VOEVuORi1aEjpdNvOn28xmzYxSR3bKbwWgGGJ2d4nkn0
 bL/nFDZZ9PGGpmMxh1/v/hx1Sl8qZPO85IzFf7v2ChvNSOvV2apQ8zZ3p0vUQ+G1oRkzYmw8
 lViKMxINtZiLihMBIs7O42kCAAA=
X-CMS-MailID: 20200828130714eucas1p26b45e68ee12ca6c31b0ebe62bf699ba7
X-Msg-Generator: CA
X-RootMTR: 20200828130714eucas1p26b45e68ee12ca6c31b0ebe62bf699ba7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200828130714eucas1p26b45e68ee12ca6c31b0ebe62bf699ba7
References: <CGME20200828130714eucas1p26b45e68ee12ca6c31b0ebe62bf699ba7@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_090718_336906_E79061AF 
X-CRM114-Status: GOOD (  15.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add CLK_IGNORE_UNUSED flag to the "fclk_div2" clock to fix boot hang on
the Hardkernel's Odroid N2 board (with bootloader booted from SD card and
kernel loaded via FTFP).

It looks that this clock is disabled by the generic unused clocks
scanning code before it gets enabled by the meson-gx-mmc driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Without this patch the only way to boot OdroidN2 board with mainline
kernel is to append clk_ignore_unused kernel parameter. I've build the
kernel from the default arm64's defconfig. The kernel is loaded via TFTP
using vendor's u-boot.
---
 drivers/clk/clk.c        | 5 +++++
 drivers/clk/meson/g12a.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 9803d44bb157..4106b6231be4 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
 			&g12a_fclk_div2_div.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 };
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
