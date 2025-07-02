Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99044C83013
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1owgqN2hRPtT35jGLkpiTunDnPoTabZw6FW+BTHk6Y0=; b=r+YmSBZefFAtii
	ZOR+UVV9b2aqm2l9JASgnzwgYeXsB9fIxPK78kceYDlKWDxEUFetyGY1Z7gT0THWPbzlq0LL5Zn7o
	nVnNZs9F73Qtgy8zUtWZ5avvioSsOVlISyjLpRatj5xJ/D795gPSJjoq0sr/igPGgdZ1g/zyjCA0G
	kGDCsObyTlFT6ff57Hlw+hx/lRjV0Sn9+xAuGbU06T4qtX0zlUtzkfYZ9N6Poze4jfY8y2SC6TfZ+
	46vmEdJOcMCxBGS8KDNonATq1AMdiNJnuSzmDXhh/iyTOfry2zUcUOM+mIWAH4JnYTHc75KBqENw7
	qMTPNE/HUJQT2TP3SRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWs2T-00000007VxO-2Lna;
	Wed, 02 Jul 2025 07:37:53 +0000
Received: from mail.quantro.pl ([51.195.47.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWs2P-00000007Vwl-3dOD
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 07:37:52 +0000
Received: by mail.quantro.pl (Postfix, from userid 1002)
	id BA845251FF; Wed,  2 Jul 2025 09:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quantro.pl; s=mail;
	t=1751441866; bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=;
	h=Date:From:To:Subject:From;
	b=U7UKG3XUY10GKwykTny7v9FPV/3CwFGDrG48q/TVU4jGbzIqmeutBwTaoVYfif3kC
	 cMuxQNqdeLtwYXeCGQU1PzVccj1hvRjzOt5EX3XnhtArRoQa6Qq+ofWWR4RofjvbZJ
	 YMJFYY9TOTf0RgGS5PcEi+5+Ewlmiu656fAyRKNgiPSxZ0q0l3i8vwYB1OwbqU6F0C
	 8Y3esPJIkCzVKrvy19Q9cvFCNp8402XiskOn0CJ0Ph18uVNnRH1CrRPS98z/q+5/VF
	 PrDG3rtWhH/IZDwgT1AQPSL59/oHsBJwQ7MJi2Vdj0zA4uqOPfralYh09jGXJFSFhL
	 NfiRQIaxkoMmA==
Received: by mail.quantro.pl for <linux-amlogic@lists.infradead.org>; Wed,  2 Jul 2025 07:35:41 GMT
Message-ID: <20250702084500-0.1.ii.5n7vl.0.242w0avy54@quantro.pl>
Date: Wed,  2 Jul 2025 07:35:41 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@quantro.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.quantro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_003750_593560_2553B01C 
X-CRM114-Status: UNSURE (   0.78  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjenkgemFzdGFuYXdpYWxpIHNpxJkgUGHFhHN0d28sIGphayB6
d2nEmWtzennEhyB6YWRvd29sZW5pZSBwcmFjb3duaWvDs3cgaSBqZWRub2N6ZcWbbmllIHphb3N6
Y3rEmWR6acSHIG5hIGtvc3p0YWNoIHphdHJ1ZG5pZW5pYT8gCgpPYmVjbmllIGplc3QgbW/FvGxp
d2/Fm8SHIHp3b2xuaWVuaWEgeiBvcMWCYXQgWlVTIGHFvCBkbyA0NTAgesWCIG1pZXNpxJljem5p
ZSBuYSBrYcW8ZGVnbyBwcmFjb3duaWthIHBvcHJ6ZXogZG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dy4gCgpaYSBwb21vY8SFIGthcnR5IGx1bmNoIHByYWNvd25pY3kgbW9nxIUgcMWCYWNpxIcgdyBy
ZXN0YXVyYWNqYWNoLCB6YW1hd2lhxIcgamVkemVuaWUgb25saW5lLCBrb3J6eXN0YcSHIHogY2F0
ZXJpbmd1IGN6eSByb2JpxIcgemFrdXB5IHNwb8W8eXdjemUuIFRvIGRvc2tvbmHFgmUgbmFyesSZ
ZHppZSBtb3R5d2FjeWpuZSwga3TDs3JlIHRha8W8ZSB3eXLDs8W8bmlhIGZpcm3EmSBuYSByeW5r
dSBwcmFjeS4KCkNoxJl0bmllIG9wb3dpZW0gd2nEmWNlaiBuYSB0ZW4gdGVtYXQsIGN6eSBtb2ds
aWJ5xZtteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRyYXdpYW0K
RXdlbGluYSBLb3Byb3dza2EKU2VuaW9yIEhSIE1hbmFnZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
