Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917B8ECAAD8
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Sep 2022 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4E5PW2Mmj3UOPY1nIJe5e6HN5uz1/Nk4wv9gQydJuO0=; b=DbGKTUhsuafqdA
	Lx4C3Fu+6Y9ZVswlj95rh0+CXYfjLraelUpcbdwqBPqANohY+V2cdkXw3Cye3n0LGTESCHJfeg3Ny
	m3w1sp8wn9Fbue7tLAcVC1prmlf96IoGxzH6tgDCHNflyOeQWU1u9wI0e+/G+/fQZXdrpezBTrzJL
	/wxGj4j69XyqePMnAuOifnooO+PDVPRmA+VCKaMptWyWdHtMavHszffxg+DumL13+MVO1ZfQlzvEg
	pKg/jBoa7oSf5NRsdz1st0f9MSDMwpYo9T1j4dapnC6CF7338Fpa1TvBMjPoAw0FTEcmXFYRRTfl8
	1ArD99a6inm8P15MsXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabSt-003Jy3-B3; Tue, 20 Sep 2022 11:30:59 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabQP-003IGW-M6; Tue, 20 Sep 2022 11:28:27 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K8LaGi025082;
	Tue, 20 Sep 2022 07:28:10 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3jpn468r2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 07:28:10 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 28KBS9kn062512
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Sep 2022 07:28:09 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 20 Sep
 2022 07:28:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 20 Sep 2022 07:28:08 -0400
Received: from nsa.ad.analog.com ([10.44.3.57])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 28KBR4US021723;
	Tue, 20 Sep 2022 07:27:58 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-imx@nxp.com>,
        <linux-iio@vger.kernel.org>
CC: Chunyan Zhang <zhang.lyra@gmail.com>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Cixi Geng <cixi.geng1@unisoc.com>, Kevin Hilman <khilman@baylibre.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Fabio
 Estevam <festevam@gmail.com>,
        Andriy Tryshnivskyy
	<andriy.tryshnivskyy@opensynergy.com>,
        Haibo Chen <haibo.chen@nxp.com>, Shawn
 Guo <shawnguo@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Heiko
 Stuebner <heiko@sntech.de>,
        Florian Boor <florian.boor@kernelconcepts.de>,
        Ciprian Regus <ciprian.regus@analog.com>,
        Lars-Peter Clausen
	<lars@metafoo.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan
 Cameron <jic23@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Baolin
 Wang <baolin.wang@linux.alibaba.com>,
        Jyoti Bhayana <jbhayana@google.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Chen-Yu Tsai
	<wens@csie.org>, Orson Zhai <orsonzhai@gmail.com>
Subject: [PATCH 06/15] iio: adc: ltc2947-core: do not use internal iio_dev lock
Date: Tue, 20 Sep 2022 13:28:12 +0200
Message-ID: <20220920112821.975359-7-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920112821.975359-1-nuno.sa@analog.com>
References: <20220920112821.975359-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: WQZ4trr9O3xvg2FSPexkhMZrbogw66H0
X-Proofpoint-GUID: WQZ4trr9O3xvg2FSPexkhMZrbogw66H0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_02,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_042825_781263_76EC6AE3 
X-CRM114-Status: GOOD (  15.55  )
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
IGFjY2Vzc2VzLgoKU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4K
LS0tCiBkcml2ZXJzL2lpby9hZGMvbHRjMjQ5Ny1jb3JlLmMgfCA3ICsrKysrLS0KIGRyaXZlcnMv
aWlvL2FkYy9sdGMyNDk3LmggICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9sdGMy
NDk3LWNvcmUuYyBiL2RyaXZlcnMvaWlvL2FkYy9sdGMyNDk3LWNvcmUuYwppbmRleCBmNTJkMzdh
ZjRkMWYuLjAwNTM2NTAxZGM1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2x0YzI0OTct
Y29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9sdGMyNDk3LWNvcmUuYwpAQCAtMTAsNiArMTAs
NyBAQAogI2luY2x1ZGUgPGxpbnV4L2lpby9paW8uaD4KICNpbmNsdWRlIDxsaW51eC9paW8vZHJp
dmVyLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvbXV0ZXgu
aD4KICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KIAogI2luY2x1ZGUgImx0
YzI0OTcuaCIKQEAgLTgxLDkgKzgyLDkgQEAgc3RhdGljIGludCBsdGMyNDk3Y29yZV9yZWFkX3Jh
dyhzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAogCiAJc3dpdGNoIChtYXNrKSB7CiAJY2FzZSBJ
SU9fQ0hBTl9JTkZPX1JBVzoKLQkJbXV0ZXhfbG9jaygmaW5kaW9fZGV2LT5tbG9jayk7CisJCW11
dGV4X2xvY2soJmRkYXRhLT5sb2NrKTsKIAkJcmV0ID0gbHRjMjQ5N2NvcmVfcmVhZChkZGF0YSwg
Y2hhbi0+YWRkcmVzcywgdmFsKTsKLQkJbXV0ZXhfdW5sb2NrKCZpbmRpb19kZXYtPm1sb2NrKTsK
KwkJbXV0ZXhfdW5sb2NrKCZkZGF0YS0+bG9jayk7CiAJCWlmIChyZXQgPCAwKQogCQkJcmV0dXJu
IHJldDsKIApAQCAtMTY5LDYgKzE3MCw4IEBAIGludCBsdGMyNDk3Y29yZV9wcm9iZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAJc3RydWN0IGx0YzI0OTdj
b3JlX2RyaXZlcmRhdGEgKmRkYXRhID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKIAlpbnQgcmV0Owog
CisJbXV0ZXhfaW5pdCgmZGRhdGEtPmxvY2spOworCiAJLyoKIAkgKiBLZWVwIHVzaW5nIGRldl9u
YW1lKCkgZm9yIHRoZSBpaW9fZGV2J3MgbmFtZSBvbiBzb21lIG9mIHRoZSBwYXJ0cywKIAkgKiBz
aW5jZSB1cGRhdGluZyBpdCB3b3VsZCByZXN1bHQgaW4gYSBBQkkgYnJlYWthZ2UuCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lpby9hZGMvbHRjMjQ5Ny5oIGIvZHJpdmVycy9paW8vYWRjL2x0YzI0OTcu
aAppbmRleCBlMDIzZGUwZDg4YzQuLjc4MTUxOWI1MjQ3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9p
aW8vYWRjL2x0YzI0OTcuaAorKysgYi9kcml2ZXJzL2lpby9hZGMvbHRjMjQ5Ny5oCkBAIC0xMiw2
ICsxMiw4IEBAIHN0cnVjdCBsdGMyNDk3X2NoaXBfaW5mbyB7CiBzdHJ1Y3QgbHRjMjQ5N2NvcmVf
ZHJpdmVyZGF0YSB7CiAJc3RydWN0IHJlZ3VsYXRvciAqcmVmOwogCWt0aW1lX3QJdGltZV9wcmV2
OworCS8qIGxvY2sgdG8gcHJvdGVjdCBhZ2FpbnN0IG11bHRpcGxlIGFjY2VzcyB0byB0aGUgZGV2
aWNlICovCisJc3RydWN0IG11dGV4IGxvY2s7CiAJY29uc3Qgc3RydWN0IGx0YzI0OTdfY2hpcF9p
bmZvCSpjaGlwX2luZm87CiAJdTggYWRkcl9wcmV2OwogCWludCAoKnJlc3VsdF9hbmRfbWVhc3Vy
ZSkoc3RydWN0IGx0YzI0OTdjb3JlX2RyaXZlcmRhdGEgKmRkYXRhLAotLSAKMi4zNy4zCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
