Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CF9CA600E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkDzPZlBfnlPJ3fuV0ThIrrSuMNgaBbWh9iaJr+esRE=; b=iR9nsxsHd53XP4
	5hHbIwCdlQDPyS2G2M0Vn2Rj3gaemGYNJjfOGXtAykQUXJBkddN0NZPJwj/d6rQfFoy4sehJIX57P
	6UgPUHB7uIZyj0AOZn5IGn5TNH89mS6xLE5y3PzQl/UbRWktHEiOE182OuAM04VPTzFeauKuKYvg6
	W664g29SfU3ZD0+LT5jejU9qKeURTEIhUwBzR3DlsPYtw6E2+Xqucheqohvyd17qBMWBvi2Lf+DXe
	E5Nxy8O9KI/AhBMKDJYQbNmEHz2gIhRW5Y2H+M6+NoMzvFVZHHJq0EBkoSxWguogeRD+UV6kAgTk0
	DyrPSS/0hGWUwY6INrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjSt-00000003rdw-1Ssh;
	Thu, 08 Oct 2026 08:26:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjSs-00000003rdi-0W9X
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Oct 2026 08:26:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 896B8439B8;
	Thu,  8 Oct 2026 08:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6971F00893;
	Thu,  8 Oct 2026 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448017;
	bh=1CAsfYXouPqaPw4SppP8YN6Wq5UXbGRuoARLoWBg7oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FGT1UxWLPTie1j3ovS8QLZAZ8ZuoYPfd3fSxcOP+R9PpZhoqB9FWtqDdPY6+y1Vm/
	 PQ3mDM6Dm7rRAbheBij+U7K/b7HZOfrFs2xRWnVuOpLYaO80AJWCmK1c7lwJHUAa1n
	 Ke964HOC5WCgweWaRj1uSqmrrLnWpa6kZySif66hNEkiHWxkMb2auNr8gKxqFi6TWZ
	 wTeqKXL5PuOZu64PzGFuLQfkSOHayFlWPBR3mDhL3DhRhJAmeb2QFjOm9j/ZqYzldV
	 wrl3AgPIsDFeyQ1plPXPwGLd5B41yP9mZoHxLzwzE3AFZBct3K82pof+SzlQIfxmVA
	 +BRyT2VF5bV9w==
Message-ID: <sashiko-outbox-163838@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable
 the ethernet port
To: "Lucas Tanure" <tanure@linux.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20261007082627.63807-8-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-8-tanure@linux.com>
Date: Thu, 08 Oct 2026 08:26:56 +0000
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHRzOiBtYWdpYyBudW1i
ZXIgdXNlZCBmb3IgR1BJT0hfNiBpbnRlcnJ1cHQgaW5zdGVhZCBvZiBtYWNybwotLQoKY29tbWl0
IGY1ODVkYThkYzk1ZGE1MDUwYzVmNmE4YmQ0YjE5NjJlNjYyYWU1NDcKQXV0aG9yOiBMdWNhcyBU
YW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cgphcm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFz
LXZpbTQ6IGVuYWJsZSB0aGUgZXRoZXJuZXQgcG9ydAoKVGhpcyBjb21taXQgZW5hYmxlcyB0aGUg
Z2lnYWJpdCBldGhlcm5ldCBjb250cm9sbGVyIG9uIHRoZSBLaGFkYXMgVklNNCBib2FyZCwKY29u
ZmlndXJpbmcgaXQgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgZXh0ZXJuYWwgUmVhbHRlayBSVEw4
MjExRiBQSFkgb3ZlcgpSR01JSS4gSXQgYWxzbyBjb25maWd1cmVzIHRoZSBSR01JSSBkZWxheXMg
YW5kIHNldHMgdXAgdGhlIFBIWSBpbnRlcnJ1cHQKd2lyaW5nLgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0
cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMt
dmltNC5kdHMKPiBpbmRleCAwZmE4MzM2MmI0MTc5Li40YTJiMGI1NjM2NTU5IDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMt
dmltNC5kdHMKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1h
MzExZDIta2hhZGFzLXZpbTQuZHRzCgpbIC4uLiBdCgo+IEBAIC0yNTYsNiArMjU3LDI3IEBAIHh0
YWw6IHh0YWwtY2xrIHsKPiAgCX07Cj4gIH07CgpbIC4uLiBdCgo+ICsmZXh0X21kaW8gewo+ICsJ
ZXh0ZXJuYWxfcGh5OiBldGhlcm5ldC1waHlAMCB7Cj4gKwkJLyogUmVhbHRlayBSVEw4MjExRkQt
Q0cgKi8KPiArCQlyZWcgPSA8MD47Cj4gKwkJbWF4LXNwZWVkID0gPDEwMDA+Owo+ICsKPiArCQlp
bnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvX2ludGM+Owo+ICsJCS8qIFJHTUlJX0lOVCBvbiBHUElP
SF82ICovCj4gKwkJaW50ZXJydXB0cyA9IDwxNTQgSVJRX1RZUEVfTEVWRUxfTE9XPjsKCltTZXZl
cml0eTogTG93XQpJcyB0aGVyZSBhIHJlYXNvbiB0byB1c2UgdGhlIG1hZ2ljIG51bWJlciAxNTQg
aGVyZSBpbnN0ZWFkIG9mIHRoZSBwcmVkZWZpbmVkCkdQSU9IXzYgbWFjcm8gZnJvbSBkdC1iaW5k
aW5ncy9ncGlvL2FtbG9naWMsdDctcGVyaXBocy1waW5jdHJsLmg/IFVzaW5nIHRoZQptYWNybyBk
aXJlY3RseSBtaWdodCBpbXByb3ZlIG1haW50YWluYWJpbGl0eSBhbmQgcmVhZGFiaWxpdHkuCgo+
ICsJfTsKPiArfTsKPiArCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMDA3MDgyNjI3LjYzODA3LTEtdGFudXJlQGxpbnV4LmNvbT9w
YXJ0PTcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
