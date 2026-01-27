Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD2FD19515
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1kfu6fEA7w6eGP5Xev5q+r477hnZvgiicUV4IJTuQw=; b=CF7pMXY2DDlSyD
	IEdIR4QyUKeH28F4xbM0+nr8nBYklWfX0n31KARN0QnCelGRzfJssKbdYPqHuNistqsCZ6FssX3MN
	qEhOUBCD2gOPbxcnKHOHm6YcDz6WRfzmHhjsy7ozlS1VU9WnjDG1X0BhtNpi+riCRNMLzaiLwU4g1
	n1QixiYwPsabvu8JCTIznZcVjz+PEjJnIVT/KYFKTlHftd/njlXW4/GWNZoM0HTWso59TYzLA7XNX
	3NfgdZinGSJ3HiaPk0pu4GqhXgZLNvPoQxpzlI+FDfAQRKhKffISwfumnmZ293Wm5HkQTp12A7eiA
	QytlkE9Qzd8xEwQXxIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh7z-0000000E9Pv-0E3D;
	Tue, 27 Jan 2026 11:20:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh7t-0000000E9NW-1H2R
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 11:20:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87KVe2379285
	for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 11:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=; b=ZOmoAHbzG7TQYghP
	Q/+fbofrkL7z1l7f55oU9lCHS5tFUbwHxZdoNe8x2Autw64GNBVGPZfGheI2QSXv
	FLteKO5fStxqgUtuFGTqtUmc3bhwpXiwUTAZq+eiWL9XCEl7E9oBmFcwcII/R3A1
	XIXCwti6ZrVikX3lgE3m+BnoMabUKfRhd6rX6vphMzGx4wHMLshJAZJClrQDYRtc
	V9wdwul5Zz53ucOdClomE9fcqt3xWzzcwLuJR/aoXdZY0kjqRw8azEK/efE5heiY
	9HP7tGuOK4teYFXiS9Y1Hx43Up5X4TKZSsUszoo+KyiOSAcSekrY+FTAMewIDm0c
	ocgIsg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8mwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 11:20:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5634ecb51a2so5545936e0c.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 03:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769512852; x=1770117652; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
        b=ZFV3UFfS5++2vGGec2PmRAlOSiEutmPfyfffpQS+duBzcQHZsFTQFfDUtpEgaC44sX
         mZiiOv10GrpW01vLU7r/sNTHk+WBIxGt8kIqD4mPvuMD1JAIOHjNDhyixyIpGv+DNws8
         +jOE6XeLlBNb0U20fUgnwSQPXCfb7qI3dG8hG/B7M2RbTFvg05bGx4vxTsxMbpdUF6+C
         qX5CEiP9zh7+rIvxsghw9f7leSBhKJiOo5XrbJKSscCrjXpft2SpGF0IXjtYAdt9s8PN
         ozi32eJuHhkXrRgiyuzCrxC+RzJhF/uGucyLga2iSEDCm7+//FFQ5+LIwATf8gvp6H8c
         dxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512852; x=1770117652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
        b=G2OcTnBjgL+bWbyLbkuvW6TFAT+cWJ4yCLCV0AXCAqKK2Age5mU7ezLgQlrgqsmgQJ
         gnCbRZMtGDNIZ2PmfW8Y9MXaAlYNbCpgpBXtkN/yygK5Gc7oO+AbhaapGw1coYlNzzY+
         V/Xo3vMswGQjL3pTeHIr05N59LbXBUmGE3dWLC5drb0MSAEwH9ofoZctXvXdT2bLmN3P
         cTq/3ZF/XeBh6+5HbhXmbnC50TbLLHMmj8NvzNZOLbyeMv6M1bV1EoOxGnFv6O4nBPqA
         MOidkPEk580lUzmF+lhlrQDbonPzyMr5A0V74B6ecl0QGODZ1uY28ZLF/LcpyU72tLpK
         t0bA==
X-Forwarded-Encrypted: i=1; AJvYcCW5vm2q1mFlv0UVTmyOfXAFuWqRgaJyvISzw2ie6WwKjrJdNGBkzFGK4q7/rNugA4BjyiCwN1Tm/Dvil9xH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5NXm7zpgpQC5QVvOxgz2um0pchtihX7JoAeQ7ThMDybltjd0e
	7DTHxLmuQVI8gb15AALUT3ErBR4jOkNX5uy3TCMY4BOB8Jq0Ak4obtZWjZ6ylWzI94dMU4X6lzF
	LE/lpqrOWpSewJWwJI5+mCFQ/NCq90XCt+OZyVxeRLX1e8m0LCIflL/hMbHGWYAXBQPoGTCBWXA
	==
X-Gm-Gg: AZuq6aIBrR4yGKrecqdEs3HDajO9ASAcHRSxfwbxSU3VwVJWxEBMWZ5a4K1FSQcvgnl
	6rtSnZf3U+YspkL82jSB22oNQOrP8Kw44tu3LVOfkNkkT5xVPtSlbpoXuV8gvjNDQ4OFmjPevRP
	QxZ0J9LNO5hxlBmGlTRwbRj9gjRV/XMlNV9l4IBjYn1gDVQPqZChQtdOgzBPckjj//lTtYbH3iE
	iwn48yBBNYSYp+kPfTpQZOYe7HnLJLdTEkmhRXCYihZNRXD4a2YcWFtY8/tPxRqjPfUDIUJgKkY
	v47wD6i58CTQ/QxE8qgGYWrgYepUiAmmILNpsJcsj4ca/OJb42Tq1JdEEbiBeElCejrEgCiXxht
	i6RphP+DBkGnxSWvfIMM0OskdNgsQLMHn+Kx1ouP+85zlpO+VDfdPhbWFrPSVyg06wb5kF+QHd4
	5U4R6pjS7EAryYYB/xh3c9V9s=
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id ada2fe7eead31-5f7235d4e59mr521476137.5.1769512851692;
        Tue, 27 Jan 2026 03:20:51 -0800 (PST)
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id ada2fe7eead31-5f7235d4e59mr521455137.5.1769512851297;
        Tue, 27 Jan 2026 03:20:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48f0259sm3368696e87.45.2026.01.27.03.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:20:50 -0800 (PST)
Date: Tue, 27 Jan 2026 13:20:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/7] drm/ci: reduce sm8350-hdk parallel jobs from 4 to
 2
Message-ID: <ftkgk4xevcfe4dyx2pqi3gk3bqm7jcv65qvn3ypgrwls5dyx3m@srsgbmsteifw>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127104406.200505-4-vignesh.raman@collabora.com>
X-Proofpoint-GUID: DpU_Gqg0BdkwYc0CAX70iaW3-Ew6iCSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfXwH6IhXEb4Rh4
 uVq/wCInjMB2aHlOSXrw14mLfv7YfnM5R2GjJuxqtpWdZbOnoUXGeqJXTMdMVp7CYshez+TVUHB
 rmIJx6/9tg997R90qA2pF2mneN7tI8EBXjv+6YeUg1TzP2W9RsxB++nWRo/iJLJSlFsS2g8nZME
 qAGSKtKnl6iEGo1o+VQD+5tizw6IuXs5y3jllBGZB5d3fb61RkAV5KQfaPrqVKCTynTc4n/viWa
 ws/F4NXhqGk7aff2gkE1eSS90a1J9hcpLypa5QynWc5kuLn6aRwCrYbIWlsVegNi9mqxov3ky0K
 W2kyTmk3qL+1MEIG8K26dMOct19qAzXAsl+5+cRXV89myHKyDb+fg8bHjzz/6Yt/jMJODSIChTd
 V9EC1QdbXP6ddv77zlWq3SWy36bevPUh0x/R7kRt6wc/WF79Aqaq/8+Pv1jMGXpgGonXz2TaaDR
 sjgaNES/+sK4pU9fzgg==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=69789f94 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=_49z0RMimKR0Jg0_r6oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: DpU_Gqg0BdkwYc0CAX70iaW3-Ew6iCSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_032055_020487_C45F64ED 
X-CRM114-Status: GOOD (  14.26  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMDQ6MTM6NThQTSArMDUzMCwgVmlnbmVzaCBSYW1hbiB3
cm90ZToKPiBUaGUgc204MzUwLWhkayBqb2JzIGFyZSBzaG9ydCBhbmQgZWFjaCB0ZXN0IHRha2Vz
IGFyb3VuZCAy4oCTMyBtaW51dGVzIGFuZAo+IHRoZSBmdWxsIGpvYiBjb21wbGV0ZXMgaW4gYWJv
dXQgMTAgbWludXRlcy4gUnVubmluZyA0IHBhcmFsbGVsIGpvYnMgdXNlcwo+IDQgZGV2aWNlcyBh
dCBvbmNlLCB3aGljaCBpcyBub3QgbmVlZGVkLiBTZXQgcGFyYWxsZWwgdG8gMiB0byByZWR1Y2UK
PiBkZXZpY2UgdXNhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlnbmVzaCBSYW1hbiA8dmlnbmVz
aC5yYW1hbkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vY2kvdGVzdC55
bWwgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAoKUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3Nz
LnF1YWxjb21tLmNvbT4KCgotLSAKV2l0aCBiZXN0IHdpc2hlcwpEbWl0cnkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
