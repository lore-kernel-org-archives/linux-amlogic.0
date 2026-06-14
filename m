Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2276DCD98C5
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Jun 2026 02:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNLI+oqWBZdsO+marfpB8g4HV4S6YLYhn8naz+Q4ysI=; b=qHqCSovoiw8300
	Y6FvBsghGG8UaVMxyE62FYl4GxZIaB78TPKzA57yBoobWjIYL6+5BRPHBfpJR1ejBz3b6JjevdrVT
	isMAt4jKNVSZnfEBw8LBXJwfCq56mj8I8al8t9ZGLmLpIjaBTyMORDuNXKYxP5eOwPeGgpApTVaLr
	mvJ9lJuQ0O4ldzuH7w+pjY4ao0JHUYkEhJylnzCSdRF9bnn0eU3dwKuaVsqSByFGyt2dmJwuCjTYV
	V9LhvN6uiyrrA/U/XaGdcJdg65zAwETtlWQJ2cqpmkluIIq+b+pOCgvbyWxE5OBRbUI6yICspzRZy
	SRVP4xf78qnjABCS5ijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYadS-0000000CgUx-3sjL;
	Sun, 14 Jun 2026 02:31:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYadR-0000000CgUq-2XCX
	for linux-amlogic@lists.infradead.org;
	Sun, 14 Jun 2026 02:31:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EC3F6008A;
	Sun, 14 Jun 2026 02:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51F41F000E9;
	Sun, 14 Jun 2026 02:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781404299;
	bh=yOw20AfG2+pooGtXtuJFspV/3rZPgd5XBJgt1m2qhr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtHZKELWGFvnhDX4uxjhuge0h+yEmZEOv9b3qOVGUUqMatY/Omtt5J3tj+EddjS4U
	 I3xlcMjDkzX/li0rRKL5NzL2jqX+IIQ3ydIcnNxcztUXSNQFST/30iI06c36c9HwUk
	 23tWfO+LWwkFepdCv2TEE+IcVWUyoLcXdzgUkJP0Tw+iubB7+Ee0OSpOr8rAa+Ikwe
	 gI3vDzZ8s2qOfdD3JfNLBysavb+bTQCRyngyVoLBKWkWKZcYTvwBYMUEVpsapSUJjh
	 CbnJLfZuWm+ZWvuGU2ApBLxExl11cbUWbXWIk1JB6tweD580nEkFfsJBWWotuaE+BA
	 HkiCRgLchkmug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
To: "Gowtham Kudupudi" <gowtham@ferryfair.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260614015620.20432-1-gowtham@ferryfair.com>
References: <20260614015620.20432-1-gowtham@ferryfair.com>
Date: Sun, 14 Jun 2026 02:31:39 +0000
Message-Id: <20260614023139.A51F41F000E9@smtp.kernel.org>
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

PiBPbiB3YXJtIHJlYm9vdCwgdGhlIFBDSWUgY29udHJvbGxlcidzIExUU1NNIHN0YXJ0cyBsaW5r
IHRyYWluaW5nCj4gaW1tZWRpYXRlbHkgaWYgUEVSU1QjIGlzIGFscmVhZHkgZGVhc3NlcnRlZCBm
cm9tIHRoZSBwcmV2aW91cyBib290Lgo+IFRoZSBkcml2ZXIgdGhlbiBwdWxzZXMgUEVSU1QjIGZv
ciBvbmx5IDUwMHVzLCB3aGljaCBpcyB0b28gc2hvcnQgdG8KPiBwcm9wZXJseSByZXNldCB0aGUg
ZW5kcG9pbnQgZGV2aWNlIHRoYXQgaGFzIGFscmVhZHkgc3RhcnRlZCB0cmFpbmluZy4KPiAKPiBG
aXggYnkgbW92aW5nIHRoZSBQRVJTVCMgYXNzZXJ0L2RlYXNzZXJ0IHB1bHNlIEJFRk9SRSBlbmFi
bGluZyBMVFNTTSwKPiBzbyB0aGUgZW5kcG9pbnQgZ2V0cyBhIGNsZWFuIHJlc2V0IGN5Y2xlIGJl
Zm9yZSBsaW5rIHRyYWluaW5nIGJlZ2lucy4KPiAKPiBUaGlzIHdhcyBmb3VuZCBvbiBBbWxvZ2lj
IEcxMkIgKEEzMTFEKSB3aXRoIE5WTWUgb24gYW4gTS4yIHNsb3QuCj4gQ29sZCBib290IHdvcmtl
ZCBiZWNhdXNlIFBPUiBoZWxkIFBFUlNUIyBsb3c7IHdhcm0gcmVib290IGRpZCBub3QuCj4gVGhl
IGZpeCB3YXMgY29uZmlybWVkIG9uIGEgQmFuYW5hIFBpIENNNCB3aXRoIFdhdmVzaGFyZSBJTyBi
YXNlIGJvYXJkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdvd3RoYW0gS3VkdXB1ZGkgPGdvd3RoYW1A
ZmVycnlmYWlyLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5k
IG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjE0MDE1NjIwLjIwNDMyLTEtZ293dGhh
bUBmZXJyeWZhaXIuY29tP3BhcnQ9MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
