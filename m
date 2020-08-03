Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDABFC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 14:55:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6D820775
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 14:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MY4My2AH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="js72JAn2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B6D820775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=L4iD0gYvyzd5F6gRud2NWjVFJ9FY4cc6irMlRqmoAaA=; b=MY4My2AHkZJLulew/0KYNO6zM
	B4kThKy6vmVfLbRH2jCcI0edoBTLRGv62xsl9pdwSnEDVR3pHwpYyGYcHEMpr8jLGm8cLJDIaCkN+
	m38+pDkHqNjK3mT9uTbVDuLaRU/GNmRSdXln/iENAWyngGSy/zg9HHUmYxQ1VBTScl/ILj1KYmcC0
	qkmCYpHAEmr0evjNYC0TSSr2sXY+Qop4qeTx0PzAIWMo5oFe+0JBtrmPNnSIZgza+61S9hVauhTlk
	rRrwhBg3M6nvx1DX+XUSL9GxYb96bRxPgvNn+b9BzAAy6kj9cM3cXb1jsPgvxZ1eAZff1mAeZfQPI
	yv4b11hXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2brt-0006Fg-IT; Mon, 03 Aug 2020 14:55:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2brq-0006F8-Mt; Mon, 03 Aug 2020 14:55:11 +0000
Received: from localhost (mobile-166-175-186-42.mycingular.net
 [166.175.186.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 941822076C;
 Mon,  3 Aug 2020 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596466509;
 bh=qjp447E1FdrQ1VZ023mmW0i+s+n2xlSEVcNx6++grCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=js72JAn2bH2xSm+hYcTQJGVkYXneeZJu3WaUZn6z6vYSOzv7YKwhBYVr6t9avSQXt
 qU1B6g/sav0/hQvP8lshLpuLg09vHpm0tBm1iPdgP8Oy8IOEVvOnZHpFaz1vJf+fWC
 OM3gS2l2KadBq5i7cExyeKjGHeiEM+cd7lXZK83k=
Date: Mon, 3 Aug 2020 09:55:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH 00/10] Remove surplus dev_err() when handing an error
 from platform_get_irq()
Message-ID: <20200803145508.GA332368@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803020151.GA291575@bjorn-Precision-5520>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_105510_893576_7A30F35F 
X-CRM114-Status: GOOD (  21.96  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>, Binghui Wang <wangbinghui@hisilicon.com>,
 linux-arm-kernel@axis.com, linux-tegra@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBdWcgMDIsIDIwMjAgYXQgMDk6MDE6NTFQTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBTdW4sIEF1ZyAwMiwgMjAyMCBhdCAwMjoyNTo1MlBNICswMDAwLCBLcnp5c3p0
b2YgV2lsY3p5xYRza2kgd3JvdGU6Cj4gPiBBdCB0aGUgbW9tZW50IGEgbG90IG9mIGVycm9yIGhh
bmRsaW5nIGNvZGUgd291bGQgcHJpbnQgYSBkdXBsaWNhdGVkCj4gPiBlcnJvciBtZXNzYWdlIHNo
b3VsZCBlaXRoZXIgdGhlIHBsYXRmb3JtX2dldF9pcnEoKSBvcgo+ID4gcGxhdGZvcm1fZ2V0X2ly
cV9ieW5hbWUoKSBmdW5jdGlvbiBmYWlscyB0byBvYnRhaW4gYW4gSVJRIGZvciBhIGRldmljZS4K
PiA+IAo+ID4gVGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsIHRoZSBkZXZfZXJyKCkgZnVuY3Rpb24g
ZGlyZWN0bHkgdG8gcHJpbnQKPiA+IGEgY3VzdG9tIG1lc3NhZ2Ugd2hlbiBoYW5kbGluZyBhbiBl
cnJvciBmcm9tIGVpdGhlciBvZiB0aGVzZSBmdW5jdGlvbnMKPiA+IGFzIGJvdGggYXJlIGdvaW5n
IHRvIGRpc3BsYXkgYW4gYXBwcm9wcmlhdGUgZXJyb3IgbWVzc2FnZSBpbiBjYXNlIG9mCj4gPiBh
IGZhaWx1cmUuCj4gPiAKPiA+IFRoaXMgc2VyaWVzIGFpbXMgdG8gcmVtb3ZlIHN1cnBsdXMgY2Fs
bCB0byBkZXZfZXJyKCkgd2hlbiBoYW5kaW5nIGFuCj4gPiBlcnJvciBvcmlnaW5hdGluZyBmcm9t
IGVpdGhlciBwbGF0Zm9ybV9nZXRfaXJxKCkgb3IKPiA+IHBsYXRmb3JtX2dldF9pcnFfYnluYW1l
KCkgZnVuY3Rpb24gYXMgcGVyIHN1Z2dlc3Rpb24gZnJvbSBDb2NjaW5lbGxlLgo+ID4gCj4gPiBS
ZWxhdGVkIGNvbW1pdHMgYXJlIGNvbW1pdCA3NzIzZjRjNWVjZGIgKCJkcml2ZXIgY29yZTogcGxh
dGZvcm06IEFkZCBhbgo+ID4gZXJyb3IgbWVzc2FnZSB0byBwbGF0Zm9ybV9nZXRfaXJxKigpIikg
YW5kIGNvbW1pdCA5ODA1MWJhMmIyOGIKPiA+ICgiY29jY2luZWxsZTogQWRkIHNjcmlwdCB0byBj
aGVjayBmb3IgcGxhdGZvcm1fZ2V0X2lycSgpIGV4Y2Vzc2l2ZQo+ID4gcHJpbnRzIikuCj4gPiAK
PiA+IEtyenlzenRvZiBXaWxjennFhHNraSAoMTApOgo+ID4gICBQQ0k6IGR3YzogUmVtb3ZlIGRl
dl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQo+ID4gICAgIHBsYXRmb3JtX2dldF9p
cnEoKQo+ID4gICBQQ0k6IG1vYml2ZWlsOiBSZW1vdmUgZGV2X2VycigpIHdoZW4gaGFuZGluZyBh
biBlcnJvciBmcm9tCj4gPiAgICAgcGxhdGZvcm1fZ2V0X2lycSgpCj4gPiAgIFBDSTogdGVncmE6
IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBoYW5kaW5nIGFuIGVycm9yIGZyb20KPiA+ICAgICBwbGF0
Zm9ybV9nZXRfaXJxKCkKPiA+ICAgUENJOiBhbHRlcmE6IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBo
YW5kaW5nIGFuIGVycm9yIGZyb20KPiA+ICAgICBwbGF0Zm9ybV9nZXRfaXJxKCkKPiA+ICAgUENJ
OiBob3N0LWdlbmVyaWM6IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBoYW5kaW5nIGFuIGVycm9yIGZy
b20KPiA+ICAgICBwbGF0Zm9ybV9nZXRfaXJxKCkKPiA+ICAgUENJOiB2My1zZW1pOiBSZW1vdmUg
ZGV2X2VycigpIHdoZW4gaGFuZGluZyBhbiBlcnJvciBmcm9tCj4gPiAgICAgcGxhdGZvcm1fZ2V0
X2lycSgpCj4gPiAgIFBDSTogYWx0ZXJhLW1zaTogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRp
bmcgYW4gZXJyb3IgZnJvbQo+ID4gICAgIHBsYXRmb3JtX2dldF9pcnEoKQo+ID4gICBQQ0k6IHhn
ZW5lLW1zaTogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQo+ID4g
ICAgIHBsYXRmb3JtX2dldF9pcnEoKQo+ID4gICBQQ0k6IHJvY2tjaGlwOiBSZW1vdmUgZGV2X2Vy
cigpIHdoZW4gaGFuZGluZyBhbiBlcnJvciBmcm9tCj4gPiAgICAgcGxhdGZvcm1fZ2V0X2lycSgp
Cj4gPiAgIFBDSTogeGlsaW54LW53bDogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4g
ZXJyb3IgZnJvbQo+ID4gICAgIHBsYXRmb3JtX2dldF9pcnEoKQo+ID4gCj4gPiAgZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpLWRyYTd4eC5jICAgICAgICAgICAgICB8ICA4ICsrLS0tLS0t
Cj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWV4eW5vcy5jICAgICAgICAgICAg
ICB8ICA5ICsrKy0tLS0tLQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2
LmMgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWtleXN0b25lLmMgICAgICAgICAgICB8ICA0ICstLS0KPiA+ICBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ID4gIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtYXJtYWRhOGsuYyAgICAgICAgICAgfCAgNCAr
LS0tCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1hcnRwZWM2LmMgICAgICAg
ICAgICB8ICA0ICstLS0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3Ri
LmMgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUta2lyaW4uYyAgICAgICAgICAgICAgfCAgNSArLS0tLQo+ID4gIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtc3BlYXIxM3h4LmMgICAgICAgICAgfCAgNSArKy0tLQo+ID4gIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYyAgICAgICAgICAgfCAgNCAr
LS0tCj4gPiAgLi4uL3BjaS9jb250cm9sbGVyL21vYml2ZWlsL3BjaWUtbGF5ZXJzY2FwZS1nZW40
LmMgICB8ICA1ICsrLS0tCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9tb2JpdmVpbC9wY2ll
LW1vYml2ZWlsLWhvc3QuYyB8ICA0ICstLS0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aS10ZWdyYS5jICAgICAgICAgICAgICAgICAgIHwgIDggKystLS0tLS0KPiA+ICBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL3BjaS12My1zZW1pLmMgICAgICAgICAgICAgICAgIHwgIDUgKystLS0KPiA+
ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS14Z2VuZS1tc2kuYyAgICAgICAgICAgICAgIHwg
IDIgLS0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtYWx0ZXJhLW1zaS5jICAgICAg
ICAgICAgIHwgIDEgLQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1hbHRlcmEuYyAg
ICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ll
LXJvY2tjaGlwLWhvc3QuYyAgICAgICAgICB8IDEyICsrKy0tLS0tLS0tLQo+ID4gIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvcGNpZS10YW5nby5jICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4g
PiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXhpbGlueC1ud2wuYyAgICAgICAgICAgICB8
IDExICsrLS0tLS0tLS0tCj4gPiAgMjEgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwg
ODIgZGVsZXRpb25zKC0pCj4gCj4gSSBzcXVhc2hlZCB0aGVzZSB0b2dldGhlciBhbmQgYXBwbGll
ZCB0aGVtIHRvIHBjaS9pcnEtZXJyb3IgZm9yIHY1LjksCj4gdGhhbmtzIQo+IAo+IFRoZSBjb3Zl
ciBsZXR0ZXIgY2xhaW1zIHRoZXJlIHNob3VsZCBiZSAxMCBwYXRjaGVzLCBidXQgSSBvbmx5IGdv
dCA5Lgo+IEp1c3QgRllJLgoKSSBwaWNrZWQgdXAgYW5kIGFwcGxpZWQgMTAvMTAgYXMgd2VsbC4g
IEFuZCBhZGRlZCBKZXNwZXIgJiBMZXkgRm9vbidzCnJldmlld2VkLWJ5IGFuZCBhY2tlZC1ieS4g
IFRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
