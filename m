Return-Path: <SRS0=E9O4=YL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54778CA9EA0
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 15:06:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA2A21897
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 15:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qSnipnTb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CJiEmw1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA2A21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-ID:
	In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1bW7QOkt3O2IaH1BqRe5R49MZgkymtPrdf+dhVLkS8=; b=qSnipnTbtXJCvF
	zQcErUhI82/EoJS6hwtCJamXHiu4SZSDGwy3vpEYsAT7XnounaVJODkWddvKzBYvZwI9YnS6HafBs
	kgjdYPMIEUy+cHN3Izb5FvUAXlMgrQCO5GiAm5ReRfU/ptkcVvifEyjo5IeSb+d9JfbBIviXQD1jb
	fHmAoKoTueZPDApTLutxJvb1vS+lbnl0y5Juolfu/OvFYwp+foKkKKOKRxzBqotiKSySF2gaZqsB8
	iKZsHApxAC5tUQbzgE/ykv9zR3FWLJ3lNy8EgT2VM0mt/lvzNHYzmd/cHWoq5ZHrqD1rEtkwtdscZ
	H+k6Axh7vHiKraqs8z6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLTpB-0001yw-V5; Fri, 18 Oct 2019 15:05:53 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLTp6-0001x9-GJ
 for linux-amlogic@lists.infradead.org; Fri, 18 Oct 2019 15:05:52 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191018150545euoutp02c54f8e30a0b62aa685ec28c00d469368~OxhxwUlfA1964019640euoutp02r
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Oct 2019 15:05:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191018150545euoutp02c54f8e30a0b62aa685ec28c00d469368~OxhxwUlfA1964019640euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1571411145;
 bh=YSf90oubbg4unQOpAuECCf40F0OM9F8QucJcCB/f+dg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CJiEmw1nNkjcAPXStcym14pCxyhtdgwqnesvEGJUBEs+I0YO7obNnDxWPBLJVgYE7
 Ofa7hIbwLXaBuw00pBHbuGVt2tQaBFW9Hit0xogx3CzfLjw09NPUVZfwPxYpF8YGrl
 4x48bcrOVCchqGBT3OW58tbyDIt/eGlCvXgCcznM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191018150544eucas1p1c918ba86091f4c9117d11a9b1ae0391b~Oxhw4nJfk1657216572eucas1p1D;
 Fri, 18 Oct 2019 15:05:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9D.27.04469.8C4D9AD5; Fri, 18
 Oct 2019 16:05:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191018150543eucas1p1cf4312467597ad7c76f258e924d8184a~OxhwWFemf1657216572eucas1p1C;
 Fri, 18 Oct 2019 15:05:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191018150543eusmtrp12c4596ecf9923ad48a9b0d6ecae06277~OxhwVHo-E3006030060eusmtrp1d;
 Fri, 18 Oct 2019 15:05:43 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-92-5da9d4c81cca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B6.31.04166.7C4D9AD5; Fri, 18
 Oct 2019 16:05:43 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20191018150543eusmtip256c26151370cc6b0f534f783d16fa5fa~OxhwKE-eZ1582815828eusmtip2f;
 Fri, 18 Oct 2019 15:05:43 +0000 (GMT)
From: =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next 03/13] hwrng: exynos - use
 devm_platform_ioremap_resource() to simplify code
Date: Fri, 18 Oct 2019 17:05:41 +0200
In-Reply-To: <20191016104621.26056-4-yuehaibing@huawei.com>
 (yuehaibing@huawei.com's message of "Wed, 16 Oct 2019 18:46:11 +0800")
Message-ID: <87v9smdrga.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxj29N7ee0FLjgXiu9rF2AwTMcrIyHIUo2zReRJ+aNw/jR9XuSlE
 iqQV/MDETosoKmgxUQpurUARFKoUi19BrUAZZOuYU8lEq6LicKIiIlglo72Y+e85z/s8z/uR
 IzDqek4jZGRtkYxZYqaOi2Q9baO/z23/q2bN1/mdQAoGnDz5aG3jSd2hVpYUlAwryLWfbiLy
 fqCFJ3sqXBw50K8lxb3PGTJa0Kggfv9ZntjLJpOG3ttKErg/qiA3L5Vz5Mjdcf64v1lBgu/G
 lORZ3R0lsXuKEGlyOxhS3n4LkSelbo4MnH6MiK99P0N63vaxKRq6+2UbR4PvrYi+7M7n6c9n
 8qgt8BtHL9ru8bSi4SpHPdfiqKXlhZI21O7n6NUTZ3jqrtxF/ccdiPaMVCHaa8lnaNE/Z9EK
 9arIhWlSZkauZExYtD4y3XUuOjsYte0X+xHGjNqiClGEADgJ+ipH+EIUKajxKQQP9l1g5ccQ
 goDzCRNSqfEbBGUW9SfH+Y6aCVE1gibXMSSL+hC4Ts4IYQ4vhuKWZjaEY/AssHQ0MiEDgweV
 sLuzhwsVonE63HYeVRYiQWBxHFw+Gh/SRGDLeE59eThUhb+BD47+cFAsng/3i+5xMj8Vfi19
 HOYZPAecjufhBoCHBHD/Ua2UR10C515VKGQcDf2+Rl7GWugsOciGGgPeBSXWb2XvQQSe8hFW
 1iTDDV9XeDgGzwbXpQSZ/g4Ct4o42RoF3S+myiNEgdVzjJFpFezbO3Grr6C++MpEoAYO9Z9C
 MqZQ1mTmD6OZts+WsX22jO3/vnbE1KJpUo7JoJdMiVnS1nkm0WDKydLP27jZ0IDGf3HnmG/w
 Anr75wYvwgLSTVE9c9asUSvFXNN2gxeBwOhiVD8mj1OqNHH7Dsm4eZ0xJ1MyedF0gdVNU+VN
 erBajfXiFmmTJGVLxk9VhRChMaPYnV1VmsXuKT76dPjLqhWzxUmZgQivfm1GPA3U6eLmGpa1
 Liepr1PtrwfnvAvG1Cr8d9N8Y+lJcQsegdaabHuYnKD9e/ngntgfWpuTSs19S13DuRsPp17v
 WFDjKP238Y5+a3DTjrxuSbMyZafPjD5qi78Y8n7PdB2AaGdK9VNRx5rSxcR4xmgS/wOh4dg/
 wQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRiGeXfOzjmzVm9T6WX4I04YZHjWnOa7vgx/vRFRUP2oFBt50sg5
 29miDyK1mWlkZUW6LJ2WNK2mm85SSFs2LSkzy4JMC42+yD6gD82sTYn6d3M/13M/PHBzlKpB
 rua2Z1pEc6Yhg2dC6K6JjoHojkfO5IV2dxzOH6lm8a9iP4uvHL1N4/yT32S4LacX4LGRdhYf
 rHIx+Mi7CHxs6D2FR/MbZLi7u47FFWenYfdQnxwPDozKcG9zGYNPPAv4Jd03ZPjn9wk5fnPl
 iRxXeIsAbvI4KFzW+RjgV6UeBo/UDgPc0VlA4f6vr+kVapL70c+Qn2PFgHx8mseS85f3Efvg
 PYZctz9nSZW7lSHetkhia/8gJ+6aAoa0nrvMEs+FA6S7xAFI/4+LgAzZ8ihS9LYOrFVtEpaa
 TVaLOCfdJFmW8Zu1OEbQ6rEQE6sXtLr45MUxcbxm+dJUMWP7LtGsWb5FSM+95GKzRkN25/R8
 YrJBuaIQKDgEY1HjXSddCEI4FbwI0ETPb7YQcIGBGjnPpU0xoWi8r5CZYl4BdKHyDBUcMDAB
 HWu/QQd1GJyHbHcbJn0KDsrR67HVQR0Kt6Hrg3lMUKvgYnQ6+zMdzKdhJGo5FRXMVEAbQK6r
 ZSDIKKEOjTveTWaGQz0aKHrOTPmz0J3S4cldCs5HrmbN1KkFqNrxnjoOZtn/o+z/KPt/VAWg
 akCYaJWMaUZJK0gGo2TNTBO2moxuEGiM1z/quQYe1q/zAcgBfrryTbUzWSU37JL2GH0AcRQf
 ply3JGApUw179opmU4rZmiFKPhAXeOcEpQ7fagr0L9OSoo3TxmO9Nl4Xr1uE+dnKw/Bmkgqm
 GSziDlHMEs1/92ScQp0NSsqZhHK9TXgSnnC/gHU21Pu2sD6jJqZnVdjwetvnvk2kqJWvrYw2
 +hPL9s+4lQrTHxgT5yYeXEN4YcOttSRl5SrvzHaN64tVsSK6t6omqbzY09W1YyeHvH3+lo35
 UuyPhYfMbXtfRLxs2kxXPmrzr36adXVOv5QCzzTudmCeltIN2ijKLBn+AN7zgpJHAwAA
X-CMS-MailID: 20191018150543eucas1p1cf4312467597ad7c76f258e924d8184a
X-Msg-Generator: CA
X-RootMTR: 20191018150543eucas1p1cf4312467597ad7c76f258e924d8184a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191018150543eucas1p1cf4312467597ad7c76f258e924d8184a
References: <20191016104621.26056-4-yuehaibing@huawei.com>
 <CGME20191018150543eucas1p1cf4312467597ad7c76f258e924d8184a@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_080548_746514_E7976025 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, eric@anholt.net,
 f.fainelli@gmail.com, herbert@gondor.apana.org.au, khilman@baylibre.com,
 krzk@kernel.org, ludovic.desroches@microchip.com, kgene@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org,
 dsaxena@plexity.net, arnd@arndb.de, rjui@broadcom.com,
 linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 mpm@selenic.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 patrice.chotard@st.com, wahrenst@gmx.net, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SXQgd2FzIDwyMDE5LTEwLTE2IMWbcm8gMTI6NDY+LCB3aGVuIFl1ZUhhaWJpbmcgd3JvdGU6DQo+
IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSB0byBzaW1wbGlmeSB0aGUgY29k
ZSBhIGJpdC4NCj4gVGhpcyBpcyBkZXRlY3RlZCBieSBjb2NjaW5lbGxlLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9jaGFyL2h3X3JhbmRvbS9leHlub3MtdHJuZy5jIHwgNCArLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+DQoNCkFja2VkLWJ5OiDFgXVr
YXN6IFN0ZWxtYWNoIDxsLnN0ZWxtYWNoQHNhbXN1bmcuY29tPg0KDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2NoYXIvaHdfcmFuZG9tL2V4eW5vcy10cm5nLmMgYi9kcml2ZXJzL2NoYXIvaHdfcmFu
ZG9tL2V4eW5vcy10cm5nLmMNCj4gaW5kZXggYjRiNTJhYi4uOGUxZmUzZiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9leHlub3MtdHJuZy5jDQo+ICsrKyBiL2RyaXZlcnMv
Y2hhci9od19yYW5kb20vZXh5bm9zLXRybmcuYw0KPiBAQCAtMTA5LDcgKzEwOSw2IEBAIHN0YXRp
YyBpbnQgZXh5bm9zX3RybmdfaW5pdChzdHJ1Y3QgaHdybmcgKnJuZykNCj4gIHN0YXRpYyBpbnQg
ZXh5bm9zX3RybmdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4g
IAlzdHJ1Y3QgZXh5bm9zX3RybmdfZGV2ICp0cm5nOw0KPiAtCXN0cnVjdCByZXNvdXJjZSAqcmVz
Ow0KPiAgCWludCByZXQgPSAtRU5PTUVNOw0KPiAgDQo+ICAJdHJuZyA9IGRldm1fa3phbGxvYygm
cGRldi0+ZGV2LCBzaXplb2YoKnRybmcpLCBHRlBfS0VSTkVMKTsNCj4gQEAgLTEyOCw4ICsxMjcs
NyBAQCBzdGF0aWMgaW50IGV4eW5vc190cm5nX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgdHJuZyk7DQo+ICAJdHJuZy0+
ZGV2ID0gJnBkZXYtPmRldjsNCj4gIA0KPiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShw
ZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+IC0JdHJuZy0+bWVtID0gZGV2bV9pb3JlbWFwX3Jl
c291cmNlKCZwZGV2LT5kZXYsIHJlcyk7DQo+ICsJdHJuZy0+bWVtID0gZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiAgCWlmIChJU19FUlIodHJuZy0+bWVtKSkNCj4g
IAkJcmV0dXJuIFBUUl9FUlIodHJuZy0+bWVtKTsNCg0KLS0gDQrFgXVrYXN6IFN0ZWxtYWNoDQpT
YW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kDQpTYW1zdW5nIEVsZWN0cm9uaWNzDQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
