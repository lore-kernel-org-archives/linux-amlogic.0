Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7277EC44501
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jul 2026 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ui8eH6zi7Z+WOHvSSqZWtdRF9EPOEo7hhaZli+sQk0Q=; b=1T5+KxJrh89qHF
	u4bak4rpq8J/Gck0siyjlQUJZ6MoexoBGkyS9I5GNT8jG/o9UaoCTiIVRdkPfOdQJSvrOPUksGrvy
	aO4TZIRE32j+IWPsWWf53DMndFCGTQzVdKveDaAfbYRiqHbtne/jUrAAtgjVpPcQ7t4NdsrtN1Zz1
	IJt0I7j425vbv9UkfMO2wH2cGDxUg19mAxVug4yc7YPQC918Rjf8Edb44mAd5nMjqP5XgBWya7K+g
	52uAJrkDR6UiMmX/LkmP1c0u8Z3XHnD/untw9PIlYlSOgGT7lrlo/qhY6HHoVt1zyY1cgC3t/THjA
	rQa3FhWHAQV8MeFrPN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSXQ-0000000HD9G-089a;
	Wed, 08 Jul 2026 13:42:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSXN-0000000HD7t-2Q1b
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Jul 2026 13:42:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C4B0B2752259
	for <linux-amlogic@lists.infradead.org>; Wed, 8 Jul 2026 13:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAn5oRAOD1QHpE4ls+17l31BEDS3aVXn/PHrM1rmmKA=; b=mqEpa8npHQGKRky4
	U80gPlXm4mghET5zArMq+7DG1VPZLTGiUEl4bjrkCDaiZHZq5crl0ewMo8yj+N33
	LBVfjba4sEO35K8TYrTMIGRmpyYBBKQRt6bWZXXfJMZaEkAPnAmH0ozlthXT9zNe
	DVp8Oi1r8+gwgf6APV5WonRJCBhZ6B9eq5l5MFIbyOtQ3ZTrmqFPjUz/6DvcgfCT
	UL02NTdgZMRKFVn6YwmoAPkPgSi6G1lppx43zdJO/9sxC2SVMHsFSRTVjAVeNa/l
	klcxCn2GGIdZsHcNj/xxvlIvtgRz0/b7siQyu6u2k1jEy7sm5zVWOuJzXRpXQos2
	USBa8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstp5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 08 Jul 2026 13:42:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so7892951cf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Jul 2026 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783518124; x=1784122924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAn5oRAOD1QHpE4ls+17l31BEDS3aVXn/PHrM1rmmKA=;
        b=RO272RaHHOd3/jvBjTKx2A2jBPwQpbYe6QrrSmujkGg2+uRmlC3ZWMWk4huSti8Z9t
         1dZsHIrsaHY3E1dRG5dUvV5DEiaTde5LWoJB18iykEshry3hKpr5NRY5LG/zE8fhnB8V
         sZNP2u+GQmbklNgdoEP/XodQgluNBbAFkMuAszVgAwe4g+xuFW62RUM+ax1yPO80UAED
         8KggPlCskDp6YoNQAyNwNtMpMHrgA8PMWbdeWDxpDpbMTIIvHshEzo4SJrYlLgR6glnI
         Gr5tec/QOKQqxJuB6WI9O7rE3AejOO6XGOIDJF9jAddYIXq7RKRfYTmwF9Hm9hVxcNyf
         uLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518124; x=1784122924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAn5oRAOD1QHpE4ls+17l31BEDS3aVXn/PHrM1rmmKA=;
        b=qPhF0L92mP7+CA7rbY1djwXBYQIN6sIQNusN5SMu59yzn6a7MVUnV6xn3vMJ46R7hk
         Mee79w5Z699DBMuxY0769idHr0ohBN36SM4/jAy04j2haHmqsLNi8rhmpkmDQPRbY8KM
         HcmzoszUMUBjWJtF1dGo0Eg4EK1BOPJCZQgf3Q/2Gq8cT2DKsFyzqRx7C4bkrtdzRPt+
         H+80yVY3otROPszP6yoP8TeabU88/WXWhsMv9rkR5RCulFBtTfQFeLYqCxdXepo/oUtI
         byCYR1iTkO/TVbbQJxKfWlGACv0xIiZZd30rVkbsCLcJzKEoSDQK0f+rIzpldKC4X8oR
         ZZJg==
X-Gm-Message-State: AOJu0YzY5OzddDLI4eqKNp/vbmFZNDLPY+boFfKXDV5VbQZWtJLGKvxu
	iwwf5X9uYGHq8UvedSlYQFKuwBzH8KarxMCXLYpbWqHCma13DhS5LXIJN4gtHPu9yF5eEYAlHkJ
	+wzwTI6aW/fx11ysd+rLkfsv6rJyDFq8rXXCUOOj/xwWtPYnk+3bS4VL+daBL1hlOKFoLWZiDtA
	==
X-Gm-Gg: AfdE7clQirkdpLV8ttUTk+waZQd+e//GBZogDXOiQCvgy7cZgM05Yczb89TbYZyhYg3
	7bxxYGgFuMePu2sNevEFE8haJfdLB6HAmUW1Z9X9yUWwiAB702SjXtQf2OYSa+AGKIs5l+ckdYg
	OBy2gidwVzbupuMcHVAseFZXZ2zjYLs7Fb9+y7na/gkrk4VJBBNS2Uf6WQEur1v4eQlSMHd5J+w
	xgnEDbpNk+5Efkq1liOVbZB9OgtlIKrWOWYGZMP77eX3iGQwE3AkOPUQEI+IcnulgTlD5jFYKX/
	PK69LjmhIoQhdccv7aIoiVqPXnjUyf2Tm+Q8etjgt6KPdNYB3V3VIUo7xNnr3rNKeIAzwKQRyPn
	F7UIhBnX82MJL7AFcqeHkHGI8VD6Uff5A1V9V1omVw8bOxCUXPHPD5EcbHFed5cIFCzNYjJA/9Q
	==
X-Received: by 2002:ac8:6f10:0:b0:51a:8c99:1f0d with SMTP id d75a77b69052e-51c8b41eb83mr26572191cf.60.1783518123708;
        Wed, 08 Jul 2026 06:42:03 -0700 (PDT)
X-Received: by 2002:ac8:6f10:0:b0:51a:8c99:1f0d with SMTP id d75a77b69052e-51c8b41eb83mr26571551cf.60.1783518123041;
        Wed, 08 Jul 2026 06:42:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2110:e352:d7b8:8bf2? ([2a05:6e02:1041:c10:2110:e352:d7b8:8bf2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a58853sm48871385e9.1.2026.07.08.06.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:42:02 -0700 (PDT)
Message-ID: <713c728a-f68f-41fa-a64b-09ccecef9157@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] Add VIM4 MCU/FAN support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e53ac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=J7wINilrcEgEcG5NXz0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfXxt6s/pygHWZo
 z9KOCRequxCyBZSv0fqJ9EE+BOyhqnbMH7+pZ5VkToLtph8tNevaXVfIIFRdP1OFi/ljAVzOG2F
 Kd4w3gFv/Ce07MS64DV107C+rJOWbCREZAXLdWciUL57OCg4XDNwlQsqtW0Bc6qlChxBPDmWg+C
 3Q0h4hdPX72xOiJ6YpzP5dCsSQjF13VRzWksSkfaxsj9jdBV3kQzH5xkI0KVOZYRSN9YPkjA258
 Cd2wwQKxC15+Ji76ZevqPyQgswGN8VO3f42ibpYeZIpbGQeKGdRFdzwqjHhXKTRQFiM4oqOb4M2
 +zleXGOzRSdR1PrCql/rrAaBAddIvpfFWaZ9SVbdyXUuyMBVmygDq4F8tyUrFRXoJCjQRn147C+
 XcTOFV8n4kQgMVUb9YkWyBcvPUvz1xIffKCyzfIpipDak6HsmhNVyhoASXfVIkfjZO8Ec4l0UsC
 YCePeDSkCMrhWrNtDDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfXxxx8XdJpEhD7
 fFS/p3w+M2bf5XWFmtGreOnvhfAzFAYPH83KwpHKhqbKCIzJBfCXfvpLh8qzDtcZRACj1MddLQy
 Rw1YhBcBCB27uZdBt4iuqMn3nGxTATA=
X-Proofpoint-GUID: HqCT1FDEVCoeEkAcQa1ReF0dgCl2fzfU
X-Proofpoint-ORIG-GUID: HqCT1FDEVCoeEkAcQa1ReF0dgCl2fzfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_064205_726730_694D5D81 
X-CRM114-Status: GOOD (  14.92  )
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

T24gNy8yLzI2IDExOjU1LCBSb25hbGQgQ2xhdmVhdSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gVGhl
IEtoYWRhcyBWSU00IGJvYXJkIGZlYXR1cmVzIGEgZGlmZmVyZW50IE1DVSB2YXJpYW50IGNvbXBh
cmVkIHRvCj4gcHJldmlvdXMgVklNIGJvYXJkcy4KPiBXaGlsZSBpdCBzaGFyZXMgdGhlIHNhbWUg
STJDLWJhc2VkIGNvbW11bmljYXRpb24gbW9kZWwsCj4gaXQgZGlmZmVycyBpbiBzb21lIHdheXM6
Cj4gCj4gICAgLSBBIGRpc3RpbmN0IHJlZ2lzdGVyIG1hcCB3aXRoIGl0cyBvd24gdm9sYXRpbGUv
d3JpdGVhYmxlIHJlZ2lzdGVyIHNldAo+ICAgIC0gQSBmYW4gY29udHJvbCB3aXRoIDDigJMxMDAg
bGV2ZWxzIGluc3RlYWQgb2YgdGhlIDDigJMzIGxldmVscyBwcmV2aW91c2x5CgpUaGF0IG1lYW5z
IGZvciBhIGVnLiAxMDAgbXMgcG9sbGluZywgdGhlIGZpcnN0IG9uZSB0YWtlcyAxMHMgdG8gcmVh
Y2ggCnRoZSBtYXggc3BlZWQsIHdoaWxlIHRoZSBzZWNvbmQgdGFrZXMgMzAwbXMsIHJpZ2h0ID8K
Cj4gICAgLSBBIGZhbiBwb3dlciBzdXBwbHkgZ2F0ZWQgdGhyb3VnaCBhIHJlZ3VsYXRvcgo+IAo+
IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhpcyBuZXcgdmFyaWFudCBieToKPiAKPiAg
ICAxLiBSZWZhY3RvcmluZyB0aGUga2hhZGFzLW1jdSBNRkQgZHJpdmVyIHRvIHVzZSBwZXItdmFy
aWFudCBkYXRhCj4gICAgICAgc3RydWN0dXJlcyAocmVnbWFwIGNvbmZpZywgY2VsbHMsIGZhbiBw
bGF0Zm9ybSBkYXRhKSwKPiAgICAgICBhbmQgYWRkaW5nIHRoZSBraGFkYXMsdmltNC1tY3UgY29t
cGF0aWJsZSBzdHJpbmcuCj4gCj4gICAgMi4gRXh0ZW5kaW5nIHRoZSBmYW4gdGhlcm1hbCBkcml2
ZXIgdG8gcmV0cmlldmUgdGhlIGZhbiByZWdpc3Rlcgo+ICAgICAgIGFuZCBtYXhpbXVtIGxldmVs
IGZyb20gcGxhdGZvcm1fZGF0YSwKPiAgICAgICBhbmQgdG8gb3B0aW9uYWxseSBtYW5hZ2UgYSBw
b3dlciByZWd1bGF0b3IgZm9yIHRoZSBmYW4gc3VwcGx5LgoKVGhyb3VnaCB3aGljaCB0cmVlIGRv
IHlvdSBleHBlY3QgcGF0Y2ggNS84IHRvIGdvID8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
