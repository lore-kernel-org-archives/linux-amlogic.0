Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35E7C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 21:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2X0B4dE74U2I9l1EHvw6fvJfgE0CtFpr1PugSrz5Yg0=; b=Xug5f5E5q5oQjj
	PZQgnUAoWa2L7o0xrsXOHABgSAqCswFfXFuY27d/FLytNWj1dty0QHjyNvQocWPU1edcS5m+RmvHR
	ZWLJ73kJKJ7RLKHg3T+8Ap9BObZX51vPvCCWr0K0bAkV35l7cvrXc58XN4mXxk1o6skhClwSB7aN4
	YxQ3Jfx1Fs8hcP4ChupFxNp5+2fkcanMVb/UGtkFXmn60okl5/so0BXnouR0axWBp+1UW5/G1L5Me
	5QkL40WfAFMObNUrCcS9CWUwCqztLmlzFNy4m/JQ6iurDI8VmT8XvtiiVcQWcOUru8IJmQsOnpfXs
	UzokvAmGF0Pd2zaRg2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOnSx-00E8JU-TE; Mon, 28 Feb 2022 21:21:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOnSu-00E8IR-RW; Mon, 28 Feb 2022 21:21:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C72AB81195;
 Mon, 28 Feb 2022 21:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AECC340F1;
 Mon, 28 Feb 2022 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646083314;
 bh=V+xFj8FOhP9mS0Y/ZN938c7a+qfRt25LEtVSf8sSyT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BwV9zWR5dGsrXkUCfsWbV0kPJKZMThpJ6Lc0b5cxYaeqxlrMC6Xh9Y2uZ1XV/jEsl
 kwVG/VE17VvWJtjhWSyNYEhUjIdNzPwvU6r2fM545pdkxCVQMxg6nV7NtvWAiUH+6z
 cxJwQeW7+BzOhHceerE2kKHZCaQ6VxhL0cT8F7lI=
Date: Mon, 28 Feb 2022 22:21:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Message-ID: <Yh087tJhakKHs88e@kroah.com>
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_132157_056569_EB92D022 
X-CRM114-Status: GOOD (  12.61  )
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

T24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMDM6MTM6NDhQTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGksCj4gCj4gT24gMjgvMDIvMjAyMiAxNDo1NSwgWXUgVHUgd3JvdGU6Cj4gPiBE
ZXNjcmliZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9jayB1c2lu
ZyBhIGNsb2NrCj4gPiBmcmFtZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0
IFJvYm90IGNvbXBpbGF0aW9uIGVycm9yCj4gPiBkdWUgdG8gQ09NTU9OX0NMSyBkZXBlbmRlbmN5
Lgo+ID4gCj4gPiBGaXhlczogKCJ0dHk6IHNlcmlhbDptZXNvbjogRGVzY3JpYmVzIHRoZSBjYWxj
dWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBjbG9jayBmcmFtZeKA
nCkKPiAKPiBBcyBJIGFscmVhZHkgcmVwbGllZCBvbiBWMiBvZiB0aGlzIHBhdGNoLCB5b3UncmUg
aW52aXRlZCB0byBhcHBseSB0aGVzZSBmaXhlcyBkaXJlY3RseQo+IG9uIHRoZSBuZXh0IHZlcnNp
b24gb2YgeW91ciAiVXNlIENDRiB0byBkZXNjcmliZSB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2si
IHBhdGNoc2V0Cj4gYW5kIG5vdCBhcyBhIHNlcGFyYXRlIHBhdGNoLgoKTm8sIHRoaXMgaXMgYnJv
a2VuIGluIGxpbnV4LW5leHQgbm93IGFzIHRoZSBwYXRoIGxpc3RlZCBoZXJlIGlzIGluIG15CnRy
ZWUgcmlnaHQgbm93LgoKSSBuZWVkIGEgZml4IGZvciBpdCwgb3IgSSBjYW4gcmV2ZXJ0IHRoZSBv
cmlnaW5hbC4KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
