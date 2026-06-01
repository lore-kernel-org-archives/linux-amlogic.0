Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FA2CD6E55
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jun 2026 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ev+O8AH65dJKPDe0gjPDMlpmOrFkXewrZCusFYqfCPk=; b=CpjWGZltztRxFJ
	rN9l0VUJKxq5UsG373FjUFmgCZGyBeMcop8a/O9wNMqOma9hFRX/B9KTrzSBwO8OCviRLKyq3ogN+
	NC1c9TJuwP0Ht/47UxSrypZHtG5CJRB+nBJxQteqgstBk8k27T++TdRxCtsWl8tVPE1GJLIN63Z42
	3dFzJ5CzBf5I2cYjI/lO+4ulMmZ6ye6urgJ3k19jWS/C4ZpnaEF49q6FbIKi1fB/4Yqtxfu02pkYP
	94dXY2NsgaqEJThv2sxCqQXZSLCNFEcWIXJcxQ2otZTUhVy9PaB681JiK1Ve89z9JS47BQPxU+AoJ
	Sgm6jH8gdeWGg/SKT07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8ts-0000000BkbP-1QVd;
	Mon, 01 Jun 2026 20:06:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8tr-0000000Bkb5-16cb
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jun 2026 20:06:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86655601E5
	for <linux-amlogic@lists.infradead.org>; Mon,  1 Jun 2026 20:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB481F00898
	for <linux-amlogic@lists.infradead.org>; Mon,  1 Jun 2026 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344374;
	bh=s14BrCNKw5biHzAbTs/7/BHxIivmPKRyhGyt3zFJ42s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kLQxdGdNOe4WAEbHBkITeF72kb2AlxBmTVmE3SUR+hxPNzSrxMJ3Dc2M8M3fwuDhb
	 dMA+dyw0besE/LJl+JFci2ecBZdwLXJJZGxXRrkuJZMNIUUTCF2nHBuDrLlLHIGvwp
	 1x3YsaXmjrQt2XDXtF3TV5gijfYdJq52cj2KoouXuMbbzvE2AOxMLEtQk2HB13VbfD
	 LUYlJvdW0+ZLC0IdPNdLNIppnxjLDAvwdNlAec2Oc1VPhxr4OUIZFhZBMt2zakDqjX
	 FKiliHyUxtDVmdvCqgyx8TGYSIga8SqoYqU7l0ywT/PQJGktU0i7Dj1qKwIgrXLtcy
	 Ct35td3mH45zg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39677245e15so19624671fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jun 2026 13:06:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94x8SQpLTe0NHkSW7rph9oVv6eVjCH04jG0YhHtycp8uN3ozQvCDSEiSsi5/jnI0vSz4x81002+XMpqGyG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9JFdHphn0s0ByIyiXbFJVWbybBUI5a+Q7v+AD5P3O7dgL3hWU
	b8o/1Cl2L3DxDJyA38TLwiQz96rIxyRSqp3DMGRZ7LNbmjrJZ30hddhhx/iO8W3gZFLovrdxay+
	U+bDrhPVf+uz7/sgrCdpS75ijHSWJHhs=
X-Received: by 2002:a05:6512:1250:b0:5aa:6cfc:771e with SMTP id
 2adb3069b0e04-5aa6cfc7c86mr1598474e87.2.1780344373039; Mon, 01 Jun 2026
 13:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
In-Reply-To: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 22:06:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
X-Gm-Features: AVHnY4K0SnpwSd7TlxazfH13zL4pKXTV_yuQj-jItkV28NmyUihecMzf4bInR58
Message-ID: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
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

SGkgTmVpbCwKCnRoYW5rcyBmb3IgeW91ciBwdWxsIHJlcXVlc3QhCgpPbiBUaHUsIE1heSAyMSwg
MjAyNiBhdCAzOjE54oCvUE0gTmVpbCBBcm1zdHJvbmcKPG5laWwuYXJtc3Ryb25nQGxpbmFyby5v
cmc+IHdyb3RlOgoKPiAgICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IGtoYWRhcy12aW00
OiBSZW1vdmUgaW52YWxpZCBwcm9wZXJ0eQoKVGhpcyBjb21taXQgaGFzIGEgcHJvYmxlbWF0aWMg
Rml4ZXM6Cgpjb21taXQgNmYxNGJhM2MzZmEzZDY3YjcyZTA1MmY0MzFmNjc3NjQ3MGViMmNiZApB
dXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgpEYXRlOiAg
IE1vbiBNYXIgMzAgMTQ6MTE6MjEgMjAyNiArMDIwMAoKICAgIGFybTY0OiBkdHM6IGFtbG9naWM6
IHQ3OiBraGFkYXMtdmltNDogUmVtb3ZlIGludmFsaWQgcHJvcGVydHkKCiAgICBGaXggaW50cm9k
dWNlZCBpbnZhbGlkIHByb3BlcnR5IGZvciBLaGFkYXMgVklNNCBzZGNhcmQgcmVndWxhdG9yLgoK
ICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMt
dmltNC5kdGI6CnJlZ3VsYXRvci1zZGNhcmQtM3YzIChyZWd1bGF0b3ItZml4ZWQpOiBVbmV2YWx1
YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QKYWxsb3dlZCAoJ2VuYWJsZS1hY3RpdmUtbG93JyB3YXMg
dW5leHBlY3RlZCkKCiAgICBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+CiAgICBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwv
MjAyNjAzMjkwODI4LjVndDM5M3Q2LWxrcEBpbnRlbC5jb20vCiAgICBGaXhlczogNjBlZmY3NWFj
NjdiICgiYXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IGtoYWRhcy12aW00OiBBZGQKcG93ZXIgcmVn
dWxhdG9ycyIpCiAgICBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPgogICAgU2lnbmVkLW9mZi1ieTogUm9uYWxkIENs
YXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CiAgICBMaW5rOiBodHRwczovL3BhdGNo
Lm1zZ2lkLmxpbmsvMjAyNjAzMzAtZml4LWludmFsaWQtcHJvcGVydHktdjItMS0yMjhjNTFjOGRl
OTNAYWxpZWwuZnIKICAgIFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPgoKQ29tbWl0IDYwZWZmNzVhYzY3YiBkb2VzIG5vdCBleGlzdCBpbiB0
aGUgU29DIHRyZWUgbm9yIGluIFRvcnZhbGRzJwp0cmVlLgoKV2hhdCdzIHVwIGhlcmUsIGl0IGxv
b2tzIGluY29ycmVjdD8KCkNhbiB5b3UgbG9vayBpbnRvIGl0PwoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
