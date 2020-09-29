Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5276C4346E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 05:25:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC7120BED
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 05:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZKwYEdsA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u9RTZSY0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FC7120BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hoMJjgWLyQD1e5xqnbHHG71wEwQCCMQ0QZo3pWD48Bo=; b=ZKwYEdsAXqJHodOegzFCyJTX+
	CGp4SOYYt8T1lsC4awr7ggJai3Q2iaeteXzElbooO93RDg1d/ejwAgG4fz09yiUgu47m0fFDKdOzr
	4pZiz4WhuW8dYdIwV2RzUpYHNSjO5CsnQCnl6Foc+Jp8gbXyG4o9YtVmZnNAHBEtUI9gTiOV8IqBw
	AKCDRxrxG5i1dsbfbCFm3GBcs+U6qpSX/hZ44QznT18BVDbGur2gG6FmEQu74KffCCfwJGYJtiEzE
	smbWpq0zGGbvhT6xfyGEEwJklnmTXEiroKK1JSGpeuHkFXl+cxiF602PSqoTzvCjt2jpi+ZWtjWfO
	p1x/XEcug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN88C-0001Jo-VF; Tue, 29 Sep 2020 05:24:52 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN888-0001IJ-24; Tue, 29 Sep 2020 05:24:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08T5NNdV076112;
 Tue, 29 Sep 2020 00:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601357003;
 bh=lsVV+WiqwympooMTHM7zY4Y8lKNeYX3fBUBfCVJ/Lnk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=u9RTZSY0p8VY3yd+DO/wPxiDmHvgLQOv/9YyP5Bfl/tblOAubCsvONbhwUbgLjdbZ
 /cKGeAx5m0FGThnxI/nhlD7bUNB6726QeZ1KmtFTV+0GoBh7x9Bqi8kn2kw+XnRSJ+
 /r1DJzmnQoK8W/Xv9PAXZUBvtkpZnJ/GFO0hybSw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08T5NNpG047481
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 00:23:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 00:23:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 00:23:22 -0500
Received: from [10.250.232.147] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08T5NAKG078844;
 Tue, 29 Sep 2020 00:23:11 -0500
Subject: Re: [PATCH v2 00/40] PCI: dwc: Driver clean-ups
To: Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
 <20200915091218.28737-1-michael@walle.cc>
 <CAL_JsqLHBPduSjs1L3R2vbsLygJNDzajt4XThAkRG0DEu-GnAA@mail.gmail.com>
 <346b694e43b1b6b86e4f3164e6589d25@walle.cc>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <6b776dda-e575-74f0-5575-0e5d30641522@ti.com>
Date: Tue, 29 Sep 2020 10:53:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <346b694e43b1b6b86e4f3164e6589d25@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_012448_231221_6A85AA5D 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 Wangbinghui <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 "Gross, Andy" <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Song Xiaowei <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Yue Wang <yue.wang@amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, Kukjin Kim <kgene@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxNi8wOS8yMCAxOjI0IHBtLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjAt
MDktMTYgMDA6MDIsIHNjaHJpZWIgUm9iIEhlcnJpbmc6Cj4+IENhbiB5b3UgdHJ5IHRoaXM/IFRo
ZSBsaW5rIHVwIGNoZWNrIHNlZW1lZCB1bm5lY2Vzc2FyeSBhcyBpdCBpcyByYWN5Lgo+PiBXaGF0
IGhhcHBlbnMgaWYgdGhlIGxpbmsgZ29lcyBkb3duIHJpZ2h0IGFmdGVyIGNoZWNraW5nPyBUaGF0
J3MgdGhlCj4+IG9ubHkgdGhpbmcgaW4gdGhlIGNoYW5nZSB0aGF0IHN0aWNrcyBvdXQuCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUt
aG9zdC5jCj4+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhv
c3QuYwo+PiBpbmRleCAzMTdmZjUxMmY4ZGYuLmFmZWUxYTBlODg4MyAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYwo+PiArKysg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jCj4+IEBA
IC00NDEsNiArNDQxLDkgQEAgc3RhdGljIHZvaWQgX19pb21lbQo+PiAqZHdfcGNpZV9vdGhlcl9j
b25mX21hcF9idXMoc3RydWN0IHBjaV9idXMgKmJ1cywKPj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHBjaWVfcG9ydCAqcHAgPSBidXMtPnN5c2RhdGE7Cj4+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBk
d19wY2llICpwY2kgPSB0b19kd19wY2llX2Zyb21fcHAocHApOwo+Pgo+PiArwqDCoMKgwqDCoMKg
IGlmICghZHdfcGNpZV9saW5rX3VwKHBjaSkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBOVUxMOwo+PiArCj4+IMKgwqDCoMKgwqDCoMKgIGJ1c2RldiA9IFBDSUVfQVRV
X0JVUyhidXMtPm51bWJlcikgfAo+PiBQQ0lFX0FUVV9ERVYoUENJX1NMT1QoZGV2Zm4pKSB8Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBDSUVfQVRVX0ZVTkMoUENJX0ZVTkMo
ZGV2Zm4pKTsKPiAKPiBUaGlzIHdpbGwgZml4IHRoZSBpc3N1ZS4KClRoaXMgZml4IGlzIHJlcXVp
cmVkIHRvIGdldCBEUkE3IEVWTSBib290aW5nIGFnYWluIGluIGxpbnV4LW5leHQuCgpUaGFua3MK
S2lzaG9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
