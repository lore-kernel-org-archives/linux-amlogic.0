Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158B7C77B7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HmIIX+J2st1adEag+JCuatQx8zHlnmB8DMdnksePWI8=; b=AGacFE8A2RJrdc
	oYHDlcUeoYUT8f/Y0SMFfgLGcu1D+jHnDK0PROqczAr11z2JKSrS2NdOS4XQvHXiVjksBiiCLMZYx
	AY6Mm7Orqcz1Jd50VNXiNHE4qFJFopNKoUW46cK0tmQO60iMbv1kFGKmbGtgySW8ELkcbvh0SRvIJ
	6PziEgIaIey5ewov4hdyiBYfdXYeeG+UrXVGlp4CKOLEDZevUKDa/GNQbP/c1cRH6O5RDw2j0BeVK
	rCcJh/4SrwAs6dk0GaaSvaiSJ7H/+xaMExDR8hEDM6sIzwdBlJdWKd2zDjq6HU9URMUwRUBttIpSB
	pPVsNuzBDzFRoOcjUqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkox-006MZM-0s;
	Wed, 10 May 2023 14:29:35 +0000
Received: from first.geanix.com ([116.203.34.67])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkov-006MYo-05
	for linux-amlogic@lists.infradead.org;
	Wed, 10 May 2023 14:29:34 +0000
Received: from xps.skovby (85.184.138.13.dynamic.dhcp.aura-net.dk [85.184.138.13])
	by first.geanix.com (Postfix) with ESMTPSA id D82284E4F18;
	Wed, 10 May 2023 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1683728394; bh=8mxoiILecU3Ef/apqxJ0ZHRd86eTwd5eBTBahvkg6RQ=;
	h=From:To:Cc:Subject:Date;
	b=gRIOlDsZxI36YuKyvMkpJOsJVc+zjmvj1f1p23b/uLDwB+bb3CFA0j7DmGulJ0Kao
	 wm0/j1oefegyfbA5ybt9XBlIPP0Aw0XUFvv6kqBptTxSamPsXMvzAvuaQ2dCHE8kUj
	 5+5J8Pz7TmrLaDv6atYQDDwueLFirJ5yAUyCb65zWm+H3uTaDXaRjCXom5UL086l/O
	 VoaVcZYW8VjuwC4aRqT466PHgUoNhJRvEG5dIQbRZ4wqAXN5Z6xKWG7Tn4rEKbBqF8
	 I0o68PLUkhcJ9XIhZpGIxAsaUwnS3ifJe1pIAUbt7GERVJ1WxnWClY0g3Mbqt+QF8i
	 HanoIxoKtvcrg==
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: linux-amlogic@lists.infradead.org
Cc: stable@vger.kernel.org,
	Xingyu Chen <xingyu.chen@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH] pinctrl: meson-axg: add missing GPIOA_18 gpio group
Date: Wed, 10 May 2023 16:19:34 +0200
Message-Id: <20230510141934.112994-1-martin@geanix.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_072933_216470_5BA6473C 
X-CRM114-Status: UNSURE (   7.09  )
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

V2l0aG91dCB0aGlzLCB0aGUgZ3BpbyBjYW5ub3QgYmUgZXhwbGljaXRseSBtdXgnZWQgdG8gaXRz
IGdwaW8gZnVuY3Rpb24uCgpGaXhlczogODNjNTY2ODA2YTY4YSAoInBpbmN0cmw6IG1lc29uLWF4
ZzogQWRkIG5ldyBwaW5jdHJsIGRyaXZlciBmb3IgTWVzb24gQVhHIFNvQyIpClNpZ25lZC1vZmYt
Ynk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5AZ2Vhbml4LmNvbT4KLS0tCiBkcml2ZXJzL3Bp
bmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1heGcuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwt
bWVzb24tYXhnLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1heGcuYwpp
bmRleCA3YmZlY2RmYmExNzcuLmQyNDlhMDM1YzJiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9waW5j
dHJsL21lc29uL3BpbmN0cmwtbWVzb24tYXhnLmMKKysrIGIvZHJpdmVycy9waW5jdHJsL21lc29u
L3BpbmN0cmwtbWVzb24tYXhnLmMKQEAgLTQwMCw2ICs0MDAsNyBAQCBzdGF0aWMgc3RydWN0IG1l
c29uX3BteF9ncm91cCBtZXNvbl9heGdfcGVyaXBoc19ncm91cHNbXSA9IHsKIAlHUElPX0dST1VQ
KEdQSU9BXzE1KSwKIAlHUElPX0dST1VQKEdQSU9BXzE2KSwKIAlHUElPX0dST1VQKEdQSU9BXzE3
KSwKKwlHUElPX0dST1VQKEdQSU9BXzE4KSwKIAlHUElPX0dST1VQKEdQSU9BXzE5KSwKIAlHUElP
X0dST1VQKEdQSU9BXzIwKSwKIAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
