Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53A6C282F6
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 08:59:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF27F2084A
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 08:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/yR0xu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF27F2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ECdotUwQDjk+mqbCHUDtXI7bQjWQ9/W2hLksapgtaZs=; b=F/yR0xu5+8BwnCCgIRCLP7Am6
	7tQHBJhCAjqWIMbtwYMGc0rcRKCfv3iLFfM/Gj/xN6Jgq6+ckbcI9/VJ4p63URIM8Xp/tSBh/VjWD
	xjZsJHURRM+aELcwlzUPTWR18hcCm4PpUBqqCSzwVzSoS6Fpmgu1p0GAovChp2W87y4snE9ZLkLsj
	4d3fIUFdKnKvn29ygpDj51pjyc4Sz7AY+WIUYyNiBM+Wv2OSGDBsUQa0LX4vv20SXKVzgOTANtV/e
	66sGdi+zxT83CwKpwEdmZpSwVKosR9pBo1uraJODjeIFUqHdugVXyRX99/GmFvNt/OTyRv6lUB0jM
	Jcz8gR/RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glVQO-0006Tb-JP; Mon, 21 Jan 2019 08:59:20 +0000
Received: from mail-sz2.amlogic.com ([211.162.65.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glVQC-0006Jq-14; Mon, 21 Jan 2019 08:59:09 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz2.amlogic.com
 (10.28.11.6) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Mon, 21 Jan
 2019 16:59:42 +0800
Subject: Re: [PATCH] MAINTAINERS: Add entry for Amlogic NAND controller driver
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>
References: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
 <20190120160605.33689354@xps13>
 <3f098e44-9d9b-3d0a-3e19-5913077aeb07@amlogic.com>
 <20190121092106.2c97ebe2@xps13>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <54e8156f-2362-21db-3e6c-e5b68147c49c@amlogic.com>
Date: Mon, 21 Jan 2019 16:59:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121092106.2c97ebe2@xps13>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz2.amlogic.com (10.28.11.6) To mail-sz2.amlogic.com
 (10.28.11.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_005908_071133_FB990024 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVs77yMCgpPbiAyMDE5LzEvMjEgMTY6MjEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgSmlhbnhpbiwKPiAKPiBKaWFueGluIFBhbiA8amlhbnhpbi5wYW5AYW1sb2dpYy5jb20+IHdy
b3RlIG9uIE1vbiwgMjEgSmFuIDIwMTkKPiAxMjoxODoxOCArMDgwMDoKPiAKPj4gSGkgTWlxdWVs
LAo+Pgo+PiBPbiAyMDE5LzEvMjAgMjM6MDYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBIaSBK
aWFueGluLAo+Pj4KPj4+IEppYW54aW4gUGFuIDxqaWFueGluLnBhbkBhbWxvZ2ljLmNvbT4gd3Jv
dGUgb24gU3VuLCAyMCBKYW4gMjAxOQo+Pj4gMDE6MDI6MzUgKzA4MDA6Cj4+PiAgICAKPj4+PiBB
ZGQgZW50cnkgZm9yIEFtbG9naWMgTkFORCBjb250cm9sbGVyIGRyaXZlciBhbmQgaXRzIGJpbmRp
bmdzWzBdLgo+Pj4+Cj4+Pj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTU0NzU2
NjY4NC01NzQ3Mi0xLWdpdC1zZW5kLWVtYWlsLWppYW54aW4ucGFuQGFtbG9naWMuY29tLwo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTGlhbmcgWWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFueGluIFBhbiA8amlhbnhpbi5wYW5AYW1sb2dpYy5jb20+
Cj4+Pgo+Pj4gSWYgeW91IGFyZSB0aGUgYXV0aG9yIG9mIHRoZSBwYXRjaCB5b3VyIFNpZ25lZC1v
ZmYtYnkgc2hvdWxkIGNvbWUgZmlyc3QuCj4+IE9LLgo+Pj4KPj4+IEFsc28sIHdoeSBpcyBMaWFu
ZyB0aGUgTWFpbnRhaW5lcj8gV2h5IG5vdCB5b3U/Cj4+PiAgICAKPj4gWWFuZ2xpYW5nIGlzIEFt
bG9naWMgbWFpbnRhaW5lciBmb3IgTkFORCBjb250cm9sbGVyLiBBbmQgYWxsIHBhdGNoZXMgYWJv
dXQgYW1sb2dpYyBOQU5EIGNvbnRyb2xsZXIgYXJlIGZyb20gaGltLgo+IAo+IE1heWJlIGJ1dCBo
ZSBuZXZlciB3cm90ZSB0byB0aGUgTUwsIHRoZSBtYWludGFpbmVyIG1heSBiZSBzb21lb25lIGVs
c2UKPiB0aGFuIHRoZSBvcmlnaW5hbCBhdXRob3IsIEkganVzdCB3YW50IHNvbWVvbmUgdG8gcmV2
aWV3IHBhdGNoZXMgYW5kCj4gaGVscCB0byBtYWludGFpbiB0aGUgZHJpdmVyLgo+IAo+IFlhbmds
aWFuZyBhcmUgeW91IHdpbGxpbmcgdG8gZG8gdGhhdD8KPiBPZiBjb3Vyc2UuaXQgaXMgbXkgcGxl
YXN1cmUgYW5kIHJlc3BvbnNpYmlsaXR5Lgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gLgo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
