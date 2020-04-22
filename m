Return-Path: <SRS0=3eID=6G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4C9C54FCB
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 17:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4B62076E
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 17:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aeXFgwed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4B62076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UT1viPABVOg2M3yz4EeQ9RdNDPHW/hDsjxYPF4F/lw=; b=aeXFgwedgtXy3W
	Aj2GIjHkMiWY4c4XCN/zXyC7NGAItxjvP9KQPZAeD4Gxc+Avpvy/lc5bb8TFD/yOfWLcIFEiJ0zSH
	eG+/jEPeCp6DgHxfarBQ8u4xD3xEWaJ/aQ5z8OH86G+UBUsrul1bhdzKx8Ol8y8QxjnTKFNlwApL3
	+AnzaSMuYgQWNA1qavn0AbyMxYxEaJ9sSVhdZnL6hXX+Z5vKqKJmGLFLsioSgrN7V+UQFbXQAoDJY
	/Uq9QIHRRrOoRIQtlg+S7e3XlNGITvybMS/mJpjntiAv9cYOV+qEXRc+DlftM9hJlj43+xl+AXQhZ
	f0J+N5PjCxGsNeVUjIHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRJME-0001EK-A0; Wed, 22 Apr 2020 17:40:22 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRJM5-0007sp-0k
 for linux-amlogic@lists.infradead.org; Wed, 22 Apr 2020 17:40:14 +0000
Received: from [192.168.1.91] (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
 by mail.holtmann.org (Postfix) with ESMTPSA id D0B23CECFD;
 Wed, 22 Apr 2020 19:49:44 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 0/3] Bluetooth: hci_qca: add support for QCA9377
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200421081656.9067-1-christianshewitt@gmail.com>
Date: Wed, 22 Apr 2020 19:39:36 +0200
Message-Id: <D965D634-A881-43E0-B9F8-DF4679BB9C6D@holtmann.org>
References: <20200421081656.9067-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_104013_266339_2D87E6D1 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0aWFuLAoKPiBUaGlzIHNlcmllcyBhZGRzIGEgbmV3IGNvbXBhdGlibGUgZm9yIHRo
ZSBRQ0E5Mzc3IEJUIGRldmljZSB0aGF0IGlzIGZvdW5kCj4gaW4gbWFueSBBbmRyb2lkIFRWIGJv
eCBkZXZpY2VzLCBtYWtlcyBtaW5vciBjaGFuZ2VzIHRvIGFsbG93IG1heC1zcGVlZAo+IHZhbHVl
cyBmb3IgdGhlIGRldmljZSB0byBiZSByZWFkIGZyb20gZGV2aWNlLXRyZWUsIGFuZCB1cGRhdGVz
IGJpbmRpbmdzCj4gdG8gcmVmbGVjdCB0aG9zZSBjaGFuZ2VzLgo+IAo+IENocmlzdGlhbiBIZXdp
dHQgKDMpOgo+ICBkdC1iaW5kaW5nczogbmV0OiBibHVldG9vdGg6IEFkZCBkZXZpY2UgdHJlZSBi
aW5kaW5ncyBmb3IgUUNBOTM3Nwo+ICBCbHVldG9vdGg6IGhjaV9xY2E6IGFkZCBjb21wYXRpYmxl
IGZvciBRQ0E5Mzc3Cj4gIEJsdWV0b290aDogaGNpX3FjYTogYWxsb3cgbWF4LXNwZWVkIHRvIGJl
IHNldCBmb3IgUUNBOTM3NyBkZXZpY2VzCj4gCj4gLi4uL2JpbmRpbmdzL25ldC9xdWFsY29tbS1i
bHVldG9vdGgudHh0ICAgICAgICAgfCAgNSArKysrKwo+IGRyaXZlcnMvYmx1ZXRvb3RoL2hjaV9x
Y2EuYyAgICAgICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKy0tLS0tLS0KPiAyIGZpbGVz
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgp0aGUgc2VyaWVzIGRv
ZXNu4oCZdCBhcHBseSBjbGVhbmx5IGFnYWluc3QgYmx1ZXRvb3RoLW5leHQgdHJlZS4gQ2FuIHlv
dSBwbGVhc2UgcmVzcGluIGl0LgoKUmVnYXJkcwoKTWFyY2VsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
