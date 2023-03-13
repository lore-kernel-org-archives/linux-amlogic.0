Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF6BC6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 21:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZ9WIJ1R2ApC+RrrQl3sTn6KYaLXU/bAvuPGQmOidvQ=; b=RnPWv6iicyTZLD
	TXR6Bho/vVC0qBF1AExuwbYFkUWxKXyJf3fZkOMbYYe5oP3Nu9SgIV5wy6h2OK4xiWQy22MgkzcX8
	jbcZfwVFCf1Mzf3Zr7IDacG9UuoQjByYTfFANgKiwizFdnVBbrM4qb/ZnmkpKyap+4MX8jDGlNR/V
	LdrlbHAdCAhL0p083yrPk3maQxL1GBmRJ75IB1NPSNf1SMyjaecvq5MR0OwajFmnDrrPbP5BNcONf
	kaiw+rY1mxVG+vxCYXyqVfkjjIygt41oDdOm2RgW/QD0cMRWokRL23rjz1clnRYHAViP8bGlNkz/x
	D+peu5Wi7qG7zIeZDC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpwE-007yeM-Rr; Mon, 13 Mar 2023 21:42:39 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpwA-007ybr-Ve
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 21:42:37 +0000
Received: from [IPV6:2a02:8428:2a4:1a01:c8ce:acb0:d46a:bb07] (unknown [IPv6:2a02:8428:2a4:1a01:c8ce:acb0:d46a:bb07])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 94AD1B0051E;
	Mon, 13 Mar 2023 22:42:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678743750;
	bh=VEU8HwgWPW9ROwRnS41wvdPNcD7KmargOkeucWFLS4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ibV+m8YZmaQxJ2zXcwxwmRV5EzUD98UltT/YLQ2Smu+/welo9rIawRdQ+7jrx68ZQ
	 E/smTuaMFRSOX9X5JNao+IiVwFbi2cuPl+Uuhw5qCTjXXeOqMgJPZj7BHWLqVZ0bwG
	 /oI6MeCSsRBYy/Olkw0W3jtvHFLg4ld5RwGbY1I8x1WSbAkkPFzyjieM/tBss1p9To
	 0OmWMSY3/KUyVqt0WZV7+H+GZc9wfZlBWuB4sOnAJxKZY7i7VXYYUc2BpmRKmt2N1L
	 YNfP42xtwdhZ3aEHU2P8BlQ2j7bS8WcU0rCLRv+FMbdlLPQ4iUzJOP+I6FBkPtDhrI
	 AAMECuMBLMmPg==
Message-ID: <6ac1ecb1-eba4-b0a3-579c-afcbe532a474@free.fr>
Date: Mon, 13 Mar 2023 22:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
Content-Language: fr, en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Angus Ainslie <angus@akkea.ca>, Pierre-Hugues Husson <phh@phh.me>,
 linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
 <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
 <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
 <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr>
 <CAPDyKFoAT-jMkYb7=m--q_eEb2xxH-VPQy5vaHNvw4s=WiAeCg@mail.gmail.com>
 <0450e34e-7190-104c-832a-150f15f7c825@free.fr>
 <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
 <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr>
 <CAFBinCDHRhLSyFsEv7cdhSgZorj-TdR3HhqSBnAQcUtEsecV=Q@mail.gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <CAFBinCDHRhLSyFsEv7cdhSgZorj-TdR3HhqSBnAQcUtEsecV=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_144235_255748_1EAE825E 
X-CRM114-Status: GOOD (  10.67  )
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

T24gMTMvMDMvMjAyMyAyMTowNCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKCj4gT24gTW9u
LCBNYXIgMTMsIDIwMjMgYXQgNjowOeKAr1BNIE1hcmMgR29uemFsZXogd3JvdGU6Cj4gWy4uLl0K
Pj4gUVVFU1RJT046Cj4+IEl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoeSB3ZSBzbGVlcCB0d2ljZSBm
b3IgaG9zdC0+aW9zLnBvd2VyX2RlbGF5X21zPwo+Cj4gSSdtIG5vdCBzdXJlIGJ1dCBJIHRoaW5r
IGhvc3QtPmlvcy5wb3dlcl9kZWxheV9tcyBpcyBpbmRlcGVuZGVudCBmcm9tCj4gdGhlIHBvc3Qt
cG93ZXItb24tZGVsYXktbXMgcHJvcGVydHkgb2YgIm1tYy1wd3JzZXEtc2ltcGxlIi4KClRoZXkg
YXJlIGRpc3RpbmN0IGluZGVlZCAodGhlIHByb3BzIGhhdmUgdGhlIHNhbWUgbmFtZSAmIHNpbWls
YXIgcHVycG9zZSB0aG91Z2gpLgoKaG9zdC0+aW9zLnBvd2VyX2RlbGF5X21zIGlzIHNldCB2aWE6
Cgpkcml2ZXJzL21tYy9jb3JlL2hvc3QuYzogICAgICAgIGRldmljZV9wcm9wZXJ0eV9yZWFkX3Uz
MihkZXYsICJwb3N0LXBvd2VyLW9uLWRlbGF5LW1zIiwKZHJpdmVycy9tbWMvY29yZS9ob3N0LmMt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmhvc3QtPmlvcy5wb3dlcl9kZWxheV9t
cyk7CgoKcHdyc2VxLT5wb3N0X3Bvd2VyX29uX2RlbGF5X21zIGlzIHNldCB2aWE6Cgpkcml2ZXJz
L21tYy9jb3JlL3B3cnNlcV9zaW1wbGUuYzogICAgICAgZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMy
KGRldiwgInBvc3QtcG93ZXItb24tZGVsYXktbXMiLApkcml2ZXJzL21tYy9jb3JlL3B3cnNlcV9z
aW1wbGUuYy0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwd3JzZXEtPnBvc3RfcG93
ZXJfb25fZGVsYXlfbXMpOwoKCkhvd2V2ZXIsIHRoZXkgYXJlIGJvdGggdXNlZCB0byBkZWxheSBt
bWNfcG93ZXJfdXAoKSwKYW5kIHRoZSBob3N0IGRlbGF5IGlzIHVzZWQgdG8gc2xlZXAgdHdpY2Us
IHdoaWNoIEkKZm91bmQgY29uZnVzaW5nIDspCgpSZWdhcmRzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
