Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92911FC0342
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4oJKQoaz9cScDUhMmFqJA+TcMXYMwoMmxZeJCpW+R8=; b=Rs+hA34uYzWlgX
	b8UBJmuRY8gVlGL2PfGeb5mxqcM4i6fCEVIOFVF19dVvjHQGE0RZS/PVJmzbthtEmAp+P/TgbimQO
	upeGFI9g28jH38jtMuq4KLlKxlnFUX8fla7tHwbyYiLPgq/GgElUfN37mnzFL75CUigp0tE2GdwHz
	n0nUe7yjoU6EKYWKtp0Nl4XfPKNzWrMKVwheEc0i8Ux8fLJ6fQa/kPRDnErcEdalW77hYQDOmdL7A
	cbaWzjE7NYov3NwoPc2TB0p4KxsijyX/mManUfz7V+vVXL2tzRuCy8KfNdpKXTuRZ4WRRJ0dT4dcp
	MrNLY04BQAoYGlofPVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvnv-0000000Brrg-1md5;
	Thu, 23 Apr 2026 15:17:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvnp-0000000Bros-3OTo
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 15:17:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u48O3768991
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 15:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eze/1plM2v1qn5QnTvk0ysvssVshSt8k0/rXfQex3Xg=; b=PA6gL6/3dqpWMUfW
	jEkt63+YX5zSJ4fDKeSX6I0cS9gGGPnzeX0g16rPwysV6c1G3Sdxr9/EHJgS61BH
	apN6HLXVpgRHrhjy35HCYO74wSh5ud8aQgRrhIXzQPhxd3cgcnO2z8OpxaN5qy2u
	PQGatrXMIpHgAeakubttffluTsQzVZbQfsMPtjxWs6TgwoSa4VFpwQZvKcTQ5m9x
	Xr77nDCX+F4E4QA10o08WcIcwVL6ERjkHSKgVCRoskcpUDop90IAJVlfIze1gstY
	egS/4r8ycsjCO7Ed0HaMQAahN0mSwVRKQTIWM9dghK2WiZNdZo32t3lTTZHLhceh
	uBnBpQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq4ggb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 15:17:16 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-479d4674399so3132152b6e.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776957436; x=1777562236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eze/1plM2v1qn5QnTvk0ysvssVshSt8k0/rXfQex3Xg=;
        b=Yp9xqOXEzUeoBX7N/3sqh3aS+ZEjNUPnrMg/+qmLhVuiLbz5XQhed6Ts1gTKzgMBjn
         IUWZbe6U63gTj1IXf/PlGRiuOHPvo8+vp6TJpYhhKeSnV+68gqeF+bIrlaS1tlVoyQ0S
         OrS8jFRdAEnpx+Ez3IahcArCXYQjJfHCu3vAb/Qv4GBLIGBdgZpL23/8OjH3boKOy2Ds
         yUcFcToSMtcmiUS0yRS87TyCKWvjh7D9jOfOEdQ4j7TskjRzeGKmdc4N/Rm0sEX+u0LH
         Qz++H8rKu5tAumdXgGKgqM5NC6S8NHu2xB00braRdYoZAnoi/JfidHQ6Eo/S11vbQWxc
         LqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957436; x=1777562236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eze/1plM2v1qn5QnTvk0ysvssVshSt8k0/rXfQex3Xg=;
        b=NM6bIMK/Jjl7HVC1iyDNu8rxoRR7JPK576CTQES4DcsmJfg7QB6NspS/bxAwNohh19
         vVrKDltNAsvnlVa6Q7og7gHxExgEi1EAg7D9qIiNZSIRF7X0ckhP6aFHfawxKeRHWBTy
         Of7vPFZgjghA2Au6++wCdwSlMIUUuv79DNRb3O5CZrwEjc8D8HDAMd1cOYSDbrCBJmum
         qDW/ES6xjLRnx7wBVOxYC2qX85r0W00YQcVqP9F7s5Zjd+TjHxhcF6sImydw6OPx5gfp
         K29iP9d3LPxhTgg7jIgsa0rOpNSAGba24Yp2h84kbPKQpUK47WiQgMB6uzeMBygDU1p9
         hXIw==
X-Forwarded-Encrypted: i=1; AFNElJ9khDE4002ChNoJ4xXe78bjWC4au2p4+qfuTgGT3jszZAE6wGJCjvKtIqj9q3U1oDLEdlhm38Usd9T1DS+h@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Q+UP9R3Mnh1WTg5VPMrhu9BnXyB1d2VnTgdZKBqS8OAyTbGX
	dfIvi0gs7qzl7JiHVRscnVJPRH9WP8QPfgtwvyD8gZF4M127X8PZIWP6ZRAG1C87Ccq4rc55hlY
	q4t9PAC7UAvR8jhwom6xS5AVfJTC1P8rYsDgJ/j03VMg0LFBB6Q+IrUdhe7jF/30iJ4OCo1FGhw
	AiewZ+LCFA
X-Gm-Gg: AeBDieul0VelDnuUKTZr2bzKwng4nKX23RR3f5UI1x1bIiSI5S4iVqB6ZMupewcIR2T
	Ez3Jn/OFlpheV6hFKJIpr2wySGTkRZKOQTKzJ685kPA0jzSvANStFG2kiIFYUK1EAyIrozbSxIa
	rY3YvaUfydPf7evx6F6OJE0VCyNiL6ltEofFLHVmnObPP0cFMhJEfM7Md41mkSRoDH+U9VufRJp
	UNIcgi5doHfy04El8B1Rpnw75m9kPs6VewwdkhjZOcT9uKAuMz46lrtp8VNz3ANxNap72r4QR77
	wmKnwbnavVPKT912524PVI4vZJrP+Ejjgv+xq42iv4IVIpIizYKghRoWZEETrJnPY7/+gZ/oRC3
	mS+a+cmP3XCaPf9fhl/0CRD2CTW8S9499QfYnTA3YmO+/RPzisr+7TlD4KRndtZgExzhA6X4TDa
	3XvtdWddHZn6flM4NehGM=
X-Received: by 2002:a05:6808:50a0:b0:47a:8c2:a558 with SMTP id 5614622812f47-47a08c2b6a8mr4055140b6e.43.1776957435921;
        Thu, 23 Apr 2026 08:17:15 -0700 (PDT)
X-Received: by 2002:a05:6808:50a0:b0:47a:8c2:a558 with SMTP id 5614622812f47-47a08c2b6a8mr4055087b6e.43.1776957435470;
        Thu, 23 Apr 2026 08:17:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8a9b:1477:c29c:4bcb? ([2a05:6e02:1041:c10:8a9b:1477:c29c:4bcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0b4c85sm502913835e9.0.2026.04.23.08.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 08:17:14 -0700 (PDT)
Message-ID: <8a4dcb94-ab88-4559-9027-49308ad02b73@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
 <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
 <7aaa7873-9274-48d8-a6fe-cff4239b03b4@oss.qualcomm.com>
 <19d70883-21db-4963-841d-7c00505e0d9e@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <19d70883-21db-4963-841d-7c00505e0d9e@aliel.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE1MiBTYWx0ZWRfX3SI6Dt5TTOzH
 Ogfo5W94aMWNWv7LRTJAojgFpgoZsEkfaGQSKFz9hVuNIh0t2w7jKxC73zkGcsEINelo6yAJJT0
 TApWpT88/GY0k/eN+2WQtBC1dzzciNSRIKhoV6m8wt5raZAZ6gF6ojRo3JtOmkYMMIe5mbi7aYY
 GAtZ6GFldyD7WGDx9bBmK7mDPkfU1GLpWk9VL1e9CxaYthnVtTzV3PRFbPvG/rZOp5E+1+aUqZr
 uN9qM54wqdeSI4jg6uXxzBZDooCwpWfPvNr7Ofzp4t3fUqh0MGEWfAmokXIJp7hOvV29ZtvKDpr
 RBUn4EfqxAanDfeWCvGBimS01RQ04ECMyeQxINpghNPj7sxUTuZW2UN6tjT7Hq/ePfgu+Z8HhuU
 tGaS7kL+y1rVR37Db8638fZ/gVCi9uV0krGA49WqEZKY7tvdUHE2L5QXLLf6Tndb9XXbLs1CfHq
 x7it/TtSFeDSX5AJadQ==
X-Proofpoint-ORIG-GUID: ULCD-V_azQH3G5MaPADThh7iu9rwYtLJ
X-Proofpoint-GUID: ULCD-V_azQH3G5MaPADThh7iu9rwYtLJ
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea37fc cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pD_S-A0WoN6OyM3pGvIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_081717_994304_8F732992 
X-CRM114-Status: GOOD (  20.90  )
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

T24gNC8yMy8yNiAxNzowOSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+
IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4KPiAKPiBPbiA0LzIzLzI2IDEyOjI1IFBNLCBEYW5p
ZWwgTGV6Y2FubyB3cm90ZToKPj4KPj4gSGkgUm9uYWxkLAo+PgoKZnVuY3Rpb24xKCkgewoKCj4+
PiArwqDCoMKgIGlmIChwZGF0YS0+ZGF0YS0+dXNlX3NtKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGRldmljZV9ub2RlICpzbV9ucDsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgb2Zf
cGhhbmRsZV9hcmdzIHBoX2FyZ3M7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gb2Zf
cGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3MocGRldi0+ZGV2Lm9mX25vZGUsCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJhbWxvZ2ljLHNlY3VyZS1tb25pdG9yIiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMSwgMCwgJnBoX2FyZ3MpOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNtX25wID0gcGhfYXJncy5ucDsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXNtX25wKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZXZfZXJyKGRldiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkZhaWxl
ZCB0byBwYXJzZSBzZWN1cmUgbW9uaXRvciBwaGFuZGxlXG4iKTsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PREVWOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+ICsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBwZGF0YS0+c21fZncgPSBtZXNvbl9zbV9nZXQoc21fbnApOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIG9mX25vZGVfcHV0KHNtX25wKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoIXBkYXRhLT5zbV9mdykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihk
ZXYsICJGYWlsZWQgdG8gZ2V0IHNlY3VyZSBtb25pdG9yIGZpcm13YXJlXG4iKTsKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRVBST0JFX0RFRkVSOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIH0KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwZGF0YS0+dHNlbnNvcl9pZCA9IHBoX2Fy
Z3MuYXJnc1swXTsKPj4+ICvCoMKgwqAgfSAKCn0KCmZ1bmN0aW9uMigpIHsKCmVsc2Ugewo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHBkYXRhLT5zZWNfYW9fbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBf
YnlfcGhhbmRsZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHBkZXYtPmRldi5vZl9ub2Rl
LCAiYW1sb2dpYyxhby1zZWN1cmUiKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKHBk
YXRhLT5zZWNfYW9fbWFwKSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihk
ZXYsICJzeXNjb24gcmVnbWFwIGxvb2t1cCBmYWlsZWQuXG4iKTsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKHBkYXRhLT5zZWNfYW9fbWFwKTsKPj4+ICvCoMKgwqDC
oMKgwqDCoCB9Cj4+PiAgwqDCoMKgwqDCoCB9Cgp9Cgo+IFN1cmUsIEkgd2lsbCBkbyB0aGF0Lgo+
IAo+Pj4gIMKgwqDCoMKgwqAgcGRhdGEtPnR6ZCA9IGRldm1fdGhlcm1hbF9vZl96b25lX3JlZ2lz
dGVyKCZwZGV2LT5kZXYKPj4KPj4gVGhlIHRoZXJtYWwgem9uZSBpcyByZWdpc3RlcmVkIGJlZm9y
ZSBjYWxsaW5nCj4+IGFtbG9naWNfdGhlcm1hbF9pbml0aWFsaXplKCksIHRodXMgcGRhdGEtPnRy
aW1faW5mbyBpcyBub3QgaW5pdGlhbGl6ZWQuCj4+IFdoZW4gYSB0aGVybWFsIHpvbmUgaXMgcmVn
aXN0ZXJlZCB0aGUgdGhlcm1hbCBmcmFtZXdvcmsgcmVhZHMgdGhlCj4+IHRlbXBlcmF0dXJlLCBz
byBpdCByZWFkcyBhbiBpbnZhbGlkIHZhbHVlIGJlY2F1c2U6Cj4+Cj4+IGRldm1fdGhlcm1hbF9v
Zl96b25lX3JlZ2lzdGVyKCkKPj4gIMKgLT4gdGhlcm1hbF9vZl96b25lX3JlZ2lzdGVyKCkKPj4g
IMKgwqAgLT4gdGhlcm1hbF96b25lX2RldmljZV9yZWdpc3Rlcl93aXRoX3RyaXBzKCkKPj4gIMKg
wqAgLT4gdGhlcm1hbF96b25lX2RldmljZV9lbmFibGUoKQo+PiAgwqDCoMKgwqDCoCAtPiBfX3Ro
ZXJtYWxfem9uZV9kZXZpY2VfdXBkYXRlKCkKPj4gIMKgwqDCoMKgwqDCoMKgIC0+IF9fdGhlcm1h
bF96b25lX2dldF90ZW1wKCkKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAtPiBhbWxvZ2ljX3RoZXJt
YWxfZ2V0X3RlbXAoKQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0+IGFtbG9naWNfdGhl
cm1hbF9jb2RlX3RvX21pbGxpY2Vsc2l1cygpCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBbIFVzZSBvZiB1bmluaXRpYWxpemVkIHBkYXRhLT50cmltX2luZm8gXQo+Pgo+PiBS
aWdodCA/Cj4+Cj4gCj4gWWVzLCBJIHdpbGwgbW92ZSB0aGUgaW5pdGlhbGl6ZSBiZWZvcmUgdGhl
IHJlZ2lzdGVyLgo+IAo+PiBJSVVDLCBhbWxvZ2ljX3RoZXJtYWxfaW5pdGlhbGl6ZSgpIGNhbiBi
ZSBhbHNvIHNwbGl0IGFuZCBtb3ZlZCB0aGUKPj4gY29ycmVzcG9uZGluZyBibG9ja3MgdG8gdGhl
IGZ1bmN0aW9ucyB0byBiZSBjcmVhdGVkIGluIHRoZSBjb21tZW50IGFib3ZlLgo+Pgo+IAo+IFRo
ZSBTTSBhbmQgc3lzY29uIHNldHVwIHdpbGwgYmUgZXh0cmFjdGVkIGludG8gdHdvIGZ1bmN0aW9u
cy4KPiBhbWxvZ2ljX3RoZXJtYWxfaW5pdGlhbGl6ZSgpIGl0c2VsZiBpcyBrZXB0IGFzLWlzIGJ1
dCBtb3ZlZCBiZWZvcmUKPiBkZXZtX3RoZXJtYWxfb2Zfem9uZV9yZWdpc3RlcigpLgo+IExldCBt
ZSBrbm93IGlmIHlvdSdkIHByZWZlciBhIGRpZmZlcmVudCBhcHByb2FjaC4KCkluIHRoZSBpbml0
aWFsaXplIGZ1bmN0aW9uIHRoZSBmb2xsb3dpbmcgY2h1bmsgaXMgYWRkZWQ6CgorICAgIGlmIChw
ZGF0YS0+ZGF0YS0+dXNlX3NtKSB7CisgICAgICAgIHJldHVybiBtZXNvbl9zbV9nZXRfdGhlcm1h
bF9jYWxpYihwZGF0YS0+c21fZncsCisgICAgICAgICAgICAgICAgICAgICAgICAgICZwZGF0YS0+
dHJpbV9pbmZvLAorICAgICAgICAgICAgICAgICAgICAgICAgICBwZGF0YS0+dHNlbnNvcl9pZCk7
CisgICAgfQoKSSB3YXMgc3VnZ2VzdGluZyB0byBtb3ZlIGl0IHRvIGZ1bmN0aW9uMSgpIGFuZCB0
aGUgcmVzdCBvZiBjb2RlIGZyb20gCmluaXRpYWxpemUgaW4gZnVuY3Rpb24yKCkKClRoYXQgcmVz
dWx0cyBpbiBhbWxvZ2ljX3RoZXJtYWxfaW5pdGlhbGl6ZSgpIHRvIGJlIGRpc3NvbHZlZCBpbiAK
ZnVuY3Rpb24xKCkgYW5kIGZ1bmN0aW9uMigpCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
