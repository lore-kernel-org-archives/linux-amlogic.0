Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CC3C77B77
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7SufBkpbP0QIFDffVIthAhusLCHLtJj+c28piIRRkA=; b=SU/u5R6LhfwxTb
	A5jKOeMqAcsoSToOOMnJWhZ2nyiQ2FEqfnnVRbf/9xmtBF4VfLYuDpI4Xmtb1/GusBgBOBQ4VqyuP
	DFGSJvBzlXKlytLMWLDEBvuEoY6aoW+jS38GYUa49ldTSAkUAsMSzsOd/C0lOSp68RXI04m8jHhNj
	bkkmg6R05/f2FotpUj9t/kDU4uigglgbRqEoA6PB1TNALqmBeSTygjorvbRsaFxaMvBBolFceNF2m
	59YxW/4EmJraWVRIJJ8mFudxQEOc4iUWDE9vFkvHK9Y00HtL3J4ocxggRj9IXpnoV2gGdRit+6vUO
	QZ06+zVxGaf3WHPD82eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNzc-00G99b-0C;
	Mon, 17 Apr 2023 12:30:00 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNzZ-00G991-0S;
	Mon, 17 Apr 2023 12:29:58 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id B6A735FD1F;
	Mon, 17 Apr 2023 15:29:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681734594;
	bh=jvK4cXeO8Jj4+6kMoLy/DP4MK+U8SvFogPOaVUzPgzM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=eDdQtACxFXEqW9lv0/TbVuemLFGr05aN/2rtSitOukENevq2YpZU1eJIDGIUzC3op
	 IpM60h1IZiEXMQsxT+Lype5cB1mZa2XUi7KJBeTaUltlibH1bZmx9qPU+yR54J0Nv2
	 gHeV002pL93tMlt6tfVHZPlsXqxDyhDcrrOTooj2H1bU+pOdjNDCl9PJbN2pF1hf7U
	 Df7myAOXL2YSMclFwSiu3k2Zy7VTy6xO5aTH3NhaHqSE+ydMDNx42kww5CgHFVbf60
	 kTSRCd10xUeAsFYOboT8GI9umuSD9aXbt7yNaVsr9qWokp1G2cROb58jVVwW3czh5D
	 lj2Qe3T++gS9A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 17 Apr 2023 15:29:53 +0300 (MSK)
Date: Mon, 17 Apr 2023 15:29:52 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <mturquette@baylibre.com>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <hminas@synopsys.com>, <Thinh.Nguyen@synopsys.com>,
	<yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>
Subject: Re: [PATCH v1 4/5] usb: dwc3-meson-g12a: support OTG switch
Message-ID: <20230417122952.s6ag2mtc7exdbr4n@CAB-WSD-L081021>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
 <20230414152423.19842-5-ddrokosov@sberdevices.ru>
 <CAFBinCDyUBWd-V0mDy_edzH=3JM5SAuX=vtT4MG9Fb62Rcv=mA@mail.gmail.com>
 <20230417114739.r7aoiodqybalbn4o@CAB-WSD-L081021>
 <3381d124-1049-16da-bcdb-1cbbec379154@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3381d124-1049-16da-bcdb-1cbbec379154@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/17 09:07:00 #21118574
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_052957_358344_EEB5421B 
X-CRM114-Status: GOOD (  22.43  )
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

SGVsbG8gTmVpbCwKClRoYW5rIHlvdSBmb3IgcmV2aWV3LCBhcHByZWNpYXRlIGl0IQoKT24gTW9u
LCBBcHIgMTcsIDIwMjMgYXQgMDI6MjI6MjZQTSArMDIwMCwgbmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZyB3cm90ZToKPiBPbiAxNy8wNC8yMDIzIDEzOjQ3LCBEbWl0cnkgUm9rb3NvdiB3cm90ZToK
PiA+IEhlbGxvIE1hcnRpbiwKPiA+IAo+ID4gVGhhbmsgeW91IGZvciBxdWljayByZXZpZXcsIGFw
cHJlY2lhdGUgaXQhCj4gPiBQbGVhc2UgZmluZCBteSBjb21tZW50cyBiZWxvdyBhbmQgaW4gdGhl
IG90aGVyIHJlcGxpZXMuCj4gPiAKPiA+IE9uIFN1biwgQXByIDE2LCAyMDIzIGF0IDEwOjU2OjM2
UE0gKzAyMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgQXByIDE0
LCAyMDIzIGF0IDU6MjTigK9QTSBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292QHNiZXJkZXZpY2Vz
LnJ1PiB3cm90ZToKPiA+ID4gWy4uLl0KPiA+ID4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdj
M19tZXNvbl9nMTJhX2RydmRhdGEgYTFfZHJ2ZGF0YSA9IHsKPiA+ID4gPiAtICAgICAgIC5vdGdf
c3dpdGNoX3N1cHBvcnRlZCA9IGZhbHNlLAo+ID4gPiA+ICsgICAgICAgLm90Z19zd2l0Y2hfc3Vw
cG9ydGVkID0gdHJ1ZSwKPiA+ID4gaXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIGFsc28g
Zm9sbG93IHVwIHdpdGggYSBwYXRjaCB0aGF0Cj4gPiA+IHJlbW92ZXMgb3RnX3N3aXRjaF9zdXBw
b3J0ZWQuCj4gPiA+IEExIHdhcyB0aGUgb25seSB2YXJpYW50IHRoYXQgbmVlZGVkIGl0IGFuZCBh
ZnRlciB0aGlzIHBhdGNoIGl0J3MganVzdCBkZWFkIGNvZGUuCj4gPiAKPiA+IEl0IG1ha2VzIHNl
bnNlLiBJIHRob3VnaHQgYWJvdXQgaXQgYmVmb3JlIHNlbmRpbmcgdGhlIGZpcnN0IHZlcnNpb24s
IGJ1dAo+ID4gSSBmb3VuZCBhIGNvdW50ZXItYXJndW1lbnQ6IGZ1dHVyZSBTb0NzIG1heSB1c2Ug
dGhpcyBwYXJhbWV0ZXIuCj4gPiBCdXQgaWYgeW91IGFzaywgSSB3aWxsIHJlbW92ZSAnb3RnX3N3
aXRjaF9zdXBwb3J0ZWQnIGluIHRoZSBuZXh0IHZlcnNpb24KPiA+IAo+IAo+IFBsZWFzZSByZW1v
dmUgaXQsIGl0J3MgZWFzeSB0byBhZGQgaXQgYWdhaW4gaWYgbmVlZGVkLgoKU3VyZSwgbm8gcHJv
YmxlbS4gSXQgd2lsbCBiZSByZW1vdmVkIGluIHRoZSBuZXh0IHZlcnNpb24uCgotLSAKVGhhbmsg
eW91LApEbWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
