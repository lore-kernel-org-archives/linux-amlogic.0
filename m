Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A8BC11F67
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 01:16:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7B1613E2
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 01:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7B1613E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwHlLyyAft2JKKPPb/MWF50UjFsQwQ2dY2td1D0DZ64=; b=xr72ND6r2/DILC
	PA73TpHTBmWpVDSh9aayqrngJ0/F+Gl0a3zwRCAcR/7LWGdAOfeWcBMmEfc42Ls4DITCde1FNDIe6
	E+WYtQTZOpucCRGTy3b1Ao+1xjAsypcE/7TXZ+NgbbkFNXYS+NWOwxDxuq5IDY3luCcyt1Oz55OUD
	vKtc3utE15y/MWuVLjCQdxNaKcoHx9j0/R2rCJyxTZtp9R5j2zAXJSuPf3DfXVsCDQ0vO0HBIPuf7
	9qSa490JtZuHyItbvA5QQWPL2pUQ+MF2ghE5Yw1ZLCoC4ZeWivAi66XJuTb9x6xUbFFUwPGBIXIfS
	1CPOYBMvnWNsLhAej/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz7mh-001k6G-B2; Fri, 02 Jul 2021 01:15:59 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz7md-001k4k-Ku; Fri, 02 Jul 2021 01:15:57 +0000
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Fri, 2 Jul 2021
 09:15:26 +0800 (GMT+08:00)
X-Originating-IP: [112.20.109.145]
Date: Fri, 2 Jul 2021 09:15:26 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>
To: "Bjorn Helgaas" <helgaas@kernel.org>
Cc: "Artem Lapkin" <email2tema@gmail.com>, narmstrong@baylibre.com, 
 yue.wang@Amlogic.com, khilman@baylibre.com, 
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com, 
 jbrunet@baylibre.com, christianshewitt@gmail.com, 
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 art@khadas.com, nick@khadas.com, gouwa@khadas.com, chenhuacai@gmail.com
Subject: Re: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2021 www.mailtech.cn .loongson.cn
In-Reply-To: <20210701154634.GA60743@bjorn-Precision-5520>
References: <20210701154634.GA60743@bjorn-Precision-5520>
MIME-Version: 1.0
Message-ID: <67a9e1fa.81a9.17a64c8e7f7.Coremail.chenhuacai@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9AxmuCuaN5gtl4bAA--.9556W
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/1tbiAQAJBl3QvNnfDwAEsy
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_181556_142715_0572544F 
X-CRM114-Status: UNSURE (   3.88  )
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

SGksIEJqb3JuLAoKJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCiZndDsg5Y+R5Lu25Lq6OiAi
Qmpvcm4gSGVsZ2FhcyIgPGhlbGdhYXNAa2VybmVsLm9yZz4KJmd0OyDlj5HpgIHml7bpl7Q6IDIw
MjEtMDctMDEgMjM6NDY6MzQgKOaYn+acn+WbmykKJmd0OyDmlLbku7bkuro6ICJBcnRlbSBMYXBr
aW4iIDxlbWFpbDJ0ZW1hQGdtYWlsLmNvbT4KJmd0OyDmioTpgIE6IG5hcm1zdHJvbmdAYmF5bGli
cmUuY29tLCB5dWUud2FuZ0BBbWxvZ2ljLmNvbSwga2hpbG1hbkBiYXlsaWJyZS5jb20sIGxvcmVu
em8ucGllcmFsaXNpQGFybS5jb20sIHJvYmhAa2VybmVsLm9yZywga3dAbGludXguY29tLCBqYnJ1
bmV0QGJheWxpYnJlLmNvbSwgY2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20sIG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20sIGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBhcnRAa2hhZGFzLmNvbSwg
bmlja0BraGFkYXMuY29tLCBnb3V3YUBraGFkYXMuY29tLCAiSHVhY2FpIENoZW4iIDxjaGVuaHVh
Y2FpQGxvb25nc29uLmNuPgomZ3Q7IOS4u+mimDogUmU6IFtQQVRDSCAwLzRdIFBDSTogcmVwbGFj
ZSBkdWJsaWNhdGVkIE1SUlMgbGltaXQgcXVpcmtzCiZndDsgCiZndDsgWytjYyBIdWFjYWldCiZn
dDsgCiZndDsgT24gU2F0LCBKdW4gMTksIDIwMjEgYXQgMDI6Mzk6NDhQTSArMDgwMCwgQXJ0ZW0g
TGFwa2luIHdyb3RlOgomZ3Q7ICZndDsgUmVwbGFjZSBkdWJsaWNhdGVkIE1SUlMgbGltaXQgcXVp
cmtzIGJ5IG1ycnNfbGltaXRfcXVpcmsgZnJvbSBjb3JlCiZndDsgJmd0OyAqIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jCiZndDsgJmd0OyAqIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpLWxvb25nc29uLmMKJmd0OyAKJmd0OyBzL2R1YmxpY2F0ZWQvZHVwbGljYXRl
ZC8gKHNldmVyYWwgb2NjdXJyZW5jZXMpCiZndDsgCiZndDsgQ2FwaXRhbGl6ZSBzdWJqZWN0IGxp
bmVzLgomZ3Q7IAomZ3Q7IFVzZSAiZ2l0IGxvZyAtLW9ubGluZSIgdG8gbGVhcm4gY29udmVudGlv
bnMgYW5kIGZvbGxvdyB0aGVtLgomZ3Q7IAomZ3Q7IEFkZCAiKCkiIGFmdGVyIGZ1bmN0aW9uIG5h
bWVzLgomZ3Q7IAomZ3Q7IENhcGl0YWxpemUgYWNyb255bXMgYXBwcm9wcmlhdGVseSAoTlZNZSwg
TVJSUywgUENJLCBldGMpLgomZ3Q7IAomZ3Q7IEVuZCBzZW50ZW5jZXMgd2l0aCBwZXJpb2RzLgom
Z3Q7IAomZ3Q7IEEgIm1vdmUiIHBhdGNoIG11c3QgaW5jbHVkZSBib3RoIHRoZSByZW1vdmFsIGFu
ZCB0aGUgYWRkaXRpb24gYW5kIG1ha2UKJmd0OyBubyBjaGFuZ2VzIHRvIHRoZSBjb2RlIGl0c2Vs
Zi4KJmd0OyAKJmd0OyBBbWxvZ2ljIGFwcGVhcnMgd2l0aG91dCBleHBsYW5hdGlvbiBpbiAyLzQu
ICBNdXN0IGJlIHNlcGFyYXRlIHBhdGNoIHRvCiZndDsgYWRkcmVzcyBvbmx5IHRoYXQgc3BlY2lm
aWMgaXNzdWUuICBTaG91bGQgcmVmZXJlbmNlIHB1Ymxpc2hlZCBlcnJhdHVtCiZndDsgaWYgcG9z
c2libGUuICAiU29sdmVzIHNvbWUgaXNzdWUiIGlzIG5vdCBhIGNvbXBlbGxpbmcganVzdGlmaWNh
dGlvbi4KJmd0OyAKJmd0OyBUaGUgdHJlZSBtdXN0IGJlIGNvbnNpc3RlbnQgYW5kIGZ1bmN0aW9u
YWxseSB0aGUgc2FtZSBvciBpbXByb3ZlZAomZ3Q7IGFmdGVyIGV2ZXJ5IHBhdGNoLgomZ3Q7IAom
Z3Q7IEFkZCB0byBwY2lfaWRzLmggb25seSBpZiBzeW1ib2wgdXNlZCBtb3JlIHRoYW4gb25lIHBs
YWNlLgomZ3Q7IAomZ3Q7IFNlZQomZ3Q7IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTA3
MDEwNzQ0NTguMTgwOTUzMi0zLWNoZW5odWFjYWlAbG9vbmdzb24uY24sCiZndDsgd2hpY2ggbG9v
a3Mgc2ltaWxhci4gIENvbWJpbmUgZWZmb3J0cyBpZiBwb3NzaWJsZSBhbmQgY2MgSHVhY2FpIHNv
CiZndDsgeW91J3JlIGJvdGggYXdhcmUgb2Ygb3ZlcmxhcHBpbmcgd29yay4KJmd0OyAKJmd0OyBN
b3JlIGhpbnRzIGluIGNhc2UgdGhleSdyZSB1c2VmdWw6CiZndDsgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcGNpLzIwMTcxMDI2MjIzNzAxLkdBMjU2NDlAYmhlbGdhYXMtZ2xhcHRvcC5y
b2FtLmNvcnAuZ29vZ2xlLmNvbS8KJmd0OyAKJmd0OyAmZ3Q7IEJvdGgga3NfcGNpZV9xdWlyayBs
b29uZ3Nvbl9tcnJzX3F1aXJrIHdhcyByZXdyaXR0ZW4gd2l0aG91dCBhbnkKJmd0OyAmZ3Q7IGZ1
bmN0aW9uYWxpdHkgY2hhbmdlcyBieSBvbmUgbXJyc19saW1pdF9xdWlyawpEb2VzIHRoYXQgbWVh
bnMga2V5c3RvbmUgYW5kIExvb25nc29uIGhhcyB0aGUgc2FtZSBNUlJTIHByb2JsZW0/IEFuZCB3
aGF0IHNob3VsZCBJIGRvIG5vdz8KCkh1YWNhaQomZ3Q7ICZndDsgCiZndDsgJmd0OyBBZGRlZCBE
ZXNpZ25XYXJlIFBDSSBjb250cm9sbGVyIHdoaWNoIG5lZWQgc2FtZSBxdWlyayBmb3IKJmd0OyAm
Z3Q7ICogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMgKFBDSV9ERVZJQ0Vf
SURfU1lOT1BTWVNfSEFQU1VTQjMpCiZndDsgJmd0OyAKJmd0OyAmZ3Q7IFRoaXMgcXVpcmsgY2Fu
IHNvbHZlIHNvbWUgaXNzdWUgZm9yIEtoYWRhcyBWSU0zL1ZJTTNMKEFtbG9naWMpCiZndDsgJmd0
OyB3aXRoIEhETUkgc2NyYW1ibGVkIHBpY3R1cmUgYW5kIG52bWUgZGV2aWNlcyBhdCBpbnRlbnNp
dmUgd3JpdGluZy4uLgomZ3Q7ICZndDsgCiZndDsgJmd0OyBjb21lIGZyb206CiZndDsgJmd0OyAq
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDIxMDYxODA2MzgyMS4xMzgzMzU3
LTEtYXJ0QGtoYWRhcy5jb20vCiZndDsgJmd0OyAKJmd0OyAmZ3Q7IEFydGVtIExhcGtpbiAoNCk6
CiZndDsgJmd0OyAgUENJOiBtb3ZlIEtleXN0b25lIGFuZCBMb29uZ3NvbiBkZXZpY2UgSURzIHRv
IHBjaV9pZHMKJmd0OyAmZ3Q7ICBQQ0k6IGNvcmU6IHF1aXJrczogYWRkIG1ycnNfbGltaXRfcXVp
cmsKJmd0OyAmZ3Q7ICBQQ0k6IGtleXN0b25lIG1vdmUgbXJycyBxdWlyayB0byBjb3JlCiZndDsg
Jmd0OyAgUENJOiBsb29uZ3NvbiBtb3ZlIG1ycnMgcXVpcmsgdG8gY29yZQomZ3Q7ICZndDsgCiZn
dDsgJmd0OyAtLSAKJmd0OyAmZ3Q7IDIuMjUuMQomZ3Q7ICZndDsKCgo8L2NoZW5odWFjYWlAbG9v
bmdzb24uY24+PC9lbWFpbDJ0ZW1hQGdtYWlsLmNvbT48L2hlbGdhYXNAa2VybmVsLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
