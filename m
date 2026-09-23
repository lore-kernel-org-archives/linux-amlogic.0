Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3667DC98307
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtuJU4hHV7/nDSRHBo7aUmDEOc/cSqraflJiV2bWN6I=; b=plhk4tE13iSD6u
	yf5Kf4rmCr3LaPsG6AEkzXRk5kd2xoNtrSXq/Xl15njERVNeseI5188eu0aj4U1kW4XeuIQoxjfsB
	zfeTcxtkJSamvtrHRFgr6Pz0ZJ9M742O3R/9O7fgkUUcOxFlwFj7Y1vdDyvZZS+GAHiXuvEtO7Kls
	6GetTg6knxujw4uUW0z8cEafqaFd2ApK84bSmb1SNXx9nv2nQR4noCkn+/7yQOYy7icFzk9WOgIdJ
	caVCAgey3KM3AiwQ+nazJOWqn26GB+D5ZF3XFH1BrZvheQmpd24jjPI/4skXjAoD20WE1oDSd/nhF
	e0c3OnSbx+tk+PANZ/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kum-0000000814R-2dEb;
	Wed, 23 Sep 2026 11:13:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kul-0000000813w-0sRE;
	Wed, 23 Sep 2026 11:13:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1B33415F7;
	Wed, 23 Sep 2026 11:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E821F000FF;
	Wed, 23 Sep 2026 11:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790162006;
	bh=6OWssQdGeKsyE+yPPzL9NID088rXE6n1NT7d9aLNuLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f255DHjPL7qcmuNQwMipvzvnDX+7hQ2EPoy15lFc3RlpueYEfKHfvnoUqEYqM1sNb
	 NWBIafoReygqiJurrwkepfMrWtm4dmdciZcGPHZj/UXcGVhT/gUEj9o7ycAyOsvv1H
	 VqqSVjZjXHtHcvciU24arw2rlEWeASuZ4V6Pee7xW62cur2hfF2P1a2knuHbqR+q42
	 gMBblt0TMmXcHqNunum5Arm0/pdXZWQDgCJyQiuCPlGnyePwTCIA4Udngv9vfkhOae
	 NuuKuLY3Qe+HkhbVscCeNe2wrBS53RY93ZrUlKLi0/K3QG2Yu63tslB35MvSjcWKk7
	 qFkKtFqTPodkg==
From: Lee Jones <lee@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 mfd@lists.linux.dev
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
Subject: Re: (subset) [PATCH v12 0/6] Add VIM4 MCU/FAN support
Message-Id: <179016200216.3991538.9729498500468458301.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:13:22 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-ad80c
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

T24gVGh1LCAxNyBTZXAgMjAyNiAwOTo1ODo1OSArMDIwMCwgUm9uYWxkIENsYXZlYXUgd3JvdGU6
Cj4gVGhlIEtoYWRhcyBWSU00IGJvYXJkIGZlYXR1cmVzIGEgZGlmZmVyZW50IE1DVSB2YXJpYW50
IGNvbXBhcmVkIHRvCj4gcHJldmlvdXMgVklNIGJvYXJkcy4KPiBXaGlsZSBpdCBzaGFyZXMgdGhl
IHNhbWUgSTJDLWJhc2VkIGNvbW11bmljYXRpb24gbW9kZWwsCj4gaXQgZGlmZmVycyBpbiBzb21l
IHdheXM6Cj4gCj4gICAtIEEgZGlzdGluY3QgcmVnaXN0ZXIgbWFwIHdpdGggaXRzIG93biB2b2xh
dGlsZS93cml0ZWFibGUgcmVnaXN0ZXIgc2V0Cj4gICAtIEEgZmFuIGNvbnRyb2wgd2l0aCAw4oCT
MTAwIGxldmVscyBpbnN0ZWFkIG9mIHRoZSAw4oCTMyBsZXZlbHMgcHJldmlvdXNseQo+ICAgLSBB
IGZhbiBwb3dlciBzdXBwbHkgZ2F0ZWQgdGhyb3VnaCBhIHJlZ3VsYXRvcgo+IAo+IFsuLi5dCgpB
cHBsaWVkLCB0aGFua3MhCgpbMS82XSBtZmQ6IGtoYWRhcy1tY3U6IEFkZCBwZXItdmFyaWFudCBj
b25maWd1cmF0aW9uIGluZnJhc3RydWN0dXJlIGFuZCBWSU00IHN1cHBvcnQKICAgICAgY29tbWl0
OiA2Mjc3YzNjZDc0ZjU0YzI2YmY0ZDVlODgxODJhMzc4ZWU3MTkwZDkwClsyLzZdIG1mZDoga2hh
ZGFzLW1jdTogVXNlIE1GRF9DRUxMXyogbWFjcm9zIGZvciBjZWxsIGRlY2xhcmF0aW9ucwogICAg
ICBjb21taXQ6IGY5ZjYxYzIxYjk0MmFjMzg3YWNkN2ZiM2VmMWY5NTBjYmE1OTc1NWYKWzMvNl0g
bWZkOiBraGFkYXMtbWN1OiBBZGQgc3VwcG9ydCBmb3IgVklNNCBNQ1UgdmFyaWFudAogICAgICBj
b21taXQ6IGM5NGM5N2Y4Yzk3ZTY4NGQ0NGVmNTQ4M2Q3ZjJhZDZiM2RmYTU1YWMKWzQvNl0gdGhl
cm1hbDoga2hhZGFzLW1jdS1mYW46IEFkZCBmYW4gY29uZmlnIGZyb20gcGxhdGZvcm0gZGF0YSBB
ZGQgcmVndWxhdG9yIHN1cHBvcnQKICAgICAgY29tbWl0OiBkYWQ2Zjc4OTdhOTNiNGUxNjE0NjY0
ZGJiY2FlMGY2MWU1N2QxYWMwCgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
