Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B2FC43327
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oh/OuvoDFFzYIdlJ6ZhNDa2SnrSqSFSSlKUcx/Dshp8=; b=KO7SHd+nix0+vJ
	RlZk2SuFH4tw8Yoa0RIVO+KM8sIKgQ171O6v2NH7j2PABDhNbF00psf1VoiKiyPYA7lH+ilhO7ksk
	N3nAU74S33/dMP3ZVCCBLKZGf3KK6VNSYDRzXmeILFUXF4a4lIhFL5/swzPUbc4axVPU2y/RR310O
	sEMAp9xmgXGUAIYLJ4PTqb0nqT90cTomT9yp21AjR61Zpfo7m+xn50KutAChECKLg4MmRtJ4lo1lv
	PB4UdFktsJGeQ7S/umA39TGqIqRQIb1CEo4M+O1Nw9aEpLxf1fvD2phHX+rOCE44c1Ldbhh6c+ssW
	JqdmQQ6aZRYtAtqZLM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJiw-00000004sfX-1m73;
	Thu, 02 Jul 2026 15:53:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJiu-00000004sf2-3yZ8
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:53:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38501601EE;
	Thu,  2 Jul 2026 15:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CF01F00A3A;
	Thu,  2 Jul 2026 15:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007587;
	bh=VdNLw1AHjIwxY+Vg+6eZfZKG7g2sOWOkYPUSzbquVNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MC3PiQcHKgkw7DU1S7avN4kGIlYm7M4s/1rIiEF8+uVF0PxstCS64X8FtglONBkn3
	 L/Un6l1Sqig7xrY6kWbErHshgFtUbCf6PUeBEttb0MHQOEoXdRQDk2F67/BAtEeBx5
	 d+Nqc9IiSjV1zvMkGXLr6tik41LNoMYCWyG3Q9auV8pw5bXCYKVWrSO3MtAHcNwP5X
	 x93J0kgyWx4Ya4ooIVrojwIq9/RExYYNBb1Zcbw9B6E3FnLKDAaaeRPTjvhTyAyMRh
	 xdv7dvDzmD72mctyk3Z++xp06ZDV6n4VOV/CMp4Z8cB/8jGyqIn4jgvRNM5gs9isVA
	 RCnKrscS1CJNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] fpga: dfl-fme-perf: Use sysfs_emit() for
 cpumask show
To: "Yury Norov" <ynorov@nvidia.com>
Cc: linux-cxl@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260702154725.185376-7-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-7-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:53:07 +0000
Message-Id: <20260702155307.71CF01F00A3A@smtp.kernel.org>
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

PiBjcHVtYXNrX3Nob3coKSBpcyBhIHN5c2ZzIHNob3cgY2FsbGJhY2suIFVzZSBzeXNmc19lbWl0
KCkgYW5kCj4gY3B1bWFza19wcl9hcmdzKCkgdG8gZW1pdCB0aGUgbWFzay4KPiAKPiBUaGlzIHBy
ZXBhcmVzIGZvciByZW1vdmluZyBjcHVtYXBfcHJpbnRfdG9fcGFnZWJ1ZigpLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFl1cnkgTm9yb3YgPHlub3JvdkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2
aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0t
IApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA3MDIxNTQ3MjUuMTg1Mzc2LTEteW5vcm92QG52aWRpYS5jb20/cGFydD02CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
