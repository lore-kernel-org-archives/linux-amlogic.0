Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED0AC5AC7C
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Aug 2026 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MszIJwropYIC64yM8otR4NtJfVflvLdEMavca4vijaE=; b=p4mPV5YA8/CGe5
	TmMeuquPGuosFV+4CS5PMDEXfN+ad1QYsBJB0BXdWo00borRbukyn/vRUTpr4fQ2uBXa+OKsoDMjr
	C8giTd3KPV9kB6tRtgd1nttSJB6lJ8SQvxil7WA/XobjecIeh9PC6hriKqqe3lhJy3CQMxdIqRiX9
	EfoD79J/b7ZjRza6Mln/maY123HJPLQODKRc0+Ne5DruSG3IyVjx0ooAn5RpeNx/+yosD/179rO1S
	dHuDsgsejoCkXY+n+HW15W/0yGo951qYoiA3XRlhOAHcV5S/+pEBimZacjr5bO6Di+o6xxf5uJBNv
	0EpND30jFDQoEgmAGcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJfV-000000080rp-2Ch0;
	Fri, 07 Aug 2026 12:27:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJfS-000000080rN-3qHe
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Aug 2026 12:27:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778NfBh3176979
	for <linux-amlogic@lists.infradead.org>; Fri, 7 Aug 2026 12:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWhrQ5oZJ4OcodbYVFGeyGVtUwUyxWBQ54DXP3aMp0I=; b=VO8n7TRND5AA76sg
	F6Z5OOQiMWvMFOAIi75liJDz44UNFtsLKQDZdwRqJ2R0no/oYarA7NKx3v805IPY
	oo+vmrlL2R582xeSg4lIBq+fU+XZRDbngWtCp2ZB0GEJPGiwfLO0sK8z7N87Bgft
	PiJsWZNNRxiJmONGUZnh7lB1VfDI7KwJ7ovLedxOaj8WGk4JHTSr1oeznMO0zbjV
	MKShGe1wTgrBsNf/yFvTQjgjcncbv9tdNFvXMH4FAbfwXdEmLx1Ko7hRKy48RGsw
	skm14IWbOZnGdhV0xSMxqFNplCPUZIn3hUT4JYSv3WSGGWzgxWX40bbzA29orArE
	wHKYFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jkstc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 07 Aug 2026 12:27:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso40899351cf.0
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Aug 2026 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786105637; x=1786710437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWhrQ5oZJ4OcodbYVFGeyGVtUwUyxWBQ54DXP3aMp0I=;
        b=WWXqIhmZwJpAzF9ujzHawdUGwN0OlOliMMv8qpI3OA8RxX459XfDJ9/Rev8HMb5T7d
         oNbIZdE6WW2OLr7d5FsonmlMzycIHDbt9C70u1Hu4TsRRcX6ff1l0WP0uKF+SZA9lfo5
         1gp+eYO1uUaZ0nYWojXMxiHBF8lR9AQqfHbo0FLmuh/ugLWMBqXn4Uqg8P8kOkQEfXIT
         d76+K6vnG+/sM7AVOTvR4q08X8m3LGfGTOKlq27fPakVoI7/Wc0+aFo+bngERgLmhXym
         2RLaEMyjpf2sfLDRvtCkkLoqppEHsnNJJeKe7t9yELa20u19yIXZmIK42dBgu8E+go46
         RZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786105637; x=1786710437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWhrQ5oZJ4OcodbYVFGeyGVtUwUyxWBQ54DXP3aMp0I=;
        b=Edxb0mfFC6J15TSgwni3uu0sSwdJeCenicRpoVcDtYszXPTzS17B7iyNiNrBmBdUj3
         6szTbTPZYVM1vznVzkS9aH/c5CRZoeAEAefPNA5SQVlIGM4ghx3c6VpqhMOBLezAomVI
         91IdEqWzzmA9LsugxU1HtHNs3XTo/yxxPamj9SmylOhXUbFFklE48PxhXZh3GFUvxmyK
         xZQ7dvYGoqv+YUwMba+mORflSh5krtXzUGFeUmuPhO+N7FWOsV6kDtVL1L4McAiVjLlW
         LmKWFMrOSq5QSqJJU+YwJvKYT/YWPUSXISh+s747m3E+pzulQjR/QNaw9+3Wppv3Ocm1
         Kqxg==
X-Forwarded-Encrypted: i=1; AHgh+Rpx6TsP1ZKZX/jpX3WX5BTdeJbt115HStdz89i7G63JVR5lBrVzQf7jrWfFRriKvKTTduGO8MgNeAhjX5m7@lists.infradead.org
X-Gm-Message-State: AOJu0YxarQQYxjOkHa47oJgVCwoj97dRLLdYErF2XiNhDwXYJnmUdOyj
	pI9gIzo4pT4put11IlJ2kzbsdv6HFk0AERcijXx6Jhafs3g3EH2ERgAQQBSputAR+SvL+IaRDqo
	hY+5k9Sv0f8Pk3xLekx6BIexiPeYuHrOZSQYjmBKg1Mgt4FXpZk+7z5Yv4VYflMXUYQuDc1ZxGA
	==
X-Gm-Gg: AR+sD130viz7v4aBA/Ugy7xEeNOr/aV6QlwxMW82GrcT3Nj8wYHTn0buJt+vdu9mmhx
	hwWm9N5ZKYareDuCK4Z/NhmerWK/r2Z8Ov9DY92+qe5OeAKTVV2XTlfsh7OFGooxxIM3BhFmWC3
	hIeNdWthASr+4h1usBNgV3uGuN23XwZwGBXl+5Vj/wTUA/aHLdHyrGSwL9mpLD0oFltO38bSkis
	6/pDXw1THA7+jhFVwEUZTyBvELy4nd6/+g3LPJX4Z4KEg9UrSNpgmln5OeMEN13v8ZsXaqsC2v/
	jBtKhpCpyoZIQkQLuDbJRe4kfZzQNdl/RAJzu0kRZq8sVxFjn7+c5nMnlVlykS6+COdtUQZueSB
	c6naSi3iAUZkV9x08Qg5Zy68b4qJR7KEcPVUq6bw330GeYg==
X-Received: by 2002:a05:622a:2612:b0:529:e058:d185 with SMTP id d75a77b69052e-52ce6108b6fmr262686921cf.24.1786105637148;
        Fri, 07 Aug 2026 05:27:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:529:e058:d185 with SMTP id d75a77b69052e-52ce6108b6fmr262685701cf.24.1786105636517;
        Fri, 07 Aug 2026 05:27:16 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c8bcca6sm41534105e9.4.2026.08.07.05.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:27:15 -0700 (PDT)
Message-ID: <727d6bc8-4682-4fed-97a1-e16efab8fbb2@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: amlogic: Add support for A9 thermal
 controller
To: xianwei.zhao@amlogic.com, Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com>
 <20260730-a9-thermal-v1-2-d786d37cba58@amlogic.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260730-a9-thermal-v1-2-d786d37cba58@amlogic.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NyBTYWx0ZWRfX6IKLxrKelUnD
 5SOCsVYNmOntHIMblpp1cC7/39J2nfz9dolkRsghZDLMja9d++EbVfh6xHDS7S09T/pU0R/NqPm
 gfgUTDWWa8QI4YCBgUEYo2UXXcXJPbO73D75CIuJx3nlF1IJ8PNntJ9DQOLcvz5T62xpkDjs1LD
 GBGA3hei4YhyNYwxXhAm1FtARzytqF/tpORspFp5icuwRs/GtwWkb0AiEs/eWpHyLqWzb2mYbp9
 zD72/xsJszcpSQLKU98jh24N3hMZdV2Yuej6zXOJNOGrtgdUj55lx8KwXM+l8X3pwY4hRZrtVNX
 0FwMSVEHj4d/lJMAh9UBKuV2ISlAME1uh2DNWDznGRLlaj+mtJhrRAIGe48bDV1B0HyU9ol11T5
 I6AJ9YnJqLeOOCKoOw0ZOBOFFG3VqR3YwfAoABQrdezQjpzvqHt8o8ubc4eReWu3PjSWev3AVtc
 2w8maLxTgnowpGUfqzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NyBTYWx0ZWRfXzZF6qT+Fhzhb
 gdjLzGQfRsDQjA9QnwcWNmuK3TMWHJHigNX4YKrhxcNS2oJj+g3ufk/vee4UweOVrCs23eFzBBB
 Wlj7AU4iGxshnUTEIVkLetiY236nd0A=
X-Proofpoint-ORIG-GUID: oqC7y2hxt7_rgB7_GjXxz0zcCbqWp_y3
X-Proofpoint-GUID: oqC7y2hxt7_rgB7_GjXxz0zcCbqWp_y3
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a75cf26 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=BY5PBP3jAAAA:8 a=a5WAP96V9kihPZHeLm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_052718_965260_659D6898 
X-CRM114-Status: GOOD (  32.95  )
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

T24gNy8zMC8yNiAxMDozNCwgWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheSB3cm90ZToKPiBGcm9t
OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPiAKPiBBZGQgc3VwcG9y
dCBmb3IgdGhlIEFtbG9naWMgQTkgdGhlcm1hbCBjb250cm9sbGVyLgo+IAo+IFRoZSBBOSB0aGVy
bWFsIGNvbnRyb2xsZXIgdXNlcyBkaWZmZXJlbnQgY2FsaWJyYXRpb24gcGFyYW1ldGVycywgcmVx
dWlyZXMKPiBzZXBhcmF0ZSBjb3JlIGFuZCBidXMgY2xvY2tzLCBhbmQgc3VwcG9ydHMgYSBoYXJk
d2FyZSBvdmVyLXRlbXBlcmF0dXJlCj4gcmVzZXQgbWVjaGFuaXNtLgo+IAo+IEFkZCB0aGUgQTkg
Y2FsaWJyYXRpb24gZGF0YSwgcmV0cmlldmUgdGhlIGNsb2NrcyBieSBuYW1lLCBhbmQgY29uZmln
dXJlCj4gdGhlIGhhcmR3YXJlIHJlc2V0IHRlbXBlcmF0dXJlIHRocm91Z2ggdGhlIG9wdGlvbmFs
ICdhbWxvZ2ljLGh3LXJlc2V0LXRlbXAnCj4gRFQgcHJvcGVydHkuIFdoZW4gdGhlIHByb3BlcnR5
IGlzIGFic2VudCwgdXNlIHRoZSBkZWZhdWx0IHJlc2V0IHRlbXBlcmF0dXJlCj4gb2YgMTEwwrBD
Lgo+IAo+IEFsc28gcmVzdG9yZSB0aGUgaGFyZHdhcmUgcmVzZXQgY29uZmlndXJhdGlvbiBhZnRl
ciByZXN1bWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9A
YW1sb2dpYy5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMg
fCAxMDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIGIvZHJpdmVycy90aGVybWFsL2Ft
bG9naWNfdGhlcm1hbC5jCj4gaW5kZXggYTBiNTMwNjI0YjYwLi5jOWMzNTE0OTY2NTMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCj4gKysrIGIvZHJpdmVy
cy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCj4gQEAgLTQ1LDYgKzQ1LDE4IEBACj4gICAJCSBU
U0VOU09SX0NGR19SRUcxX0RFTV9FTiB8CVwKPiAgIAkJIFRTRU5TT1JfQ0ZHX1JFRzFfQ0hfU0VM
KQo+ICAgCj4gKyNkZWZpbmUgVFNFTlNPUl9DRkdfUkVHMgkJCTB4OAo+ICsJI2RlZmluZSBUU0VO
U09SX0NGR19SRUcyX0hJVEVNUF9FTglCSVQoMzEpCj4gKwkjZGVmaW5lIFRTRU5TT1JfQ0ZHX1JF
RzJfUkVCT09UX0VOCUJJVCgzMCkKPiArCSNkZWZpbmUgVFNFTlNPUl9DRkdfUkVHMl9SRUJPT1Rf
Q09ERQlHRU5NQVNLKDE1LCA0KQo+ICsJI2RlZmluZSBUU0VOU09SX0NGR19SRUcyX1JFQk9PVF9U
SU1FCUdFTk1BU0soMjMsIDE2KQo+ICsJI2RlZmluZSBUU0VOU09SX0NGR19SRUcyX0VOQUJMRQkJ
XAo+ICsJCShUU0VOU09SX0NGR19SRUcyX0hJVEVNUF9FTiB8CVwKPiArCQkgVFNFTlNPUl9DRkdf
UkVHMl9SRUJPT1RfRU4gfAlcCj4gKwkJIFRTRU5TT1JfQ0ZHX1JFRzJfUkVCT09UX1RJTUUpCj4g
Kwo+ICsjZGVmaW5lIFRTRU5TT1JfVEVNUF9DQUwJCTEKPiArCj4gICAjZGVmaW5lIFRTRU5TT1Jf
U1RBVDAJCQkweDQwCj4gICAKPiAgICNkZWZpbmUgVFNFTlNPUl9TVEFUOQkJCTB4NjQKPiBAQCAt
NjMsNiArNzUsNyBAQAo+ICAgCj4gICAjZGVmaW5lIFRTRU5TT1JfQ0FMSUJfT0ZGU0VUCTEKPiAg
ICNkZWZpbmUgVFNFTlNPUl9DQUxJQl9TSElGVAk0Cj4gKyNkZWZpbmUgVFNFTlNPUl9IV19SRVNF
VF9ERUZBVUxUX1RFTVAJMTEwMDAwCj4gICAKPiAgIC8qKgo+ICAgICogc3RydWN0IGFtbG9naWNf
dGhlcm1hbF9zb2NfY2FsaWJfZGF0YQo+IEBAIC05Myw2ICsxMDYsNyBAQCBzdHJ1Y3QgYW1sb2dp
Y190aGVybWFsX2RhdGEgewo+ICAgCWNvbnN0IHN0cnVjdCBhbWxvZ2ljX3RoZXJtYWxfc29jX2Nh
bGliX2RhdGEgKmNhbGlicmF0aW9uX3BhcmFtZXRlcnM7Cj4gICAJY29uc3Qgc3RydWN0IHJlZ21h
cF9jb25maWcgKnJlZ21hcF9jb25maWc7Cj4gICAJYm9vbCB1c2Vfc207Cj4gKwlib29sIGhhc19z
eXNjbGs7Cj4gICB9Owo+ICAgCj4gICBzdHJ1Y3QgYW1sb2dpY190aGVybWFsIHsKPiBAQCAtMTAx
LDggKzExNSwxMCBAQCBzdHJ1Y3QgYW1sb2dpY190aGVybWFsIHsKPiAgIAlzdHJ1Y3QgcmVnbWFw
ICpyZWdtYXA7Cj4gICAJc3RydWN0IHJlZ21hcCAqc2VjX2FvX21hcDsKPiAgIAlzdHJ1Y3QgY2xr
ICpjbGs7Cj4gKwlzdHJ1Y3QgY2xrICpzeXNjbGs7Cj4gICAJc3RydWN0IHRoZXJtYWxfem9uZV9k
ZXZpY2UgKnR6ZDsKPiAgIAl1MzIgdHJpbV9pbmZvOwo+ICsJdTMyIHRlbXBfY29kZTsKPiAgIAlz
dHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKnNtX2Z3Owo+ICAgCXUzMiB0c2Vuc29yX2lkOwo+ICAg
fTsKPiBAQCAtMTM4LDYgKzE1NCw0NiBAQCBzdGF0aWMgaW50IGFtbG9naWNfdGhlcm1hbF9jb2Rl
X3RvX21pbGxpY2Vsc2l1cyhzdHJ1Y3QgYW1sb2dpY190aGVybWFsICpwZGF0YSwKPiAgIAlyZXR1
cm4gdGVtcDsKPiAgIH0KPiAgIAo+ICsvKgo+ICsgKiBDYWxjdWxhdGUgYSB0ZW1wZXJhdHVyZSBj
b2RlIGZyb20gYSB0ZW1wZXJhdHVyZSB2YWx1ZSAuCj4gKyAqIFRoZSB1bml0IG9mIHRoZSB0ZW1w
ZXJhdHVyZSBpcyBkZWdyZWUgbWlsbGlDZWxzaXVzLgo+ICsgKi8KPiArc3RhdGljIHUzMiBhbWxv
Z2ljX3RoZXJtYWxfbWlsbGljZWxzaXVzX3RvX2NvZGUoc3RydWN0IGFtbG9naWNfdGhlcm1hbCAq
cGRhdGEsIGludCBtaWxsaWNlbHNpdXMpCj4gK3sKPiArCWNvbnN0IHN0cnVjdCBhbWxvZ2ljX3Ro
ZXJtYWxfc29jX2NhbGliX2RhdGEgKnBhcmFtID0KPiArCQkJCQlwZGF0YS0+ZGF0YS0+Y2FsaWJy
YXRpb25fcGFyYW1ldGVyczsKPiArCXM2NCBmYWN0b3IsIHVwdGF0LCB1ZWZ1c2U7Cj4gKwl1MzIg
dGVtcF9jb2RlOwo+ICsKPiArCXVlZnVzZSA9IHBkYXRhLT50cmltX2luZm8gJiBUU0VOU09SX1RS
SU1fU0lHTl9NQVNLID8KPiArCQkJICAgICB+KHBkYXRhLT50cmltX2luZm8gJiBUU0VOU09SX1RS
SU1fVEVNUF9NQVNLKSArIDEgOgo+ICsJCQkgICAgIChwZGF0YS0+dHJpbV9pbmZvICYgVFNFTlNP
Ul9UUklNX1RFTVBfTUFTSyk7Cj4gKwo+ICsJZmFjdG9yID0gcGFyYW0tPkIgKyBkaXZfczY0KG1p
bGxpY2Vsc2l1cywgMTAwKTsKPiArCWZhY3RvciA9IEJJVCgxNikgKiBmYWN0b3I7Cj4gKwlmYWN0
b3IgPSBkaXZfczY0KGZhY3RvciwgcGFyYW0tPkEpOwo+ICsJZmFjdG9yID0gZmFjdG9yIC0gKHVl
ZnVzZSAmIFRTRU5TT1JfVFJJTV9URU1QX01BU0spOwo+ICsKPiArCXVwdGF0ID0gcGFyYW0tPm4g
KiBmYWN0b3I7Cj4gKwl1cHRhdCA9IGRpdl9zNjQodXB0YXQsIEJJVCgxNikpOwo+ICsJdXB0YXQg
PSBwYXJhbS0+bSAtIHVwdGF0Owo+ICsKPiArCWZhY3RvciA9IGZhY3RvciAqIDEwMDsKPiArCWZh
Y3RvciA9IGRpdl9zNjQoZmFjdG9yLCB1cHRhdCk7Cj4gKwo+ICsJdGVtcF9jb2RlID0gKChmYWN0
b3IgPj4gMHg0KSAmIFRTRU5TT1JfVEVNUF9NQVNLKSArIFRTRU5TT1JfVEVNUF9DQUw7Cj4gKwo+
ICsJcmV0dXJuIHRlbXBfY29kZTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgYW1sb2dpY190c2Vu
c29yX3NldHVwX2h3X3Jlc2V0KHN0cnVjdCBhbWxvZ2ljX3RoZXJtYWwgKmRhdGEpCj4gK3sKPiAr
CXJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIFRTRU5TT1JfQ0ZHX1JFRzIsIFRTRU5T
T1JfQ0ZHX1JFRzJfUkVCT09UX0NPREUsCj4gKwkJCSAgIGRhdGEtPnRlbXBfY29kZSA8PCAweDQp
Owo+ICsJcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgVFNFTlNPUl9DRkdfUkVHMiwK
PiArCQkJICAgVFNFTlNPUl9DRkdfUkVHMl9FTkFCTEUsIFRTRU5TT1JfQ0ZHX1JFRzJfRU5BQkxF
KTsKPiArfQo+ICsKPiAgIHN0YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX2VuYWJsZShzdHJ1Y3Qg
YW1sb2dpY190aGVybWFsICpkYXRhKQo+ICAgewo+ICAgCWludCByZXQ7Cj4gQEAgLTI1NCw2ICsz
MTAsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWxvZ2ljX3RoZXJtYWxfc29jX2NhbGliX2Rh
dGEgYW1sb2dpY190aGVybWFsX2cxMmEgPSB7Cj4gICAJLm4gPSAzMjQsCj4gICB9Owo+ICAgCj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgYW1sb2dpY190aGVybWFsX3NvY19jYWxpYl9kYXRhIGFtbG9n
aWNfdGhlcm1hbF9hOSA9IHsKPiArCS5BID0gOTE2NCwKPiArCS5CID0gMjc0NywKPiArCS5tID0g
MzcwLAo+ICsJLm4gPSAyNzAsCj4gK307Cj4gKwo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWxv
Z2ljX3RoZXJtYWxfZGF0YSBhbWxvZ2ljX3RoZXJtYWxfZzEyYV9jcHVfcGFyYW0gPSB7Cj4gICAJ
LnVfZWZ1c2Vfb2ZmID0gMHgxMjgsCj4gICAJLmNhbGlicmF0aW9uX3BhcmFtZXRlcnMgPSAmYW1s
b2dpY190aGVybWFsX2cxMmEsCj4gQEAgLTI3Miw2ICszMzUsMTMgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBhbWxvZ2ljX3RoZXJtYWxfZGF0YSBhbWxvZ2ljX3RoZXJtYWxfYTFfY3B1X3BhcmFtID0g
ewo+ICAgCS5yZWdtYXBfY29uZmlnID0gJmFtbG9naWNfdGhlcm1hbF9yZWdtYXBfY29uZmlnX2cx
MmEsCj4gICB9Owo+ICAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYW1sb2dpY190aGVybWFsX2Rh
dGEgYW1sb2dpY190aGVybWFsX2E5X3BhcmFtID0gewo+ICsJLnVzZV9zbQkJCT0gdHJ1ZSwKPiAr
CS5oYXNfc3lzY2xrCQk9IHRydWUsCj4gKwkuY2FsaWJyYXRpb25fcGFyYW1ldGVycwk9ICZhbWxv
Z2ljX3RoZXJtYWxfYTksCj4gKwkucmVnbWFwX2NvbmZpZwkJPSAmYW1sb2dpY190aGVybWFsX3Jl
Z21hcF9jb25maWdfZzEyYSwKPiArfTsKPiArCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGFtbG9n
aWNfdGhlcm1hbF9kYXRhIGFtbG9naWNfdGhlcm1hbF90N19wYXJhbSA9IHsKPiAgIAkudXNlX3Nt
CQkJPSB0cnVlLAo+ICAgCS5jYWxpYnJhdGlvbl9wYXJhbWV0ZXJzCT0gJmFtbG9naWNfdGhlcm1h
bF9nMTJhLAo+IEBAIC0yOTEsNiArMzYxLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIG9mX2FtbG9naWNfdGhlcm1hbF9tYXRjaFtdID0gewo+ICAgCQkuY29tcGF0aWJsZSA9
ICJhbWxvZ2ljLGExLWNwdS10aGVybWFsIiwKPiAgIAkJLmRhdGEgPSAmYW1sb2dpY190aGVybWFs
X2ExX2NwdV9wYXJhbSwKPiAgIAl9LAo+ICsJewo+ICsJCS5jb21wYXRpYmxlID0gImFtbG9naWMs
YTktdGhlcm1hbCIsCj4gKwkJLmRhdGEgPSAmYW1sb2dpY190aGVybWFsX2E5X3BhcmFtLAo+ICsJ
fSwKPiAgIAl7Cj4gICAJCS5jb21wYXRpYmxlID0gImFtbG9naWMsdDctdGhlcm1hbCIsCj4gICAJ
CS5kYXRhID0gJmFtbG9naWNfdGhlcm1hbF90N19wYXJhbSwKPiBAQCAtMzA1LDYgKzM3OSw3IEBA
IHN0YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiAgIAl2b2lkIF9f
aW9tZW0gKmJhc2U7Cj4gICAJaW50IHJldDsKPiArCXUzMiByZXNldF90ZW1wOwo+ICAgCj4gICAJ
cGRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4g
ICAJaWYgKCFwZGF0YSkKPiBAQCAtMzIzLDkgKzM5OCwyNCBAQCBzdGF0aWMgaW50IGFtbG9naWNf
dGhlcm1hbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCWlmIChJU19F
UlIocGRhdGEtPnJlZ21hcCkpCj4gICAJCXJldHVybiBQVFJfRVJSKHBkYXRhLT5yZWdtYXApOwo+
ICAgCj4gLQlwZGF0YS0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7Cj4gLQlpZiAoSVNf
RVJSKHBkYXRhLT5jbGspKQo+IC0JCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihw
ZGF0YS0+Y2xrKSwgImZhaWxlZCB0byBnZXQgY2xvY2tcbiIpOwo+ICsJaWYgKHBkYXRhLT5kYXRh
LT5oYXNfc3lzY2xrKSB7Cj4gKwkJcGRhdGEtPmNsayA9IGRldm1fY2xrX2dldChkZXYsICJjb3Jl
Iik7Cj4gKwkJaWYgKElTX0VSUihwZGF0YS0+Y2xrKSkKPiArCQkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCBQVFJfRVJSKHBkYXRhLT5jbGspLCAiZmFpbGVkIHRvIGdldCBjb3JlIGNsa1xuIik7
Cj4gKwkJcGRhdGEtPnN5c2NsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgInBjbGsiKTsK
PiArCQlpZiAoSVNfRVJSKHBkYXRhLT5zeXNjbGspKQo+ICsJCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZShkZXYsIFBUUl9FUlIocGRhdGEtPnN5c2NsayksICJmYWlsZWQgdG8gZ2V0IHBjbGtcbiIpOwo+
ICsJfSBlbHNlIHsKPiArCQlwZGF0YS0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7Cj4g
KwkJaWYgKElTX0VSUihwZGF0YS0+Y2xrKSkKPiArCQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKHBkYXRhLT5jbGspLCAiZmFpbGVkIHRvIGdldCBjbG9ja1xuIik7Cj4gKwl9Cj4g
Kwo+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiYW1sb2dp
Yyxody1yZXNldC10ZW1wIiwgJnJlc2V0X3RlbXApKSB7Cj4gKwkJZGV2X2RiZyhkZXYsICJ1c2lu
ZyBkZWZhdWx0IGhhcmR3YXJlIHJlc2V0IHRlbXBlcmF0dXJlXG4iKTsKPiArCQlyZXNldF90ZW1w
ID0gVFNFTlNPUl9IV19SRVNFVF9ERUZBVUxUX1RFTVA7Cj4gKwl9CgpPbGQgU29DIHdpdGhvdXQg
dGhlICdhbWxvZ2ljLGh3LXJlc2V0LXRlbXAnIHdpbGwgbm93IGRlZmF1bHQgdG8gClRTRU5TT1Jf
SFdfUkVTRVRfREVGQVVMVF9URU1QCgo+ICsKPiAgIAo+ICAgCWlmIChwZGF0YS0+ZGF0YS0+dXNl
X3NtKQo+ICAgCQlyZXQgPSBhbWxvZ2ljX3RoZXJtYWxfcHJvYmVfc20ocGRldiwgcGRhdGEpOwo+
IEBAIC0zNDYsNiArNDM2LDEwIEBAIHN0YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAKPiAgIAlkZXZtX3RoZXJtYWxfYWRkX2h3
bW9uX3N5c2ZzKCZwZGV2LT5kZXYsIHBkYXRhLT50emQpOwo+ICAgCj4gKwlwZGF0YS0+dGVtcF9j
b2RlID0gYW1sb2dpY190aGVybWFsX21pbGxpY2Vsc2l1c190b19jb2RlKHBkYXRhLCByZXNldF90
ZW1wKTsKPiArCj4gKwlhbWxvZ2ljX3RzZW5zb3Jfc2V0dXBfaHdfcmVzZXQocGRhdGEpOwoKU29t
ZWhvdyByZWxhdGVkIHRvIHRoZSBhYm92ZSBjb21tZW50LCBzaG91bGQgaXQgYmUgb25seSBmb3Ig
QTkgPwoKPiArCj4gICAJcmV0ID0gYW1sb2dpY190aGVybWFsX2VuYWJsZShwZGF0YSk7Cj4gICAK
PiAgIAlyZXR1cm4gcmV0Owo+IEBAIC0zNTUsNiArNDQ5LDggQEAgc3RhdGljIHZvaWQgYW1sb2dp
Y190aGVybWFsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgewo+ICAg
CXN0cnVjdCBhbWxvZ2ljX3RoZXJtYWwgKmRhdGEgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKPiAgIAo+ICsJaWYgKGRhdGEtPmRhdGEtPmhhc19zeXNjbGspCj4gKwkJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGRhdGEtPnN5c2Nsayk7CgpOb3QgbmVlZGVkLCBkZXZtXyBpcyB1c2VkIGluIHRo
ZSBwcm9iZSBmdW5jdGlvbgoKPiAgIAlhbWxvZ2ljX3RoZXJtYWxfZGlzYWJsZShkYXRhKTsKPiAg
IH0KPiAgIAo+IEBAIC0zNjMsNiArNDU5LDggQEAgc3RhdGljIGludCBhbWxvZ2ljX3RoZXJtYWxf
c3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICAJc3RydWN0IGFtbG9naWNfdGhlcm1hbCAq
ZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICAgCj4gICAJYW1sb2dpY190aGVybWFsX2Rp
c2FibGUoZGF0YSk7Cj4gKwlpZiAoZGF0YS0+ZGF0YS0+aGFzX3N5c2NsaykKPiArCQljbGtfZGlz
YWJsZV91bnByZXBhcmUoZGF0YS0+c3lzY2xrKTsKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgfQo+
IEBAIC0zNzEsNiArNDY5LDkgQEAgc3RhdGljIGludCBhbWxvZ2ljX3RoZXJtYWxfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1sb2dpY190aGVybWFsICpkYXRh
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gICAKPiArCWFtbG9naWNfdHNlbnNvcl9zZXR1cF9o
d19yZXNldChkYXRhKTsKPiArCWlmIChkYXRhLT5kYXRhLT5oYXNfc3lzY2xrKQo+ICsJCWNsa19w
cmVwYXJlX2VuYWJsZShkYXRhLT5zeXNjbGspOwoKU2hvdWxkbid0IHRoZSBjbG9jayBlbmFibGVk
IGJlZm9yZSBhY2Nlc3NpbmcgdGhlIHJlZ2lzdGVyIGluIAphbWxvZ2ljX3RzZW5zb3Jfc2V0dXBf
aHdfcmVzZXQoKSA/Cgo+ICAgCXJldHVybiBhbWxvZ2ljX3RoZXJtYWxfZW5hYmxlKGRhdGEpOwo+
ICAgfQo+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
