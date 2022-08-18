Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD9FC25B0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8Px3/omBH8I0RPtwm64FxBDOSOI+xrPt0TgDRM7NC8=; b=FElKJ1dPEEVrDE
	yLIR8cGhy1nY8ZR3/P1QBNGyzjRF4Rxk+VQ7FjlAqmWk5CBOrBIyJeCdwuM/Vx5bPThjHE4xxjOOX
	Ds9tWaTYZRfb29w4J1ON8k4eFLFveqAymfWwPlebPiaGILD+8Dewn6jfBla2gLz92AF9ucN5EBklZ
	aWFLAL43UtoxjmqThpdpZ9l6fykUsvw1NQk7aJ35BlXlsG1lWwQhRcGD411VBmRYhG633oIjm5v8Z
	JmluEbcKG60FXTv3VF3VRnGR0v7LuTAsZ1zr+S7HzVMk+c1TnO9l+Ozy43facU4HJYNXE+up1ahth
	fc6ZIrnvoebzpLV3qwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZWU-00HOy7-B0; Thu, 18 Aug 2022 07:00:58 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZWR-00HOrW-Fq; Thu, 18 Aug 2022 07:00:57 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M7bM90WjFznTX6;
	Thu, 18 Aug 2022 14:58:29 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 18 Aug
 2022 15:00:40 +0800
From: Xu Qiang <xuqiang36@huawei.com>
To: <narmstrong@baylibre.com>, <mchehab@kernel.org>,
	<gregkh@linuxfoundation.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mjourdan@baylibre.com>,
	<hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-staging@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <guohanjun@huawei.com>,
	<weiyongjun1@huawei.com>, <xuqiang36@huawei.com>
Subject: [PATCH -next] media: meson: vdec: add missing clk_disable_unprepare on error in vdec_hevc_start()
Date: Thu, 18 Aug 2022 06:57:53 +0000
Message-ID: <20220818065753.104050-1-xuqiang36@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_000055_794311_4205FE9D 
X-CRM114-Status: UNSURE (   7.93  )
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

QWRkIHRoZSBtaXNzaW5nIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGJlZm9yZSByZXR1cm4KZnJv
bSB2ZGVjX2hldmNfc3RhcnQoKSBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgY2FzZS4KCkZpeGVzOiA4
MjNhNzMwMDM0MGUgKOKAnG1lZGlhOiBtZXNvbjogdmRlYzogYWRkIGNvbW1vbiBIRVZDIGRlY29k
ZXIgc3VwcG9ydOKAnSkKU2lnbmVkLW9mZi1ieTogWHUgUWlhbmcgPHh1cWlhbmczNkBodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWNfaGV2Yy5jIHwg
NiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjX2hldmMu
YyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWNfaGV2Yy5jCmluZGV4IDk1
MzBlNTgwZTU3YS4uYWZjZWQ0MzVjOTA3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVk
aWEvbWVzb24vdmRlYy92ZGVjX2hldmMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVz
b24vdmRlYy92ZGVjX2hldmMuYwpAQCAtMTY3LDggKzE2NywxMiBAQCBzdGF0aWMgaW50IHZkZWNf
aGV2Y19zdGFydChzdHJ1Y3QgYW12ZGVjX3Nlc3Npb24gKnNlc3MpCiAKIAljbGtfc2V0X3JhdGUo
Y29yZS0+dmRlY19oZXZjX2NsaywgNjY2NjY2NjY2KTsKIAlyZXQgPSBjbGtfcHJlcGFyZV9lbmFi
bGUoY29yZS0+dmRlY19oZXZjX2Nsayk7Ci0JaWYgKHJldCkKKwlpZiAocmV0KSB7CisJCWlmIChj
b3JlLT5wbGF0Zm9ybS0+cmV2aXNpb24gPT0gVkRFQ19SRVZJU0lPTl9HMTJBIHx8CisJCSAgICBj
b3JlLT5wbGF0Zm9ybS0+cmV2aXNpb24gPT0gVkRFQ19SRVZJU0lPTl9TTTEpCisJCQljbGtfZGlz
YWJsZV91bnByZXBhcmUoY29yZS0+dmRlY19oZXZjZl9jbGspOwogCQlyZXR1cm4gcmV0OworCX0K
IAogCWlmIChjb3JlLT5wbGF0Zm9ybS0+cmV2aXNpb24gPT0gVkRFQ19SRVZJU0lPTl9TTTEpCiAJ
CXJlZ21hcF91cGRhdGVfYml0cyhjb3JlLT5yZWdtYXBfYW8sIEFPX1JUSV9HRU5fUFdSX1NMRUVQ
MCwKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
