Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB8EC27C7B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+LxQzH2BKvXL8D072OuUAPqjnD7Msn5SkPZfPxW9V1k=; b=2CgwLWFKxodjF0
	S6WKICLIK1tDzzhh6bTgB9rHY5FhvK8mDrKepN9c5XT9oMq+V9qy2ePVP9CvFRrJJwWg8nam3S6I9
	ViNJkMHl7EdLKarb0FDu72V4vHe1ar81HOCta+txcHPjuHMB9mRsxZyLwEtVnhonVeden3S6G5cVe
	joMXfSdERuRGQ8B1rAWrk+keXQhYj+n4Yi71jS2FWTa8kCdpVytT+Bj0niQFbatiYiGi9Rtsd2Z05
	EgAaDwqM+NI1i0ZOfuEJdICPQ4tRs995op1SF1JY9tpZ8jV8K1S/Ui8lwqh/A540dPmaSOfrdxumE
	HJbzyfXC5WNRo0uPX6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Si-00000009o9v-0jar;
	Mon, 17 Jun 2024 08:11:36 +0000
Received: from mail.salesoptimize.pl ([162.19.245.89])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Sd-00000009o63-1OpH
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 08:11:33 +0000
Received: by mail.salesoptimize.pl (Postfix, from userid 1002)
	id 5929E46302; Mon, 17 Jun 2024 10:11:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=salesoptimize.pl;
	s=mail; t=1718611889;
	bh=u+y/L6S5UL+8vZAxwL74vV1B6m8M84m9zI1fQPT/Bfs=;
	h=Date:From:To:Subject:From;
	b=RolkYhSd3oN5GijDfjHOdGsKtMIRhT4EVmAF5EcexizdCtD9SLKd0P9MPWSxE8Fhr
	 GR8MWe7UdnMkNFu4RXz+rVBJP0lafKW+GWZVJ2fhVJ0CXgIctlIy3J8lU3vVTLU4CU
	 v14/rwEmV3ymNB8pntnToCVE3gBtw5KYoO2KmgM1vuZnqyZG2HU1KlPAD7BLnjV2Ma
	 /FZV/ZwSWGvdOwSyDt9hSRTZ9/r3+qLBsbPWSq46Zzx+qplaA1r3EdYrlujY2YPApU
	 feiQBYsneFNraQ97Xh7XOX4hhrmsusa9wwk5K2pWNrb+xrxFAMHceWoRuNvRFQ6F9e
	 /7nKZ1A2dDznA==
Received: by mail.salesoptimize.pl for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 08:10:47 GMT
Message-ID: <20240617084500-0.1.31.of7f.0.r0zaieabr9@salesoptimize.pl>
Date: Mon, 17 Jun 2024 08:10:47 GMT
From: "Tomasz Wawrzyniak" <tomasz.wawrzyniak@salesoptimize.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Odroczenie_zap=C5=82aty?=
X-Mailer: mail.salesoptimize.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_011131_987148_2BE9C19D 
X-CRM114-Status: UNSURE (  -0.03  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYnltIHphcHJvcG9ub3dhxIcgbW/FvGxpd2/Fm8SH
IHd5ZMWCdcW8ZW5pYSBva3Jlc3Ugc3DFgmF0eSB6YSB6YWt1cGlvbmUgcHJvZHVrdHkuCgpNb2ds
aWJ5xZtjaWUgesWCb8W8ecSHIHphbcOzd2llbmllIHUgc3dvamVnbyBkb3N0YXdjeSwgYSBteSBk
b2tvbmFteSBwxYJhdG5vxZtjaSB3IHd5em5hY3pvbnltIHByemV6IG5pZWdvIHRlcm1pbmllLiBQ
byBvdHJ6eW1hbml1IHDFgmF0bm/Fm2NpIHd5c3Rhd2lteSBQYcWEc3R3dSBmYWt0dXLEmSBzcHJ6
ZWRhxbx5IHogb2Ryb2N6b255bSB0ZXJtaW5lbSBwxYJhdG5vxZtjaSAoMzAtOTAgZG5pKS4KClPE
hSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB0YWtpbSByb3p3acSFemFuaWVtPwoKClBvemRyYXdp
YW0KVG9tYXN6IFdhd3J6eW5pYWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
