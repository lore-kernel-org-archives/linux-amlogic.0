Return-Path: <SRS0=ZEtl=4N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97627C35E17
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Feb 2020 21:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6585E20675
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Feb 2020 21:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjSq1osQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=easyb-ch.20150623.gappssmtp.com header.i=@easyb-ch.20150623.gappssmtp.com header.b="oveJUVfN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6585E20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JABV77t/i38f5HTKadRCNYhxdukOrvt8HqERm0avGI=; b=WjSq1osQ/c4w1I
	/+Cm3ahr6r99lx3Q/vWin/ItAhTZ/QDNkeGylrSCzpsg9cwuzzYhpd8zqBkp9r/fpW5jVZniO5ShY
	k+4ySEepQNlKA6+4KLLmvF5udjVwWSGZCoZhUdxOXCj2aVeTfzoyrfTqyLhsL8o+OauAebergpiNo
	X1oQh+LtmIW3heCqaesB9/LltqHV4koHr2as4cuaRhQMhKDibHLf2h82CnmVmUPhWfyfm99+znn+v
	3rLBbqyB+8cp54iq5afvu5n5cZpYLY6VbVjt+n3R947bIeUqlJV6SxJQgD8Y5P2NJQ4QYlquIZzLf
	Z3/T3jJL3TfSLJrAFNxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6hyv-0005jM-Io; Tue, 25 Feb 2020 21:43:09 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6hyq-0005hg-Qh
 for linux-amlogic@lists.infradead.org; Tue, 25 Feb 2020 21:43:08 +0000
Received: by mail-wm1-x344.google.com with SMTP id m3so854130wmi.0
 for <linux-amlogic@lists.infradead.org>; Tue, 25 Feb 2020 13:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=easyb-ch.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kEVJ1n2NxQ1glfbZ9e15foebWC3MxMe0p/5A/jyD6H0=;
 b=oveJUVfN4mGmIby/KrplpWvi32NOCpmb1Fej6u+eU25j1sso9bxSCmnS1HYlP5k+TS
 MN55kLyOOXTrI5QiCGtP00bRnkJxE6q+aUpqdFsAsXwQh0dvu55FS/TXrAVS/ae6mu1l
 NAlvopKlSspPGtPCVj0mdTNuFv+ZfhgIinLqRNatsNKvQI8KxR0B1VAiDYp321L4gtUZ
 g8u+mkFIDr2NdhUV2f4JbQ3BTA7fhSsIoCINRAOSYNlefs7F0PuxzSG5YkiVtBklT+fO
 oaD/MUhWA0PqDh9MWO9s+RAgppI/P3ICunuQwVb2PDrJVH31q6jq8+vTKG+aECdrMlUL
 Kc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kEVJ1n2NxQ1glfbZ9e15foebWC3MxMe0p/5A/jyD6H0=;
 b=Lz/mUjyEbTLi8Ll/+AoqefpeL5PAYywaBkaF2Ii41R72y0jXzU4oJ/sqfIO50Q0YsV
 rU5kDdsGGRnDqKe34UOQ3eRsL8w7MhVNotdANhIA/ER8xAOU7bp8RYumQNBPGfQgZMNd
 i4gsMpT9quXbCJj1OpGPEKlpot7QzwKdb6tKzuM8gt/DUn9fhHzqsHCrJByi9zkoYyT+
 fPJ1hq/Ej80UpomSuVAl1bJMuzo3VEVep2AJw7VaRppwX3TTI/pAlhM1Bv/Y5B1UOmJ7
 5ThsHT+Vw+We18UhqRrRaq6zH8ClMXquHweyQnEjuzyIdPvngxWSgz+xX8XLUZK8kU9W
 8E6g==
X-Gm-Message-State: APjAAAU4kuPoUyth8be3TxrCgy8GrFQjQVrz14qQTf2Vbeil9T/rIaeo
 wxllgMnw/tIR8/sEZXR/9/eMmQ==
X-Google-Smtp-Source: APXvYqzT6vU3uivqK3LFISSNim+ES8rBV5I3PSPpMQoyPtAT6binkjIz4QcxUjjxxm7ATqtLrWgIdA==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr1188559wmc.52.1582666980570; 
 Tue, 25 Feb 2020 13:43:00 -0800 (PST)
Received: from ?IPv6:2001:1715:4e22:c580:ed96:156f:9663:e7e4?
 ([2001:1715:4e22:c580:ed96:156f:9663:e7e4])
 by smtp.gmail.com with ESMTPSA id f1sm212602wro.85.2020.02.25.13.42.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 13:43:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [RFC 00/25] arm64: realtek: Add Xnano X5 and implement
 TM1628/FD628/AiP1618 LED controllers
From: Ezra Buehler <ezra@easyb.ch>
In-Reply-To: <04e7d7cd-a8bc-621b-9205-1a058521cabe@arm.com>
Date: Tue, 25 Feb 2020 22:42:57 +0100
Message-Id: <E33E27B9-D33C-4182-A5B1-C72FA40470BC@easyb.ch>
References: <20191212033952.5967-1-afaerber@suse.de>
 <7110806f-ddbd-f055-e107-7a1f7e223102@arm.com>
 <c86c6bc0-b0e5-c46e-da87-9d910b95f9f3@suse.de>
 <04e7d7cd-a8bc-621b-9205-1a058521cabe@arm.com>
To: Robin Murphy <robin.murphy@arm.com>,
 =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_134305_012546_76FD654B 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, csd@princeton.com.tw,
 linux-realtek-soc@lists.infradead.org, sales@fdhisi.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 zypeng@titanmec.com, linux-amlogic@lists.infradead.org,
 Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUm9iaW4sCkhpIEFuZHJlYXMsCgo+IE9uIDEzIERlYyAyMDE5LCBhdCAxNTowNywgUm9iaW4g
TXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4gCj4gSSBhbHNvIGhhdmUgb25l
IG9mIHRoZSBIOTYgTWF4IGJveGVzICh3aGljaCBJIHBpY2tlZCB1cCBvdXQgb2YgY3VyaW9zaXR5
Cj4gZm9yIHRoZSBteXN0ZXJpb3VzIFJLMzMxOCkgd2l0aCBhbiBGRDY1NTEsIGFsdGhvdWdoIEkn
dmUgbm90IGF0dGFja2VkCj4gdGhhdCBvbmUgd2l0aCB0aGUgbG9naWMgYW5hbHlzZXIgeWV0IHRv
IHNlZSBob3cgc2ltaWxhciBpdCBpcy4KCkkgaGF2ZSBhIFQ5IChSSzMzMjgpIFRWIGJveCB3aXRo
IHRoZSBzYW1lIGNoaXAgaW4gaXQuIFRoZSBGRDY1NTEgdXNlcyBhbgpJMkMtbGlrZSBwcm90b2Nv
bC4gRXZlcnkgZGlnaXQgKGFuZCB0aGUgc3ltYm9scykgaGF2ZSBhbiBJMkMgYWRkcmVzcywKYnV0
LCB0aGUgZGlzcGxheSBkb2VzIG5vdCBzaWduYWwgQUNLLiBBRkFJSyB0aGUgRkQ2NTAgYW5kIEZE
NjU1IHdoaWNoCmFyZSB1c2VkIGluIG90aGVyIGJveGVzIChBbWxvZ2ljKSBhcmUgdmVyeSBzaW1p
bGFyLgoKU28gZmFyLCBJIGhhdmUgd2hpcHBlZCB1cCBhIHByb29mLW9mLWNvY2VwdCBkcml2ZXIg
dGhhdCB1c2VzIGkyYy1ncGlvLgpUaGUgZGlnaXRzIHNlZW0gdG8gYmUgcm90YXRlZCBieSAxODAg
ZGVncmVlcy4gU28sIGluIG9yZGVyIHRvIHVzZQptYXBfdG9fN3NlZ21lbnQuaCBJIGhhZCB0byBk
ZWZpbmUgdGhlIEJJVF9TRUc3XyogY29uc3RhbnRzIGRpZmZlcmVudGx5LgpNeSBkaXNwbGF5IGFs
c28gaGFzIG11bHRpcGxlIHN5bWJvbHMgKFdJRkksIG5ldHdvcmssIHBhdXNlLCBwbGF5LCBVU0Is
CmFsYXJtKSB0aGF0IGFyZSBjb250cm9sbGVkIGJ5IHdyaXRpbmcgdG8gdGhlIHNhbWUgYWRkcmVz
cyBhcyBmb3IgdGhlCmNvbG9uLgoKSeKAmWQgbG92ZSB0byB3b3JrIG9uIGEgZHJpdmVyIChzaW1p
bGFyIHRvIEFuZHJlYXPigJkgU1BJIGJhc2VkIGRyaXZlcikgZm9yCnRoZXNlIEkyQyBjb25uZWN0
ZWQgY2hpcHMuCgpDaGVlcnMsCkV6cmEuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
