Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7808FC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Oct 2022 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiLlMMwqbbVQbPZdE8JQ1uAfmBqZYnOXwBDrMkGYx2o=; b=C+ccLRIm830AlA
	YJiptl5uAzVurrajF7OfJ1TsMnonChUKRD1tYbCtOXHl39dEGSl/BXAJT5gPCv+pVHCsk/pz4In/o
	ZykjdoRE9OYDHSNhx9B1Zxek3xjQuHCBdLeB3IiqN/uZZYPXgJ4rT7WtfK4KD9VGru7YgQJgsF1WQ
	dKokQpvfwvsP7xlVEzN+P7I5Ni0MCnIR0U3E8jXG7l+TMtxsaTWXKHiaKwxhY8BNnp2+IPaTsE58E
	Trt2mhN6WA/zDa53ZfdJdIL5Q5ySWm9svIepTUssFKrNylhyGACG/AnJYbS08pcMU81bryqN4lF4H
	jn3HSleJL/hepNHBsTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofiIK-009ljF-Nm; Tue, 04 Oct 2022 13:49:12 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofiI1-009lcI-FR; Tue, 04 Oct 2022 13:48:55 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294DEEWD005780;
	Tue, 4 Oct 2022 09:48:36 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3jxfd73nfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 09:48:36 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 294DmZsK001543
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Oct 2022 09:48:35 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 4 Oct 2022
 09:48:34 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 4 Oct 2022 09:48:33 -0400
Received: from nsa.ad.analog.com ([10.44.3.52])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 294DlkVZ032663;
	Tue, 4 Oct 2022 09:48:24 -0400
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
Subject: [PATCH v2 02/16] iio: adc: axp288_adc: do not use internal iio_dev lock
Date: Tue, 4 Oct 2022 15:48:55 +0200
Message-ID: <20221004134909.1692021-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004134909.1692021-1-nuno.sa@analog.com>
References: <20221004134909.1692021-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: E-JnG3o02XEwxbSRq0iwnGdYuUSG9TBZ
X-Proofpoint-ORIG-GUID: E-JnG3o02XEwxbSRq0iwnGdYuUSG9TBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_06,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_064853_540875_56BE8203 
X-CRM114-Status: GOOD (  15.10  )
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

VGhlIGlpb19kZXZpY2UgbG9jayBpcyBvbmx5IG1lYW50IGZvciBpbnRlcm5hbCB1c2UuIEhlbmNl
IGRlZmluZSBhCmRldmljZSBsb2NhbCBsb2NrIHRvIHByb3RlY3QgYWdhaW5zdCBjb25jdXJyZW50
IGFjY2Vzc2VzLgoKV2hpbGUgYXQgaXQsIHByb3Blcmx5IGluY2x1ZGUgIm11dGV4LmgiIGZvciBt
dXRleCByZWxhdGVkIEFQSXMuCgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPgotLS0KIGRyaXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMgfCAxMCArKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvYXhw
Mjg4X2FkYy5jCmluZGV4IDU4MDM2MWJkOTg0OS4uNTM3ODEwMTBmNzg5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lpby9hZGMvYXhwMjg4X2FkYy5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9heHAyODhf
YWRjLmMKQEAgLTksNiArOSw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9kbWkuaD4KICNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgogI2luY2x1ZGUgPGxp
bnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4
L3JlZ21hcC5oPgpAQCAtNTAsNiArNTEsOCBAQCBlbnVtIGF4cDI4OF9hZGNfaWQgewogc3RydWN0
IGF4cDI4OF9hZGNfaW5mbyB7CiAJaW50IGlycTsKIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7CisJ
LyogbG9jayB0byBwcm90ZWN0IGFnYWluc3QgbXVsdGlwbGUgYWNjZXNzIHRvIHRoZSBkZXZpY2Ug
Ki8KKwlzdHJ1Y3QgbXV0ZXggbG9jazsKIAlib29sIHRzX2VuYWJsZWQ7CiB9OwogCkBAIC0xNjEs
NyArMTY0LDcgQEAgc3RhdGljIGludCBheHAyODhfYWRjX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2
ICppbmRpb19kZXYsCiAJaW50IHJldDsKIAlzdHJ1Y3QgYXhwMjg4X2FkY19pbmZvICppbmZvID0g
aWlvX3ByaXYoaW5kaW9fZGV2KTsKIAotCW11dGV4X2xvY2soJmluZGlvX2Rldi0+bWxvY2spOwor
CW11dGV4X2xvY2soJmluZm8tPmxvY2spOwogCXN3aXRjaCAobWFzaykgewogCWNhc2UgSUlPX0NI
QU5fSU5GT19SQVc6CiAJCWlmIChheHAyODhfYWRjX3NldF90cyhpbmZvLCBBWFAyODhfQURDX1RT
X0NVUlJFTlRfT05fT05ERU1BTkQsCkBAIC0xNzgsNyArMTgxLDcgQEAgc3RhdGljIGludCBheHAy
ODhfYWRjX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAJZGVmYXVsdDoKIAkJ
cmV0ID0gLUVJTlZBTDsKIAl9Ci0JbXV0ZXhfdW5sb2NrKCZpbmRpb19kZXYtPm1sb2NrKTsKKwlt
dXRleF91bmxvY2soJmluZm8tPmxvY2spOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTI2NCw2ICsy
NjcsNyBAQCBzdGF0aWMgaW50IGF4cDI4OF9hZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlpbmZvID0gaWlvX3ByaXYoaW5kaW9fZGV2
KTsKKwogCWluZm8tPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7CiAJaWYgKGluZm8t
PmlycSA8IDApCiAJCXJldHVybiBpbmZvLT5pcnE7CkBAIC0yODksNiArMjkzLDggQEAgc3RhdGlj
IGludCBheHAyODhfYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYg
KHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKKwltdXRleF9pbml0KCZpbmZvLT5sb2NrKTsKKwog
CXJldHVybiBkZXZtX2lpb19kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgaW5kaW9fZGV2KTsK
IH0KIAotLSAKMi4zNy4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
