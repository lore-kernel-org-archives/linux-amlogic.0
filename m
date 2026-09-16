Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5F5C88E5C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnrlvoAXKxiDJkizr96+4/IYWL1bC2mtB/GNHEsB6iA=; b=fJqtIryjAtVy5K
	gaVKqMf4MlvI4UrJJMtynRTUexswKMEJXO3dWBLVpB5huCUlMBO4UIwWWF7R+FW8uXspoPEDpAmCi
	gwMbV2Pc7hRvpEONw9y6IUobJ2LVnxLZBnXxTyUZbGmAf4qzBwzh3B53EtfL3NxWo7mSqv0zJVmT7
	x6HakKuDsDWTZU4u9cOYjOnapAzI8XlNE17QTZwoq4qRk8bsPlPveoeG2YJgnC+lgjj8YW3NmVOoe
	xdEdkIcC4WA1xRv05e7UzfpiaX5zer5o5c/+HA62TN9hWvvF2PrFHfrfhmpz9MEVuKU99+a655xE1
	8CEN/h0aB46cvmofpkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jGy-00000008UeS-0xny;
	Wed, 16 Sep 2026 06:37:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jGv-00000008UdR-2dlS
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 06:37:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68v2U589892
	for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2026 06:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=; b=ILKqrp7+N1wCkRrs
	nLsngSEOjVJ4Se7FEQ1iUV1nCgLA7yCzm8iUPx6tsQrlSE+mvCg3a9WPt1Bxn7zL
	KeUXGlzm+v1Ss8EMBjk4K7w9GhzYGcP9meburL+vh5BJGcXaoDUQV7CYJt5zuQT0
	MyMVDiXjbqHsQRwTZSdoyS2O6wAnUpiUO1TnyOwQh/nmZZmJndPMDKuPbQmF6oBe
	QZr0PEnlP2PINYvG4aYJqXvjBNpXITeXRfBlZPFr71GfC+Emzi1mKlMO1MkwSRkU
	ZRxCADeLpv5CmwgeXaTX/iXVZ1mnewDdb52wg2TLcpWo9BPFJivl4tcQnpbuyANG
	pkhS0g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9sku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2026 06:37:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-912351b220bso35790996d6.1
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2026 23:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789540652; x=1790145452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=;
        b=YUbHm8L45+KT+ZxGzdRXL6jyMq7+XdyNqUN3+RKFpdQhgC7dJXUiRgYXVjM3DUHq15
         GRDs8sQPtxdV4QhA89AONhRwJKkwI7fgt8PNqT7MOqi/tLcUAOYUsfDiAGxFgiY6X29H
         M7ZYwGjtVATihiySiyP36maudwlHWvzYLo04YLDPxfMoQ4cm2/RbBsWihkv3FzOZgLAB
         M6h+Lu1vrZiTZLwPDwhVBIx3mNtfnYPvWv05G5/5lx4lyKPc6ZFfLZHrhYbgGy54ODCx
         iv+jgDXhPo3eB9t60lAnGONbQJ+yXbk9ac1L/WxYCnP4XyW1FThtOdksLYToPtn64Qbw
         5HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540652; x=1790145452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=;
        b=inBtavSjD28H0DHq1rm7tyDnrSyqLa/bxulgO3BNqjWH8sa9rLVEHsDcqGYKUiz6qR
         DHX7OKDIrgTFhcclFLR7qxwwoRbrVSmLf85cBOlTpH0fe6WZR6UTdXgPLbXsgIhzmNW1
         kDYJ63yCgpd7cUrOBkLxAOjeCTRVmKxzKePUY79ka7qwkFc2LRfyA0811aUT0GOJD/MP
         lUhF8XkpEQrorMoUXiOcGr1/X5dSrdH+W/zpoB2XafpAzG2f6mBkSzyr7BmgMi96VEqm
         rUpZOQ1KsfCFie1Hnmfz2vvb6gBlH0LE8q0FuWOICm2j2mjx2aOOwLL3SdgCl2UsCFD/
         lAGw==
X-Forwarded-Encrypted: i=1; AKwUvBx7Q/JwI783hlSQyi7X7A3AYD04OpDIdpwflm4EGqLpwTM0mdzD8pxVz4eI/xniKKFSEBAdxapP19FzOnhm@lists.infradead.org
X-Gm-Message-State: AFuF++nbCj4UFdmjARZf6J9jefROfYL8WJLgF8SfhA4umYib2Yw0uIeu
	jToVaRZWVCEwNMXiHUOJvZaHvv6bzXRKVwJN+lBZn7R436yeFm9ZqFatLAPyN3LsbkeLVxcju9N
	4FVhAvJUfysvFUAACtstYfn5WXSs6u2EDGMDvbtP4zQu5i5C28GYECYqzYuhdnkl5QDsICSzz6Q
	==
X-Gm-Gg: AYBFou0uFp9EcSJ29cRtTCNAd0iDYGx+dfivhlma3ol7agP9XkBnbmmIMY8Tnmw+05f
	pgOE4h/f+8ZC5Y0vuSVqUAlRt1yFUkvfA8xepkiyRsM3aAtFFgqyjCYrUAV/Hs7kKqcQcQYcxL/
	nXs4c8J+rR+LYb/Ew/xS/s34dbPortQykOI2/+G39Jdd4MkxDUuxrqhiY2dsZ1ncplN9k/Njt4d
	AKtWn579ojAlyi3df/nJ4q2N3Lj4OPvCNcDw6Avm1lyqBiveaB2t0S+5ynMCHsYkbhkrdThiufY
	rSDRdDJCX/qvwgRqZ5cE03nEfW5S+J7duWLz4fEZQCPYnVxtQLF3lK+9gx546bKL9O1Zi5MgArc
	xkUWupQ1/TfKONs2A0qiNRNTo1+yjMEGKGs/huPthADq5DPkkYCBVT2oN5iXu+ChE
X-Received: by 2002:a05:6214:3186:b0:910:3923:cc76 with SMTP id 6a1803df08f44-91234436ca6mr106063626d6.31.1789540651579;
        Tue, 15 Sep 2026 23:37:31 -0700 (PDT)
X-Received: by 2002:a05:6214:3186:b0:910:3923:cc76 with SMTP id 6a1803df08f44-91234436ca6mr106063206d6.31.1789540651009;
        Tue, 15 Sep 2026 23:37:31 -0700 (PDT)
Received: from [10.38.246.144] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bddcf56sm18155886d6.2.2026.09.15.23.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 23:37:30 -0700 (PDT)
Message-ID: <ec70fa7f-4e02-484a-b7f7-ced7b81d3e44@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:37:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
 <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
 <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfX+SZz+YnYIN6/
 ZO5HEDLb+a3P+R0kmIepRSltzkz/FktmV2ePtJ1j0NaUHJJDm8IFqMB27p3E/nzUFsNtGsG45kb
 Mr+oeCANYt7ohpc8sjnCwPKYuowoahY=
X-Proofpoint-GUID: XlUIrCortSr531Pafr1sXLL-mg2FNwQa
X-Proofpoint-ORIG-GUID: XlUIrCortSr531Pafr1sXLL-mg2FNwQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfXw7ECREaqDtwN
 uxG6y7RV8dRCXWZ3ynsstFaBTwpt13FDF8oCMP6xyprFgGL8X7YJ03SHkURDAEyo7xebR0nq+SY
 XPdj/NixAuwtIbVaO2ITrgaOFB7o7JdmIhztq4lCIt6NPSq0cAi7gYiOWR/R0ym2hNphE9xEq4M
 MHBCHbzUZuErwjXRbgwnaJsmmRg8lLLwVOiX4jGLS3y+8wAKXUFdRWwC756lsSdZ2mZz67qQOLa
 4YsQzPULyNKHZ9qqUglcQDNK+wFSIS8Rjq+qH3YcOX6uIBvWCFDO/4CfVRE7c0uKn1AHkoaV7Qe
 ZmQLN89A8SbsHftdwJnchg/l2CC8vltjdwf47SfogDpuGC+UgIWrZKmE/0Kho2HIXPINTigiZCv
 IHqrPWdIkDoAFoKEpCKPcTAqws6xw+/wU8u3I/z7rm7AcFUdp6Jeh8DezJSxYw9WLk59QJlaSMn
 7aNL7dnBESyh/GdCcwQ==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa392c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NHX6yGbTSU1aQjhbUZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_233733_680093_1840C642 
X-CRM114-Status: GOOD (  42.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzgvMjAyNiA5OjEwIFBNLCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOgo+IE9uIE1vbiwg
QXVnIDI0LCAyMDI2IGF0IDExOjE1OjQ0QU0gKzA4MDAsIFlvbmd4aW5nIE1vdSB3cm90ZToKPj4K
Pj4KPj4gT24gOC8yMS8yMDI2IDM6MjAgUE0sIFlvbmd4aW5nIE1vdSB3cm90ZToKPj4+Cj4+Pgo+
Pj4gT24gOC8xOC8yMDI2IDExOjAxIEFNLCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOgo+Pj4+IE9u
IE1vbiwgQXVnIDE3LCAyMDI2IGF0IDA0OjAxOjQxUE0gKzA4MDAsIFlvbmd4aW5nIE1vdSB3cm90
ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gNy8xMi8yMDI2IDY6MjEgUE0sIERtaXRyeSBCYXJ5c2hr
b3Ygd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIEp1biAyOSwgMjAyNiBhdCAxMDo0ODowM1BNICswODAw
LCBZb25neGluZyBNb3Ugd3JvdGU6Cj4+Pj4+Pj4gVGhlIGJyaWRnZSBjb25uZWN0b3IgZnJhbWV3
b3JrIGN1cnJlbnRseSBpbnZva2VzIGFsbCBicmlkZ2UKPj4+Pj4+PiBocGRfbm90aWZ5KCkgY2Fs
bGJhY2tzIGFuZCB1bmNvbmRpdGlvbmFsbHkgZW1pdHMgYSBjb25uZWN0b3IgaG90cGx1Zwo+Pj4+
Pj4+IGV2ZW50IGFmdGVyd2FyZHMuCj4+Pj4+Pj4KPj4+Pj4+PiBIb3dldmVyLCBub3QgZXZlcnkg
SFBEIG5vdGlmaWNhdGlvbiByZXF1aXJlcyBhIHVzZXJzcGFjZQo+Pj4+Pj4+IGhvdHBsdWcgZXZl
bnQuCj4+Pj4+Pj4KPj4+Pj4+PiBJbiBwYXJ0aWN1bGFyLCBEUCBNU1QgYnJpZGdlcyBtYXkgdXNl
IGhwZF9ub3RpZnkoKSB0bwo+Pj4+Pj4+IHByb3BhZ2F0ZSBIUEQgYW5kCj4+Pj4+Pj4gSVJRIG5v
dGlmaWNhdGlvbnMgdGhyb3VnaCB0aGUgYnJpZGdlIGNoYWluIHdoaWxlIHRoZSBhY3R1YWwgaG90
cGx1Zwo+Pj4+Pj4+IGhhbmRsaW5nIGlzIHBlcmZvcm1lZCBieSB0aGUgRFJNIERQIE1TVCBjb3Jl
LiBDb25uZWN0b3IgY3JlYXRpb24sCj4+Pj4+Pj4gcmVtb3ZhbCBhbmQgdXNlcnNwYWNlIGhvdHBs
dWcgZXZlbnRzIGFyZSBhbHJlYWR5IG1hbmFnZWQgYnkgdGhlIE1TVAo+Pj4+Pj4+IHRvcG9sb2d5
IGZyYW1ld29yay4KPj4+Pj4+Pgo+Pj4+Pj4+IEFsbG93IGhwZF9ub3RpZnkoKSBpbXBsZW1lbnRh
dGlvbnMgdG8gc3VwcHJlc3MgdGhlIGJyaWRnZSBjb25uZWN0b3IKPj4+Pj4+PiBob3RwbHVnIGV2
ZW50IGJ5IGludHJvZHVjaW5nIGEgYm9vbCAqc2VuZF9ob3RwbHVnIHBhcmFtZXRlci4gRHJpdmVy
cwo+Pj4+Pj4+IGNhbiBjbGVhciB0aGlzIGZsYWcgd2hlbiBIUEQgcHJvY2Vzc2luZyBzaG91bGQg
bm90IHJlc3VsdCBpbiBhCj4+Pj4+Pj4gY29ubmVjdG9yIGhvdHBsdWcgbm90aWZpY2F0aW9uLgo+
Pj4+Pj4KPj4+Pj4+IFdoeT8gV29yc3QgY2FzZSB0aGUga2VybmVsIHJlY2VpdmVzIGFub3RoZXIg
aG90cGx1ZyBub3RpZmljYXRpb24gd2hpY2gKPj4+Pj4+IGdldHMgaWdub3JlZCBieSB0aGUgZHJp
dmVyLgo+Pj4+Pj4KPj4+Pj4gSGksIHRoYW5rcyBmb3IgcmV2aXdpbmcgdGhvc2UgcGF0Y2hlcy4K
Pj4+Pj4gTGV0IG1lIHRyeSB0byBleHBsYWluIHRoZSBtb3RpdmF0aW9uLgo+Pj4+Pgo+Pj4+PiBT
ZW1hbnRpY2FsbHksIElSUV9IUEQgaXMganVzdCBhbiBJUlEgbm90aWZpY2F0aW9uLCBub3QgYQo+
Pj4+PiBjb25uZWN0aW9uIHN0YXRlCj4+Pj4+IHRyYW5zaXRpb24sIGFuZCBzaG91bGRuJ3QgYmUg
dHVybmVkIGludG8gYSB1c2Vyc3BhY2UgaG90cGx1ZyBpbgo+Pj4+PiB0aGUgZmlyc3QKPj4+Pj4g
cGxhY2UuIEhvd2V2ZXIsIGRybV9icmlkZ2VfY29ubmVjdG9yX2hhbmRsZV9ocGQoKSBjdXJyZW50
bHkgY2FsbHMKPj4+Pj4gZHJtX2ttc19oZWxwZXJfY29ubmVjdG9yX2hvdHBsdWdfZXZlbnQoKSB1
bmNvbmRpdGlvbmFsbHkgYWZ0ZXIKPj4+Pj4gcHJvY2Vzc2luZwo+Pj4+PiB0aGUgZXZlbnQsIHNv
IGV2ZXJ5IElSUV9IUEQgZW5kcyB1cCByZXBvcnRlZCBhcyBhIGhvdHBsdWcuCj4+Pj4KPj4+PiBX
aGF0IGlmIHRoZSBJUlFfSFBEIGlzIGRlbGl2ZXJlZCB0b2dldGhlciB3aXRoIHRoZSBmaXJzdCBI
UEQgZXZlbnQgKGZvcgo+Pj4+IGV4YW1wbGUgYmVjYXVzZSBvZiB0aGUgVENQTSBwcm9jZXNzaW5n
IHRob3NlIGV2ZW50cyk/IFNlZSB0aGUgbWVjaGFuaXNtCj4+Pj4gaW4gdGhlIGRpc3BsYXlwb3J0
LmMgQWx0TW9kZSBkcml2ZXIuCj4+Pj4KPj4+IFRoZSBEUk0gQVBJIHNob3VsZCBzaW1wbHkgcGFz
cyBib3RoIGxvbmcgSFBEIElSUXMgYW5kIHNob3J0IEhQRCBJUlFzIHRvCj4+PiB0aGUgZHJpdmVy
IGFzIHRoZXkgYXJlLCBhbmQgbGV0IHRoZSBkcml2ZXIgZGVjaWRlIGhvdyB0byBoYW5kbGUgdGhl
bS4KPj4+IEJhc2VkIG9uIG15IHJldmlldyBvZiB0aGUgaW1wbGVtZW50YXRpb25zIGZyb20gYWxs
IHRocmVlIHZlbmRvcnMsIHdoZW4KPj4+IGxvbmcgYW5kIHNob3J0IEhQRCBJUlFzIG9jY3VyIHNp
bXVsdGFuZW91c2x5LCB0aGUgbG9uZyBIUEQgSVJRIGlzIGFsd2F5cwo+Pj4gaGFuZGxlZCBmaXJz
dCwgZm9sbG93ZWQgYnkgdGhlIHNob3J0IEhQRCBJUlEuCj4+Pgo+Pj4gSSBoYXZlIGFub3RoZXIg
dGhvdWdodCByZWdhcmRpbmcgdGhlIGN1cnJlbnQgRFJNIEFQSS4gQ291bGQgd2UgaGF2ZSB0aGUK
Pj4+IERSTSBsYXllciBwYXNzIG9ubHkgdGhlIEhQRCBldmVudCBpbmZvcm1hdGlvbiAobG9uZyBJ
UlEgYW5kL29yIHNob3J0Cj4+PiBJUlEpIGluc3RlYWQgb2YgY29ubmVjdG9yIHN0YXR1cywgYW5k
IGxlYXZlIGFsbCBoYW5kbGluZyBkZWNpc2lvbnMgdG8KPj4+IHRoZSBkcml2ZXI/IFRoZSBEUk0g
Y29yZSB3b3VsZCBzaW1wbHkgcmVwb3J0IExPTkdfSFBEIHwgU0hPUlRfSFBELCBhbmQKPj4+IGVh
Y2ggZHJpdmVyIGNvdWxkIGRlY2lkZSBob3cgdG8gcHJvY2VzcyB0aGUgZXZlbnQuIFRoaXMgc2Vl
bXMgbGlrZSBhCj4+PiBwYXR0ZXJuIHRoYXQgY291bGQgYmUgc2hhcmVkIGFjcm9zcyBkaWZmZXJl
bnQgZHJpdmVycy4KPj4+Cj4+PiBUaGlzIGlzIGp1c3QgbXkgY3VycmVudCB1bmRlcnN0YW5kaW5n
LiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSd2ZSBtaXNzZWQKPj4+IGFueXRoaW5nIG9yIGdvdCBz
b21ldGhpbmcgd3JvbmcuIFRoYW5rcy4KPj4gU29ycnksIGFmdGVyIHRoaW5raW5nIGFib3V0IGl0
IGFnYWluLCB0aGlzIGlkZWEgaXMgbm90IGZ1bmRhbWVudGFsbHkKPj4gZGlmZmVyZW50IGZyb20g
eW91ciBjdXJyZW50IGFwcHJvYWNoLiBJbiB0aGUgZW5kLCB3ZSBzdGlsbCBuZWVkIHRvIGhhbmRs
ZQo+PiBIUEQgc3RhdGUgdHJhbnNpdGlvbnMgaW4gdGhlIGRyaXZlci4gSXQgc2VlbXMgbXkgcHJl
dmlvdXMgc3VnZ2VzdGlvbiBkb2VzCj4+IG5vdCByZWFsbHkgc2ltcGxpZnkgdGhlIHByb2JsZW0s
IHNvIEkgYXBvbG9naXplIGlmIGl0IGhhcyBjYXVzZWQgYW55Cj4+IGNvbmZ1c2lvbiBvciBtaXNs
ZWQgdGhlIGRpc2N1c3Npb24uCj4gCj4gTm8gd29ycmllcy4KPiAKPiBJJ20gY3VycmVudGx5IHN0
dWNrIGJldHdlZW4gdHdvIGlkZWFzOiBjb250aW51ZSBwdXJzdWluZyB0aGUgY3VycmVudAo+ICJz
aW5nbGUgQVBJIGZvciBib3RoIGV2ZW50cyIgb3IgaW1wbGVtZW50IG5ldyAidHdvIEFQSSBmb3Ig
dHdvIGV2ZW50cyIuCj4gSSB0aGluayB0aGF0IHRoZSBzZWNvbmQgbWlnaHQgc291bmQgbW9yZSBw
bGF1c2libGUsIGJ1dCBpbiB0aGUgZW5kIGl0Cj4gd291bGQgY29tcGxpY2F0ZSBkcml2ZXJzIG11
Y2ggbW9yZSwgYmVjYXVzZSBub3cgdGhleSdkIG5lZWQgdG8gaGFuZGxlCj4gc3luY2hyb25pc2F0
aW9uIGlzc3VlcyBvbiB0aGVpciBvd24uCj4gCj4gSWYgd2Ugc3RhcnQgZnJvbSB0aGUgRFAgQWx0
TW9kZSwgd2UgaGF2ZSBhIHNpbmdsZSBzdGF0ZSB3b3JkIHdoaWNoCj4gc3BlY2lmaWVzIGV4YWN0
bHksICdIUEQgcGluIHN0YXR1cycgYW5kICd3YXMgdGhlIElSUV9IUEQgY2FwdHVyZWQnLiBPdXIK
PiBEUCBjb250cm9sbGVyIGFsc28gaGFzIGFib3V0IHRoZSBzYW1lIHN0YXR1cyB3b3JkOiB0aGUg
Y29ubmVjdGVkIHN0YXR1cwo+IGFuZCB0aGUgSVJRX0hQRCBwdWxzZS4gV2hpY2ggKGZvciBtZSkg
cG9pbnRzIG91dCB0aGF0IHRoZSBzaW5nbGUgQVBJIGlzCj4gYSBjb3JyZWN0IHdheSB0byBoYW5k
bGUgdGhlIEhQRC9JUlFfSFBELgo+IApJ4oCZbSBub3Qgb2JqZWN0aW5nIHRvIHRoZSBzaW5nbGUt
QVBJIGFwcHJvYWNoLiBJ4oCZbSBqdXN0IG5vdCBjb21wbGV0ZWx5IApzdXJlIHlldCBob3cgaXQg
c2ltcGxpZmllcyB0aGUgZHJpdmVyLXNpZGUgaGFuZGxpbmcsIHNpbmNlIHRoZSBkcml2ZXIgCm1h
eSBzdGlsbCBuZWVkIHRvIGRlYWwgd2l0aCBIUEQgYW5kIElSUV9IUEQgYXJyaXZpbmcgYXQgYXJv
dW5kIHRoZSBzYW1lIAp0aW1lLCBvciBJUlFfSFBEIGFycml2aW5nIHdoZW4gdGhlIGxpbmsgaXMg
bm8gbG9uZ2VyIHByZXNlbnQuCgpGb3IgcmVmZXJlbmNlLCBJbnRlbCwgQU1ELCBhbmQgTm91dmVh
dSBhcHBlYXIgdG8gcHJvY2VzcyBIUEQgc3RhdGUgCmNoYW5nZXMgYW5kIElSUV9IUEQgaGFuZGxp
bmcgaW4gc2VwYXJhdGUgd29ya2Vycy4gSeKAmW0gbm90IHN1cmUgd2hldGhlciAKdGhhdCBpcyBy
ZWxldmFudCBoZXJlLCBidXQgSSB0aG91Z2h0IGl0IG1pZ2h0IGJlIHVzZWZ1bCBpbmZvcm1hdGlv
bi4KPiBOb3csIGNvbWluZyB0byB0aGUgZHJpdmVycy91c2Vyc3BhY2Ugc2lkZS4gTGV0J3MgbGVh
dmUgdGhlIE1TVCBzdG9yeQo+IGFzaWRlIGZvciBhIG1vbWVudC4gRm9yIHRoZSBEUCBicmFuY2gg
ZGV2aWNlcyBjb25uZWN0ZWQgdG8gdGhlIFVTQi1DIHRoZQo+IEFsdE1vZGUgd2lsbCBhbHdheXMg
cmVwb3J0ICdjb25uZWN0ZWQnLCBidXQgdGhlIERQJ3MgZGV0ZWN0IGNhbGxiYWNrCj4gd291bGQg
cmlnaHRmdWxseSByZXBvcnQgJ2Rpc2Nvbm5lY3RlZCcgaWYgdGhlcmUgaXMgbm8gYWN0dWFsIG1v
bml0b3IuCj4gVGhlIGtlcm5lbCBzaG91bGQgZG8gaXQncyBiZXN0IGluIHRoaXMgY2FzZSBhbmQg
cmVwb3J0IHRoYXQgdGhlCj4gY29ubmVjdG9yIGlzIGRpc2Nvbm5lY3RlZCB3aXRob3V0IGFueSBp
bnRlcmltIHN0YXRlcy4gSSB0aGluayB3ZSBkbyBpdAo+IGFscmVhZHkuIFRoZSBjb21wb3NpdG9y
IHNob3VsZCBkbyBpdCdzIGpvYiBhbmQgc2tpcCBmdWxsIHNjZW5lCj4gZXZhbHVhdGlvbiBvZiB0
aGUgZGlzY29ubmVjdGVkIGNvbm5lY3RvciBnZXRzIGRpc2Nvbm5lY3RlZCBhZ2Fpbi4KPiAKQWdy
ZWUuCj4gRXZlbnQgZmlsdGVyaW5nLiBIaXN0b3JpY2FsbHksIGRybV9icmlkZ2VfY29ubmVjdG9y
IHdhcyB0cnlpbmcgdG8gZmlsdGVyCj4gSFBEIGV2ZW50LiBXZSBoYWQgdG8gcmVtb3ZlIGl0IGJl
Y2F1c2UgZm9yIHRoZSBEUCBwcmVmaWx0ZXJpbmcgZG9lc24ndAo+IHdvcmsuIFRoaXMgbWlnaHQg
aGF2ZSBsZWZ0IHRoZSBnYXAsIHdoaWNoIG5vdyBuZWVkcyB0byBiZSBmaWxsZWQuIFRoZQo+IGJy
aWRnZV9jb25uZWN0b3IgdXNlcyBkcm1fa21zX2hlbHBlcl9jb25uZWN0b3JfaG90cGx1Z19ldmVu
dCgpIHdoaWNoCj4ganVzdCByZXBvcnRzIHRoZSBldmVuIHRvIHRoZSB1c2Vyc3BhY2UuIENvbnNp
ZGVyIHJld29ya2luZwo+IGRybV9icmlkZ2VfY29ubmVjdG9yX2hhbmRsZV9ocGQoKSB0byBiZWhh
dmUgbW9yZSBsaWtlCj4gZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfaHBkX2lycV9ldmVudCgpLiBFeGVj
dXRlIGhwZF9ub3RpZnkgdW5kZXIgdGhlIHNhbWUKPiBtdXRleCBsb2NrLCBjYXB0dXJlIGlmIHRo
ZSBzdGF0dXMgaGFzIGFjdHVhbGx5IGNoYW5nZWQgYWZ0ZXJ3YXJkcyBhbmQKPiByZXBvcnQgaXQg
dG8gdXNlcnNwYWNlIG9ubHkgaWYgdGhlcmUgd2FzIGEgY2hhbmdlLgo+IApZZXMsIGkgd2FudCB0
byB1cGRhdGUgYSBuZXcgdmVyaXNvbiB0byBkbyB0aGlzIGFuZCB1cGRhdGUgdGhlICdIUEQgY29t
ZSAKd2l0aCBpcnEnIGNhc2UuIE9uZSBxdWVzdGlvbiwgZG8geW91IGhhdmUgYW55IHJvdWdoIHRp
bWVsaW5lIGluIG1pbmQgZm9yIAp0aGUgbmV4dCByZXZpc2lvbiBvZiB0aGUgSVJRIHNlcmllcz8K
Pj4+Pj4gU2Vjb25kLCBNU1QgSVJRX0hQRCBpcyBsZXZlbC1zdGlja3kgLS0gYXMgbG9uZyBhcyB0
aGUgQUNLIGhhcyBub3QgYmVlbgo+Pj4+PiBjbGVhcmVkLCB0aGUgSVJRIGtlZXBzIGZpcmluZyBy
ZXBlYXRlZGx5LCBhbmQgTVNUIGJyaW5nLXVwIChsaW5rCj4+Pj4+IHRyYWluaW5nCj4+Pj4+IC8g
TVNUIGVuYWJsZSBoYW5kc2hha2UpIGl0c2VsZiBnZW5lcmF0ZXMgYSBidXJzdCBvZiBJUlFfSFBE
cy4gU28gdGhpcyBpcwo+Pj4+PiBub3QgYWJvdXQgIm9uZSBleHRyYSBob3RwbHVnIiwgYnV0IGFi
b3V0IGEgYnVyc3Qgb2YgdGhlbSB3aXRoaW4gYSBzaG9ydAo+Pj4+PiB3aW5kb3cuCj4+Pj4KPj4+
PiBPaywgaWYgaXQgaXMgbGV2ZWwtc3RpY2t5LCBpdCBzaG91bGQgYmUgaGFuZGxlZCBhcyBzdWNo
Lgo+Pj4+Cj4+Pj4+Cj4+Pj4+IEV2ZXJ5IG9uZSBvZiB0aG9zZSBob3RwbHVncyBpcyBkZWxpdmVy
ZWQgdG8gdXNlcnNwYWNlIHZpYSB1ZGV2IGFuZAo+Pj4+PiBwcm9tcHRzIHRoZSBjb21wb3NpdG9y
IHRvIHJlLXByb2JlIHRoZSBjb25uZWN0b3IuIEluIHRoZSB3aW5kb3cgYmVmb3JlCj4+Pj4+IG1z
dF9hY3RpdmUgaXMgc2V0LCB0aGF0IHJlLXByb2JlIHdhbGtzIGJhY2sgaW50byBtc21fZHBfYnJp
ZGdlX2RldGVjdCgpCj4+Pj4+IGFuZCBwZXJmb3JtcyBhdXgvRFBDRCBhY2Nlc3NlcywgcmFjaW5n
IHdpdGggdGhlIE1TVCBlbmFibGUgZmxvdy4KPj4+Pgo+Pj4+IElmIHRoZXJlIGlzIGEgcmFjZSwg
dGhlIHBhdGggbmVlZHMgdG8gaGF2ZSBhIGxvY2ssIHByZXZlbnRpbmcgY29uY3VycmVudAo+Pj4+
IGFjY2Vzcy4gT3RoZXJ3aXNlLCB5b3UgYXJlIGp1c3Qgc2hvcnRlbmluZyB0aGUgd2luZG93IGlu
c3RlYWQgb2Ygc29sdmluZwo+Pj4+IHRoZSBwcm9ibGVtLgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoZSBh
bXBsaWZpY2F0aW9uIGFsc28gaXNuJ3QgbGltaXRlZCB0byBhIHNpbmdsZSBjb25uZWN0b3I6IG9u
IEhhbW9hCj4+Pj4+IHRoZXJlIGFyZSA0IGNvbm5lY3RvcnMgKDN4IERQICsgZURQKSwgYW5kIHdl
IG9ic2VydmUgdGhhdCBhIGhvdHBsdWcgb24KPj4+Pj4gYW55IG9uZSBjb25uZWN0b3IgY2F1c2Vz
IHRoZSBjb21wb3NpdG9yIHRvIHJlLXF1ZXJ5IGFsbCA0LiBTbyB0aGlzIGJ1cnN0Cj4+Pj4KPj4+
PiBQbGVhc2UgZml4IHRoZSBjb21wb3NpdG9yLCBpdCBzaG91bGQgbm90IG5lZWQgdG8gcXVlcnkg
YWxsIDQgY29ubmVjdG9ycwo+Pj4+IGlmIHRoZSBIUEQgZXZlbnQgY2FtZSBmcm9tIHRoZSBzaW5n
bGUgb25lLgo+Pj4+Cj4+Pj4+IG9mIHNwdXJpb3VzIElSUV9IUERzIGR1cmluZyBNU1QgZW5hYmxl
IGVuZHMgdXAgYW1wbGlmaWVkIGFjcm9zcyB0aGUKPj4+Pj4gd2hvbGUgY2FyZC4KPj4+Pgo+Pj4+
IEhvdyBkbyBpOTE1LCBhbWRncHUgYW5kIG5vdXZlYXUgcmVzcG9uZCB0byBJUlFfSFBEPyBXaGVu
IGRvIHRoZXkgc2VuZAo+Pj4+IHRoZSBIUEQgZXZlbnQgdG8gdGhlIHVzZXJzcGFjZT8KPj4+Pgo+
Pj4gVGhlIGRyaXZlciByZXZhbGlkYXRlcyB0aGUgYWN0dWFsIGNvbm5lY3RvciBzdGF0ZSwgYW5k
IGEgaG90cGx1ZyBldmVudAo+Pj4gaXMgdHJpZ2dlcmVkIG9ubHkgd2hlbiBhbiBhY3R1YWwgY29u
bmVjdG9yIHN0YXRlIGNoYW5nZSBvciBhIGxpbmsgc3RhdHVzCj4+PiBjaGFuZ2UgaXMgZGV0ZWN0
ZWQuCj4+Pj4+Pj4gQSBOVUxMIHBvaW50ZXIgaW5kaWNhdGVzIHRoYXQgaG90cGx1ZyBzdXBwcmVz
c2lvbiBpcyBub3Qgc3VwcG9ydGVkIGJ5Cj4+Pj4+Pj4gdGhlIGNhbGxlciwgc3VjaCBhcyB0aGUg
Y29ubmVjdG9yIGRldGVjdCBwb2xsaW5nIHBhdGguCj4+Pj4+Pgo+Pj4+Pj4gQW5kIG5vdGhpbmcg
aW4gdGhpcyBwYXRjaCBtYWtlcyBhbnkgdXNlIG9mIGl0LiBJJ2Qgc2F5LCBpdCdzCj4+Pj4+PiBx
dWVzdGlvbmFibGUgYWRkaXRpb24uIExldCBtZSBjaGVjayBvdGhlciBwYXRjaGVzLi4uCj4+Pj4+
Pgo+Pj4+PiBZb3UgYXJlIHJpZ2h0LCBJIHdpbGwgcmVvcmdhbml6ZSB0aGUgcGF0Y2hlcyBpbiBu
ZXh0IHBhdGNoc2V0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3hpbmcgTW91
IDx5b25neGluZy5tb3VAb3NzLnF1YWxjb21tLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgwqDC
oCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExdXhjLmPCoMKgwqDCoCB8wqAg
MyArKy0KPj4+Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fYnJpZGdlX2Nv
bm5lY3Rvci5jIHwgMTUgKysrKysrKysrLS0tLS0tCj4+Pj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jwqDCoMKgwqAgfMKgIDMgKystCj4+Pj4+Pj4g
IMKgwqAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAzICsrLQo+Pj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBf
ZHJtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKystCj4+Pj4+Pj4gIMKg
wqAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0LmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAzICsrLQo+Pj4+Pj4+ICDCoMKgIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrLQo+Pj4+Pj4+
ICDCoMKgIDcgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+Cj4+Pgo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
