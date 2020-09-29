Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E18C47420
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 18:13:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FA421548
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 18:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zAsbbwh3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJjs+GRA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FA421548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=me27/I26/HtUI3VyS+VsNrReNDZJ3SHHHjZF5/8Wm0A=; b=zAsbbwh3QVlvCdLeivDmdgbSi
	h2Te0YN1zT2U6ElRTC7ELl2AU8M23TyeYw1EOcyG2nl9Ct7+/wwByzcZGeXZBukPth0S+/XhIGk9q
	qAKmYr/hPs9BY+CZIpSsk0w3wqGr0hUp+cWKxlJALU1kEF3/PhYton0DoK5nwL14l+uQXpzsbp+Tz
	HfxeV8iu4MDbalsqFDe0+8xWG1xZgL/RoS2hmongZE8CXmHGXeHzFephz7mtfkJcA2aXceeq5mi0Y
	bBb/aPRdUkrRZLfl0Hd+W1DrMcwOl4H6Kv/bPFApF00S3Icfh+xEqT+rHvfDwShW0kWDSo5ROhZu6
	td3h9PXDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNK7a-0001pX-N2; Tue, 29 Sep 2020 18:13:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNK7Y-0001oZ-Ks; Tue, 29 Sep 2020 18:13:01 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61130208B8;
 Tue, 29 Sep 2020 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601403179;
 bh=KbbIptFu2by3ZEgiSoxO0ItV258aPMBQ8QGyKLlZVN4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RJjs+GRAdQMy1SObha2G7D1UaBcQCAAyaTf8WgvCvreuOJYCdRhPfgljfewCRMqNa
 fgTvFA+0dGumXNIblpNRfptGGEAht5GxmMN852H1TK4YPcCUSphboNBwtzPzAVnGzS
 +GpbuSl9ZZMwew3iyJxm0lXQg8HDC9Hx7S1EK6Fw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kNK7V-00FxpD-8M; Tue, 29 Sep 2020 19:12:57 +0100
MIME-Version: 1.0
Date: Tue, 29 Sep 2020 19:12:57 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
In-Reply-To: <6ead62a5-6ad5-bde8-a5df-93c0f8029f65@nvidia.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
 <20200929184851.22682ff1@xhacker.debian>
 <8e06a370-a37a-5f33-b43b-2830adb31b3e@nvidia.com>
 <d4a6eea3c5e33a3a4056885419df95a7@kernel.org>
 <6ead62a5-6ad5-bde8-a5df-93c0f8029f65@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <5f4947b18bf381615a37aa81c2242477@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, Jisheng.Zhang@synaptics.com,
 hayashi.kunihiko@socionext.com, narmstrong@baylibre.com,
 linux-pci@vger.kernel.org, wangbinghui@hisilicon.com,
 bjorn.andersson@linaro.org, yamada.masahiro@socionext.com,
 thierry.reding@gmail.com, linux-arm-kernel@axis.com, vidyas@nvidia.com,
 festevam@gmail.com, jbrunet@baylibre.com, robh@kernel.org,
 jesper.nilsson@axis.com, lorenzo.pieralisi@arm.com, khilman@baylibre.com,
 pratyush.anand@gmail.com, linux-tegra@vger.kernel.org, krzk@kernel.org,
 kishon@ti.com, kgene@kernel.org, linux-imx@nxp.com, songxiaowei@hisilicon.com,
 hongxing.zhu@nxp.com, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, yue.wang@amlogic.com,
 linux-samsung-soc@vger.kernel.org, bhelgaas@google.com,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com, agross@kernel.org,
 linux-kernel@vger.kernel.org, svarbanov@mm-sol.com, kernel@pengutroni
 x.de, gustavo.pimentel@synopsys.com, shawnguo@kernel.org,
 l.stach@pengutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_141300_877739_376ACD32 
X-CRM114-Status: GOOD (  20.51  )
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-arm-kernel@axis.com, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@amlogic.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wOS0yOSAxOTowMiwgSm9uIEh1bnRlciB3cm90ZToKPiBPbiAyOS8wOS8yMDIwIDE4
OjI1LCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4+IE9uIDIwMjAtMDktMjkgMTQ6MjIsIEpvbiBIdW50
ZXIgd3JvdGU6Cj4+PiBIaSBKaXNoZW5nLAo+Pj4gCj4+PiBPbiAyOS8wOS8yMDIwIDExOjQ4LCBK
aXNoZW5nIFpoYW5nIHdyb3RlOgo+Pj4+IEhpIEpvbiwKPj4+PiAKPj4+PiBPbiBGcmksIDI1IFNl
cCAyMDIwIDA5OjUzOjQ1ICswMTAwIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Pj4gCj4+Pj4+IAo+Pj4+
PiBPbiAyNC8wOS8yMDIwIDEyOjA1LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+Pj4+Pj4gSW1wcm92
ZSB0aGUgbXNpIGNvZGU6Cj4+Pj4+PiAxLiBBZGQgcHJvcGVyIGVycm9yIGhhbmRsaW5nLgo+Pj4+
Pj4gMi4gTW92ZSBkd19wY2llX21zaV9pbml0KCkgZnJvbSBlYWNoIHVzZXJzIHRvIGRlc2lnbndh
cmUgaG9zdCB0byAKPj4+Pj4+IHNvbHZlCj4+Pj4+PiBtc2kgcGFnZSBsZWFrYWdlIGluIHJlc3Vt
ZSBwYXRoLgo+Pj4+PiAKPj4+Pj4gQXBvbG9naWVzIGlmIHRoaXMgaXMgc2xpZ2h0bHkgb2ZmIHRv
cGljLCBidXQgSSBoYXZlIGJlZW4gbWVhbmluZyB0byAKPj4+Pj4gYXNrCj4+Pj4+IGFib3V0IE1T
SXMgYW5kIFBDSS4gT24gVGVncmExOTQgd2hpY2ggdXNlcyB0aGUgRFdDIFBDSSBkcml2ZXIsCj4+
Pj4+IHdoZW5ldmVyIHdlCj4+Pj4+IGhvdHBsdWcgQ1BVcyB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3
YXJuaW5ncyAuLi4KPj4+Pj4gCj4+Pj4+IMKgW8KgwqDCoMKgwqAgNzkuMDY4MzUxXSBXQVJOSU5H
IEtFUk4gSVJRNzA6IHNldCBhZmZpbml0eSBmYWlsZWQoLTIyKS4KPj4+Pj4gwqBbwqDCoMKgwqDC
oCA3OS4wNjgzNjJdIFdBUk5JTkcgS0VSTiBJUlE3MTogc2V0IGFmZmluaXR5IGZhaWxlZCgtMjIp
Lgo+Pj4+PiAKPj4+PiAKPj4+PiBJIHRyaWVkIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlIG9uIFN5
bmFwdGljcyBTb0MsIGJ1dCBjYW4ndCAKPj4+PiByZXByb2R1Y2UKPj4+PiBpdC4KPj4+PiBQZXIg
bXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgY29kZSBpbiBrZXJuZWwvaXJxL2NwdWhvdHBsdWcuYywg
dGhpcwo+Pj4+IHdhcm5pbmcKPj4+PiBoYXBwZW5lZCB3aGVuIHdlIG1pZ3JhdGUgaXJxcyBhd2F5
IGZyb20gdGhlIG9mZmxpbmUgY3B1LCB0aGlzIAo+Pj4+IGltcGxpY2l0bHkKPj4+PiBpbXBsaWVz
IHRoYXQgYmVmb3JlIHRoaXMgcG9pbnQgdGhlIGlycSBoYXMgYmluZCB0byB0aGUgb2ZmbGluZSBj
cHUsCj4+Pj4gYnV0IGhvdwo+Pj4+IGNvdWxkIHRoaXMgaGFwcGVuIGdpdmVuIGN1cnJlbnQgZHdf
cGNpX21zaV9zZXRfYWZmaW5pdHkoKSAKPj4+PiBpbXBsZW1lbnRhdGlvbgo+Pj4+IGFsd2F5cyBy
ZXR1cm4gLUVJTlZBTAo+Pj4gCj4+PiBCeSBkZWZhdWx0IHRoZSBzbXBfYWZmaW5pdHkgc2hvdWxk
IGJlIHNldCBzbyB0aGF0IGFsbCBDUFVzIGNhbiBiZQo+Pj4gaW50ZXJydXB0ZWQgLi4uCj4+PiAK
Pj4+ICQgY2F0IC9wcm9jL2lycS83MC9zbXBfYWZmaW5pdHkKPj4+IDB4ZmYKPj4+IAo+Pj4gSW4g
bXkgY2FzZSB0aGVyZSBhcmUgOCBDUFVzIGFuZCBzbyAweGZmIGltcGxpZXMgdGhhdCB0aGUgaW50
ZXJydXB0IAo+Pj4gY2FuCj4+PiBiZSB0cmlnZ2VyZWQgb24gYW55IG9mIHRoZSA4IENQVXMuCj4+
PiAKPj4+IERvIHlvdSBzZWUgdGhlIHNldF9hZmZpbml0eSBjYWxsYmFjayBiZWluZyBjYWxsZWQg
Zm9yIHRoZSBEV0MgaXJxY2hpcCAKPj4+IGluCj4+PiBtaWdyYXRlX29uZV9pcnEoKT8KPj4gCj4+
IFRoZSBwcm9ibGVtIGlzIGNvbW1vbiB0byBhbGwgTVNJIGltcGxlbWVudGF0aW9ucyB0aGF0IGVu
ZCB1cCBtdXhpbmcKPj4gYWxsIHRoZSBlbmQtcG9pbnQgTVNJcyBpbnRvIGEgc2luZ2xlIGludGVy
cnVwdC4gV2l0aCB0aGVzZSBzeXN0ZW1zLAo+PiB5b3UgY2Fubm90IHNldCB0aGUgYWZmaW5pdHkg
b2YgaW5kaXZpZHVhbCBNU0lzICh0aGV5IGRvbid0IHRhcmdldCBhCj4+IENQVSwgdGhleSB0YXJn
ZXQgYW5vdGhlciBpbnRlcnJ1cHQuLi4gYnJhaW5kZWFkKS4gT25seSB0aGUgbXV4Cj4+IGludGVy
cnVwdCBjYW4gaGF2ZSBpdHMgYWZmaW5pdHkgY2hhbmdlZC4KPj4gCj4+IFNvIHJldHVybmluZyAt
RUlOVkFMIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KPiAKPiBSaWdodCwgc28gaWYgdGhhdCBp
cyB0aGUgY2FzZSwgdGhlbiBzdXJlbHkgdGhlcmUgc2hvdWxkIGJlIHNvbWUgd2F5IHRvCj4gYXZv
aWQgdGhlc2Ugd2FybmluZ3MgYmVjYXVzZSB0aGV5IGFyZSBub3QgcmVsZXZhbnQ/CgpJIGRvbid0
IHRoaW5rIHRoZXJlIGlzIGEgd2F5IHRvIGRvIHRoaXMsIGJlY2F1c2UgdGhlIGNvcmUgY29kZQpk
b2Vzbid0IChhbmQgY2Fubm90KSBrbm93IHRoZSBleGFjdCBpbnRlcnJ1cHQgdG9wb2xvZ3kuCgpU
aGUgb25seSBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBjaGFuZ2UgdGhlIGFmZmluaXR5IG9mIHRo
ZSBtdXgKaW50ZXJydXB0IHdoZW4gYSBNU0kgYWZmaW5pdHkgY2hhbmdlcywgYnV0IHRoYXQgdGVu
ZHMgdG8gYnJlYWsKdXNlcnNwYWNlIChpcnFiYWxhbmNlLCBmb3IgZXhhbXBsZSkuCgogICAgICAg
ICBNLgotLSAKSmF6eiBpcyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuLi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
