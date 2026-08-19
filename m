Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4DCC5DF85
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 19:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pl20TiGMIqI9oMMnv2DMM0icy3BEPiKDz35D2wAk5IM=; b=vavypNRLhh2/c6
	d560WjvVX2KbVmeP9Znbuj6RHV2B4SeIswUZyK/yyKryHQG6Dh3vwCxAPP30+JLhhpPkhvWzF39oh
	jgAkujKVk4j7e3FH/IRjxFhH8KVUWpv0kLCiH65W7hO2w5S9epFISgFT6cc+qXP7ixVqlt6dww3pg
	sWKHTqDsxbtdmuIEnW2cFEBJUitp1xdrKztJckFu+FAGf14ZETZfH8fv/PzYY6Pc7s1WqA5Ru1nwf
	lB03kMXTfsg7jbOJPzc6iEryoGCwYE7mQ3Q451lfnNEJIQXOdA7P+GjLlCNql0NlDeK0k8SXDI6eI
	+eCzMozQEYvUZxumJVuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlgi-0000000AQp3-0B5F;
	Wed, 19 Aug 2026 19:11:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlgh-0000000AQor-16aL
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 19:10:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D23B540320;
	Wed, 19 Aug 2026 19:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3C81F000E9;
	Wed, 19 Aug 2026 19:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166658;
	bh=Dcc723rn+1ttrxxNUtvg9nDjftZMomopk4bIpJuOrMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ibk8StY2ockBu7UazXFHaX2glAlNiYwdxRBjtkbsg9jMTEm/oEmzHzt/1Us6DOpZV
	 iVQh6/8qE+rySLhMzNZmYrFWyrVLVImdaFyqZzoz1Pk7EOPtoS1g2RQ0kEjO1Dlxlz
	 m6Dslfw3160nBkzkT0NRuilKg+D3aJbCrRCS4yYklYSb+mTyXcFXLk0M3oweRWI5TD
	 yUTeN2WY6m8yDo6owXll+fEqck1yyDf6owOerG4avanhU9tGqj4oau4pZWf7rZcT/t
	 n/oLrWRWZj1irnPOScdwdBKEzoIz2kAhh1Yv0HJ6E4SjNiCqhn4JvmdJHBKWYW7+TG
	 WlxiDuO9SpVZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 1/5] clk: ti: Make sure clk_init_data is fully
 initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-hwmon@vger.kernel.org, neil.armstrong@linaro.org, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
Date: Wed, 19 Aug 2026 19:10:58 +0000
Message-Id: <20260819191058.8A3C81F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBUaGUgY2xrX2luaXRfZGF0YSBzdHJ1Y3R1cmUgY29udGFpbnMgc2V2ZXJhbCBtdXR1YWxseS1l
eGNsdXNpdmUgbWVtYmVycwo+IGZvciBkaWZmZXJlbnQgbWV0aG9kcyB0byBzcGVjaWZ5IHRoZSBw
b3NzaWJsZSBwYXJlbnRzIG9mIGEgY2xvY2ssCj4gcHJvbXB0aW5nIGRyaXZlcnMgdG8gaW5pdGlh
bGl6ZSBvbmx5IHRoZSBtZW1iZXJzIHRoZXkgbmVlZC4gIEhvd2V2ZXIsCj4gbm90IGluaXRpYWxp
emluZyBhbGwgbWVtYmVycyBtYXkgY2F1c2Ugc3VidGxlIGlzc3Vlcywgd2hpY2ggYXJlIG9ubHkK
PiBleHBvc2VkIHdoZW4gQ09ORklHX0lOSVRfU1RBQ0tfQUxMX1BBVFRFUk4gb3IgQ09ORklHX0lO
SVRfU1RBQ0tfTk9ORSBpcwo+IGVuYWJsZWQuCj4gCj4gX3JlZ2lzdGVyX211eCgpIGZpbGxzIGlu
IGluaXQucGFyZW50X2RhdGEsIGFuZCBhc3N1bWVzIHRoYXQKPiBpbml0LnBhcmVudF9uYW1lcyBp
cyBOVUxMLiAgSG93ZXZlciwgdGhlIGxhdHRlciBpbiB1bmluaXRpYWxpemVkLCBhbmQKPiB0aHVz
IG1heSBjYXVzZSBhIGNyYXNoLgo+IAo+IE1ha2Ugc3VyZSBhbGwgbWVtYmVycyBhcmUgZnVsbHkg
aW5pdGlhbGl6ZWQsIHRvIGZpeCBzdWNoIGJ1Z3MsIGFuZCB0bwo+IGF2b2lkIGZ1dHVyZSBicmVh
a2FnZSB3aGVuIGNvbnZlcnRpbmcgZHJpdmVycyB0byBhIGRpZmZlcmVudCBtZXRob2QgZm9yCj4g
c3BlY2lmeWluZyB0aGUgcGFyZW50cy4KPiAKPiBGaXhlczogNjY3ZjQyMGMwOWYxNDE3YyAoImNs
azogdGk6IG11eDogcmVzb2x2ZSBwYXJlbnQgY2xvY2tzIGJ5IERUIGluZGV4LCBub3QgYnkgbmFt
ZSIpCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9DQU11SE1kVTN5VnFveUhDNGVO
RjJOdVlvOHd5KzZPRExvWWF0NFI3MVg5OU14Y189a3dAbWFpbC5nbWFpbC5jb20KPiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKU2Fz
aGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29r
cyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvY292ZXIuMTc4NzE2NTMyOS5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU/cGFy
dD0xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
