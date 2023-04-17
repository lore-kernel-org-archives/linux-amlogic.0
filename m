Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A01BC77B70
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3LlsRoCcdl18vy8i2ByQxqaLmdaHTEWffH5OautpI0=; b=26E29SprpfI2MC
	72xevGxbwhMWfMOXB2TJDBlj5bC3KUQSQwXFpc3FJ3OuPhzRDYrOYWJzCe1J2Bktd9of96HICqLJ3
	aIG3lW1wYJJq5HuHTi9VD51Ly6+SDUx1xxl8qbFNKyQNtSqsNrnluYKhSIqv8omdw5eN659M8MZ3k
	hIvMmTZBvi9c6FARDHbwqUA+ob2t9JZ22jPjHP05ORiBpktUKC+7oFospjhx1FtgoTxdDKHCOdIBR
	CbOU0z2IbPRelJAAkxI9UFVPNUdizp9ZEIs0OJa/B8BZiMePlPyNmHIsZT1T/iYPQSqeD5s6IVnu0
	JBZa+CAsQXod/W5JLjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNKt-00G2Kg-1M;
	Mon, 17 Apr 2023 11:47:55 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNKn-00G2IF-1O;
	Mon, 17 Apr 2023 11:47:53 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 18A545FD28;
	Mon, 17 Apr 2023 14:47:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681732061;
	bh=UFOQ7zl15XBdCKDP1PBa7gWSCuhGytq2kMbaG0PLdoc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=l3oCzl5MJATaLtjposS07ZcWREmdW4Z4JqkdE5ALl7zbPpEgBtFlhtj8kWx6ooy7O
	 IasWd1VK1kgPIueM2Od6VLJWmA7IvsvEaZ/z/AA8uMBCcJKV4ZpmYKXKmgdrXcSZaD
	 /dLFxE4K784BXu0cOxqOU/CKULHj7FC48gpyuaYalocdi/HCjehD36QZ6qpYwzav+I
	 WB9I9KJuZaNn4hYCCSR3gdqmg5vf4gEnCo0/muMQJo/mOupgs6RqQIXVYh7fPBfgjw
	 b001/EpgNTtDPcUvqqppiw2o+bQLDrWf45kA7DyN3Wn39hy0cpO5EQ0Ijdf5DI9RPz
	 4w+nL9GaUb/Cw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 17 Apr 2023 14:47:39 +0300 (MSK)
Date: Mon, 17 Apr 2023 14:47:39 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>, <yue.wang@amlogic.com>,
	<hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v1 4/5] usb: dwc3-meson-g12a: support OTG switch
Message-ID: <20230417114739.r7aoiodqybalbn4o@CAB-WSD-L081021>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
 <20230414152423.19842-5-ddrokosov@sberdevices.ru>
 <CAFBinCDyUBWd-V0mDy_edzH=3JM5SAuX=vtT4MG9Fb62Rcv=mA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDyUBWd-V0mDy_edzH=3JM5SAuX=vtT4MG9Fb62Rcv=mA@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/17 09:07:00 #21118574
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_044750_010926_D1CEA506 
X-CRM114-Status: GOOD (  14.59  )
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

SGVsbG8gTWFydGluLAoKVGhhbmsgeW91IGZvciBxdWljayByZXZpZXcsIGFwcHJlY2lhdGUgaXQh
ClBsZWFzZSBmaW5kIG15IGNvbW1lbnRzIGJlbG93IGFuZCBpbiB0aGUgb3RoZXIgcmVwbGllcy4K
Ck9uIFN1biwgQXByIDE2LCAyMDIzIGF0IDEwOjU2OjM2UE0gKzAyMDAsIE1hcnRpbiBCbHVtZW5z
dGluZ2wgd3JvdGU6Cj4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgNToyNOKAr1BNIERtaXRyeSBS
b2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+IFsuLi5dCj4gPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkd2MzX21lc29uX2cxMmFfZHJ2ZGF0YSBhMV9kcnZkYXRhID0gewo+
ID4gLSAgICAgICAub3RnX3N3aXRjaF9zdXBwb3J0ZWQgPSBmYWxzZSwKPiA+ICsgICAgICAgLm90
Z19zd2l0Y2hfc3VwcG9ydGVkID0gdHJ1ZSwKPiBpdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY291
bGQgYWxzbyBmb2xsb3cgdXAgd2l0aCBhIHBhdGNoIHRoYXQKPiByZW1vdmVzIG90Z19zd2l0Y2hf
c3VwcG9ydGVkLgo+IEExIHdhcyB0aGUgb25seSB2YXJpYW50IHRoYXQgbmVlZGVkIGl0IGFuZCBh
ZnRlciB0aGlzIHBhdGNoIGl0J3MganVzdCBkZWFkIGNvZGUuCgpJdCBtYWtlcyBzZW5zZS4gSSB0
aG91Z2h0IGFib3V0IGl0IGJlZm9yZSBzZW5kaW5nIHRoZSBmaXJzdCB2ZXJzaW9uLCBidXQKSSBm
b3VuZCBhIGNvdW50ZXItYXJndW1lbnQ6IGZ1dHVyZSBTb0NzIG1heSB1c2UgdGhpcyBwYXJhbWV0
ZXIuCkJ1dCBpZiB5b3UgYXNrLCBJIHdpbGwgcmVtb3ZlICdvdGdfc3dpdGNoX3N1cHBvcnRlZCcg
aW4gdGhlIG5leHQgdmVyc2lvbgoKLS0gClRoYW5rIHlvdSwKRG1pdHJ5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
