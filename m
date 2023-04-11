Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054BFC77B6F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/HQPL253H1/zh9o56MZ1yZJGPr4LmEpOGLcGfhlaPM=; b=HywUhMK2sTeHb2
	2goW5FCA+WRZh5MTncacuY/e58sItOSJ+b7bV5Rk0i+U/Y+ALjv6zZWkO4L2oPy8nD2zCNVn2G6qG
	MAPtER6kO6xADpOM9Mcpih7gpoHu/W9rPx934sQZW5j3ZmVbSTgt7paEhJJ6kndQjqTttxluufM7I
	kA/vc/nuHFYPeG9R9J7eEPZmA7kKLMoiXqCgDyMGb0+H2572Ky51ca5xIrM6A6C2PCd9jZojHJ5gN
	ribGxkwOTJG03PfKXyPKeEaltTV9LdiH9G51Ee6DlfsOnV1hXsvmJWtBfqDrO3XrmG5IOz02RSjZW
	92HL+ScwsLTbZ/XbQaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHF2-000ctQ-15;
	Tue, 11 Apr 2023 16:53:12 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHEy-000csf-37;
	Tue, 11 Apr 2023 16:53:10 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pmHEs-00051b-Qy; Tue, 11 Apr 2023 18:53:02 +0200
Message-ID: <10076b2c-1f20-378d-6eb0-d7c352b4660e@leemhuis.info>
Date: Tue, 11 Apr 2023 18:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
 <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
 <fdffc009-47cf-e88d-5b9e-d6301f7f73f2@leemhuis.info>
 <44556911-e56e-6171-07dd-05cc0e30c732@collabora.com>
 <71816e38-f919-11a4-1ac9-71416b54b243@leemhuis.info>
 <2023040604-washtub-undivided-5763@gregkh>
 <d7f389ab-914b-c48e-dc8e-290fb72f345e@collabora.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <d7f389ab-914b-c48e-dc8e-290fb72f345e@collabora.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681231989;73c6b9eb;
X-HE-SMSGID: 1pmHEs-00051b-Qy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_095309_165597_25088639 
X-CRM114-Status: GOOD (  10.10  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTAuMDQuMjMgMDg6MDksIFJpY2FyZG8gQ2HDsXVlbG8gd3JvdGU6Cj4gCj4gSSBzZW50IHRo
ZSBvcmlnaW5hbCByZXBvcnQgdG8gc3RhYmxlQHZnZXIua2VybmVsLm9yZy4gCgp0aHghIGxldCBt
ZSB0ZWxsIHJlZ3pib3QgYWJvdXQgaXQ6CgojcmVnemJvdCBtb25pdG9yOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMWZjZmY1MjItMzM3YS1jMzM0LTQyYTctYmM5YjRmMGRhZWM0QGNvbGxh
Ym9yYS5jb20vCiNyZWd6Ym90IGlnbm9yZS1hY3Rpdml0eQoKPiBTb3JyeSBmb3IKPiB0aGUgY29u
ZnVzaW9uLCBJJ20gc3RpbGwgbGVhcm5pbmcgYWJvdXQgaG93IHJlcG9ydCByZWdyZXNzaW9ucwo+
IHByb3Blcmx5IHVzaW5nIHJlZ3pib3QsIHNwZWNpYWxseSBmb3Igc3RhYmxlIGJyYW5jaGVzLiBU
aG9yc3RlbidzCj4gZ3VpZGVsaW5lcyBhcmUgYmVpbmcgdmVyeSBoZWxwZnVsIGhlcmUuCgpHcmVh
dCB0byBoZWFyISBCdXQgRldJVywgSSByZWFsbHkgc2hvdWxkIHRyeSB0byBmaW5kIHNvbWUgdGlt
ZSB0byBmaW5lCnR1bmUgcmVwb3J0aW5nLWlzc3Vlcy5yc3QsIHJlcG9ydGluZy1yZWdyZXNzaW9u
cy5yc3QsIGFuZApoYW5kbGluZy1yZWdyZXNzaW9ucy5yc3Qgc29tZSBtb3JlLCBhcyB0aGVyZSBh
cmUgcXVpdGUgYSBmZXcgdGhpbmdzIHRoYXQKYWZhaWNzIGNvdWxkIG9yIG5lZWQgdG8gYmUgaW1w
cm92ZWQuIEVzcGVjaWFsbHkgdGhlIGFzcGVjdAoic3RhYmxlL2xvbmd0ZXJtIGlzIGhhbmRsZWQg
YnkgZGlmZmVyZW50IHNldCBvZiBwZW9wbGUgKGJ1dCByZWd1bGFyCmRldmVsb3BlcnMgbWlnaHQg
aGVscCkiIGlzIHNvbWV0aGluZyB0aGF0IG5lZWRzIHRvIGJlY29tZSBjbGVhcmVyIGFmYWljcy4K
CkJ1dCB0aGVyZSBpcyBzdGlsbCB0aGlzICJ0aGVyZSBhcmUgb25seSAyNCBob3VycyBpbiBhIGRh
eSwgYnV0IHNvIG1hbnkKdGhpbmdzIHRvIGRvIiBwcm9ibGVtLi4uCgpDaWFvLCBUaG9yc3RlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
