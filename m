Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044CC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Dec 2021 03:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnK3QD8Qs4kVojZVON0DLUZdaib4BUwZGNDfS2wC1kM=; b=AbwNpFiapleGw9
	eiYEfBCRlYIflisGgtFxsGoVpPPPEiUy1YH3M047dYgK6YjTlDmsJSRgpyFoHipvdCiaaFWcz32QA
	X5DSHDnp07mWH93xiWvN+4OgXBIpq0Qz7YYAqgxl/VNtcC+/YZ7NA5HT78AZ9llOUOdi+QuigLAji
	YHD5O59GD/ldFW0TWsI8JhuHwArLvua+0kWtdWXBmBQGALqKqvRvHHhzmx759rBhUOwE/Zoai9DNc
	PheSDbtt9TSuch6T8j12Jnr6cTQv7V6ezxv3JVi29CRXfItuUEA4z70xNAROpHUjuU/EAvYSLFyvZ
	Kf4c/qhqUe4uYH3guNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1Ju9-00FF3Z-8p; Sun, 26 Dec 2021 03:09:01 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Ju6-00FF39-9f; Sun, 26 Dec 2021 03:08:59 +0000
Received: from [10.28.39.104] (10.28.39.104) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sun, 26 Dec
 2021 11:08:39 +0800
Message-ID: <6d973606-b525-32fe-a6e7-411ce8f6e92a@amlogic.com>
Date: Sun, 26 Dec 2021 11:08:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] dt-bindings: reset: add bindings for the Meson-S4 SoC
 Reset Controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 <jbrunet@baylibre.com>
References: <20211217073521.35820-1-zelong.dong@amlogic.com>
 <CAFBinCA7DXG5o1yc=5HTM4R_yYMBMUPZMWvF1W++PBQabRKQvA@mail.gmail.com>
From: Zelong Dong <zelong.dong@amlogic.com>
In-Reply-To: <CAFBinCA7DXG5o1yc=5HTM4R_yYMBMUPZMWvF1W++PBQabRKQvA@mail.gmail.com>
X-Originating-IP: [10.28.39.104]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_190858_391290_902E2BE4 
X-CRM114-Status: UNSURE (   7.16  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpZZXMsIEkgd2lsbCBzdWJtaXQgCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXJlc2V0LnlhbWwgaW4gYSAKbmV3IHBhdGNoLgoKCuWc
qCAyMDIxLzEyLzI1IDA6NDYsIE1hcnRpbiBCbHVtZW5zdGluZ2wg5YaZ6YGTOgo+IFsgRVhURVJO
QUwgRU1BSUwgXQo+Cj4gSGVsbG8sCj4KPiBPbiBGcmksIERlYyAxNywgMjAyMSBhdCA4OjM1IEFN
IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+IEFkZCBEVCBi
aW5kaW5ncyBmb3IgdGhlIE1lc29uLVM0IFNvQyBSZXNldCBDb250cm9sbGVyIGluY2x1ZGUgZmls
ZS4KPiBBcmUgeW91IGFsc28gcGxhbm5pbmcgdG8gYWRkIGEgbmV3IGNvbXBhdGlibGUgc3RyaW5n
IHRvCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVz
b24tcmVzZXQueWFtbCBmb3IKPiB0aGUgTWVzb24tUzQgU29DIGFzIHdlbGw/Cj4gV2UgZG8gaGF2
ZSBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHRoZSBBMSBTb0MgaW4gdGhlcmUgYXMgd2VsbCAoanVz
dCB0bwo+IG5hbWUgYW4gZXhhbXBsZSkuCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KPgo+
IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
