Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F90CA5FC5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YV3PAO1f3TNbesZ7nHAFkRR2gt0YL4Fjr00PtI6vbzQ=; b=MKN4FrxaIyvNKm
	ef03wvx5t+PRFT6XmASRt46Rn6NCkeLktH7V3l3oQKLTmgTZbvA/KFsPG84zaWnC7ekhBTYxyiruE
	gTWPgp4qfrPVArfzyNxfjF5PVp41ODYbBpBRt+9IUGWNRetubKk3QLNrxzUrKSS+qlWHYtMD/LDcj
	TDv3qYl7QU+uJIjRNU0h4gRPIU6XyvDvnIAl2jueEdtUo5j2lwfAQ4ae1DIH5ZCEoFtIPzTEGv/pT
	tQufswjSdrcmX9MF5JidcOLjHQdmZo6cZeAFqG7E2Yt6S33pFhjd5rUtWnWt6qELoxWOZZy0UhF8P
	+NcnXVpNct/SLG2ngTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvlU-00000006P1R-2zeJ;
	Wed, 30 Sep 2026 14:58:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvlT-00000006P1E-3YgP
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Sep 2026 14:58:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F70060008;
	Wed, 30 Sep 2026 14:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A731F000FF;
	Wed, 30 Sep 2026 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780314;
	bh=tFj9yR3EXVaeVdREWg0XI2y3eNg2mzE+ylxexSPDH/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e1KzxnuxG07qlr1S3sfMl02qxZmyyUpZH9fdASTPMCTtXHL+3ctVdE1Vbs3i+yOtb
	 A5msLb1OPELHFxUwAWVfoDyFEpRx8BMxZ2+Fj5t6YFJVbYBWOvTRxJuwRUqhpoXu0L
	 mfYXtidFGtS2vmIVRVgGSnCfVxycRc+qpxA5jKs56/kyjm530a7rogvN3+wKLXyGEM
	 L1c5OlA6FHB+2pO83ER+Uts/5Y67f3XT2Ig2v7AHCxhmfkAL7zitoV+0RgToNyKGHD
	 zYgD7SM63as5/aFrOZdS4DkxzLCEZqKX+Yae/k5ru81JgnER6VucuxQE1REqpeWRFW
	 7RQAAqWskTccg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/4] PCI: Update saved Max Payload Size in
 pcie_set_mps()
To: "Niklas Cassel" <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260930145017.1356088-7-cassel@kernel.org>
References: <20260930145017.1356088-6-cassel@kernel.org>
 <20260930145017.1356088-7-cassel@kernel.org>
Date: Wed, 30 Sep 2026 14:58:33 +0000
Message-Id: <20260930145834.92A731F000FF@smtp.kernel.org>
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

PiBwY2llX3NldF9tcHMoKSBjaGFuZ2VzIHRoZSBNYXggUGF5bG9hZCBTaXplIChNUFMpIGluIHRo
ZSBEZXZpY2UgQ29udHJvbAo+IHJlZ2lzdGVyIGJ1dCBsZWF2ZXMgdGhlIGNvcHkgc2F2ZWQgYnkg
cGNpX3NhdmVfc3RhdGUoKSBhbG9uZSwgc28gdGhlIG5leHQKPiBwY2lfcmVzdG9yZV9zdGF0ZSgp
IHB1dHMgYmFjayB0aGUgb2xkIHZhbHVlLgo+IAo+IFRoZSBQQ0kgY29yZSBkb2VzIGNoYW5nZSB0
aGUgTVBTIG9mIGRldmljZXMgd2hvc2Ugc3RhdGUgaGFzIGFscmVhZHkgYmVlbgo+IHNhdmVkOiBw
Y2lfY29uZmlndXJlX21wcygpIHJlZHVjZXMgYSBSb290IFBvcnQncyBNUFMgd2hlbiBhIGRldmlj
ZSB3aXRoIGEKPiBzbWFsbGVyIE1QUyBTdXBwb3J0ZWQgaXMgaG90LWFkZGVkIGRpcmVjdGx5IGJl
bG93IGl0IChjb21taXQgOWYwZTg5MzU5Nzc1Cj4gKCJQQ0k6IE1hdGNoIFJvb3QgUG9ydCdzIE1Q
UyB0byBlbmRwb2ludCdzIE1QU1MgYXMgbmVjZXNzYXJ5IikpLCBhbmQgd2l0aAo+ICJwY2k9cGNp
ZV9idXNfc2FmZSIsIHBjaWVfYnVzX2NvbmZpZ3VyZV9zZXR0aW5ncygpIGNhbiBkbyB0aGUgc2Ft
ZSB3aGVuCj4gcGNpZWhwIGNhbGxzIGl0IGFmdGVyIGEgaG90LWFkZC4gIFRoZSBSb290IFBvcnQn
cyBzdGF0ZSB3YXMgc2F2ZWQgd2hlbiBpdAo+IHdhcyBhZGRlZCBhbmQgYWdhaW4gd2hlbiBwb3J0
ZHJ2IHByb2JlZCBpdC4KPiAKPiBTaW5jZSBjb21taXQgM2ZjNjg2ZDU1MGY2ICgiUENJL0VSUjog
QWRkIHN1cHBvcnQgZm9yIHJlc2V0dGluZyB0aGUgUm9vdAo+IFBvcnRzIGluIGEgcGxhdGZvcm0t
c3BlY2lmaWMgd2F5IiksIHBjaWJpb3NfcmVzZXRfc2Vjb25kYXJ5X2J1cygpIHJlc3RvcmVzCj4g
dGhhdCBzYXZlZCBzdGF0ZSwgd2l0aG91dCBzYXZpbmcgaXQgZmlyc3QsIGFmdGVyIGhvc3QtPnJl
c2V0X3Jvb3RfcG9ydCgpCj4gaGFzIHJlc2V0IHRoZSBSb290IFBvcnQsIGUuZy4gZHVyaW5nIEFF
UiByZWNvdmVyeSBvciBvbiBMaW5rIERvd24gd2l0aCB0aGUKPiBxY29tIGFuZCBSb2NrY2hpcCBE
V0MgZHJpdmVycy4gIFRoZSBSb290IFBvcnQgdGhlbiBnb2VzIGJhY2sgdG8gdGhlIG9sZCwKPiBs
YXJnZXIgTVBTIHdoaWxlIHRoZSBkZXZpY2UgYmVsb3cgaXQgaXMgcmVzdG9yZWQgdG8gdGhlIHNt
YWxsZXIgb25lLCBzbwo+IHRoZSBSb290IFBvcnQgbWF5IHNlbmQgVExQcyB0aGF0IHRoZSBkZXZp
Y2UgdHJlYXRzIGFzIE1hbGZvcm1lZC4KPiAKPiBVcGRhdGUgdGhlIHNhdmVkIGNvcHkgb2YgRGV2
aWNlIENvbnRyb2wgd2hlbiBwY2llX3NldF9tcHMoKSBjaGFuZ2VzIHRoZQo+IE1QUywgbGlrZSBj
b21taXQgOTA5ZjdiZjliMDgwICgiUENJOiBVcGRhdGUgc2F2ZWRfY29uZmlnX3NwYWNlIHVwb24K
PiByZXNvdXJjZSBhc3NpZ25tZW50IikgZG9lcyBmb3IgQkFScy4KPiAKPiBGaXhlczogM2ZjNjg2
ZDU1MGY2ICgiUENJL0VSUjogQWRkIHN1cHBvcnQgZm9yIHJlc2V0dGluZyB0aGUgUm9vdCBQb3J0
cyBpbiBhIHBsYXRmb3JtLXNwZWNpZmljIHdheSIpCj4gQXNzaXN0ZWQtYnk6IExMTQo+IFNpZ25l
ZC1vZmYtYnk6IE5pa2xhcyBDYXNzZWwgPGNhc3NlbEBrZXJuZWwub3JnPgoKU2FzaGlrbyBoYXMg
cmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEK
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA5MzAxNDUwMTcuMTM1NjA4OC02LWNhc3NlbEBrZXJuZWwub3JnP3BhcnQ9MQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
