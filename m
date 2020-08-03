Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74594C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 02:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F70206F6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 02:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEU74ilq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyW5nORS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F70206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iGPG5hR4Y6rYFG47EzrXHArP2exvI6C43ydO0d9KNJ0=; b=VEU74ilqihSJbmzw9h6TGywI+
	JiAQM0E1kTJBTiE9LJ++wzm6eZ7DZUR00Ql8XJ2SSGpfLwppcv3TrP+BBjgINN1UueV6JROE87SXV
	FTEN6xlmA2N2wuc9h5WPYY6VBsoWPfzQSDuPUsZQH5fv1lyBIXJQNkYC1EfPRwEUNA7Nm7vLe52Vn
	2Uwpj6zM7dtP1I0q9IwdSkJqvALtZYdKiLDj7NssMDFJP02Jzyo8X0i/DCCT0Pn9Xot7SjG0kW2xj
	pQdDWEt/p4R+uhlxr7e5vRyz6V/32f1kM4QT+q7vkT6uNSpLoCHF32GqkkmCrRKWDKV+Xvz9jAIF3
	+4XjIRnJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Pna-0007oW-Oz; Mon, 03 Aug 2020 02:01:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2PnX-0007nc-Fi; Mon, 03 Aug 2020 02:01:56 +0000
Received: from localhost (mobile-166-175-186-42.mycingular.net
 [166.175.186.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFC3E206F6;
 Mon,  3 Aug 2020 02:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596420113;
 bh=csMPgTESK/931j1qG9MTrwDhZCVihaWAMQqTAqfKW5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nyW5nORSo5AtXim4lBz+2DzUBjRfuE320k9hfbNcGttTulZKBCWQoOXThtYwq7rjm
 +NaG3GTmr6LRKqkBym0sSCMo1r7L1VApW8ABtHbKv/yrrUTQHXn0QhEP38Hrcd876z
 DFuz1+WsHOhnHgx+wZ7POJRqpoNccEWEgoInOQKU=
Date: Sun, 2 Aug 2020 21:01:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH 00/10] Remove surplus dev_err() when handing an error
 from platform_get_irq()
Message-ID: <20200803020151.GA291575@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_220155_748016_8A314D6E 
X-CRM114-Status: GOOD (  18.29  )
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

T24gU3VuLCBBdWcgMDIsIDIwMjAgYXQgMDI6MjU6NTJQTSArMDAwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQgYSBsb3Qgb2YgZXJyb3IgaGFuZGxpbmcgY29k
ZSB3b3VsZCBwcmludCBhIGR1cGxpY2F0ZWQKPiBlcnJvciBtZXNzYWdlIHNob3VsZCBlaXRoZXIg
dGhlIHBsYXRmb3JtX2dldF9pcnEoKSBvcgo+IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKCkgZnVu
Y3Rpb24gZmFpbHMgdG8gb2J0YWluIGFuIElSUSBmb3IgYSBkZXZpY2UuCj4gCj4gVGhlcmUgaXMg
bm8gbmVlZCB0byBjYWxsIHRoZSBkZXZfZXJyKCkgZnVuY3Rpb24gZGlyZWN0bHkgdG8gcHJpbnQK
PiBhIGN1c3RvbSBtZXNzYWdlIHdoZW4gaGFuZGxpbmcgYW4gZXJyb3IgZnJvbSBlaXRoZXIgb2Yg
dGhlc2UgZnVuY3Rpb25zCj4gYXMgYm90aCBhcmUgZ29pbmcgdG8gZGlzcGxheSBhbiBhcHByb3By
aWF0ZSBlcnJvciBtZXNzYWdlIGluIGNhc2Ugb2YKPiBhIGZhaWx1cmUuCj4gCj4gVGhpcyBzZXJp
ZXMgYWltcyB0byByZW1vdmUgc3VycGx1cyBjYWxsIHRvIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcg
YW4KPiBlcnJvciBvcmlnaW5hdGluZyBmcm9tIGVpdGhlciBwbGF0Zm9ybV9nZXRfaXJxKCkgb3IK
PiBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZSgpIGZ1bmN0aW9uIGFzIHBlciBzdWdnZXN0aW9uIGZy
b20gQ29jY2luZWxsZS4KPiAKPiBSZWxhdGVkIGNvbW1pdHMgYXJlIGNvbW1pdCA3NzIzZjRjNWVj
ZGIgKCJkcml2ZXIgY29yZTogcGxhdGZvcm06IEFkZCBhbgo+IGVycm9yIG1lc3NhZ2UgdG8gcGxh
dGZvcm1fZ2V0X2lycSooKSIpIGFuZCBjb21taXQgOTgwNTFiYTJiMjhiCj4gKCJjb2NjaW5lbGxl
OiBBZGQgc2NyaXB0IHRvIGNoZWNrIGZvciBwbGF0Zm9ybV9nZXRfaXJxKCkgZXhjZXNzaXZlCj4g
cHJpbnRzIikuCj4gCj4gS3J6eXN6dG9mIFdpbGN6ecWEc2tpICgxMCk6Cj4gICBQQ0k6IGR3Yzog
UmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQo+ICAgICBwbGF0Zm9y
bV9nZXRfaXJxKCkKPiAgIFBDSTogbW9iaXZlaWw6IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBoYW5k
aW5nIGFuIGVycm9yIGZyb20KPiAgICAgcGxhdGZvcm1fZ2V0X2lycSgpCj4gICBQQ0k6IHRlZ3Jh
OiBSZW1vdmUgZGV2X2VycigpIHdoZW4gaGFuZGluZyBhbiBlcnJvciBmcm9tCj4gICAgIHBsYXRm
b3JtX2dldF9pcnEoKQo+ICAgUENJOiBhbHRlcmE6IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBoYW5k
aW5nIGFuIGVycm9yIGZyb20KPiAgICAgcGxhdGZvcm1fZ2V0X2lycSgpCj4gICBQQ0k6IGhvc3Qt
Z2VuZXJpYzogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQo+ICAg
ICBwbGF0Zm9ybV9nZXRfaXJxKCkKPiAgIFBDSTogdjMtc2VtaTogUmVtb3ZlIGRldl9lcnIoKSB3
aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQo+ICAgICBwbGF0Zm9ybV9nZXRfaXJxKCkKPiAgIFBD
STogYWx0ZXJhLW1zaTogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJv
bQo+ICAgICBwbGF0Zm9ybV9nZXRfaXJxKCkKPiAgIFBDSTogeGdlbmUtbXNpOiBSZW1vdmUgZGV2
X2VycigpIHdoZW4gaGFuZGluZyBhbiBlcnJvciBmcm9tCj4gICAgIHBsYXRmb3JtX2dldF9pcnEo
KQo+ICAgUENJOiByb2NrY2hpcDogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJy
b3IgZnJvbQo+ICAgICBwbGF0Zm9ybV9nZXRfaXJxKCkKPiAgIFBDSTogeGlsaW54LW53bDogUmVt
b3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQo+ICAgICBwbGF0Zm9ybV9n
ZXRfaXJxKCkKPiAKPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWRyYTd4eC5jICAg
ICAgICAgICAgICB8ICA4ICsrLS0tLS0tCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aS1leHlub3MuYyAgICAgICAgICAgICAgfCAgOSArKystLS0tLS0KPiAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpLWlteDYuYyAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMgICAgICAgICAgICB8ICA0ICstLS0K
PiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMgICAgICAgICAgICAgICB8
ICA0ICstLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1hcm1hZGE4ay5jICAg
ICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1hcnRw
ZWM2LmMgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1oaXN0Yi5jICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1raXJpbi5jICAgICAgICAgICAgICB8ICA1ICstLS0tCj4gIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3BlYXIxM3h4LmMgICAgICAgICAgfCAgNSArKy0tLQo+
ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMgICAgICAgICAgIHwg
IDQgKy0tLQo+ICAuLi4vcGNpL2NvbnRyb2xsZXIvbW9iaXZlaWwvcGNpZS1sYXllcnNjYXBlLWdl
bjQuYyAgIHwgIDUgKystLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9tb2JpdmVpbC9wY2ll
LW1vYml2ZWlsLWhvc3QuYyB8ICA0ICstLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kt
dGVncmEuYyAgICAgICAgICAgICAgICAgICB8ICA4ICsrLS0tLS0tCj4gIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpLXYzLXNlbWkuYyAgICAgICAgICAgICAgICAgfCAgNSArKy0tLQo+ICBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaS14Z2VuZS1tc2kuYyAgICAgICAgICAgICAgIHwgIDIgLS0K
PiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFsdGVyYS1tc2kuYyAgICAgICAgICAgICB8
ICAxIC0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFsdGVyYS5jICAgICAgICAgICAg
ICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhv
c3QuYyAgICAgICAgICB8IDEyICsrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUtdGFuZ28uYyAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaWUteGlsaW54LW53bC5jICAgICAgICAgICAgIHwgMTEgKystLS0tLS0tLS0K
PiAgMjEgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgODIgZGVsZXRpb25zKC0pCgpJ
IHNxdWFzaGVkIHRoZXNlIHRvZ2V0aGVyIGFuZCBhcHBsaWVkIHRoZW0gdG8gcGNpL2lycS1lcnJv
ciBmb3IgdjUuOSwKdGhhbmtzIQoKVGhlIGNvdmVyIGxldHRlciBjbGFpbXMgdGhlcmUgc2hvdWxk
IGJlIDEwIHBhdGNoZXMsIGJ1dCBJIG9ubHkgZ290IDkuCkp1c3QgRllJLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
