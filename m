Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A11C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 21:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqLWrvBVNYDUgmcaA1GQzk4un2C7e14fp2dBO66/DrY=; b=kjIciD2nR7bPRF
	Up4HhoWD6W/6H5wycU5DQlmBRF4U4FtAStn1Uz6mlxrKpVGQZaU2dC3r/mMnhJR6LjskMKMdeSS58
	6xajlhvli18MKvNNSBspJ/CBqOUlWlUJtQEiyV6CDqN3bofY4dueQJpeyT8g/4Waplm7i0ji86c5e
	FLmCbeczDmjW0Skt5wvR0J3HUd2mhdkKZjScx418UpfH4B234fS4wGNTGbRMrm25utQFC1XUY0FIg
	aITmAObhzRRyaNFSC02Zg7dhU1iwkHfqtFKv8KDDc5eJS8Wz0j1PXCUCt4ZQn3QdBYTToijVOl/v0
	EBAZkRptUHEmM2hFUWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOnTq-00E8Sm-T4; Mon, 28 Feb 2022 21:22:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOnTo-00E8S0-7o; Mon, 28 Feb 2022 21:22:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACC3161130;
 Mon, 28 Feb 2022 21:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77792C340F1;
 Mon, 28 Feb 2022 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646083370;
 bh=tb2aIw9Bk+OfDUZ8YaWhmfxIxuM92KdPR56wkPBsvsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bdcFSOxpLoF8NXjbhXbxwfujjSxgRuvZMDBnNuRO5mRQK65qplNufblSQ4EkU5f3f
 4o51om4pGE+VIfO1W7yN7D2twnlCsaSlFxabKdvbgA3aiU9/HCGtNNT7ceOSdqEs1N
 TSyN7btlGjzISAn5trz6m64c0y82iNjghJxb6qG0=
Date: Mon, 28 Feb 2022 22:22:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH V2] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Message-ID: <Yh09JjLDuqoTFCbX@kroah.com>
References: <20220228090351.9976-1-yu.tu@amlogic.com>
 <790952bd-b066-0b41-545c-1f65cd4244af@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <790952bd-b066-0b41-545c-1f65cd4244af@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_132252_343394_A657375C 
X-CRM114-Status: GOOD (  11.44  )
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

T24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMTA6NTI6MTVBTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gaSwKPiAKPiBPbiAyOC8wMi8yMDIyIDEwOjAzLCBZdSBUdSB3cm90ZToKPiA+IERl
c2NyaWJlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5n
IGEgY2xvY2sKPiA+IGZyYW1lLiBGb3Jnb3QgdG8gYWRkIGluIEtjb25maWcga2VybmVsIHRlc3Qg
Um9ib3QgY29tcGlsYXRpb24gZXJyb3IKPiA+IGR1ZSB0byBDT01NT05fQ0xLIGRlcGVuZGVuY3ku
Cj4gPiAKPiA+IEZpeGVzOiA0NDAyM2I4ZTFmMTQgKCJ0dHk6IHNlcmlhbDptZXNvbjogRGVzY3Jp
YmVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBj
bG9jayBmcmFtZeKAnCkKPiAKPiBBRkFJSyB0aGlzIGNvbW1pdCBpcyBub3QgaW4gYW4gdXB0cmVh
bS9mZWF0dXJlIGJyYW5jaCwgc28geW91IHNob3VsZCBzaW1wbHkgZml4IHlvdXIgYFVzZSBDQ0Yg
dG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrYCBpbnN0ZWFkLgoKVGhpcyBjb21t
aXQgaXMgaW4gbXkgdHJlZSBhbmQgaW4gbGludXgtbmV4dCwgaXQgaXMgY29ycmVjdGx5IGxpc3Rl
ZApoZXJlLgoKdGhhbmtzLAoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
