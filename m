Return-Path: <SRS0=Mf/G=L6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471F9C07E96
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 09:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A5786199C
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 09:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A5786199C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K6zt7+eJmtukxGlDdVOSVIadOaP+I4nF8ciQP7wHCY4=; b=jQ72MVzNAIIH7THtAEGicDek54
	J3c3IBq7/97E2RZVFe8IfhwlnCob6+VjguhDnsj/lfhtWnx+LukSoBYJf5LOwuR8/J/OFunk/w4An
	m3V9faxRVT4DOohmB+5G+2AJfPxv5wJNXOsuiel/B/Lnr4WrqoW5PwcQS9a8+gkuzaAZ4fycvpyRd
	K3M1ij/2TrfdffbIaVfMtzHhf8bF6f6IyRj7qO2UUbjSATSIe0hWOpgxE0DrNjOuVdwFt8U+VAriP
	Kdovi/WsqTQ1fW8zwtcWgnQC2sZgXqJsvYNJvQ2773iB09TiEFsEc4eVMJuvNCjJj1NkL46U30M24
	r1q6rqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hmP-00AwAD-I6; Tue, 06 Jul 2021 09:54:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0hmL-00Aw8r-8x
 for linux-amlogic@lists.infradead.org; Tue, 06 Jul 2021 09:54:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id i94so25359107wri.4
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Jul 2021 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g0tC4MUw9+SlqVFCUMsi7lqIq0CVDtng7PTCdgO5oEU=;
 b=S+dyx3xgcpj4V3ANCC/A6Amv96T6RfsrHnI9Uz0FsZM7M1pQr864n7wdcaBDSg5Vbd
 lSGSdbe5aZ7zVjxxd8F3zNng8k7IdH9JrfTHCb6mrD9gTr8Xuf7RacFgLdU5FwOZMpDE
 /5SWAXvxFc6XhtmPg+H9EO6ov+vEG+E41XGQweMOGVHNECJ6mUL4VfMJ8L1FScR+leFe
 0WRWQ4MGc4yS43o/cqzD1xSwhjXiUjKMSdBvuTAKvIfDabwOnMUx3BlyDP7xrVSCBsPl
 YoqCvWxCZ8hn7ZglybVg4QTJlaFVIBsgzc8hxEma6a1XaJhJr1SyqaPdJ1wk96tEEFo/
 s4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g0tC4MUw9+SlqVFCUMsi7lqIq0CVDtng7PTCdgO5oEU=;
 b=rT5HS97QoqXyLe66Ikwomu9QK7KpSyf/b7XUdP8YX5Sf9Rw3/YABH6NwEwO1rHbicY
 jUarFzcB9oygz2wNA1CghsM1EFmR2TCdMuWjX3f68OxIRluWsGle8SswukiXHhQPPYG4
 rOxrF/YAkL8sP37IJKuiZX7U3k8TImWULB4iaWhxx4hUbzwoq3iBwP/7ktMPmE4KpOOX
 uXMLgqR1+qPUWcfrmLVD8D5tV7c8I7iXsDdsGES11/JlRUuRk9uCcjb0a7/KYOQJUh4/
 WhDzSiNMJK5YmvAoFJy4daJ+DZ+YIpZkanskbSf+ekq4/pNyFlxv9QinWmOWMdWrh7zl
 w3Bw==
X-Gm-Message-State: AOAM5330dznJZ1dh1shKPpaDjf+0lB/CKd+16xodezKIeEmbEoIwBGvX
 I2Sf93YaUA1PKc97LC4AmOghNw==
X-Google-Smtp-Source: ABdhPJw1OVsLKqTJI+QcQyufAyhgXFbBXCF9GbXQs8fIfbWhEVMa+N/VRwbpAMfkQ9yGFvibeQJX3g==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr21148359wrs.106.1625565246820; 
 Tue, 06 Jul 2021 02:54:06 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:7257:ae4e:a17f:5800?
 ([2001:861:44c0:66c0:7257:ae4e:a17f:5800])
 by smtp.gmail.com with ESMTPSA id e23sm2264839wme.31.2021.07.06.02.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:54:06 -0700 (PDT)
Subject: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
To: Art Nikpal <email2tema@gmail.com>, Huacai Chen <chenhuacai@gmail.com>
Cc: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>,
 Bjorn Helgaas <helgaas@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Wilczynski <kw@linux.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
References: <20210701154634.GA60743@bjorn-Precision-5520>
 <67a9e1fa.81a9.17a64c8e7f7.Coremail.chenhuacai@loongson.cn>
 <CAKaHn9KxRrBsn4b9fSO1eDzM3XdV2GzfwVX+cGw9uS_eKg75dw@mail.gmail.com>
 <CAAhV-H5M5Qf01DTD8ULGGGnv2kc2exRgXCLyNOOaqRL=dZ77xQ@mail.gmail.com>
 <CAKaHn9+iHk3UtovWU+WE2mXD9oTZD9UdxrYuLB2Odgbr91Gs-Q@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1271fa28-dddd-01a3-5ad5-e3b4898f5482@baylibre.com>
Date: Tue, 6 Jul 2021 11:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKaHn9+iHk3UtovWU+WE2mXD9oTZD9UdxrYuLB2Odgbr91Gs-Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_025409_432500_750B1FF0 
X-CRM114-Status: GOOD (  22.91  )
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

SGksCgpPbiAwNi8wNy8yMDIxIDA4OjA2LCBBcnQgTmlrcGFsIHdyb3RlOgo+PiBCdXQsIExvb25n
c29uIHBsYXRmb3JtIGhhcyBuZXdlciByZXZpc2lvbiBvZiBoYXJkd2FyZSwgYW5kIHRoZSBNUlJT
Cj4+IHF1aXJrIGhhcyBjaGFuZ2VkLCBwbGVhc2Ugc2VlOgo+PiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtcGNpL2xpc3QvP3Nlcmllcz01MDk0OTcKPj4gSHVhY2Fp
Cj4gCj4gT0shIHRueCBmb3IgaW5mb3JtYXRpb24gISBtYXliZSB3ZSBjYW4gY29vcGVyYXRlIGFu
ZCBtYWtlIG9uZQo+IHVuaXZlcnNhbCBxdWlyayBmb3IgYWxsCgpJbiB0aGVpciBEZXNpZ253YXJl
IFBDSWUgY29udHJvbGxlciBkcml2ZXIsIGFtbG9naWMgc2V0cyB0aGUgTWF4X1BheWxvYWRfU2l6
ZSAmIE1heF9SZWFkX1JlcXVlc3RfU2l6ZSB0byAyNTY6Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1l
c29uLmMjTDI2MApodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNl
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jI0wyNzYKaW4gdGhlaXIgcm9v
dCBwb3J0IFBDSWUgRXhwcmVzcyBEZXZpY2UgQ29udHJvbCBSZWdpc3Rlci4KCkxvb2tpbmcgYXQg
dGhlIFN5bm9wc3lzIERXLVBDSWUgRGF0YWJvb2ssIE1heF9QYXlsb2FkX1NpemUgJiBNYXhfUmVh
ZF9SZXF1ZXN0X1NpemUgYXJlIHVzZWQgdG8gZGVjb21wb3NlIGludG8gQVhJIGJ1cnN0LApidXQg
aXQgc2VlbXMgdGhlIE1heF9QYXlsb2FkX1NpemUgJiBNYXhfUmVhZF9SZXF1ZXN0X1NpemUgYXJl
IHNldCBieSBkZWZhdWx0IHRvIDUxMiBidXQgdGhlIGludGVybmFsIE1heF9QYXlsb2FkX1NpemVf
U3VwcG9ydGVkCmlzIHNldCB0byAyNTYsIHRodXMgY2hhbmdpbmcgdGhlc2UgdmFsdWVzIHRvIDI1
NiBhdCBydW50aW1lIHRvIG1hdGNoIGFuZCBvcHRpbWl6ZSBiYW5kd2lkdGguCgpJdCdzIHNhaWQs
ICJSZWR1Y2luZyBPdXRib3VuZCBEZWNvbXBvc2l0aW9uIiA6CiAtICJFbnN1cmUgdGhhdCB5b3Vy
IGFwcGxpY2F0aW9uIG1hc3RlciBkb2VzIG5vdCBnZW5lcmF0ZSBidXJzdHMgb2Ygc2l6ZSBncmVh
dGVyIHRoYW4gb3IgZXF1YWwgdG8gTWF4X1BheWxvYWRfU2l6ZSIKIC0gIlByb2dyYW0geW91ciBQ
Q0llIHN5c3RlbSB3aXRoIGEgbGFyZ2VyIHZhbHVlIG9mIE1heF9QYXlsb2FkX1NpemUgd2l0aG91
dCBleGNlZWRpbmcgTWF4X1BheWxvYWRfU2l6ZV9TdXBwb3J0ZWQiCiAtICJQcm9ncmFtIHlvdXIg
UENJZSBzeXN0ZW0gd2l0aCBhIGxhcmdlciB2YWx1ZSBvZiBNYXhfUmVhZF9SZXF1ZXN0IHdpdGhv
dXQgZXhjZWVkaW5nIE1heF9QYXlsb2FkX1NpemVfU3VwcG9ydGVkOgoKU28gbGVhdmluZyA1MTIg
aW4gTWF4X1BheWxvYWRfU2l6ZSAmIE1heF9SZWFkX1JlcXVlc3QgbGVhZHMgdG8gT3V0Ym91bmQg
RGVjb21wb3NpdGlvbiB3aGljaCBkZWNyZWFzZXMgUENJZSBsaW5rIGFuZCBkZWdyYWRlcwp0aGUg
QVhJIGJ1cyBieSBkb3VibGluZyB0aGUgYnVyc3RzLCBsZWFkaW5nIHRvIHRoaXMgZml4IHRvIGF2
b2lkIG92ZXJmbG93aW5nIHRoZSBBWEkgYnVzLgoKU28gaXQgc2VlbXMgdG8gYmUgc3RpbGwgbmVl
ZGVkLCBJIGFzc3VtZSB0aGlzICpzaG91bGQqIGJlIGhhbmRsZWQgaW4gdGhlIGNvcmUgc29tZWhv
dyB0byBwcm9wYWdhdGUgdGhlc2Ugc2V0dGluZ3MgdG8gY2hpbGQgZW5kcG9pbnRzIHRvIG1hdGNo
CnRoZSByb290IHBvcnQgTWF4X1BheWxvYWRfU2l6ZSAmIE1heF9SZWFkX1JlcXVlc3Qgc2l6ZXMu
CgpNYXliZSBieSBhZGRpbmcgYSBjb3JlIGZ1bmN0aW9uIHRvIHNldCB0aGVzZSB2YWx1ZXMgaW5z
dGVhZCBvZiB1c2luZyB0aGUgZHdfcGNpZV9maW5kX2NhcGFiaWxpdHkoKSAmIGR3X3BjaWVfd3Jp
dGUvcmVhZGxfZGJpKCkgaGVscGVycwphbmQgc2V0IGEgc3RhdGUgb24gdGhlIHJvb3QgcG9ydCB0
byBwcm9wYWdhdGUgdGhlIHZhbHVlID8KCk5laWwKCj4gCj4gT24gVHVlLCBKdWwgNiwgMjAyMSBh
dCA5OjM2IEFNIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+
IEhpLCBBcnQsCj4+Cj4+IE9uIE1vbiwgSnVsIDUsIDIwMjEgYXQgNDozNSBQTSBBcnQgTmlrcGFs
IDxlbWFpbDJ0ZW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+IERvZXMgdGhhdCBtZWFucyBr
ZXlzdG9uZSBhbmQgTG9vbmdzb24gaGFzIHRoZSBzYW1lIE1SUlMgcHJvYmxlbT8gQW5kIHdoYXQg
c2hvdWxkIEkgZG8gbm93Pwo+Pj4KPj4+IExvb2sgbGlrZSB5ZXMgISBhbmQgIGFtbG9naWMgaGFz
IHRoZSBzYW1lIHByb2JsZW0uCj4+PiBJIHRoaW5rIHNvbWVib2R5IG5lZWQgdG8gcmV3cml0ZSBp
dCBhbGwgdG8gb25lIGNvbW1vbiBxdWlyayBmb3IgdGhpcyBwcm9ibGVtLgo+Pj4KPj4+IElmIG5v
IG9uZSBoYXMgYW55IG9iamVjdGlvbiwgSSBjYW4gdHJ5IHRvIHJlbWFrZSBpdCBhZ2Fpbi4KPj4g
QnV0LCBMb29uZ3NvbiBwbGF0Zm9ybSBoYXMgbmV3ZXIgcmV2aXNpb24gb2YgaGFyZHdhcmUsIGFu
ZCB0aGUgTVJSUwo+PiBxdWlyayBoYXMgY2hhbmdlZCwgcGxlYXNlIHNlZToKPj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXBjaS9saXN0Lz9zZXJpZXM9NTA5NDk3
Cj4+Cj4+IEh1YWNhaQo+Pj4KPj4+IE9uIEZyaSwgSnVsIDIsIDIwMjEgYXQgOToxNSBBTSDpmYjl
jY7miY0gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+IHdyb3RlOgo+Pj4+Cj4+Pj4gSGksIEJqb3Ju
LAo+Pj4+Cj4+Pj4gJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4+Pj4gJmd0OyDlj5Hku7bk
uro6ICJCam9ybiBIZWxnYWFzIiA8aGVsZ2Fhc0BrZXJuZWwub3JnPgo+Pj4+ICZndDsg5Y+R6YCB
5pe26Ze0OiAyMDIxLTA3LTAxIDIzOjQ2OjM0ICjmmJ/mnJ/lm5spCj4+Pj4gJmd0OyDmlLbku7bk
uro6ICJBcnRlbSBMYXBraW4iIDxlbWFpbDJ0ZW1hQGdtYWlsLmNvbT4KPj4+PiAmZ3Q7IOaKhOmA
gTogbmFybXN0cm9uZ0BiYXlsaWJyZS5jb20sIHl1ZS53YW5nQEFtbG9naWMuY29tLCBraGlsbWFu
QGJheWxpYnJlLmNvbSwgbG9yZW56by5waWVyYWxpc2lAYXJtLmNvbSwgcm9iaEBrZXJuZWwub3Jn
LCBrd0BsaW51eC5jb20sIGpicnVuZXRAYmF5bGlicmUuY29tLCBjaHJpc3RpYW5zaGV3aXR0QGdt
YWlsLmNvbSwgbWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbSwgbGludXgtcGNpQHZn
ZXIua2VybmVsLm9yZywgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcsIGFydEBraGFkYXMuY29tLCBuaWNrQGtoYWRhcy5jb20sIGdvdXdhQGtoYWRhcy5jb20sICJI
dWFjYWkgQ2hlbiIgPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4+Pj4gJmd0OyDkuLvpopg6IFJl
OiBbUEFUQ0ggMC80XSBQQ0k6IHJlcGxhY2UgZHVibGljYXRlZCBNUlJTIGxpbWl0IHF1aXJrcwo+
Pj4+ICZndDsKPj4+PiAmZ3Q7IFsrY2MgSHVhY2FpXQo+Pj4+ICZndDsKPj4+PiAmZ3Q7IE9uIFNh
dCwgSnVuIDE5LCAyMDIxIGF0IDAyOjM5OjQ4UE0gKzA4MDAsIEFydGVtIExhcGtpbiB3cm90ZToK
Pj4+PiAmZ3Q7ICZndDsgUmVwbGFjZSBkdWJsaWNhdGVkIE1SUlMgbGltaXQgcXVpcmtzIGJ5IG1y
cnNfbGltaXRfcXVpcmsgZnJvbSBjb3JlCj4+Pj4gJmd0OyAmZ3Q7ICogZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMKPj4+PiAmZ3Q7ICZndDsgKiBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaS1sb29uZ3Nvbi5jCj4+Pj4gJmd0Owo+Pj4+ICZndDsgcy9kdWJsaWNhdGVk
L2R1cGxpY2F0ZWQvIChzZXZlcmFsIG9jY3VycmVuY2VzKQo+Pj4+ICZndDsKPj4+PiAmZ3Q7IENh
cGl0YWxpemUgc3ViamVjdCBsaW5lcy4KPj4+PiAmZ3Q7Cj4+Pj4gJmd0OyBVc2UgImdpdCBsb2cg
LS1vbmxpbmUiIHRvIGxlYXJuIGNvbnZlbnRpb25zIGFuZCBmb2xsb3cgdGhlbS4KPj4+PiAmZ3Q7
Cj4+Pj4gJmd0OyBBZGQgIigpIiBhZnRlciBmdW5jdGlvbiBuYW1lcy4KPj4+PiAmZ3Q7Cj4+Pj4g
Jmd0OyBDYXBpdGFsaXplIGFjcm9ueW1zIGFwcHJvcHJpYXRlbHkgKE5WTWUsIE1SUlMsIFBDSSwg
ZXRjKS4KPj4+PiAmZ3Q7Cj4+Pj4gJmd0OyBFbmQgc2VudGVuY2VzIHdpdGggcGVyaW9kcy4KPj4+
PiAmZ3Q7Cj4+Pj4gJmd0OyBBICJtb3ZlIiBwYXRjaCBtdXN0IGluY2x1ZGUgYm90aCB0aGUgcmVt
b3ZhbCBhbmQgdGhlIGFkZGl0aW9uIGFuZCBtYWtlCj4+Pj4gJmd0OyBubyBjaGFuZ2VzIHRvIHRo
ZSBjb2RlIGl0c2VsZi4KPj4+PiAmZ3Q7Cj4+Pj4gJmd0OyBBbWxvZ2ljIGFwcGVhcnMgd2l0aG91
dCBleHBsYW5hdGlvbiBpbiAyLzQuICBNdXN0IGJlIHNlcGFyYXRlIHBhdGNoIHRvCj4+Pj4gJmd0
OyBhZGRyZXNzIG9ubHkgdGhhdCBzcGVjaWZpYyBpc3N1ZS4gIFNob3VsZCByZWZlcmVuY2UgcHVi
bGlzaGVkIGVycmF0dW0KPj4+PiAmZ3Q7IGlmIHBvc3NpYmxlLiAgIlNvbHZlcyBzb21lIGlzc3Vl
IiBpcyBub3QgYSBjb21wZWxsaW5nIGp1c3RpZmljYXRpb24uCj4+Pj4gJmd0Owo+Pj4+ICZndDsg
VGhlIHRyZWUgbXVzdCBiZSBjb25zaXN0ZW50IGFuZCBmdW5jdGlvbmFsbHkgdGhlIHNhbWUgb3Ig
aW1wcm92ZWQKPj4+PiAmZ3Q7IGFmdGVyIGV2ZXJ5IHBhdGNoLgo+Pj4+ICZndDsKPj4+PiAmZ3Q7
IEFkZCB0byBwY2lfaWRzLmggb25seSBpZiBzeW1ib2wgdXNlZCBtb3JlIHRoYW4gb25lIHBsYWNl
Lgo+Pj4+ICZndDsKPj4+PiAmZ3Q7IFNlZQo+Pj4+ICZndDsgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDIxMDcwMTA3NDQ1OC4xODA5NTMyLTMtY2hlbmh1YWNhaUBsb29uZ3Nvbi5jbiwKPj4+
PiAmZ3Q7IHdoaWNoIGxvb2tzIHNpbWlsYXIuICBDb21iaW5lIGVmZm9ydHMgaWYgcG9zc2libGUg
YW5kIGNjIEh1YWNhaSBzbwo+Pj4+ICZndDsgeW91J3JlIGJvdGggYXdhcmUgb2Ygb3ZlcmxhcHBp
bmcgd29yay4KPj4+PiAmZ3Q7Cj4+Pj4gJmd0OyBNb3JlIGhpbnRzIGluIGNhc2UgdGhleSdyZSB1
c2VmdWw6Cj4+Pj4gJmd0OyBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAxNzEw
MjYyMjM3MDEuR0EyNTY0OUBiaGVsZ2Fhcy1nbGFwdG9wLnJvYW0uY29ycC5nb29nbGUuY29tLwo+
Pj4+ICZndDsKPj4+PiAmZ3Q7ICZndDsgQm90aCBrc19wY2llX3F1aXJrIGxvb25nc29uX21ycnNf
cXVpcmsgd2FzIHJld3JpdHRlbiB3aXRob3V0IGFueQo+Pj4+ICZndDsgJmd0OyBmdW5jdGlvbmFs
aXR5IGNoYW5nZXMgYnkgb25lIG1ycnNfbGltaXRfcXVpcmsKPj4+PiBEb2VzIHRoYXQgbWVhbnMg
a2V5c3RvbmUgYW5kIExvb25nc29uIGhhcyB0aGUgc2FtZSBNUlJTIHByb2JsZW0/IEFuZCB3aGF0
IHNob3VsZCBJIGRvIG5vdz8KPj4+Pgo+Pj4+IEh1YWNhaQo+Pj4+ICZndDsgJmd0Owo+Pj4+ICZn
dDsgJmd0OyBBZGRlZCBEZXNpZ25XYXJlIFBDSSBjb250cm9sbGVyIHdoaWNoIG5lZWQgc2FtZSBx
dWlyayBmb3IKPj4+PiAmZ3Q7ICZndDsgKiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
bWVzb24uYyAoUENJX0RFVklDRV9JRF9TWU5PUFNZU19IQVBTVVNCMykKPj4+PiAmZ3Q7ICZndDsK
Pj4+PiAmZ3Q7ICZndDsgVGhpcyBxdWlyayBjYW4gc29sdmUgc29tZSBpc3N1ZSBmb3IgS2hhZGFz
IFZJTTMvVklNM0woQW1sb2dpYykKPj4+PiAmZ3Q7ICZndDsgd2l0aCBIRE1JIHNjcmFtYmxlZCBw
aWN0dXJlIGFuZCBudm1lIGRldmljZXMgYXQgaW50ZW5zaXZlIHdyaXRpbmcuLi4KPj4+PiAmZ3Q7
ICZndDsKPj4+PiAmZ3Q7ICZndDsgY29tZSBmcm9tOgo+Pj4+ICZndDsgJmd0OyAqIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDIxMDYxODA2MzgyMS4xMzgzMzU3LTEtYXJ0QGto
YWRhcy5jb20vCj4+Pj4gJmd0OyAmZ3Q7Cj4+Pj4gJmd0OyAmZ3Q7IEFydGVtIExhcGtpbiAoNCk6
Cj4+Pj4gJmd0OyAmZ3Q7ICBQQ0k6IG1vdmUgS2V5c3RvbmUgYW5kIExvb25nc29uIGRldmljZSBJ
RHMgdG8gcGNpX2lkcwo+Pj4+ICZndDsgJmd0OyAgUENJOiBjb3JlOiBxdWlya3M6IGFkZCBtcnJz
X2xpbWl0X3F1aXJrCj4+Pj4gJmd0OyAmZ3Q7ICBQQ0k6IGtleXN0b25lIG1vdmUgbXJycyBxdWly
ayB0byBjb3JlCj4+Pj4gJmd0OyAmZ3Q7ICBQQ0k6IGxvb25nc29uIG1vdmUgbXJycyBxdWlyayB0
byBjb3JlCj4+Pj4gJmd0OyAmZ3Q7Cj4+Pj4gJmd0OyAmZ3Q7IC0tCj4+Pj4gJmd0OyAmZ3Q7IDIu
MjUuMQo+Pj4+ICZndDsgJmd0Owo+Pj4+Cj4+Pj4KPj4+PiA8L2NoZW5odWFjYWlAbG9vbmdzb24u
Y24+PC9lbWFpbDJ0ZW1hQGdtYWlsLmNvbT48L2hlbGdhYXNAa2VybmVsLm9yZz4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
