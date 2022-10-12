Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E88C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Oct 2022 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOtOuRI/L57MHP8zm9aCQuScnowOPaehf1zigritOic=; b=cAGgurUkCV/HA1
	RrZWBUMhZ/cq50g9rk6kxSEbM987MYcvir9QsYWI6CS/BCOtMn7pGZe+MaKPVC8IQa+4BRHcmj54w
	RlrbSS5pxW6LtDZNotLu8SJPexYZm8GASsCFIhufog0iixAyyUBDuzZyuEz0/WyDoOPChCzcZmtD6
	pufN6J4DyGrhGL264/wZuoX1zkyiGOUJA3nCmq+B2MpP/qyr7ieVWkcZnDRCy4S+hi6ca+JN3pe9d
	vJJFMmYX/6c4JLieEgKxyZsKs4yR/meO+58Pdz65xedIiTdKSkXLJ5PgrZTysgndY5NzfHW2RkbXt
	X+Kj9+QYGJUfa6HSv4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidTQ-008UuM-AU; Wed, 12 Oct 2022 15:16:44 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidSp-008UbH-8S; Wed, 12 Oct 2022 15:16:10 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CDvmWI010798;
	Wed, 12 Oct 2022 11:15:51 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3k3325xu4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 11:15:51 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 29CFFogr049242
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Oct 2022 11:15:50 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 12 Oct
 2022 11:15:49 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 12 Oct 2022 11:15:49 -0400
Received: from nsa.ad.analog.com ([10.44.3.62])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 29CFEune022095;
	Wed, 12 Oct 2022 11:15:39 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-imx@nxp.com>
CC: Chen-Yu Tsai <wens@csie.org>,
        Andriy Tryshnivskyy
	<andriy.tryshnivskyy@opensynergy.com>,
        Ciprian Regus
	<ciprian.regus@analog.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Cixi Geng
	<cixi.geng1@unisoc.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Miquel
 Raynal <miquel.raynal@bootlin.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Nuno=20S=C3=A1?=
	<nuno.sa@analog.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jerome Brunet
	<jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Hans de
 Goede <hdegoede@redhat.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Haibo Chen
	<haibo.chen@nxp.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Jyoti Bhayana
	<jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko
	<andy.shevchenko@gmail.com>,
        Florian Boor <florian.boor@kernelconcepts.de>,
        Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Shawn
 Guo <shawnguo@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 3/4] iio: health: max30102: do not use internal iio_dev lock
Date: Wed, 12 Oct 2022 17:16:19 +0200
Message-ID: <20221012151620.1725215-4-nuno.sa@analog.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221012151620.1725215-1-nuno.sa@analog.com>
References: <20221012151620.1725215-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: a56Xv0rjtvFVayxQI_MPNd_DYA726jsv
X-Proofpoint-ORIG-GUID: a56Xv0rjtvFVayxQI_MPNd_DYA726jsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_081607_375317_A2156665 
X-CRM114-Status: GOOD (  18.37  )
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

VGhlIHBhdHRlcm4gdXNlZCBpbiB0aGlzIGRldmljZSBkb2VzIG5vdCBxdWl0ZSBmaXQgaW4gdGhl
Cmlpb19kZXZpY2VfY2xhaW1fZGlyZWN0X21vZGUoKSB0eXBpY2FsIHVzYWdlLiBJbiB0aGlzIGNh
c2UsIHdlIHdhbnQgdG8Ka25vdyBpZiB3ZSBhcmUgaW4gYnVmZmVyZWQgbW9kZSBvciBub3QgdG8g
a25vdyBpZiB0aGUgZGV2aWNlIGlzIHBvd2VyZWQKKGJ1ZmZlciBtb2RlKSBvciBub3QuIEFuZCBk
ZXBlbmRpbmcgb24gdGhhdCBtYXgzMDEwMl9nZXRfdGVtcCgpIHdpbGwKcG93ZXIgb24gdGhlIGRl
dmljZSBpZiBuZWVkZWQuIEhlbmNlLCBpbiBvcmRlciB0byBrZWVwIHRoZSBzYW1lCmZ1bmN0aW9u
YWxpdHksIHdlIHRyeSB0bzoKCjEuIENsYWltIEJ1ZmZlcmVkIG1vZGU7CjI6IElmIDEpIHN1Y2Nl
ZWRzIGNhbGwgbWF4MzAxMDJfZ2V0X3RlbXAoKSB3aXRob3V0IHBvd2VyaW5nIG9uIHRoZQogICBk
ZXZpY2U7CjM6IFJlbGVhc2UgQnVmZmVyZWQgbW9kZTsKNDogSWYgMSkgZmFpbHMsIENsYWltIERp
cmVjdCBtb2RlOwo1OiBJZiA0KSBzdWNjZWVkcyBjYWxsIG1heDMwMTAyX2dldF90ZW1wKCkgd2l0
aCBwb3dlcmluZyBvbiB0aGUgZGV2aWNlOwo2OiBSZWxlYXNlIERpcmVjdCBtb2RlOwo3OiBJZiA0
KSBmYWlscywgZ290byB0byAxKSBhbmQgdHJ5IGFnYWluLgoKVGhpcyBkYW5jZSBiZXR3ZWVuIGJ1
ZmZlcmVkIGFuZCBkaXJlY3QgbW9kZSBpcyBub3QgcGFydGljdWxhcmx5IHByZXR0eQooYXMgd2Vs
bCBhcyB0aGUgbG9vcCBpbnRyb2R1Y2VkIGJ5IHRoZSBnb3RvIHN0YXRlbWVudCkgYnV0IGl0IGRv
ZXMgYWxsb3cKdXMgdG8gZ2V0IHJpZCBvZiB0aGUgbWxvY2sgdXNhZ2Ugd2hpbGUga2VlcGluZyB0
aGUgc2FtZSBiZWhhdmlvci4KClNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+Ci0tLQogZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAyLmMgfCAxOSArKysrKysrKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9oZWFsdGgvbWF4MzAxMDIuYyBiL2RyaXZlcnMv
aWlvL2hlYWx0aC9tYXgzMDEwMi5jCmluZGV4IDQzNzI5OGEyOWYyZC4uNjZkZjRhYWEzMWE3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2lpby9oZWFsdGgvbWF4MzAxMDIuYworKysgYi9kcml2ZXJzL2lp
by9oZWFsdGgvbWF4MzAxMDIuYwpAQCAtNDc3LDEyICs0NzcsMjMgQEAgc3RhdGljIGludCBtYXgz
MDEwMl9yZWFkX3JhdyhzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAogCQkgKiBUZW1wZXJhdHVy
ZSByZWFkaW5nIGNhbiBvbmx5IGJlIGFjcXVpcmVkIHdoZW4gbm90IGluCiAJCSAqIHNodXRkb3du
OyBsZWF2ZSBzaHV0ZG93biBicmllZmx5IHdoZW4gYnVmZmVyIG5vdCBydW5uaW5nCiAJCSAqLwot
CQltdXRleF9sb2NrKCZpbmRpb19kZXYtPm1sb2NrKTsKLQkJaWYgKCFpaW9fYnVmZmVyX2VuYWJs
ZWQoaW5kaW9fZGV2KSkKK2FueV9tb2RlX3JldHJ5OgorCQlpZiAoaWlvX2RldmljZV9jbGFpbV9i
dWZmZXJfbW9kZShpbmRpb19kZXYpKSB7CisJCQkvKgorCQkJICogVGhpcyBvbmUgaXMgYSAqYml0
KiBoYWNreS4gSWYgd2UgY2Fubm90IGNsYWltIGJ1ZmZlcgorCQkJICogbW9kZSwgdGhlbiB0cnkg
ZGlyZWN0IG1vZGUgc28gdGhhdCB3ZSBtYWtlIHN1cmUKKwkJCSAqIHRoaW5ncyBjYW5ub3QgY29u
Y3VycmVudGx5IGNoYW5nZS4gQW5kIHdlIGp1c3Qga2VlcAorCQkJICogdHJ5aW5nIHVudGlsIHdl
IGdldCBvbmUgb2YgdGhlIG1vZGVzLi4uCisJCQkgKi8KKwkJCWlmIChpaW9fZGV2aWNlX2NsYWlt
X2RpcmVjdF9tb2RlKGluZGlvX2RldikpCisJCQkJZ290byBhbnlfbW9kZV9yZXRyeTsKKwogCQkJ
cmV0ID0gbWF4MzAxMDJfZ2V0X3RlbXAoZGF0YSwgdmFsLCB0cnVlKTsKLQkJZWxzZQorCQkJaWlv
X2RldmljZV9yZWxlYXNlX2RpcmVjdF9tb2RlKGluZGlvX2Rldik7CisJCX0gZWxzZSB7CiAJCQly
ZXQgPSBtYXgzMDEwMl9nZXRfdGVtcChkYXRhLCB2YWwsIGZhbHNlKTsKLQkJbXV0ZXhfdW5sb2Nr
KCZpbmRpb19kZXYtPm1sb2NrKTsKKwkJCWlpb19kZXZpY2VfcmVsZWFzZV9idWZmZXJfbW9kZShp
bmRpb19kZXYpOworCQl9CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0tIAoyLjM4LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
