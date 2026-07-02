Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAEDC43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRWEUHoxhUfl0Ez/C+ZGaxn7vkJaqoZH/NNfZ4Fz30w=; b=4/7R9g5m3wsN7k
	3zRawHMnVN+x3xdFbdc/jenZHicbaVhcZhX4ZLgR7LWWViWVk1/kxH5FSpemFK2O/bXGXRSgWOyw3
	Vak1WvJz/6GOshJhAkRZ7CGKKQdt4UNF2Alsv2F3XSi4PIoLI4gHgSxqjUmsPHZyEj5d57ZuuJkxp
	jarHOfYjDEvz/Yd8vsB6XRkPxPToYFcFwgpHwJ/zPMZ35T3txbFYC04CivxU9xsfT41DqzpUnoHK+
	tn84EkNsRk/FnjYG7oaTFMUvdBVlhiBcnQUqmUwM9fWgJ7OXb3ig/3KbSLCjHWLaHi5W2vBNrCUWL
	DaFf8NViSSjRpZQHgunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJkP-00000004t1X-2EHv;
	Thu, 02 Jul 2026 15:54:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJkN-00000004t11-43vd
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:54:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AAF8601CA;
	Thu,  2 Jul 2026 15:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834611F000E9;
	Thu,  2 Jul 2026 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007679;
	bh=8DpRdJlKp0NLSVeG6yHqG2WxtfQ2nid5FhBc7YJdFuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YgMJFmo0PARjRUpeuMqgsWtc84hOQjvENFt2QlgyRsbkRdlI49Q0NWvR6k6BVoILE
	 j2j6zqTQq9wynsNK6REz5sM/HdSdvymbA6yQfSai9WEI333nUYoXduXcEsCLzl40X/
	 JsL7kGklixV+YoTNE71etnaLv1+BvdUYwhhfzwhHFuttajMqYlj+xnKU66cl34mBX4
	 ciXFSXBgXoqr2M92mofitAtR6RCyF1GDzcIFgh1prETw/UmDzVfKfoJxiP8AtwjQpI
	 I1zuyx/E1kQzO1HpU2+pt9SnYbrbmN0FwjmuoftGdzuE+i1iOx5Nge/n6NpgxPspWo
	 YQgJdx7YjBMVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] x86/events: Use sysfs_emit() for cpumask show
 callbacks
To: "Yury Norov" <ynorov@nvidia.com>
Cc: linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, neil.armstrong@linaro.org, linux-cxl@vger.kernel.org, linux-perf-users@vger.kernel.org
In-Reply-To: <20260702154725.185376-4-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-4-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:54:37 +0000
Message-Id: <20260702155438.834611F000E9@smtp.kernel.org>
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

PiBUaGVzZSBjYWxsYmFja3MgYXJlIHN5c2ZzIHNob3cgcGF0aHMuCj4gCj4gVXNlIHN5c2ZzX2Vt
aXQoKSBhbmQgY3B1bWFza19wcl9hcmdzKCkgdG8gZW1pdCB0aGUgbWFza3MuCj4gCj4gVGhpcyBw
cmVwYXJlcyBmb3IgcmVtb3ZpbmcgY3B1bWFwX3ByaW50X3RvX3BhZ2VidWYoKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBZdXJ5IE5vcm92IDx5bm9yb3ZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFzIHJl
dmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwNzAyMTU0NzI1LjE4NTM3Ni0xLXlub3JvdkBudmlkaWEuY29tP3BhcnQ9MwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
