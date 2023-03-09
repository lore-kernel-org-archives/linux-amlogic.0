Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FD5C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 15:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=X8gWy6dHNnKMnRCSqZCkcCWowtK+qy4YH4JUF2a27mQ=; b=KDWkmNHjWYOOsI
	8hQs6c29kwLet5Y+8hIQQ5FQeJoS3Efoy4/aquwjz4KWTuaro/Q9WirsSVeXlGfOVeIav95fT8ZiC
	qGryk8Ap9bAAGeX5PS9FqQ2792FkMErTQdwL3N13WCtuPj+UXPz2SgdfzIuiZvxpacezsDgUGsdc/
	98rIG0akSXnGFKkNVdq/+IX9HsDpU/Zz9zqbghQqt/uJD2hXEg9ivh9/3rpIaOEG03e3WAZznQjNM
	Odq9fUmnk2uEzDSQ/aZVRr0Md7A4yuyPYZdpQjmzNhqNaWBJGSL5tC+CYmXmd/WHfJfK2HyZdj8DV
	ruepXeIDrcv4TOjS27Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIQn-00Azd4-Ot; Thu, 09 Mar 2023 15:43:49 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paI8Y-00Asbj-8q
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 15:25:01 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230309152454euoutp01ff223094b86a32a1c1aaa228fb2cfe7f~KyZ6lmj1Z3090230902euoutp01t
	for <linux-amlogic@lists.infradead.org>; Thu,  9 Mar 2023 15:24:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230309152454euoutp01ff223094b86a32a1c1aaa228fb2cfe7f~KyZ6lmj1Z3090230902euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1678375494;
	bh=1faJVX5Kb2yIpI/XJhLzAq6nIArsD3/2jIyL3Bmnadk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QjUsqYzdG7A1ccT2lwgn563RaocmGY8vIV8F/dybIExFKHC3Fw/qzG0r8+JVueUH2
	 hFSTCDCAIXlRvyA27uzVJRu6Ch2AKW8CUHIvq2GKBJ69te4R7avcBWtTPk1wZ01IsD
	 beGKJWu7esd/hHmadXtxX6W51Zrw9h/uYeDt5uOo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230309152453eucas1p293142f0eadcb75bf2e31465ff1ab487d~KyZ6H4uNN0249702497eucas1p2N;
	Thu,  9 Mar 2023 15:24:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.07.09503.54AF9046; Thu,  9
	Mar 2023 15:24:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230309152453eucas1p28e1870593875304648243c9dead4b256~KyZ5yQBgG2942629426eucas1p2D;
	Thu,  9 Mar 2023 15:24:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230309152453eusmtrp1165f6ce04162f3de2bc7626c34f181d1~KyZ5xoz8i2522825228eusmtrp1-;
	Thu,  9 Mar 2023 15:24:53 +0000 (GMT)
X-AuditID: cbfec7f2-e8fff7000000251f-0f-6409fa459bad
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 29.8E.09583.54AF9046; Thu,  9
	Mar 2023 15:24:53 +0000 (GMT)
Received: from AMDC2765.eu.corp.samsungelectronics.net (unknown
	[106.120.51.73]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230309152452eusmtip1c87ad0d57cf96c16cc4c3d4c7e496311~KyZ5DA5uI0767807678eusmtip1B;
	Thu,  9 Mar 2023 15:24:52 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Matti Vaittinen
	<mazziesaccount@gmail.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
Date: Thu,  9 Mar 2023 16:24:46 +0100
Message-Id: <20230309152446.104913-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djP87quvzhTDD63GFqcuL6IyWLqwyds
	Fv+3TWS2uPL1PZvFm0dHmC1+tm9hslgwm9ti7ZG77BbHFp1ksZiz9ASLxfudtxgt/h39zuzA
	4/H+Riu7x467Sxg99n5bwOKxc9Zddo+nEyaze2xa1cnmcefaHjaP+93HmTw2L6n36NuyijGA
	K4rLJiU1J7MstUjfLoEr4+CvNywFrzgq3v1eytzAeI69i5GTQ0LARGLuzvXMXYxcHEICKxgl
	Ol//Z4dwvjBKNO7rY4RwPjNK/Jh8iA2m5XJ/P1TVcqCWlUug+luZJHbcaQAbzCZgKNH1tgus
	Q0TATeLHgclgo5gFDjBLHNn+HKiIg0NYIFLi4AI5kBoWAVWJ/d2rmEBsXgE7iZbJX6EOlJfY
	f/AsM0RcUOLkzCcsIDYzULx562ywxRICPzgkGluusUI0uEis3z8H6lRhiVfHt0ANkpE4PbmH
	BaKhnVFiwe/7TBDOBEaJhue3GCGqrCXunPvFBnIds4CmxPpd+hBhR4mfK7aDHS0hwCdx460g
	xBF8EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5ghbA+JH3OPgJ0pJBArsXfPLPYJjAqzkLw2
	C8lrsxBuWMDIvIpRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwoZ3+d/zTDsa5rz7qHWJk
	4mA8xCjBwawkwvtdiiNFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clkIYH0xJLU7NTUgtQi
	mCwTB6dUA5NM04mEpbP/LvarZmN61xtkxWIdpnlaXdZ/0xmTsGWZZkomoi+vlnPuPhC0k/Pi
	4oVc3hJuO/oul0WEbhNwuWG4ydjS/3zs6a8cv8TS/YwiUuLWCLbqJMeIXFY8en+Ns42oZLmV
	6JNrWzd5O9YpzVBf2ha8Xnm1z271R0ePn32ZLvW2ad/D7/HhDavEzzpe0EvcL938RuagyzvW
	6Yl22xtfHljwTpSjwYK1M3na+7xKBgG9I5ziNxM0ONbLFFzYZfEy2ajhR6OzIdOkc7ZWP70d
	nq/5IPpD8ciM7s8cmwSnPD8SUujzZWV7jcWFfXqMkqtqPvxR12+QsZ42zfLZrPjmqVo8GrwP
	v349eKNXRImlOCPRUIu5qDgRAN7QKHTXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7quvzhTDH5vELU4cX0Rk8XUh0/Y
	LP5vm8hsceXrezaLN4+OMFv8bN/CZLFgNrfF2iN32S2OLTrJYjFn6QkWi/c7bzFa/Dv6ndmB
	x+P9jVZ2jx13lzB67P22gMVj56y77B5PJ0xm99i0qpPN4861PWwe97uPM3lsXlLv0bdlFWMA
	V5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexsFf
	b1gKXnFUvPu9lLmB8Rx7FyMnh4SAicTl/n4gm4tDSGApo0THz05miISMxMlpDawQtrDEn2td
	bCC2kEAzk0TzC00Qm03AUKLrLURcRMBD4uLrBjaQQcwCx5gl9i3pB0sIC4RLtHZ+AxvKIqAq
	sb97FROIzStgJ9Ey+SvUFfIS+w+eZYaIC0qcnPmEpYuRA2iQusT6eUIgYWagkuats5knMPLP
	QlI1C6FqFpKqBYzMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQJjbtuxn1t2MK589VHvECMT
	B+MhRgkOZiUR3u9SHClCvCmJlVWpRfnxRaU5qcWHGE2Brp7ILCWanA+M+rySeEMzA1NDEzNL
	A1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqaQBfYLYoX5e4tmhTYa7S54cSXUadvV
	j9/jreQjwmOqeLbOj1wUXaGz+FTB5PO6u6NUZO7vTH0pkfNxZtK9A3ctjqyQ2D1/V1W/nVFV
	SQDLe4ugq2fC+Tymfn7xPSBA8bsbp+zljQs+nD3g16b57MOtdWHFIo9na+32lvZ8d+fhKjVr
	nmTL+ruzK24XXGTh0Lu49v9Pl6w4lY3BqVo8ptarbTSa1++L6pa877Veds6D8hs9u9+23tsn
	knxOti/F/o7Ii5nK9xe0v2j5k2LlqL1HoLD01vrn+7OfmrzQ9qpRWPzr9oaLwl0el7h51jVf
	W7Fi2b8lIYZvooK/Cj6xY2G1ls463SehWdB7Rcy1z1uJpTgj0VCLuag4EQACR+XWQgMAAA==
X-CMS-MailID: 20230309152453eucas1p28e1870593875304648243c9dead4b256
X-Msg-Generator: CA
X-RootMTR: 20230309152453eucas1p28e1870593875304648243c9dead4b256
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230309152453eucas1p28e1870593875304648243c9dead4b256
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_072459_072973_7DA785A2 
X-CRM114-Status: GOOD (  13.39  )
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

ZGV2bV9yZWd1bGF0b3JfZ2V0X2VuYWJsZV9vcHRpb25hbCgpIHJldHVybnMgLUVOT0RFViBpZiBy
ZXF1ZXN0ZWQKb3B0aW9uYWwgcmVndWxhdG9yIGlzIG5vdCBwcmVzZW50LiBBZGp1c3QgY29kZSBm
b3IgdGhhdCwgYmVjYXVzZSBpbiB0aGUKNjdkMGEzMDEyOGM5IEkndmUgaW5jb3JyZWN0bHkgYXNz
dW1lZCB0aGF0IGl0IGFsc28gcmV0dXJucyAwIHdoZW4KcmVndWxhdG9yIGlzIG5vdCBwcmVzZW50
LgoKUmVwb3J0ZWQtYnk6IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xsYWJv
cmEuY29tPgpGaXhlczogNjdkMGEzMDEyOGM5ICgiZHJtL21lc29uOiBkdy1oZG1pOiBGaXggZGV2
bV9yZWd1bGF0b3JfKmdldF9lbmFibGUqKCkgY29udmVyc2lvbiIpClNpZ25lZC1vZmYtYnk6IE1h
cmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1p
LmMKaW5kZXggNTM0NjIxYTEzYTM0Li4zZDA0Njg3OGNlNmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX2R3X2hkbWkuYwpAQCAtNzE4LDcgKzcxOCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fZHdf
aGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWR3
X3BsYXRfZGF0YSA9ICZtZXNvbl9kd19oZG1pLT5kd19wbGF0X2RhdGE7CiAKIAlyZXQgPSBkZXZt
X3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29wdGlvbmFsKGRldiwgImhkbWkiKTsKLQlpZiAocmV0IDwg
MCkKKwlpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVOT0RFVikKIAkJcmV0dXJuIHJldDsKIAogCW1l
c29uX2R3X2hkbWktPmhkbWl0eF9hcGIgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2
ZShkZXYsCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
