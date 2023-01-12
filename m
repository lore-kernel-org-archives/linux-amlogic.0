Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC144C54EBC
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Jan 2023 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCqEo4dlHzsBpF1JUCWvJB6ir+FcjuuaO/U5N2/GnIs=; b=mAz7wMG6cI/vAp
	lpxH2cYtQUwTC0bIWyi/xY0hCv92FTu2fRKCDbXHSmyc/07xs6l48t+DR9MWPQCRtHXJWsS0/iSo4
	ZXPLqcTVFXc7F3A425+VpC57i7UbeWRS1L7JWv9iixg1HsT0fG27su4NVJSakui5kTvxiqGmS4qfB
	6ri7bb0vEK01h9FF+9J4Bmjg5FBnoQj8tgg3mDl59Gc/HoulIfx3JNMs4q4ZeLsFXtpZHqpMfhnt7
	j5BhtJWMB0d22iesx1GzRjAdtSYTdmTHBiuQJcoQI4tS5HT/OGcBG4EoMq4q7SKN/TiK+RquWwacq
	GY7pDGYTlvy5zZWcRobA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFv93-00EfLd-5Y; Thu, 12 Jan 2023 10:49:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFv8X-00Ef3D-HF
	for linux-amlogic@lists.infradead.org; Thu, 12 Jan 2023 10:48:48 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230112104839euoutp02ec553c0ffe1570dfa40a85d5db4e271a~5igunjIY91883618836euoutp02e
	for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 10:48:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230112104839euoutp02ec553c0ffe1570dfa40a85d5db4e271a~5igunjIY91883618836euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1673520519;
	bh=79Ba/yX7N4skoomyF3EMjwUuSdgVUQgkCvbj9yiw4Gg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qLH2fItdRfyaxd0xhhMESauZoup0Pedje5qf+uHrWrvGmPu0CME628Dzs7t6UkQ5j
	 AlrlJ8hBWqxa8tZ3jNg4uuzgXUDXVxa9DiMioLnTEvMYsuamqrRTtPUlR6srg4nzgU
	 Fi8hu9pffVM8PLB5w5Agq6oM69oURVBzB6YTd3DE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230112104838eucas1p13c4ff844fa434de443d5dc82d7e43c76~5iguJyZC70782607826eucas1p1E;
	Thu, 12 Jan 2023 10:48:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.74.43884.685EFB36; Thu, 12
	Jan 2023 10:48:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230112104837eucas1p1175552b28e3fb5fdc05467a9e40c5ecc~5igtZOOzj1412714127eucas1p1-;
	Thu, 12 Jan 2023 10:48:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230112104837eusmtrp14ea19a13ff4cebcc124832ce372382f7~5igtYTJLU0323503235eusmtrp1K;
	Thu, 12 Jan 2023 10:48:37 +0000 (GMT)
X-AuditID: cbfec7f5-25bff7000000ab6c-f3-63bfe586e234
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 63.FB.52424.585EFB36; Thu, 12
	Jan 2023 10:48:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230112104836eusmtip1c9276f1e75546de975814cc8bcb1179e~5igsP4R631232112321eusmtip1O;
	Thu, 12 Jan 2023 10:48:36 +0000 (GMT)
Message-ID: <8dda3dcc-6204-d3f2-f551-c4a4a2a00051@samsung.com>
Date: Thu, 12 Jan 2023 11:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [v3,3/7] drm/bridge_connector: rely on drm_kms_helper_poll_*
 for HPD enablement
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Laurentiu Palcu
	<laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Philipp
	Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
	Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
	<linux-imx@nxp.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Tomi Valkeinen
	<tomba@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7djP87ptT/cnG8z6p2Jx4voiJov/2yYy
	W0w8/5PN4srX92wWD6/6W8x5fpbRYtXUnSwWD+beZLLY+XUPi8WC2dwWmx5fY7WYuP8su0XX
	r5XMFgs/bmWxaOtcxmrxfuctRou7906wWLw5OIHV4vnCH8wWf7dvYrG4O/kIo8WLLeIW726u
	YLbY8mYiq4OEx95vC1g8ds66y+6xaVUnm8eda3vYPOadDPS4332cyWPzknqPje92MHk8OrKb
	xaP/r4HH8V232D0m7qnz2Hy62uPzJrkAvigum5TUnMyy1CJ9uwSujEcvXjEWfBGveDzpFmsD
	43qRLkZODgkBE4nFL/qYuhi5OIQEVjBKfL7QwQLhfGGU6G27wwbhfGaU+LS+hRWm5cGz/1CJ
	5YwS5699Z4dwPjJKHPt8gQmkilfATuLMurlAVRwcLAKqEpPn1kCEBSVOznzCAhIWFUiR2PSn
	DCQsLBAncf7YE0YQm1lAXOLWk/lgJ4kIfGGVeHHgEpjDLLCBUaLz5S6w+WwChhJdb7vYQGxO
	oF1fr31gh+iWl2jeOpsZpEFCYCqXxImT95ggznaR2NF4lxHCFpZ4dXwLO4QtI3F6cg8LREM7
	o8SC3/eZIJwJjBINz29BdVhL3Dn3C+wdZgFNifW79CHCjhIX/j4BC0sI8EnceCsIcQSfxKRt
	05khwrwSHW1CENVqErOOr4Nbe/DCJeYJjEqzkMJlFlIAzELyziyEvQsYWVYxiqeWFuempxYb
	56WW6xUn5haX5qXrJefnbmIEpt7T/45/3cG44tVHvUOMTByMhxglOJiVRHj3HN2fLMSbklhZ
	lVqUH19UmpNafIhRmoNFSZx3xtb5yUIC6YklqdmpqQWpRTBZJg5OqQamhTmLXy1QzJ8TXLdU
	JVHZyLOiyrp148p6preLGy+uLBYzUv+ud/lkzzsfmct7fwX2mM8qEp65lbPrn8x3pqZEbpu/
	F1aabXlVf0lT5UjVXPuk2Plil7xnhqqu1761cHF3luH/W1q5ElMnXTDyqr2tOCv0cPV3veQd
	lvKaB9t6z3zYm2Crs6uzen2utuh8x6lrrZRcZpTvCIx5/rHd1e/utY9ZaryLphYxxZ3a8n86
	F7/1i/NnlnhuNO883WKdvCo06Lm5VpW8t4v23OBpx8IfzrhosS1jcnfQZnPxKdf4433uNf/s
	yDJh7dqxz32zlb9Wo6FAhPSHypT3aQp7LX/fkE349CNwQ+LngF9HH+xUYinOSDTUYi4qTgQA
	xCtwQSwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsVy+t/xu7qtT/cnGxzYrm1x4voiJov/2yYy
	W0w8/5PN4srX92wWD6/6W8x5fpbRYtXUnSwWD+beZLLY+XUPi8WC2dwWmx5fY7WYuP8su0XX
	r5XMFgs/bmWxaOtcxmrxfuctRou7906wWLw5OIHV4vnCH8wWf7dvYrG4O/kIo8WLLeIW726u
	YLbY8mYiq4OEx95vC1g8ds66y+6xaVUnm8eda3vYPOadDPS4332cyWPzknqPje92MHk8OrKb
	xaP/r4HH8V232D0m7qnz2Hy62uPzJrkAvig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1D
	Y/NYKyNTJX07m5TUnMyy1CJ9uwS9jEcvXjEWfBGveDzpFmsD43qRLkZODgkBE4kHz/6zdTFy
	cQgJLGWUaJu3ix0iISNxcloDK4QtLPHnWhdU0XtGibt7d4AleAXsJM6smwuU4OBgEVCVmDy3
	BiIsKHFy5hMWEFtUIEWi+flJsHJhgTiJkz82g8WZBcQlbj2ZzwQyU0TgG6vEuglLWUAcZoEN
	jBLnVn9jgtj2j1Fi4tomsJPYBAwlut6CnMHJwQm0+eu1D+wQo8wkurZ2MULY8hLNW2czT2AU
	moXkkllINs5C0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgclm27GfW3Ywrnz1
	Ue8QIxMH4yFGCQ5mJRHePUf3JwvxpiRWVqUW5ccXleakFh9iNAWGxkRmKdHkfGC6yyuJNzQz
	MDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYMpWUV/w7yIru8DSN63n77F6
	TQ64yrt63weOw+IvLhQffLLKUYutvWUHy6I22XSjx/INNRUXfPOvZu1wPL9AudPDWdtEdCpf
	euSqv/oH589IvbLnYc/twgzfKXXV7xOnT1jWtL2M84WKHaPT/piwfbXO/KfFJNu61n/tWapV
	w/Txj5gkl8yGPMVF3/9s5TFjvv64p3xlerL4ikf228o7V937fEbG7ujDe4t8fnvyahUnRs5/
	4KO6+cxE1851ptFBBQ5vHrnJvly/7Wp01t5DU47YtuezmZUKrrPfzyzzlCP9TuK8hdGzAp6K
	HX/jamBbIXlEvNfaZ5nc9NCnf1OEWGbldgvNqgxco+C24JDfGyWW4oxEQy3mouJEAGgkBwu/
	AwAA
X-CMS-MailID: 20230112104837eucas1p1175552b28e3fb5fdc05467a9e40c5ecc
X-Msg-Generator: CA
X-RootMTR: 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee
References: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
	<CGME20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee@eucas1p2.samsung.com>
	<a3f59ce3-8426-2af0-4663-ee948490d75c@samsung.com>
	<c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_024846_036393_F4E8E9A0 
X-CRM114-Status: GOOD (  13.23  )
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

SGkgTmVpbCwKCk9uIDEyLjAxLjIwMjMgMTA6MzUsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IE9u
IDExLzAxLzIwMjMgMTM6NDEsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6Cj4+IE9uIDAyLjExLjIw
MjIgMTk6MDcsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6Cj4+PiBVc2UgZHJtX2Nvbm5lY3Rvcidz
IGhlbHBlcnMgZW5hYmxlX2hwZCBhbmQgZGlzYWJsZV9ocGQgdG8gZW5hYmxlIGFuZAo+Pj4gZGlz
YWJsZSBIUEQgYXV0b21hdGljYWxseSBieSB0aGUgbWVhbnMgb2YgZHJtX2ttc19oZWxwZXJfcG9s
bF8qCj4+PiBmdW5jdGlvbnMuIEFzIHRoZSBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9lbmFibGVfaHBk
KCkgYW5kCj4+PiBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9kaXNhYmxlX2hwZCgpIGZ1bmN0aW9ucyBh
cmUgbm93IHVudXNlZCwgcmVwbGFjZQo+Pj4gdGhlbSB3aXRoIHN0dWJzIHRvIGVhc2UgZHJpdmVy
IG1pZ3JhdGlvbi4KPj4+Cj4+PiBFbmFibGluZyB0aGUgSFBEIGZyb20gZHJtX2JyaWRnZV9jb25u
ZWN0b3JfaW5pdCgpIGNhbiBoYXBwZW4gdG9vIGVhcmx5LAo+Pj4gYmVmb3JlIHRoZSBkcml2ZXIg
aXMgcHJlcGFyZWQgdG8gaGFuZGxlIEhQRCBldmVudHMuIEFzIHRoZQo+Pj4gZHJtX2JyaWRnZV9j
b25uZWN0b3JfZW5hYmxlX2hwZCgpIGlzIGVtcHR5IGFueXdheSwgZHJvcCB0aGlzIGNhbGwKPj4+
IGFueXdheS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnku
YmFyeXNoa292QGxpbmFyby5vcmc+Cj4+PiAtLS0KPj4KPj4gVGhpcyBwYXRjaCwgbWVyZ2VkIHRv
IHJlY2VudCBsaW51eC1uZXh0IGFzIGNvbW1pdCA5MmQ3NTVkOGYxM2IKPj4gKCJkcm0vYnJpZGdl
X2Nvbm5lY3RvcjogcmVseSBvbiBkcm1fa21zX2hlbHBlcl9wb2xsXyogZm9yIEhQRAo+PiBlbmFi
bGVtZW50IiksIHRyaWdnZXJzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBvbiBhbGwgbXkgQW1sb2dp
YyBNZXNvbgo+PiBiYXNlZCBib2FyZHM6Cj4+Cj4+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0t
LS0tLS0tLS0tLQo+PiBIb3QgcGx1ZyBkZXRlY3Rpb24gYWxyZWFkeSBlbmFibGVkCj4+IFdBUk5J
Tkc6IENQVTogMiBQSUQ6IDI4NSBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jOjEyNTcK
Pj4gZHJtX2JyaWRnZV9ocGRfZW5hYmxlKzB4OTAvMHhhMAo+PiBNb2R1bGVzIGxpbmtlZCBpbjog
c25kX3NvY19tZXNvbl9heGdfZnJkZHIgc25kX3NvY19tZXNvbl9heGdfZmlmbwo+PiBkd21hY19n
ZW5lcmljIHBhbmZyb3N0KCspIHJlc2V0X21lc29uX2F1ZGlvX2FyYigrKSBkcm1fc2htZW1faGVs
cGVyCj4+IG1lc29uX2R3X2hkbWkoKykgZHdfaGRtaSByY19vZHJvaWQgZHJtX2Rpc3BsYXlfaGVs
cGVyIG1lc29uX2lyKCspCj4+IGdwdV9zY2hlZCBtZXNvbl9ybmcgcm5nX2NvcmUgbWVzb25fZ3hi
Yl93ZHQgY3JjdDEwZGlmX2NlIGR3bWFjX21lc29uOGIKPj4gc3RtbWFjX3BsYXRmb3JtIHNuZF9z
b2NfbWVzb25fYXhnX3NvdW5kX2NhcmQgc25kX3NvY19tZXNvbl9jYXJkX3V0aWxzCj4+IG1kaW9f
bXV4X21lc29uX2cxMmEgc3RtbWFjIG1lc29uX2RybSBwd21fbWVzb24gcGNzX3hwY3MgbWVzb25f
Y2FudmFzCj4+IHNuZF9zb2NfbWVzb25fYXhnX3RkbV9pbnRlcmZhY2UgcnRjX21lc29uX3ZydGMK
Pj4gc25kX3NvY19tZXNvbl9heGdfdGRtX2Zvcm1hdHRlciBudm1lbV9tZXNvbl9lZnVzZSBkaXNw
bGF5X2Nvbm5lY3Rvcgo+PiBDUFU6IDIgUElEOiAyODUgQ29tbTogc3lzdGVtZC11ZGV2ZCBOb3Qg
dGFpbnRlZCA2LjEuMC1yYzYrICMxMzIzNgo+PiBIYXJkd2FyZSBuYW1lOiBIYXJka2VybmVsIE9E
Uk9JRC1DNCAoRFQpCj4+IHBzdGF0ZTogNjA0MDAwMDkgKG5aQ3YgZGFpZiArUEFOIC1VQU8gLVRD
TyAtRElUIC1TU0JTIEJUWVBFPS0tKQo+PiBwYyA6IGRybV9icmlkZ2VfaHBkX2VuYWJsZSsweDkw
LzB4YTAKPj4gbHIgOiBkcm1fYnJpZGdlX2hwZF9lbmFibGUrMHg5MC8weGEwCj4+IC4uLgo+PiBD
YWxsIHRyYWNlOgo+PiDCoCDCoGRybV9icmlkZ2VfaHBkX2VuYWJsZSsweDkwLzB4YTAKPj4gwqAg
wqBfZHJtX2JyaWRnZV9jb25uZWN0b3JfZW5hYmxlX2hwZCsweDI0LzB4MzQKPgo+IFdlaXJkIGJl
Y2F1c2UgX2RybV9icmlkZ2VfY29ubmVjdG9yX2VuYWJsZV9ocGQoKSBoYXMgYmVlbiByZW1vdmVk
IHdpdGgKPiA0YzAwYWM1MDBkMGUgKCJkcm0vYnJpZGdlX2Nvbm5lY3RvcjogZHJvcCAKPiBkcm1f
YnJpZGdlX2Nvbm5lY3Rvcl9lbi9kaXNhYmxlX2hwZCgpIikKClRoZSBhYm92ZSBsb2cgaGFzIGJl
ZW4gY2FwdHVyZWQgYXQgY29tbWl0IDkyZDc1NWQ4ZjEzYiBkdXJpbmcgYmlzZWN0aW5nLCAKc28g
NGMwMGFjNTAwZDBlIGlzIG5vdCBhcHBsaWVkIHlldC4gTWF5YmUgSSBzaG91bGQgaGF2ZSBtZW50
aW9uIHRoYXQuIApUaGUgaXNzdWUgb24gdG9wIG9mIGxpbnV4LW5leHQgaXMgc2ltaWxhci4KCj4K
Pj4gwqBkcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJsZS5wYXJ0LjArMHg1MC8weGQwCj4KPiBJdCBz
ZWVtcyBkcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJsZSBpcyBjYWxsZWQgYWdhaW4gYnkKPiBkcm1f
aGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKSBiZWNhdXNlIHBvbGxfcnVubmlu
ZyBpc24ndCBzZXQuCj4KPiBDYW4geW91IHRyeSB3aXRoIHRoaXMgY2hhbmdlOgoKVGhpcyBmaXhl
cyB0aGUgaXNzdWUgb24gdG9wIG9mIGxpbnV4IG5leHQtMjAyMzAxMTIuIFRoYW5rcyEgRmVlbCBm
cmVlIHRvIAphZGQgaWYgeW91IHBsYW4gdG8gc3VibWl0IGl0IGFzIGEgZm9ybWFsIHBhdGNoOgoK
UmVwb3J0ZWQtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4K
ClRlc3RlZC1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgoK
ID4gLi4uCgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFIm
RCBJbnN0aXR1dGUgUG9sYW5kCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
