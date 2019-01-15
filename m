Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694C7C43612
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3951D20645
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Se9ij9ki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3951D20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KFNPpoqTtGhb8dfbj8dGfGZ8DEJS6LJmmsDoCwq0b4=; b=Se9ij9ki08mnom
	zpcTkhSx1K6cvOu9SMEniIexNDJK8vX5s3EWAjIibBe8ScyKJv4QnmrkujQ+viHDbbfstp6ze6efO
	bRK/FgZmyZ4L93/UVFKZ7IW0UofhstB0q37W8RwRmneEOhLHRz0f7RQwPJwHNAEf+GNax0ovEmtOg
	hhbN9o0/t/uTkiijLzeNM9naJdkjnnXI6BqPHaLQ4NNXNf2USlbFaCZtFJrgFMeM4pyagL4J4JNSj
	oqjN0LwUhlMqhX3AHhmDWi0xuayCm+5bQIQFRYbZ5rVcpmEIROLT/+7w0CiTz6tSRuWXF2okyGxF2
	S1rbu6OwYUUabuLrdsmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRxJ-0003r7-D5; Tue, 15 Jan 2019 16:52:49 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRxG-0003qh-RC; Tue, 15 Jan 2019 16:52:48 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 856E920A9B; Tue, 15 Jan 2019 17:52:45 +0100 (CET)
Received: from xps13 (173.203.136.77.rev.sfr.net [77.136.203.173])
 by mail.bootlin.com (Postfix) with ESMTPSA id 0F2BA207A3;
 Tue, 15 Jan 2019 17:52:34 +0100 (CET)
Date: Tue, 15 Jan 2019 17:52:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v9 0/2]  mtd: rawnand: meson: add Amlogic NAND driver
 support
Message-ID: <20190115175232.3d82d4a9@xps13>
In-Reply-To: <1547566684-57472-1-git-send-email-jianxin.pan@amlogic.com>
References: <1547566684-57472-1-git-send-email-jianxin.pan@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_085247_015552_97A708F1 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSmlhbnhpbiwKCkppYW54aW4gUGFuIDxqaWFueGluLnBhbkBhbWxvZ2ljLmNvbT4gd3JvdGUg
b24gVHVlLCAxNSBKYW4gMjAxOQoyMzozODowMiArMDgwMDoKCj4gVGhlc2UgdHdvIHBhdGNoZXMg
dHJ5IHRvIGFkZCBpbml0aWFsIE5BTkQgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9naWMgTWVzb24K
PiBTb0NzLCBjdXJyZW50IGl0IGhhcyBiZWVuIHRlc3RlZCBvbiBHWEwocDIxMikgYW5kIEFYRyhz
NDAwKSBwbGF0Zm9ybS4KPiAKPiBDaGFuZ2VzIHNpbmNlIFY4IGF0IFs5XQo+ICAtIGZpeCBidWls
ZCBmYWlscmUgYXQgb2JqZWN0X2lzX29uX3N0YWNrCj4gIC0gdXBkYXRlIEtjb25maWcgYXMgTWFy
dGluJ3Mgc3VnZ2VzdGVkCgpUaGFua3MgZm9yIHRoaXMgbGFzdCB2ZXJzaW9uLCBsb29rcyBnb29k
IHRvIG1lLiBDb3VsZCB5b3UgcGxlYXNlIHNlbmQgYQpwYXRjaCB0byBhZGQgYSBNQUlOVEFJTkVS
UyBlbnRyeT8KCkFsc28sIGNhbiB3ZSBmYWNlIGFueSBkZWFkbHkgZmFpbHVyZSBpZiBzb21lb25l
IGNvbXBpbGVzIHRoaXMgZHJpdmVyCndpdGhvdXQgdGhlIE1NQyBjbG9jayBkcml2ZXIgdXBkYXRl
ZD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
