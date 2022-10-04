Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46465C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Oct 2022 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5J44HXcPQr/JfNaJzW8WLKcgVkB/CPg96VnIlUxHMw=; b=0U5hdR1kMOZ8Rm
	7/JxMQeNjwTQm3pK9q1x92hNLTA28e74EGWN/7z6qGgW3mTdyOHEh49ssVI5n5X1Murms+PaZ5FXv
	ahhQLkEg8BK+I9p+5yB5avNG+r1Ob31555i8VViaAIA/BI5fQnnF3FIIgyVj7ttvCIi8tKuYqZFRG
	lw8zOfV4afGGEp/fVCg8qi2mfd79BmILQWAOaeexLirYVHgUeWk6PAnt0eMPA+5SrBDhKjngOl9Wm
	2PjfvD4/PDRJ/whaRBuRkCIlluhdefkG57VX70yYcv8YaMS1TmD0311p0ARjmCkmZMxDSAuKj3vcA
	a4bWgPML8GVQpl7TjSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofiPE-009pkC-Tn; Tue, 04 Oct 2022 13:56:20 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofiJ1-009mFS-Ny; Tue, 04 Oct 2022 13:49:58 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294AJj0u005490;
	Tue, 4 Oct 2022 09:49:41 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3jxfd73npd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 09:49:40 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 294Dnbfl004154
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Oct 2022 09:49:37 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 4 Oct 2022
 09:49:36 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 4 Oct 2022 09:49:36 -0400
Received: from nsa.ad.analog.com ([10.44.3.52])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 294DlkVm032663;
	Tue, 4 Oct 2022 09:49:26 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-amlogic@lists.infradead.org>, <linux-imx@nxp.com>,
        <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
CC: Heiko Stuebner <heiko@sntech.de>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Neil Armstrong
	<narmstrong@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>,
        Jyoti Bhayana <jbhayana@google.com>,
        Hans de Goede
	<hdegoede@redhat.com>,
        Andriy Tryshnivskyy
	<andriy.tryshnivskyy@opensynergy.com>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Cixi Geng
	<cixi.geng1@unisoc.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Ciprian
 Regus <ciprian.regus@analog.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Florian
 Boor <florian.boor@kernelconcepts.de>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Orson Zhai <orsonzhai@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Vladimir
 Zapolskiy <vz@mleia.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jerome
 Brunet <jbrunet@baylibre.com>, Haibo Chen <haibo.chen@nxp.com>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 15/16] iio: health: max30102: do not use internal iio_dev lock
Date: Tue, 4 Oct 2022 15:49:08 +0200
Message-ID: <20221004134909.1692021-16-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004134909.1692021-1-nuno.sa@analog.com>
References: <20221004134909.1692021-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: BdA7PqR-1AFDPhNVn-a5yd_q2TeJAau0
X-Proofpoint-ORIG-GUID: BdA7PqR-1AFDPhNVn-a5yd_q2TeJAau0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_06,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_064955_837458_205A69ED 
X-CRM114-Status: GOOD (  18.29  )
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
aWlvL2hlYWx0aC9tYXgzMDEwMi5jCmluZGV4IGFiYmNlZjU2MzgwNy4uYjhiNWNjZjU4MmZiIDEw
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
bmRpb19kZXYpOworCQl9CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0tIAoyLjM3LjMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
