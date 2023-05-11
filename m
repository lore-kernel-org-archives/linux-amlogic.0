Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9412AC7EE22
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NAC8SPleEeiCYlwS4PYKlsUd1TfkmjEeeiB/ZZ9WTU=; b=nLIn4xJe5zOnVO
	aw3VdbfDJP6u0snFNBWlToM+dU1P5legMBfZthVuRY8ndIPqLI0eXWyr1iEUSM0VwGzMkCCrZGALF
	mi1lesOsKJeBPcUY5VBHsSNtlelfbrVV/hnctrYXOx32eeTFQsZQh/qxuQHhU8rV67DCfdoi5iwPe
	yqqT+7Vo9qPbSAQZ8A6+s6g8uXJBYzBxr7iTwH8G3RorR4TdbzYyl7ReD8QpimGP/AcCaOoBOkOxN
	MF5KIUuTIMiZqDHxDBrC0kLm94MR+sKEBFkueSE0p05LHtnfnZX0L7VxoLDHIC/ckeEAZl+A/amlo
	nVJv15q8ubgBgloKUOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px7Nh-0094Qi-0k;
	Thu, 11 May 2023 14:34:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7Nd-0094OW-2O;
	Thu, 11 May 2023 14:34:55 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A21F95FD0C;
	Thu, 11 May 2023 17:34:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683815690;
	bh=4aqcbnYtmMYM6DF+qqc6A/zLY11dMjaBVIb3KYwKcAs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=kQh7e2fjBiFc9d5WuMGnXSn3GxKHauY7o11uTXLbxpXcs6JCJrA3XFTlVbb2hRDtp
	 5xLos42S2iUllEFKQmalIcwktDVcHrC8k/qZsBsAYY6pxGiaKQe0ZsQOBvt6qnprKL
	 waZDbujSSA1iAVDhslFCk8fphcFr/2u/FBB+NSTzbcAqKPdCcXqeUTC2LD30mdDyJ7
	 7Duc72ptdHtTCEkhRZNUvad2f0Iz/b0IhOT+RV9aLZ7yjpxi7UjtuHb45ELw0RAfun
	 9pys3TXsGupyv4dx/4GzGcfgZqQtBhWlxX531jZlffVO9QPhOCsQFXcEtsPDwKltWa
	 zIgYt/W3GP1YA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 17:34:50 +0300 (MSK)
Date: Thu, 11 May 2023 17:34:49 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
	<linux-amlogic@lists.infradead.org>, <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v3] pwm: meson: modify and simplify calculation in
 meson_pwm_get_state
Message-ID: <20230511143449.lcreswddwqe4c5zb@CAB-WSD-L081021>
References: <23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_073454_127523_E10974B0 
X-CRM114-Status: GOOD (  20.86  )
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

T24gVHVlLCBNYXkgMDIsIDIwMjMgYXQgMTA6MzM6NDJQTSArMDIwMCwgSGVpbmVyIEthbGx3ZWl0
IHdyb3RlOgo+IEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHdoeSB3ZSBzaG91bGQgdHJlYXQgdGhlIGNh
c2UgbG8gPCBoaSBkaWZmZXJlbnRseQo+IGFuZCByZXR1cm4gMCBhcyBwZXJpb2QgYW5kIGR1dHlf
Y3ljbGUuIFRoZSBjdXJyZW50IGxvZ2ljIHdhcyBhZGRlZCB3aXRoCj4gYzM3NWJjYmFhYmRiICgi
cHdtOiBtZXNvbjogUmVhZCB0aGUgZnVsbCBoYXJkd2FyZSBzdGF0ZSBpbgo+IG1lc29uX3B3bV9n
ZXRfc3RhdGUoKSIpLCBNYXJ0aW4gYXMgb3JpZ2luYWwgYXV0aG9yIGRvZXNuJ3QgcmVtZW1iZXIg
d2h5Cj4gaXQgd2FzIGltcGxlbWVudGVkIHRoaXMgd2F5IGJhY2sgdGhlbi4KPiBTbyBsZXQncyBo
YW5kbGUgaXQgYXMgbm9ybWFsIHVzZSBjYXNlIGFuZCBhbHNvIHJlbW92ZSB0aGUgb3B0aW1pemF0
aW9uCj4gZm9yIGxvID09IDAuIEkgdGhpbmsgdGhlIGltcHJvdmVkIHJlYWRhYmlsaXR5IGlzIHdv
cnRoIGl0Lgo+IAo+IEZpeGVzOiBjMzc1YmNiYWFiZGIgKCJwd206IG1lc29uOiBSZWFkIHRoZSBm
dWxsIGhhcmR3YXJlIHN0YXRlIGluIG1lc29uX3B3bV9nZXRfc3RhdGUoKSIpCj4gUmV2aWV3ZWQt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdl
aXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+IC0tLQo+IHYyOgo+IC0gaW1wcm92ZSBjb21taXQg
ZGVzY3JpcHRpb24KPiB2MzoKPiAtIG1ha2UgcGF0Y2ggYSBmaXgKPiAtLS0KPiAgZHJpdmVycy9w
d20vcHdtLW1lc29uLmMgfCAxNCArKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
d20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+IGluZGV4IDU3MzIzMDBl
Yi4uMzg2NTUzOGRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4gKysr
IGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiBAQCAtMzUxLDE4ICszNTEsOCBAQCBzdGF0aWMg
aW50IG1lc29uX3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdt
X2RldmljZSAqcHdtLAo+ICAJY2hhbm5lbC0+bG8gPSBGSUVMRF9HRVQoUFdNX0xPV19NQVNLLCB2
YWx1ZSk7Cj4gIAljaGFubmVsLT5oaSA9IEZJRUxEX0dFVChQV01fSElHSF9NQVNLLCB2YWx1ZSk7
Cj4gIAo+IC0JaWYgKGNoYW5uZWwtPmxvID09IDApIHsKPiAtCQlzdGF0ZS0+cGVyaW9kID0gbWVz
b25fcHdtX2NudF90b19ucyhjaGlwLCBwd20sIGNoYW5uZWwtPmhpKTsKPiAtCQlzdGF0ZS0+ZHV0
eV9jeWNsZSA9IHN0YXRlLT5wZXJpb2Q7Cj4gLQl9IGVsc2UgaWYgKGNoYW5uZWwtPmxvID49IGNo
YW5uZWwtPmhpKSB7Cj4gLQkJc3RhdGUtPnBlcmlvZCA9IG1lc29uX3B3bV9jbnRfdG9fbnMoY2hp
cCwgcHdtLAo+IC0JCQkJCQkgICAgY2hhbm5lbC0+bG8gKyBjaGFubmVsLT5oaSk7Cj4gLQkJc3Rh
dGUtPmR1dHlfY3ljbGUgPSBtZXNvbl9wd21fY250X3RvX25zKGNoaXAsIHB3bSwKPiAtCQkJCQkJ
CWNoYW5uZWwtPmhpKTsKPiAtCX0gZWxzZSB7Cj4gLQkJc3RhdGUtPnBlcmlvZCA9IDA7Cj4gLQkJ
c3RhdGUtPmR1dHlfY3ljbGUgPSAwOwo+IC0JfQo+ICsJc3RhdGUtPnBlcmlvZCA9IG1lc29uX3B3
bV9jbnRfdG9fbnMoY2hpcCwgcHdtLCBjaGFubmVsLT5sbyArIGNoYW5uZWwtPmhpKTsKPiArCXN0
YXRlLT5kdXR5X2N5Y2xlID0gbWVzb25fcHdtX2NudF90b19ucyhjaGlwLCBwd20sIGNoYW5uZWwt
PmhpKTsKPiAgCj4gIAlzdGF0ZS0+cG9sYXJpdHkgPSBQV01fUE9MQVJJVFlfTk9STUFMOwo+ICAK
PiAtLSAKPiAyLjQwLjAKClJldmlld2VkLWJ5OiBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292QHNi
ZXJkZXZpY2VzLnJ1PgoKLS0gClRoYW5rIHlvdSwKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
