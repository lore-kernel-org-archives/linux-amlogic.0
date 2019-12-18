Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B8CC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0735321582
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GKvUKrQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0735321582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLYjFJ0H/32RF9uF2BmxWe5buL9ccIoBOwl3V6gTdPA=; b=GKvUKrQeh255Ma
	LDQgn+rmt8CxB1bOHU1h2YtfmL0BwyGt/SwHQBIX8vnPmAZq1Y5+JTdmOtmeGrGwsHGkhf5ljifY3
	zrII8hxau4srWBE2IsjZ6c4d0h72F8IEfSqvffvLf2BlK41FvxpVgPDTE4rYvUFoNisvrntA60zRK
	gz3vQmEZByUZUOFH0mB6GlxxWU79acoeX4N2WrvpgcVSO+H+4B4sWtfPTGM9621IeLXSSVHguAoNm
	GsVAFdavvDshIa0eZuIbGHNjN/OUPTyZAZgPnVTjG5k6lx6hP6gAxcEllZ8MZPZJN398rEb3mbIO2
	8o5pT/apY87f0i51OXhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihg1Q-00012b-SM; Wed, 18 Dec 2019 20:34:16 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihg1G-0000tj-Ke; Wed, 18 Dec 2019 20:34:08 +0000
Received: by mail-ot1-f67.google.com with SMTP id h9so1451852otj.11;
 Wed, 18 Dec 2019 12:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=F/E8A+1Ejaf5X51OroqwzDdI/kh4qPtQG6sI+b5/ucQ=;
 b=YNVdnJRKJzayc016HqBG32eYc4KW0eJbWpwPvH/PmUxom+xwylaFGfzaz0GBgrelLY
 PzDD5jt7hmevFhriUeBpyxPC75KW7HL07XxeZmc0Qs+bScAeTYj4KSGapN51SveV4tgj
 odP24ZCtUY/LSJqCQFM/eWgUe2YvZCp9XsKmOBnZH0ptXeOcOaup0aTQjJuiYo/17Pjw
 DmkRC1lkum8r46D53dEbTVpRc4u5+5x/kIb/6VH5R1w/EHojSr7iiCjFUc+TMc6km8S/
 4hqEpa560c2FMOCCGrrMx4QS6Eprn6eL0lKshlnRBAbbgRVVO+3XxOJhiUFd2cSB1Gzm
 7VEA==
X-Gm-Message-State: APjAAAX0Q3nLHL8PM8KcnycW95M+uxP+DRrXLoGpapWyLmiHvSYORVL+
 yhuKGt4ZbwGcICym8eh78MrGXEQ=
X-Google-Smtp-Source: APXvYqzuX/bUGktSf48gje5dDS5VMPiozApAjRV8yxUKvFqiGyVOtl2EyZFUSO8wCq3HcPH4iRrETw==
X-Received: by 2002:a9d:7a8a:: with SMTP id l10mr4794909otn.309.1576701245408; 
 Wed, 18 Dec 2019 12:34:05 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m2sm1164119oim.13.2019.12.18.12.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 12:34:04 -0800 (PST)
Date: Wed, 18 Dec 2019 14:34:04 -0600
From: Rob Herring <robh@kernel.org>
To: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
Message-ID: <20191218203404.GA2451@bogus>
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
 <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
 <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
 <f7b0afe7-e317-2422-de7e-878837f9f238@amlogic.com>
 <a8f5ab1d-264c-5b2c-e72b-3774b9f44c22@roeck-us.net>
 <1da513d7-20e1-726a-dcc4-952cbfbbe63a@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1da513d7-20e1-726a-dcc4-952cbfbbe63a@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_123406_677297_0229C4BB 
X-CRM114-Status: GOOD (  26.21  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMDM6Mzc6NDlQTSArMDgwMCwgWGluZ3l1IENoZW4gd3Jv
dGU6Cj4gSGksIEd1ZW50ZXIgTWFydGluCj4gCj4gT24gMjAxOS8xMi8xNiAyMTozMCwgR3VlbnRl
ciBSb2VjayB3cm90ZToKPiA+IE9uIDEyLzE1LzE5IDEwOjAzIFBNLCBYaW5neXUgQ2hlbiB3cm90
ZToKPiA+ID4gSGksIE1hcnRpbgo+ID4gPiAKPiA+ID4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5
Lgo+ID4gPiAKPiA+ID4gT24gMjAxOS8xMi8xMyA0OjA1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdy
b3RlOgo+ID4gPiA+IEhpIFhpbmd5dSBhbmQgUm9iLAo+ID4gPiA+IAo+ID4gPiA+IE9uIFRodSwg
RGVjIDEyLCAyMDE5IGF0IDE6MjAgUE0gWGluZ3l1IENoZW4KPiA+ID4gPiA8eGluZ3l1LmNoZW5A
YW1sb2dpYy5jb20+IHdyb3RlOgo+ID4gPiA+IFsuLi5dCj4gPiA+ID4gPiArZXhhbXBsZXM6Cj4g
PiA+ID4gPiArwqAgLSB8Cj4gPiA+ID4gPiArwqDCoMKgIHdhdGNoZG9nIHsKPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXNlYy13ZHQiOwo+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCB0aW1lb3V0LXNlYyA9IDw2MD47Cj4gPiA+ID4g
PiArwqDCoMKgIH07Cj4gPiA+ID4gaW4gdjMgb2YgdGhpcyBwYXRjaCBSb2IgY29tbWVudGVkIHRo
YXQgdGhlcmUgc2hvdWxkbid0IGJlIGFuIE9GIG5vZGUKPiA+ID4gPiBpZiB0aGVyZSBhcmUgbm8g
YWRkaXRpb25hbCBwcm9wZXJ0aWVzCj4gPiA+ID4gd2l0aCB0aW1lb3V0LXNlYyB0aGVyZSdzIG5v
dyBhbiBhZGRpdGlvbmFsIHByb3BlcnR5IHNvIG15Cj4gPiA+ID4gdW5kZXJzdGFuZGluZyBpcyB0
aGF0IGl0J3MgZmluZSB0byBoYXZlIGFuIE9GIG5vZGUKPiA+ID4gWW91ciB1bmRlcnN0YW5kaW5n
IGlzIGNvcnJlY3QuCj4gPiA+ID4gCj4gPiA+ID4gd2hhdCBJIGRvbid0IHVuZGVyc3RhbmQgeWV0
IGlzIHdoZXJlIHRoaXMgbm9kZSBzaG91bGQgYmUgcGxhY2VkLgo+ID4gPiA+IGlzIGl0IHN1cHBv
c2VkIHRvIGJlIGEgY2hpbGQgbm9kZSBvZiB0aGUgc2VjdXJlIG1vbml0b3Igbm9kZSAoZm9yCj4g
PiA+ID4gd2hpY2ggd2UgYWxyZWFkeSBoYXZlIGEgYmluZGluZyBoZXJlOgo+ID4gPiA+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS50eHQp
IG9yCj4gPiA+ID4gd2hlcmUgZWxzZSB3b3VsZCB3ZSBwbGFjZSBpdCBpbnNpZGUgdGhlIC5kdHM/
Cj4gPiA+IElNTyzCoCBBbHRob3VnaCB0aGUgd2F0Y2hkb2cgbm9kZSBuZWVkIHRvIHJlZmVyZW5j
ZSB0aGUgbWVzb25fc20KPiA+ID4gbm9kZSwgdGhlcmUgaXMgbm8KPiA+ID4gYnVzLWxpa2UgZGVw
ZW5kZW5jaWVzIGJldHdlZW4gdGhlIGRldmljZXMgd2hpY2ggdGhlIHR3byBub2Rlcwo+ID4gPiBj
b3JyZXNwb25kaW5nIHRvLgo+ID4gPiBzbyBpIHRoaW5rIHRoYXQgdGhlIHdhdGNoZG9nIG5vZGUg
YXMgY2hpbGQgbm9kZSBvZiBtZXNvbl9zbSBtYXliZQo+ID4gPiBub3QgYXBwcm9wcmlhdGUuCj4g
PiAKPiA+IFRoZSB3YXRjaGRvZyBkcml2ZXIgbmVlZHMgdGhlIG1lc29uIFNNJ3MgZHQgbm9kZSwg
YW5kIGl0IGRlcGVuZHMgb24gdGhlCj4gPiBleGlzdGVuY2UKPiA+IG9mIHRoYXQgbm9kZS4gVGhh
dCBzZWVtcyBlbm91Z2ggb2YgYSByZWxhdGlvbnNoaXAgdG8gd2FycmFudCBoYXZpbmcgaXQKPiA+
IGFzIGNoaWxkIG5vdGUuCj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBpZiBpIHRha2UgdGhlIHdk
dCBub2RlIGFzIGNoaWxkIG9mIHNlY3VyZSBtb25pdG9yCj4gKHNtKSwgaG93IHNob3VsZAo+IGkg
cmVnaXN0ZXIgb3IgZmluZCB0aGUgd2R0IGRldmljZSA/Cj4gCj4gSSBvbmx5IHRoaW5rIG9mIHRo
ZSBmb2xsb3dpbmcgdGhyZWUgbWV0aG9kcyA6Cj4gMSkuIHVwZGF0ZSB0aGUgc20gZHJpdmVy77yM
YW5kIHNjYW4mcmVnaXN0ZXIgd2R0IGRldmljZSB3aGVuIHRoZSBzbSBkcml2ZXIKPiBwcm9iZXMo
SXQgaXMgbGlrZSBpMmMpLCBidXQgdGhlcmUKPiBhcmUgdG9vIG1hbnkgY2hhbmdlcyBpbnZvbHZl
ZC4KCkp1c3QgYWRkIG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGUoKSBjYWxsIGFuZCBjbGVh
bi11cCBjYWxscy4gVGhhdCdzIApub3Qgd2hhdCBJJ2QgY2FsbCAndG9vIG1hbnkgY2hhbmdlcycu
CgogCj4gMikuIGFkZCAic2ltcGxlLWJ1cyIga2V5IHN0cmluZyB0byBjb21wYXRpYmxlIG9mIHNt
IG5vZGUsIGFuZCBpdCB3aWxsIG1ha2UKPiB0aGUgY2hpbGQgbm9kZSBpcyByZWdpc3RlcmVkIGFz
Cj4gcGxhdGZvcm0gZGV2aWNlLCBidXQgaXQgc2VlbXMgdGhhdCB0aGUga2V5IHN0cmluZyBpcyBu
b3QgbWF0Y2ggY3VycmVudAo+IHNjZW5lLgoKWW91IHByZXZpb3VzbHkgc2FpZCBpdCdzIG5vdCBh
IGJ1cy4uLgoKPiAKPiBzZWN1cmUtbW9uaXRvciB7Cj4gwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1s
b2dpYyxtZXNvbi1neGJiLXNtIizCoCAic2ltcGxlLWJ1cyI7Cj4gCj4gwqDCoMKgIHdhdGNoZG9n
IHsKPiDCoMKgwqAgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zZWMtd2R0IjsK
PiDCoMKgwqAgwqDCoMKgIHRpbWVvdXQtc2VjID0gPDYwPjsKPiDCoMKgwqAgfQo+IH0KPiAKPiAz
KS7CoCBkb24ndCByZWdpc3RlciBkZXZpY2UsIGFuZCBmaW5kIGRpcmVjdGx5IHRoZSB3YXRjaGRv
ZyBub2RlIGJ5IHVzaW5nIHRoZQo+IG9mXyogQVBJIGluIHdhdGNoZG9nCj4gZHJpdmVyIChFZzog
bGludXgtNC54L2RyaXZlcnMvdGVlL29wdGVlL2NvcmUuYykKPiAKPiBzZWN1cmUtbW9uaXRvciB7
Cj4gwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGJiLXNtIjsKPiAKPiDCoMKg
wqAgd2F0Y2hkb2cgewo+IMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNv
bi1zZWMtd2R0IjsKPiDCoMKgwqDCoMKgwqDCoCB0aW1lb3V0LXNlYyA9IDw2MD47Cj4gwqDCoMKg
IH0KPiB9Cj4gCj4gVGhlIG1ldGhvZCAzIGxvb2tzIGJldHRlciBmb3IgbWUsIGRvIHlvdSBoYXZl
IGEgYmV0dGVyIHN1Z2dlc3Rpb24gPyBUaGFua3MKPiAKPiBCUgo+ID4gCj4gPiBHdWVudGVyCj4g
PiAKPiA+IC4KPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
