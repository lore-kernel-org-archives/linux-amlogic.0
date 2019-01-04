Return-Path: <SRS0=8QoF=PM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB40C43387
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 10:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351B02173B
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 10:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="loxrD5Wj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351B02173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9/IdUehRND8c4csAsd025NwBUqpyfpY/19ea8P/f1w=; b=loxrD5Wj2kljLP
	poUeCxvXMoeb6StC045XCPPtlS8VboEnLc03zgjtqkJT2SbeMxX8X+klAJ5+LNE1ZyHf8bhc0/pjJ
	/jXCKLinTZdnhE81rHMM7JXsL6ZzN/UpU9Q4TdXib6l6TjT+21eF/yRrASqCdimjq+ahEDcGcJjg6
	W08HpDmR1oKOCqRL0D+wLxWiiHhoDct4ERA5sMuZUH/uEhpIDfOozoLcSM9FmbOae2ki3nRp/goLB
	umxCCLVfGHLhaUBkjClcTFr8Mw7p2AwazJ/K7R7KpgcfdUSGLL9QSKKDZTpz6fZla5vcEc9BAGBDu
	Dd58NZPMk3h91WUL6Kzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfMkS-0003oJ-Dy; Fri, 04 Jan 2019 10:30:40 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfMkP-0003nK-G6; Fri, 04 Jan 2019 10:30:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CF2EEBD;
 Fri,  4 Jan 2019 02:30:34 -0800 (PST)
Received: from red-moon (red-moon.cambridge.arm.com [10.1.197.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D78CC3F575;
 Fri,  4 Jan 2019 02:30:32 -0800 (PST)
Date: Fri, 4 Jan 2019 10:30:25 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH] PCI: amlogic: fix build failure due to missing
 linux/gpio/consumer.h header
Message-ID: <20190104103015.GA3738@red-moon>
References: <1546592917-27846-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1546592917-27846-1-git-send-email-clabbe@baylibre.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190104_023037_542372_25ED8605 
X-CRM114-Status: GOOD (  15.64  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, bhelgaas@google.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMDk6MDg6MzdBTSArMDAwMCwgQ29yZW50aW4gTGFiYmUg
d3JvdGU6Cj4gV2hlbiBidWlsZGluZyBvbiB4ODYsIEkgZ290IHRoZSBmb2xsb3dpbmcgYnVpbGQg
ZmFpbHVyZToKCkhpLAoKd2hhdCB0cmVlIGFyZSB5b3UgdGVzdGluZyBvbiBhbmQgd2hpY2ggY29u
ZmlnID8KClRoYW5rcywKTG9yZW56bwoKPiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
bWVzb24uYzogSW4gZnVuY3Rpb24g4oCYbWVzb25fcGNpZV9hc3NlcnRfcmVzZXTigJk6Cj4gZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmM6MjkwOjI6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXDigJk7
IGRpZCB5b3UgbWVhbiDigJhncGlvX3NldF92YWx1ZV9jYW5zbGVlcOKAmT8gWy1XZXJyb3I9aW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAo
bXAtPnJlc2V0X2dwaW8sIDApOwo+ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICBncGlv
X3NldF92YWx1ZV9jYW5zbGVlcAo+IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNv
bi5jOiBJbiBmdW5jdGlvbiDigJhtZXNvbl9wY2llX3Byb2Jl4oCZOgo+IGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jOjU0MDoxOTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uIOKAmGRldm1fZ3Bpb2RfZ2V04oCZOyBkaWQgeW91IG1lYW4g4oCYZGV2
bV9ncGlvX2ZyZWXigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+
ICAgbXAtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldChkZXYsICJyZXNldCIsIEdQSU9EX09V
VF9MT1cpOwo+ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+ICAgICAgICAgICAg
ICAgICAgICBkZXZtX2dwaW9fZnJlZQo+IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1t
ZXNvbi5jOjU0MDo0ODogZXJyb3I6IOKAmEdQSU9EX09VVF9MT1figJkgdW5kZWNsYXJlZCAoZmly
c3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYR1BJT0ZfSU5JVF9MT1fi
gJk/Cj4gICBtcC0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgInJlc2V0IiwgR1BJ
T0RfT1VUX0xPVyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEdQSU9GX0lOSVRfTE9XCj4gCj4gVGhpcyBpcyBkdWUgdG8gdGhlIG1pc3Np
bmcgbGludXgvZ3Bpby9jb25zdW1lci5oIGhlYWRlcgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvcmVu
dGluIExhYmJlIDxjbGFiYmVAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1l
c29uLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwo+IGluZGV4IDI0
MWViZTBjNDUwNS4uZTM1ZTllYWE1MGVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaS1tZXNvbi5jCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpLW1lc29uLmMKPiBAQCAtOCw2ICs4LDcgQEAKPiAgCj4gICNpbmNsdWRlIDxsaW51eC9jbGsu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2Nv
bnN1bWVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L29mX2dwaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+IC0tIAo+IDIuMTkuMgo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
