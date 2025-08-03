Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B706FC87FCA
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Aug 2025 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIVb/WJsUfDWLsJ2w5MPfnkJRZY0HCK97qnoZXUXl2Q=; b=UT8rhYmnazVYd7
	VwwoG+dh9BwsNTGh0exD6U/gPJgrYWbRHcaAnpZ2MDwoJitZG9C5UItl3CGytR7A9bduh40tt3Yyu
	9I8mkRnYyu720UmLGQi91cY6WBLZOwW393vv+ju3R3W7BDqeor4MIf+PEgVh9kirU9KuPUKbvN0mp
	pS0FoaYFfiVZr1gxfg3hwyfUpbMloUfSveJG46oJh6YQe4eMUEjVoBdTBzIaVIs00eGaHa4uwQykw
	agZCTuwChNltwHC0S9gCF2WVxOBcMokn7yRKl/QXL+GltCW49qMKWbt8pEQDEuEIegBLutnzHoey2
	UAjfRJ+ihvx468xZVHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiWGO-00000008c5D-2Pif;
	Sun, 03 Aug 2025 10:48:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiWGN-00000008c55-0dpr
	for linux-amlogic@bombadil.infradead.org;
	Sun, 03 Aug 2025 10:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3FRRPkFlnB1kL69t3mAMsVsert5m14RQCUkcsgC+nPU=; b=VvFfZR4dTL1Rnb0zFUgW36ENYX
	O6GyKFmSL3EU1CSjh66oJSUd6ttBBAFIzYsQNXL3O4aagRysFf9BVyK6r/nP8RS/wy0Te9XkcQ1Gk
	8XEq/W8Dr0T8ZvTYWg8q+8QwtWApuLUK/U9pcFDGt0lz+X2aY637Tax8oORgd+glb2YyE/7DoAIGl
	RAyB1nWau8b1yuyqeavCW/bUXpDYSbsuTkCFq47eaAQ6jh20UnQg7TnHqN2RYgK7p1adOUf7hox2w
	8UDFcek5buyqpqJbSVQb4h1NZxY3L9eQuqYBbpV/Uacyf/3QX2UGlWNc6rbDWXI5VP2QaTaYGDzdm
	lAkXE07g==;
Received: from mout.web.de ([212.227.15.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiWGJ-0000000DfSc-2DsR
	for linux-amlogic@lists.infradead.org;
	Sun, 03 Aug 2025 10:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754218094; x=1754822894; i=markus.elfring@web.de;
	bh=3FRRPkFlnB1kL69t3mAMsVsert5m14RQCUkcsgC+nPU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IjHL8A9BNWkHjlEkcUhpx4yxyvvsdjAltzvxvmA18OWQ78kxy3MvNslje3uMu0B+
	 LJ7e3GfeCxwa0FkBuZtXD1SsB/XPUEfXdd0dJ6NuummuHemXeg9Wd6c4d2nI8YKFt
	 mr6oeY61MlPgj0tk7xxjE+CB5mweD1uarEw7AZ600juzTfiJmDclQNLq9/4YhtZGt
	 OHF/21X2Thl6jqRIrLrwStMD2LI7occ63ZMW9LrHHXHqHzy7TaandknKMyd7jwAgN
	 D4I55NUt2qmns0XX2PMtNvPNaEJUhD17UDFrohcLJmomIOZdaZCdGBNgKajaELleL
	 oFPrPBC0oYNmvH84fQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.186]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0Zs0-1uUP8B3ANo-011kyh; Sun, 03
 Aug 2025 12:42:35 +0200
Message-ID: <8b23c9f1-900c-476c-81eb-80aeb2a691dd@web.de>
Date: Sun, 3 Aug 2025 12:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Carlo Caione <ccaione@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20250725074019.8765-1-johan@kernel.org>
Subject: Re: [PATCH] firmware: meson_sm: fix device leak at probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250725074019.8765-1-johan@kernel.org>
X-Provags-ID: V03:K1:aNb4W/nWdenW+ZKO5jo4FMRXp6+U/eLczt5bDV6V7x1u5EN2Mkp
 HHn5L86hY7tdEc8JhERG4Vxg7lqK/mTf78C1E/S7cnUs2Ped+kKFmQwJOFzKbbyOD8JM0xt
 bnA8fUxDfMcuLh57LOXJd94lxhe36a+L/I/LSmxqQMwi3xkhxak+EMJiB9ksEn1Xd0gKQmA
 kMwdXJ8P5SuzWYsM4A9QQ==
UI-OutboundReport: notjunk:1;M01:P0:4ebyxKh0zpM=;xXOLetkUl23VLFDjvajlMOwu/Mi
 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
 tw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_114819_831669_45807B72 
X-CRM114-Status: UNSURE (   3.21  )
X-CRM114-Notice: Please train this message.
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

PiBNYWtlIHN1cmUgdG8gZHJvcCB0aGUgcmVmZXJlbmNlIHRvIHRoZSBzZWN1cmUgbW9uaXRvciBk
ZXZpY2UgdGFrZW4gYnkKPiBvZl9maW5kX2RldmljZV9ieV9ub2RlKCkgd2hlbiBsb29raW5nIHVw
IGl0cyBkcml2ZXIgZGF0YSBvbiBiZWhhbGYgb2YKPiBvdGhlciBkcml2ZXJzIChlLmcuIGR1cmlu
ZyBwcm9iZSkuCuKApgoKSG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIGF0dHJpYnV0
ZSDigJxwdXRfZGV2aWNl4oCdIGZvciB0aGlzIHB1cnBvc2U/Cmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjE2L3NvdXJjZS9pbmNsdWRlL2xpbnV4L2RldmljZS5oI0wxMTQwCgpS
ZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
