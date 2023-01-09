Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B93C54EBD
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 22:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=J7sco4pfTUgrhUyHcZ9dIFaK7nFh/u8NnKCjq++uirM=; b=WMGA3BYWAk1xEk
	Bdm9Mg/9Pahbrliv7GAiuwHjZgv6WxkzyG96Mme1P7fFhWAtZdt8NjseovUDmelZ3R6SCPrzrXVT2
	VF/GXeBXxlU4u9WH/TV29v+UnarnOixId/2wsmS8yMBf6L68kbdS2tBzyy7xqGezvgfNrJuo56GQW
	dcfaXXZrT4SpaSq2LvrzcBIJPrstOCv+u3DjSkHWJdScq6bTf/JsLeXjiWMEWBZqFDfUQY8uxLq12
	yccBN6GDQUIKg73UwKfsQqUQw7mKqgk12h12bT4KDJ74K4TqcoNxLAGzXXvx14T/vy47zdt0BKlUh
	+BqHP28rBHfqNgoHyXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0Dd-004Pki-KW; Mon, 09 Jan 2023 22:02:13 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0CX-004PJa-Ci
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 22:01:14 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230109220058euoutp027b48f7a3d18d1be9019b1bb0d71f183c~4wv4lioAl0528905289euoutp02G
	for <linux-amlogic@lists.infradead.org>; Mon,  9 Jan 2023 22:00:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230109220058euoutp027b48f7a3d18d1be9019b1bb0d71f183c~4wv4lioAl0528905289euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1673301658;
	bh=oNj316/wrNXkPWQOOqvZpTUN5bmBqJu7fq2iwsgnbTg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=dHk3FqVcHjrbPUwPI2I480gxsqwA4b7jYk/Qsn/Sxc4+RPwcSVVTJRfhlo1mBGhHb
	 8fa/L+cCVPq6i50rK1klJ1w9+tJkQo1WgAOanTbTM2rxfpy0IrS9hUHicsNIujyvp4
	 YTrSOGuZrIOXIrT8ubMb6YzafE/tiVMG1eWrVNGw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230109220057eucas1p2eb238fa66cb3680d4e7d521e74686cfc~4wv3cfFBN1519015190eucas1p2b;
	Mon,  9 Jan 2023 22:00:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id D4.9B.56180.99E8CB36; Mon,  9
	Jan 2023 22:00:57 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230109220056eucas1p26418012878272961a3a21a365192ef60~4wv3IR-ox1575115751eucas1p2Y;
	Mon,  9 Jan 2023 22:00:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230109220056eusmtrp2954b769b5f4561fa8c26d06a2e61f62f~4wv3Hrl2E3272032720eusmtrp2L;
	Mon,  9 Jan 2023 22:00:56 +0000 (GMT)
X-AuditID: cbfec7f2-acbff7000000db74-fd-63bc8e998d31
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 0C.AA.52424.89E8CB36; Mon,  9
	Jan 2023 22:00:56 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230109220056eusmtip1f48eb352646e98805ed365f88d9d33e0~4wv2iZxCr1488214882eusmtip1U;
	Mon,  9 Jan 2023 22:00:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Matti Vaittinen
	<mazziesaccount@gmail.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
	<jbrunet@baylibre.com>
Subject: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Date: Mon,  9 Jan 2023 23:00:33 +0100
Message-Id: <20230109220033.31202-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djPc7oz+/YkG/xdxGZx4voiJov/2yYy
	W1z5+p7N4s2jI8wWP9u3MFksmM1tsfbIXXaLY4tOsljMWXqCxeL9zluMDlwe72+0snvs/baA
	xWPnrLvsHk8nTGb3uHNtD5vH/e7jTB6bl9R79G1ZxRjAEcVlk5Kak1mWWqRvl8CVseLqBOaC
	PewV/057NTBuZ+ti5OSQEDCRuLL8I0sXIxeHkMAKRolPXddYQRJCAl8YJbq/B0AkPjNKzFjU
	xgjTMan9NlTHckaJPQfPsUI4QB1PVx5jBqliEzCU6HrbBbZDRMBN4seByYwgRcwCN5kkjnx/
	xgSSEBYIlng+fy5QgoODRUBVYuNjbpAwr4CtxIOjD1kgtslLtD7fygoRF5Q4OfMJWJwZKN68
	dTYzyEwJgTMcEp/+3mSCaHCR2PP/DtRzwhKvjm9hh7BlJP7vnM8E0dDOKLHg930oZwKjRMPz
	W1DPWUvcOfeLDeQiZgFNifW79EFMCQFHiQkzCiFMPokbbwUhbuCTmLRtOjNEmFeio00IYoaa
	xKzj6+C2HrxwiRnC9pA4Mn8tCyR0YyXOrOlknMCoMAvJZ7OQfDYL4YQFjMyrGMVTS4tz01OL
	DfNSy/WKE3OLS/PS9ZLzczcxAlPU6X/HP+1gnPvqo94hRiYOxkOMEhzMSiK8Kzn3JAvxpiRW
	VqUW5ccXleakFh9ilOZgURLnnbF1frKQQHpiSWp2ampBahFMlomDU6qByUrUaf/vJJOKr75O
	vprnO3jtrYWfK9T4uS3/Vpygb5hY5n1218+dpm0u32pU7vktX1oj/uodQ9ma+lt1zzzN7NS9
	g0vV/NQfHUhLCrqSd3fpU/nV9j90i/gnvtpw3e6live0aqfcJI53l7M3CUnf+rL02Y4ehTSj
	K1K9Mx9ukNm18IWlhqf3856HQSuPx37sVhR951tu7GWyKzc/93bjysJ3ocW7i93mvroTdGap
	9dS4F0vuMn3seFO8zqVonrrdqSTu6JBEJ2ObHofTxlllaWr/39dMLtevSxcufDPjV+rXjmuG
	XGcKOee8YXkqfiDy7Dcru58WvO3GXiEpVbL/GN13sD2c6agafNggdqUSS3FGoqEWc1FxIgBo
	MqbVwAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42I5/e/4Xd0ZfXuSDaZv0rY4cX0Rk8X/bROZ
	La58fc9m8ebREWaLn+1bmCwWzOa2WHvkLrvFsUUnWSzmLD3BYvF+5y1GBy6P9zda2T32flvA
	4rFz1l12j6cTJrN73Lm2h83jfvdxJo/NS+o9+rasYgzgiNKzKcovLUlVyMgvLrFVija0MNIz
	tLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLWHF1AnPBHvaKf6e9Ghi3s3UxcnJICJhI
	TGq/zdLFyMUhJLCUUWL6ts+MEAkZiZPTGlghbGGJP9e62CCKPjFKLG1fxgKSYBMwlOh62wU2
	SUTAQ+Li6wawImaBu0wSR+7+YAZJCAsESizdvYy9i5GDg0VAVWLjY26QMK+ArcSDow9ZIBbI
	S7Q+38oKEReUODnzCVicGSjevHU28wRGvllIUrOQpBYwMq1iFEktLc5Nzy020itOzC0uzUvX
	S87P3cQIjI5tx35u2cG48tVHvUOMTByMhxglOJiVRHhXcu5JFuJNSaysSi3Kjy8qzUktPsRo
	CnTeRGYp0eR8YHzmlcQbmhmYGpqYWRqYWpoZK4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUw
	zTz0a1mYQ/LMtQwsBy7PV4vrnb1K7ZzIL7ZL3+LCG3aeuKV9+1KlXp/PfHlHh89vV+26mecw
	i+9TZJRAAxfn1hWT+ivmmz9T3Biqe0O/X0VJ9GCU2NYZuw17FKptd7Grt0udLe0ovDhdXFQx
	X6D0HKPxqR9Wn3n8Z1nVCdcLC259E/bt4ck+UWFfudu3nJ6KmVZYMdguEI3WUKk6cP7TZfs3
	91pf82g5z+d0bC157jMh+U2DrFW9xbcetxnvP6llPOlaeHttbbWE7SI++/m7fpx9IXH41Nw7
	obYBTZe86m5ZV4b/+S2r19cfxv1D91W+0TbFoiX7XBRXsTfmtlyyrvl1fWOqWNB5aa5Fy28o
	sRRnJBpqMRcVJwIAsoAqARcDAAA=
X-CMS-MailID: 20230109220056eucas1p26418012878272961a3a21a365192ef60
X-Msg-Generator: CA
X-RootMTR: 20230109220056eucas1p26418012878272961a3a21a365192ef60
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230109220056eucas1p26418012878272961a3a21a365192ef60
References: <CGME20230109220056eucas1p26418012878272961a3a21a365192ef60@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_140109_728789_C5169DC6 
X-CRM114-Status: GOOD (  13.03  )
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

devm_regulator_get_enable_optional() function returns 0 on success, so
use it for the check if function succeded instead of the -ENODEV value.

Fixes: 429e87063661 ("drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 7642f740272b..534621a13a34 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
 
 	ret = devm_regulator_get_enable_optional(dev, "hdmi");
-	if (ret != -ENODEV)
+	if (ret < 0)
 		return ret;
 
 	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
