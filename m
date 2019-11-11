Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D160C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 22:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25952173B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 22:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4mFGJJx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F25952173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pFswZiv43udelBs3IhSgFqFSz9z2+YYBx3udxd6P0Eg=; b=n4mFGJJx6TWCpb
	loVOdFM0xfAPteN/iaCYa1N4Y3bEG9040ESl9C01CqoPqTaxeM4zxgKHMSCbS0ZS7+Mbel+yMUeqo
	JyLD2FBPMcPKH1XeS1hRcfk+l211Drm9WWFlP1QkvVWCOZirPMfmjQ0ve++CLq5km3uSAqghbWXkQ
	rosvyKthJfJx+uVavqKTNETV9ztydjsOZzFgoQ6EDvSaD4ByUr24csmJkuS4hHTTzQS5Zoq8Jaypv
	yQdhHtPcAQWLg7EedLoVRE7r+xvRoBSJ/mJJZNEYIkNI3i86mjqgNfGNsD3CX+mqEtteoSZDHjhYJ
	l+/QQZHzem5iELuPxPfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUHyA-0007Av-T2; Mon, 11 Nov 2019 22:15:34 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUHy8-0007AA-BH; Mon, 11 Nov 2019 22:15:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0439DAC52;
 Mon, 11 Nov 2019 22:15:29 +0000 (UTC)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] soc: amlogic: socinfo: Avoid soc_device_to_device()
Date: Mon, 11 Nov 2019 23:15:21 +0100
Message-Id: <20191111221521.1587-1-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_141532_532877_DF7BC120 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGhlbHBlciBzb2NfZGV2aWNlX3RvX2RldmljZSgpIGlzIGNvbnNpZGVyZWQgZGVwcmVjYXRl
ZC4KRm9yIGEgZHJpdmVyIF9faW5pdCBmdW5jdGlvbiB0aGUgcHJlZGljdGFibGUgcHJlZml4IHRl
eHQKInNvYyBzb2MwOiIgZnJvbSBkZXZfaW5mbygpIGRvZXMgbm90IGFkZCByZWFsIHZhbHVlLCBz
byB1c2UKcHJfaW5mbygpIHRvIGVtaXQgdGhlIGluZm8gdGV4dCB3aXRob3V0IHN1Y2ggcHJlZml4
LgoKV2hpbGUgYXQgaXQsIG5vcm1hbGl6ZSB0aGUgY2FzaW5nIG9mICJkZXRlY3RlZCIgZm9yIEdY
LgoKQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNj
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PgpDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9zb2Mv
YW1sb2dpYy9tZXNvbi1neC1zb2NpbmZvLmMgfCA0ICstLS0KIGRyaXZlcnMvc29jL2FtbG9naWMv
bWVzb24tbXgtc29jaW5mby5jIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9hbWxvZ2ljL21l
c29uLWd4LXNvY2luZm8uYyBiL2RyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tZ3gtc29jaW5mby5j
CmluZGV4IDAxZmMwZDIwYTcwZC4uMTA1YjgxOWJiZDVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Nv
Yy9hbWxvZ2ljL21lc29uLWd4LXNvY2luZm8uYworKysgYi9kcml2ZXJzL3NvYy9hbWxvZ2ljL21l
c29uLWd4LXNvY2luZm8uYwpAQCAtMTI5LDcgKzEyOSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IG1l
c29uX2d4X3NvY2luZm9faW5pdCh2b2lkKQogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7CiAJc3Ry
dWN0IHJlZ21hcCAqcmVnbWFwOwogCXVuc2lnbmVkIGludCBzb2NpbmZvOwotCXN0cnVjdCBkZXZp
Y2UgKmRldjsKIAlpbnQgcmV0OwogCiAJLyogbG9vayB1cCBmb3IgY2hpcGlkIG5vZGUgKi8KQEAg
LTE5Miw5ICsxOTEsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBtZXNvbl9neF9zb2NpbmZvX2luaXQo
dm9pZCkKIAkJa2ZyZWUoc29jX2Rldl9hdHRyKTsKIAkJcmV0dXJuIFBUUl9FUlIoc29jX2Rldik7
CiAJfQotCWRldiA9IHNvY19kZXZpY2VfdG9fZGV2aWNlKHNvY19kZXYpOwogCi0JZGV2X2luZm8o
ZGV2LCAiQW1sb2dpYyBNZXNvbiAlcyBSZXZpc2lvbiAleDoleCAoJXg6JXgpIERldGVjdGVkXG4i
LAorCXByX2luZm8oIkFtbG9naWMgTWVzb24gJXMgUmV2aXNpb24gJXg6JXggKCV4OiV4KSBkZXRl
Y3RlZFxuIiwKIAkJCXNvY19kZXZfYXR0ci0+c29jX2lkLAogCQkJc29jaW5mb190b19tYWpvcihz
b2NpbmZvKSwKIAkJCXNvY2luZm9fdG9fbWlub3Ioc29jaW5mbyksCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvYy9hbWxvZ2ljL21lc29uLW14LXNvY2luZm8uYyBiL2RyaXZlcnMvc29jL2FtbG9naWMv
bWVzb24tbXgtc29jaW5mby5jCmluZGV4IDc4ZjBmMWFlY2E1Ny4uN2RiMmM5NGE3MTMwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLW14LXNvY2luZm8uYworKysgYi9kcml2
ZXJzL3NvYy9hbWxvZ2ljL21lc29uLW14LXNvY2luZm8uYwpAQCAtMTY3LDggKzE2Nyw4IEBAIHN0
YXRpYyBpbnQgX19pbml0IG1lc29uX214X3NvY2luZm9faW5pdCh2b2lkKQogCQlyZXR1cm4gUFRS
X0VSUihzb2NfZGV2KTsKIAl9CiAKLQlkZXZfaW5mbyhzb2NfZGV2aWNlX3RvX2RldmljZShzb2Nf
ZGV2KSwgIkFtbG9naWMgJXMgJXMgZGV0ZWN0ZWRcbiIsCi0JCSBzb2NfZGV2X2F0dHItPnNvY19p
ZCwgc29jX2Rldl9hdHRyLT5yZXZpc2lvbik7CisJcHJfaW5mbygiQW1sb2dpYyAlcyAlcyBkZXRl
Y3RlZFxuIiwKKwkJc29jX2Rldl9hdHRyLT5zb2NfaWQsIHNvY19kZXZfYXR0ci0+cmV2aXNpb24p
OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
