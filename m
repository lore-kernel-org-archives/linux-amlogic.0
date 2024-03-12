Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC2C54E5D
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sDCXiLkX3UQ5LpT+PAQ9r7YyWlLPoOPZo4eZJhlluM=; b=zRzesSRa88uygD
	2rEic/A9pMmHv0I1MjVrrlYgX/wz4ntRSfiYSLTxsRw7J+5/o+ptHrk4nzzJDTv1oSwFjDLvOsVQS
	dlFANuMqH5u/J5gLChz45ibgikiOFFQkNiF+GPvLLKxdrdRhwkWWZYb04YZl8p4wKFJyodrnm5FlW
	aBzaf2dbK6eEU/aIqhhj6vTZWYamCBhNnGL/TG1JReblY3CLmaikYfhBof1wT09izP/iDxx4Mlb0N
	S6O6bqTzvh8wgelXziN+0SRiUXWvbV0/XBO9vZ5Yi1UyL/5qQN0z5TrX7qH+dyOSCMQDC5jD+eO3V
	B3JvAqS9JmLJWX2Bw9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4kT-00000006XnS-1tH3;
	Tue, 12 Mar 2024 16:13:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4kP-00000006Xm9-3puo;
	Tue, 12 Mar 2024 16:13:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CDK4Xx023716;
	Tue, 12 Mar 2024 16:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jFeOfqofpER02Z0W5dJuJpJa9a9anKP1f9O1bGqjJMY=; b=Ek
	Pp1FMb9TvCDqEaWHo5ap2AkjMtbnuOsZWJp4CnhKpRFqWveniZPH0+6VPp1U+XNP
	NGvRTIoQxJ23Ys/zQojnxVcRzIH7Qckgo405506I8+ihLC4xKUJxsrU4cJorZUsI
	3mDqsahVooQa0b8IPhdyIxg45ZguMtgW7WcWeUB7mM8qEY9+7JbIDLoicL+i3ihw
	jCGAIDFqUo80HNO4hqfhfhDG3gsP59jf3Q3MUiP3NR5ZTXMha+m382/3kMNRTmql
	FHvSvN7sHpdTGso9K+nVNfg2OdU4/cK0r9UaNNAQkUOQNnVH2W/tnUqwQ0qxp99t
	F/iqZI/RRT3tfx9T8YjQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtgc3hdhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 16:12:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CGCvWC004990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 16:12:57 GMT
Received: from [10.216.60.182] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 09:12:53 -0700
Message-ID: <792e956f-eefb-3d2b-ada2-0eaa175ba81e@quicinc.com>
Date: Tue, 12 Mar 2024 21:42:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] nvmem: meson-mx-efuse: Remove nvmem_device from efuse
 struct
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <srinivas.kandagatla@linaro.org>, <neil.armstrong@linaro.org>,
        <khilman@baylibre.com>, <jbrunet@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1709621888-3173-1-git-send-email-quic_mojha@quicinc.com>
 <CAFBinCC2n+Muu2qaAG0PWFj6f+bVFDtHnzm78jSpeodTD47TOg@mail.gmail.com>
Content-Language: en-US
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <CAFBinCC2n+Muu2qaAG0PWFj6f+bVFDtHnzm78jSpeodTD47TOg@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GfegUGf7_eY_C748SFCEi1-9w7RLtqJz
X-Proofpoint-GUID: GfegUGf7_eY_C748SFCEi1-9w7RLtqJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_10,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_091301_983305_8BF1E2B5 
X-CRM114-Status: GOOD (  14.34  )
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

SGkgTWFydGluLAoKT24gMy84LzIwMjQgMjoyNiBBTSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPiBIZWxsbyBNdWtlc2gsCj4gCj4gT24gVHVlLCBNYXIgNSwgMjAyNCBhdCA3OjU44oCvQU0g
TXVrZXNoIE9qaGEgPHF1aWNfbW9qaGFAcXVpY2luYy5jb20+IHdyb3RlOgo+Pgo+PiBudm1lbV9k
ZXZpY2UgaXMgdXNlZCBhdCBvbmUgcGxhY2Ugd2hpbGUgcmVnaXN0ZXJpbmcgbnZtZW0KPj4gZGV2
aWNlIGFuZCBpdCBpcyBub3QgcmVxdWlyZWQgdG8gYmUgcHJlc2VudCBpbiBlZnVzZSBzdHJ1Y3QK
Pj4gZm9yIGp1c3QgdGhpcyBwdXJwb3NlLgo+Pgo+PiBEcm9wIG52bWVtX2RldmljZSBhbmQgbWFu
YWdlIHdpdGggbnZtZW0gZGV2aWNlIHN0YWNrIHZhcmlhYmxlLgo+IEknbSBnZW5lcmFsbHkgZmlu
ZSB3aXRoIHRoaXMgYXBwcm9hY2gKClRoYW5rcy4KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCB3
YXMgb24gdmFjYXRpb24uCgo+IAo+IFsuLi5dCj4+IEBAIC0yMjMsOSArMjIyLDkgQEAgc3RhdGlj
IGludCBtZXNvbl9teF9lZnVzZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
PiAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGVmdXNlLT5jb3JlX2Nsayk7Cj4+ICAg
ICAgICAgIH0KPj4KPj4gLSAgICAgICBlZnVzZS0+bnZtZW0gPSBkZXZtX252bWVtX3JlZ2lzdGVy
KCZwZGV2LT5kZXYsICZlZnVzZS0+Y29uZmlnKTsKPj4gKyAgICAgICBudm1lbSA9IGRldm1fbnZt
ZW1fcmVnaXN0ZXIoJnBkZXYtPmRldiwgJmVmdXNlLT5jb25maWcpOwo+IEJ1dCB0aGlzIGRvZXNu
J3QgY29tcGlsZSBmb3IgbWU6Cj4gICAgQ0MgICAgICBkcml2ZXJzL252bWVtL21lc29uLW14LWVm
dXNlLm8KPiAuLi9kcml2ZXJzL252bWVtL21lc29uLW14LWVmdXNlLmM6IEluIGZ1bmN0aW9uICdt
ZXNvbl9teF9lZnVzZV9wcm9iZSc6Cj4gLi4vZHJpdmVycy9udm1lbS9tZXNvbi1teC1lZnVzZS5j
OjI1Mjo5OiBlcnJvcjogJ252bWVtJyB1bmRlY2xhcmVkCj4gKGZpcnN0IHVzZSBpbiB0aGlzIGZ1
bmN0aW9uKQo+ICAgMjUyIHwgICAgICAgICBudm1lbSA9IGRldm1fbnZtZW1fcmVnaXN0ZXIoJnBk
ZXYtPmRldiwgJmVmdXNlLT5jb25maWcpOwoKU2VudCB0b28gc29vbi4sIGNoYW5nZSB3YXMgY2Fj
aGVkIG5ldmVyIGdvdCBjb21taXRlZC4uCgp2MjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8xNzEwMjU5NjYzLTE0MDk1LTEtZ2l0LXNlbmQtZW1haWwtcXVpY19tb2poYUBxdWljaW5jLmNv
bS8KClRoYW5rcywKLU11a2VzaAoKPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
