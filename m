Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDACC43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2026 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Mmj9+hWvlj7CesP74PxHKENy72wanWIvP7n/zVct3k=; b=zz5yedxWPljW04
	PpchGcV5hPfqnrauoFeiD2sY8nqIP7vvg2qF2ndPpm5nLHKDf1lALNcYrIMTO1sWTCMXwkH4hxWBm
	p+xJVXJNSGz+r2Ej5oBXwbaGITbwQISX2veRTMx3bgH8D57S1/J2U7gU7ndKNQgttVNfu+ULMpv9+
	8oOT7lcMx1KUgGnku8koLEFw8K8TU7kJGeo7fVR0Lb4jsjAiRiiZRaiUGraEriyv2dlHk8javf1vX
	KrxJqQ8Rp0iiY2twp0GQFgwH07dDObrMLY5rvprimqhZ2JcwqHO9Ghw4EO3OidGwAoojBabQAFgDk
	obN9Uq63AAlWg70a50Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWeC-0000000GqXw-0aCe;
	Tue, 30 Jun 2026 11:29:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWe9-0000000GqWT-0xMS
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jun 2026 11:28:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1AP1573380
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 11:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cD/qdB4qLo7t24V1HoY2mhI5/c5P8R7KcWgHdIvodg=; b=jIvI+h5dau62FnVJ
	+ceUeR3pIvghdyQb72ZrWn3ExB2KV7pko6NOewt0MuaLC/5682f/9U1HBRyDNClc
	vfOcsbkdj3QXDxc2KG2XS1eS/6v7KGkb3JTZNhjD38868jBp8OHdT93MZjshhmCJ
	cx3H2Qeu3/rn7o1/DCJBIPFSINj+JKiPfQpNA5jNOV+7T5oSB1mXlinNSrV6RouU
	mR1RkgGKjlZRVAkiHJ/kBjSagsQ5/21TU8QDKwZhUrnDJ32D/A659lCfYmribO4q
	q0afVARwI8CHWCAtX2IrJYXZqTvPX/LeQMLj9nZe7oYC317TBUYpjm7Gocq3ebhO
	sMu58Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861xh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 11:28:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca3374c6aso11886676eec.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782818935; x=1783423735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cD/qdB4qLo7t24V1HoY2mhI5/c5P8R7KcWgHdIvodg=;
        b=RoXZbhMucFrw++mSp8CU/khuC+SKmtflLR9yN13tUminqXT2xgShfGFdm6P4UnpOup
         j5mu/F/KYGHcrZdc+jozVP9O9ABsKHiNg4p4g332iNMAYaolXs8IxmpCuHfpXb8z9Dqs
         n8oB9KuehzyIso4Op4OoAOHPzSAHSRQXxPcLuVaYeOOkBtH6IW5/19zlSVg1uou3C3az
         MksBvU0nHAkEtOKnF+2FVI1VZITwnzkAywaq+T/Gea8KvcusQlZaj8BQPb4AO4lhuFp4
         /LyhitPPki2MuzWhrT+A4xPVJinclVqD2ajy0++rficnL7YjVvp/cNStPrDpAwCjxRG6
         AgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818935; x=1783423735;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cD/qdB4qLo7t24V1HoY2mhI5/c5P8R7KcWgHdIvodg=;
        b=cO1MC+PhigvQjMZyoFC+ejwYaJ431tTB9TSXzk1XsLpCQQ9r72RajS/4udtPxfNL/s
         E/SKRpMRTn/rzCvU9H8nTTJ6U+flS7MPum7t/4BWk/D5lYThO4vuel+2FSGtw4UTIfoo
         xPZLrkJyi6jjxNU7LpeVRsfsFhiapl5FDcXOEbrL+ERd6vxdSW/rI/U/4VQV1nGWMhwJ
         0LL5MwZYnG4kcyEbYJPdst8TqRNOKt15Ea6OQAsImiLM/vPEH5oH2GQen93dDgGlh3yq
         BCtOoQG5bkoLcr8nYSmyoYo36JlFofr9c9WlXvy1JQzmWXr0VtbuQ6vhuGQu1x5hcCJE
         vQKA==
X-Forwarded-Encrypted: i=1; AHgh+RpY4KcOeEXhxi+iPu26X6XKXGYoRZm0V5u4evKj9fwGuk0IwAsyTOodva/pfngV4gEyFt+FbLrqR/gUCAkc@lists.infradead.org
X-Gm-Message-State: AOJu0YykBsWDDUZT+loO69YVBLpczpkOdO/DQvZJjTe1+EBx2I4oA4/f
	Xn/Fl3huoJkI0LeNjhg+jmJoubu7N5y1GQntX4rpoiVb2qchFkloYYNoveoSiBUWqO8pz75lPV0
	QWG58tjgPbX+jA0/U/baQZ4reYOOTir58sJVj22WJ24TqSkc7X8WxLSHGO+1Q95efd/saLvH0ZA
	==
X-Gm-Gg: AfdE7cligsUZEeEDnMBRkMIcp9uLrZ1wONvD+fN1aE1MvtroPP/0UBpmSDyJfokV5+3
	EDQdXVwBsyBzupNCo0q/KJ6rqAtmCSdZrTWpqAn+2A+j9J37p9y6anCUv6cAT5Gv+Vl2DVRB5R0
	q47dWEKfy0fjCtr96JgvVyniDlPTaba0/e5PLHo/A3k7BxSQcINsVUaNUj5loot3VgP8CBgjZiD
	H2+DQE/CXKRrjUcyfma561uW+y7YneqlBzFXVVScSLEpOL8q9O2wklHJtdAqNt5CkOjZkcfZwAI
	6g4wLqxrzX5yD+O77C6aMT3u5IaSMovclN2GsA9Yy99ety/WtlNW5ZCjbOAIZcizlVlK/kZOvAY
	I76FisLNLsjhY7A5E6QiuhDv64kWF
X-Received: by 2002:a05:7300:4303:b0:30b:ab02:9e52 with SMTP id 5a478bee46e88-30ee13d61demr2319266eec.30.1782818934568;
        Tue, 30 Jun 2026 04:28:54 -0700 (PDT)
X-Received: by 2002:a05:7300:4303:b0:30b:ab02:9e52 with SMTP id 5a478bee46e88-30ee13d61demr2319229eec.30.1782818934035;
        Tue, 30 Jun 2026 04:28:54 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.202.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3264f52sm7541784eec.28.2026.06.30.04.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:28:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Yue Wang <yue.wang@Amlogic.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Remi Pommarel <repk@triplefau.lt>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
References: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
Subject: Re: [PATCH] PCI: dwc: meson: Fix reset GPIO initial state
Message-Id: <178281892763.291682.17352622719357029190.b4-ty@b4>
Date: Tue, 30 Jun 2026 13:28:47 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: vnHtMpa7szYKrXfaYaMtoJ-KGrxGtJOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX/PfYMiDBIokV
 pjFkXB5/XO62xZlQLacu5VxJ6XFcDt3kJwBQ7gQW8NQDVOgq1pjX4hAvpLa/o9kz7kas+kOQ1/V
 vuwZ5IxCDIBZX1mNFYEuIQrMkodMWmJFLzR+koX7PChCwBB+ou8V+v59N8rTkXkjdoKYe4jH3U7
 xFnTeh3xj2TOSrLQCXSkY/Xks/1t+2E9H/ACtCcd+VF6fS5XiNCWINqxky0uJRyalIBy1sEL4Zk
 GwXn1UaEOM0uAK+pExUukwEReWw8okdI5ElvNt1oNt9dgzNvF0x4R1BD0w5fWIG3me2b6oU86nB
 gvUE2RnOHJOnspmAPhxp8bbJrw9Zy9DvHkVX9THhoedwprRdCnFhzBUQkHAN6Ao9j6zZi70MNef
 czQksu6g9U8fCHqEonDzloRx05svDXUSs93846oYkt1/WpnaSGS0mED/tGkHvEzvfIvYSgokJC5
 fi6+OWokBLbMJiyXupQ==
X-Proofpoint-GUID: vnHtMpa7szYKrXfaYaMtoJ-KGrxGtJOd
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43a877 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=d0NiXODO0fVjScRmrPHHeg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NGquYU0cblXHf0KasdsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX2DSgkd3ocv9l
 rasPjTbRqgLAQts3fTBSFjq3svioj00V/hSq+dGFA+1OlA1svod8Zo7/+h91lQTKIIdaujL5b/Q
 agjf43K3MfEMl8jlVewkDNMurfZtb0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_042857_407079_5511EA47 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

Ck9uIFR1ZSwgMTYgSnVuIDIwMjYgMDk6MDc6MjUgKzAyMDAsIFJvbmFsZCBDbGF2ZWF1IHdyb3Rl
Ogo+IENvbW1pdCA0ZDMxODZhNTI1YjMgKCJQQ0k6IGFtbG9naWM6IEZpeCByZXNldCBhc3NlcnRp
b24gdmlhIGdwaW8KPiBkZXNjcmlwdG9yIikgaW52ZXJ0ZWQgdGhlIHJlc2V0IGFzc2VydGlvbiBs
b2dpYyB0byB1c2UgcHJvcGVyIGdwaW8KPiBkZXNjcmlwdG9yIHNlbWFudGljcywgYW5kIG1vdmVk
IHRoZSBwb2xhcml0eSBjb25maWd1cmF0aW9uIHRvIHRoZQo+IGRldmljZSB0cmVlIGFzIEdQSU9f
QUNUSVZFX0xPVy4gSG93ZXZlciwgdGhlIGluaXRpYWwgR1BJTyBzdGF0ZQo+ICJHUElPRF9PVVRf
TE9XIiB3YXMgbm90IHVwZGF0ZWQgYWNjb3JkaW5nbHkuCj4gCj4gQ2hhbmdlIEdQSU9EX09VVF9M
T1cgdG8gR1BJT0RfT1VUX0hJR0ggdG8gZ2V0IHRoZSByaWdodCBiZWhhdmlvdXIuCj4gCj4gWy4u
Ll0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIFBDSTogZHdjOiBtZXNvbjogRml4IHJlc2V0IEdQ
SU8gaW5pdGlhbCBzdGF0ZQogICAgICBjb21taXQ6IDcwMmM4OWVlYzI1YTEwOTMyYmVkMDc0Y2I5
YWRmMGZjZmNiNjY1MmMKCkJlc3QgcmVnYXJkcywKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+Cu
qeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
