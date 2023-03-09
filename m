Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27DBC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjM5+D7kyoE41BLQLPBG0Mrid8+hZn90HfN2HThnetY=; b=OoqRx7VjxaRrET
	GfHHlXKYCfuUzPLi+GcTQbY1nzYzWxOOQKvr2APkciM01MtuqFX1rJO/3KXn/YjTV2uIhuV+Okd4I
	FtUcgP0ybjEe0tMSwsVBZd+25Dg2s4+G2VuiYiNrvl+Z22rYPUdekpTrz3E3qUnU7WIIpHKFlBg+u
	6eNN+AMpFe3UlFb7znXt1vFQLjffwvu0rQborXY9xLPHG3T151sD7hM2HK0iPQVOo/NR29pmeN4ZY
	TezElalx3d6NzLEok5EpTgarfrKPl9DCmB9W4pPg99IaWtGJLoNf1iBmACNdGpOdip6dP0x5y/q4C
	e1mqZYGgh/WYF5fWfckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paI9f-00At5J-P1; Thu, 09 Mar 2023 15:26:07 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHqm-00AmeT-38
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 15:06:40 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230309150627euoutp014371df3e2f7730a588ef61595f1a0226~KyJzxs_By0921309213euoutp01k
	for <linux-amlogic@lists.infradead.org>; Thu,  9 Mar 2023 15:06:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230309150627euoutp014371df3e2f7730a588ef61595f1a0226~KyJzxs_By0921309213euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1678374387;
	bh=w/5ccIvt981fYFEPcr0iYcAkmWG0oM6tbsViHkMWFU0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JNNWxbYCYAXC+5WyQ9Dm3BaLAZny54F1j8Gp+GNi3hpV0ESDRRogNe7VY4gR3G2iq
	 vr1iIOu5cBsDSxVvFeG9e9mQccgPL3ERfUPzPspaK9zS+qx+uw7HitpBHdDDUm69w3
	 /n/+l63l8NmN011oZ0Xw296KkEp1nSBJRaeyKKBw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230309150627eucas1p1ae3ef499dde9be2d1ca8e9af31a8e3ce~KyJzek89w0761107611eucas1p1r;
	Thu,  9 Mar 2023 15:06:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 67.13.09503.3F5F9046; Thu,  9
	Mar 2023 15:06:27 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230309150626eucas1p2db5b73ae3f8bb5595d3883818f374dab~KyJzKcChC1110911109eucas1p2w;
	Thu,  9 Mar 2023 15:06:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230309150626eusmtrp1bdf6347a949f66860b781a53d1ec68ee~KyJzJ2er81444414444eusmtrp1p;
	Thu,  9 Mar 2023 15:06:26 +0000 (GMT)
X-AuditID: cbfec7f2-ea5ff7000000251f-9a-6409f5f3f4fc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.CB.09583.2F5F9046; Thu,  9
	Mar 2023 15:06:26 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230309150626eusmtip100e9f38106b65078616812efe521a1ba~KyJygZGaH2475624756eusmtip1h;
	Thu,  9 Mar 2023 15:06:26 +0000 (GMT)
Message-ID: <098ef3a5-937c-e094-7aa5-6ed4955e2722@samsung.com>
Date: Thu, 9 Mar 2023 16:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Content-Language: en-US
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	Matti Vaittinen <mazziesaccount@gmail.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230309085501.et7ngd32u25befqu@rcn-XPS-13-9305>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7qfv3KmGMxZyWlx4voiJoupD5+w
	WfzfNpHZ4srX92wWbx4dYbb42b6FyWLBbG6LY4tOsljMWXqCxeL9zluMFv+Ofmd24PZ4f6OV
	3WPH3SWMHnu/LWDx2DnrLrvH0wmT2T02repk87hzbQ+bx/3u40wem5fUB3BGcdmkpOZklqUW
	6dslcGW0tW9lL5jBV7F01mumBsYX3F2MnBwSAiYSt972sHQxcnEICaxglJja+pAZwvnCKHHw
	2jJGkCohgc+MEnc/RcF0zN9wjAmiaDmjxLzVFxkhnI+MEv3b1rJ3MXJw8ArYSXyYlgvSwCKg
	IvF89ipmEJtXQFDi5MwnLCC2qECKxI7zu8HKhQXCJR78DwYJMwuIS9x6Mp8JxBYRcJFY9G0N
	K8h4ZoGJzBJzF55hA0mwCRhKdL3tArM5gVat7b3ADtEsL9G8dTbYBxICszklFn0+yQJxtYvE
	ikU3oWxhiVfHt7BD2DISpydD/C8h0M4oseD3fSYIZwKjRMPzW4wQVdYSd879YgM5lVlAU2L9
	Ln0QU0LAUWLCjEIIk0/ixltBiBv4JCZtm84MEeaV6GgTgpihJjHr+Dq4rQcvXGKewKg0CylU
	ZiF5fxaSb2YhrF3AyLKKUTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMJ2d/nf80w7Gua8+
	6h1iZOJgPMQowcGsJML7XYojRYg3JbGyKrUoP76oNCe1+BCjNAeLkjivtu3JZCGB9MSS1OzU
	1ILUIpgsEwenVAOTGdvXL5Ouvsk79ycq7ExuflOVeJV93q5PHpsmhbFWViys2F/TpKTxrjxw
	YXmapGAR9yvD9Utjzy0w1Zj69bgxy9GSqbr2c5d+c+DorlupOZtv1wWppZXvLYOPL2/m893z
	2TRFsHfrYuutrREuT2K3Hz7o1Fx+wn2/wYfd3c01q5x+7da8XFnX9Ijv45ZHWp2iCg9lGPMa
	T9z+/9R6gsK8L+e8qqU8c7VaVKY4eyz2VJazylm35P/O5lCBs+KecVGrOlrOZuzXCT/XXi9S
	aaWvlLF3OWu+5tGYmEtpPTsO8DjY9zi9q94jovlDizH89d2a5Bd18rFsl1fVvmY1XKd6Vqdg
	xqV9jNcWB695tV2JpTgj0VCLuag4EQCEV1vt1gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xu7qfvnKmGCz5rG9x4voiJoupD5+w
	WfzfNpHZ4srX92wWbx4dYbb42b6FyWLBbG6LY4tOsljMWXqCxeL9zluMFv+Ofmd24PZ4f6OV
	3WPH3SWMHnu/LWDx2DnrLrvH0wmT2T02repk87hzbQ+bx/3u40wem5fUB3BG6dkU5ZeWpCpk
	5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GW0tW9lL5jBV7F01mum
	BsYX3F2MnBwSAiYS8zccY+pi5OIQEljKKLHwyhUWiISMxMlpDawQtrDEn2tdbBBF7xkltnZf
	Y+9i5ODgFbCT+DAtF6SGRUBF4vnsVcwgNq+AoMTJmU9YQEpEBVIkZnfpgJjCAuESD/4Hg1Qw
	C4hL3HoynwnEFhFwkVj0bQ0ryHRmgcnMEv++n2OHWHWUUaJn+Ts2kCo2AUOJrrddYDYn0Nq1
	vRfYISaZSXRt7WKEsOUlmrfOZp7AKDQLyRmzkCychaRlFpKWBYwsqxhFUkuLc9Nzi430ihNz
	i0vz0vWS83M3MQIjeNuxn1t2MK589VHvECMTB+MhRgkOZiUR3u9SHClCvCmJlVWpRfnxRaU5
	qcWHGE2BYTGRWUo0OR+YQvJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqY
	ODilGpi8gl7asTYvbzj4+7v6s59rBfosE5wl9kZ9eLRZdGW6ONPhH8FxeksignoOL9p/LnZX
	u5xkETPnLEVR6xoxvxfGDXt6D+668VGAq+X9JWHeR90hx6QjoqSOrBdqjBf72y4obLUhnpk3
	py/w9/PfU6fU+IjfKfY4riJ2PjKd/bnOeUXh9lbNJ7WiprfcLt/idX6uzO1QuPs/z7P1UVfa
	L04MOR0xX36lVMRapWVSr6p0uZLc1ifcXbP8xHvdeSe/vOe9neNowaWw89Lz107nXtjG8z7r
	Dv4XkjyHcd/0OV7vQ9zvpx7Zf1w+6OJqny0CMep7HwQ3zhVOM4yo8pQPu+0XYrAtQC3a2WDb
	q/6kTCWW4oxEQy3mouJEAAqTGK5pAwAA
X-CMS-MailID: 20230309150626eucas1p2db5b73ae3f8bb5595d3883818f374dab
X-Msg-Generator: CA
X-RootMTR: 20230109220056eucas1p26418012878272961a3a21a365192ef60
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230109220056eucas1p26418012878272961a3a21a365192ef60
References: <CGME20230109220056eucas1p26418012878272961a3a21a365192ef60@eucas1p2.samsung.com>
	<20230109220033.31202-1-m.szyprowski@samsung.com>
	<20230309085501.et7ngd32u25befqu@rcn-XPS-13-9305>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_070636_439291_E99E6577 
X-CRM114-Status: GOOD (  16.83  )
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

SGkgUmljYXJkbywKCk9uIDA5LjAzLjIwMjMgMDk6NTUsIFJpY2FyZG8gQ2HDsXVlbG8gd3JvdGU6
Cj4gT24gbHVuIDA5LTAxLTIwMjMgMjM6MDA6MzMsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6Cj4+
IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGVfb3B0aW9uYWwoKSBmdW5jdGlvbiByZXR1cm5zIDAg
b24gc3VjY2Vzcywgc28KPj4gdXNlIGl0IGZvciB0aGUgY2hlY2sgaWYgZnVuY3Rpb24gc3VjY2Vk
ZWQgaW5zdGVhZCBvZiB0aGUgLUVOT0RFViB2YWx1ZS4KPj4KPj4gRml4ZXM6IDQyOWU4NzA2MzY2
MSAoImRybS9tZXNvbjogZHctaGRtaTogVXNlIGRldm1fcmVndWxhdG9yXypnZXRfZW5hYmxlKigp
IikKPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1
bmcuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5j
IHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPj4gaW5kZXggNzY0MmY3
NDAyNzJiLi41MzQ2MjFhMTNhMzQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl9kd19oZG1pLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3
X2hkbWkuYwo+PiBAQCAtNzE4LDcgKzcxOCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fZHdfaGRtaV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+PiAgIAlkd19w
bGF0X2RhdGEgPSAmbWVzb25fZHdfaGRtaS0+ZHdfcGxhdF9kYXRhOwo+PiAgIAo+PiAgIAlyZXQg
PSBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29wdGlvbmFsKGRldiwgImhkbWkiKTsKPj4gLQlp
ZiAocmV0ICE9IC1FTk9ERVYpCj4+ICsJaWYgKHJldCA8IDApCj4+ICAgCQlyZXR1cm4gcmV0Owo+
PiAgIAo+PiAgIAltZXNvbl9kd19oZG1pLT5oZG1pdHhfYXBiID0gZGV2bV9yZXNldF9jb250cm9s
X2dldF9leGNsdXNpdmUoZGV2LAo+PiAtLSAKPj4gMi4zOS4wCj4gVGhpcyBwYXRjaCBzZWVtcyB0
byBoYXZlIGNhdXNlZCAob3IgdW5jb3ZlcmVkKSBhIHJlZ3Jlc3Npb24gaW4gdGhlCj4gYm9vdHJy
LmRlZmVycmVkLXByb2JlLWVtcHR5IHRlc3QgZm9yIG1lc29uLWcxMmEtc2VpNTEwLiBBcHBhcmVu
dGx5LCB0aGlzCj4gY2F1c2VzIGEgZHJpdmVyIHRvIHN0YXkgaW4gdGhlIGRlZmVycmVkIHByb2Jl
IGxpc3QgYWZ0ZXIgYm9vdC4KCkluZGVlZCBteSBmaXggY2F1c2VzIHJlZ3Jlc3Npb24gb24gdGhl
IHBsYXRmb3JtLCB3aGljaCBkb2Vzbid0IGhhdmUgCiJoZG1pIiByZWd1bGF0b3IuIFRoYW5rcyBm
b3IgcG9pbnRpbmcgdGhhdC4gSSB3YXMgcmVhbGx5IGNvbnZpbmNlZCB0aGF0IApkZXZtX3JlZ3Vs
YXRvcl9nZXRfZW5hYmxlXypvcHRpb25hbCooKSByZXR1cm5zIDAgaWYgcmVxdWVzdGVkIHJlZ3Vs
YXRvciAKaXMgbm90IHByZXNlbnQgKGFzICJfb3B0aW9uYWwiIHN1ZmZpeCBzdWdnZXN0cykuIFVu
Zm9ydHVuYXRlbHkgaXQgCnJldHVybnMgLUVOT0RFViwgd2hhdCBicmVha3MgbWVzb25fZHdfaGRt
aSBkcml2ZXIuIEkgd2lsbCBzZW5kIGEgZml4IGluIAphIGZldyBtaW51dGVzLgoKCkJlc3QgcmVn
YXJkcwotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xh
bmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
