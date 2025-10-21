Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34653CCD184
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Oct 2025 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iPIqPkvboflRTzCsA2uLbJynxx+ryO+inK9Fqebaq2c=; b=BXMXkONC6qpimZ
	l1DKRsu4tVyb6wN7SKMSsfhbX2Ax2u0FF0/ypKMKu8GYUi6y+q+LOzN63Rs9ZWztmIDPmOjf9DPOZ
	ZJQ1i4Nv4as/8o1dEhMEUs4LC1EfVH4LcQze9Rh/pjzYT9zN2qwB2T15LQhQrs2/H3sRr13TxEkEJ
	F/aoj4B+WZH2eiK18thwvhRHnx7tHwtemrlDexK4Qs8EhygK7s2FgaHtFfQOIkCy4XNpUB4+8qrlH
	wePNlnmaKU+thVcXuqP3krUyleL/Em3yQIXMfUhWtD5ioTtXosJCfzBxmq1rYeHi29QE0L5GJw/O7
	wsD87l41YL73zdgR+uaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB75j-0000000G99C-3qob;
	Tue, 21 Oct 2025 07:47:35 +0000
Received: from mail.zynotix.com ([79.137.80.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB75h-0000000G98C-3rLS
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Oct 2025 07:47:35 +0000
Received: by mail.zynotix.com (Postfix, from userid 1002)
	id 2B64722971; Tue, 21 Oct 2025 09:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zynotix.com; s=mail;
	t=1761032517; bh=xZTLqM3E7aVDYIB/jnD5MiDi3FAIGgatFm751EDj2YQ=;
	h=Date:From:To:Subject:From;
	b=Xjvo+sXkpQLeWemoW75ifwOqSGR1ZYAKJcrjV5VUjPZoOys+JpOEGsHfOmDKcmm6z
	 qpAjKoiy0kBdbp0JrcHlZuJq1pt04/HPPRKyTWjOU7tJGdiHbYwBWl4pdcJWP47wJZ
	 uSttfjKG3cpdqfmT2/BH1jvm8EZeCsFuemF0ABx7pAmkChOPZEeuuEdYYf3Ug6Ejj1
	 CSQ7i7+gR5p9DWz/H2pxjb+MJWxyXLRXdC85ZDZYvVq5c4sub+bEt2JUZffgUpaFt0
	 7THeAg89kAt/Zjzzi4QEFL1+35/0g92DDbWO3+c1YNKRw8Xbk7CXTCQOgssJw8rVoY
	 fsT1X1M5QC3kw==
Received: by mail.zynotix.com for <linux-amlogic@lists.infradead.org>; Tue, 21 Oct 2025 07:40:46 GMT
Message-ID: <20251021084501-0.1.ck.uoi2.0.2k3d751fqt@zynotix.com>
Date: Tue, 21 Oct 2025 07:40:46 GMT
From: =?UTF-8?Q?"Magdalena_Ko=C5=82adczyk"?= <magdalena.koladczyk@zynotix.com>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Informacja_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.zynotix.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004734_090443_37463392 
X-CRM114-Status: UNSURE (  -0.04  )
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

RHppZcWEIGRvYnJ5LAoKcHJvd2FkesSZIGJpdXJvIGtzacSZZ293ZSwga3TDs3JlIHNwZWNqYWxp
enVqZSBzacSZIHcgb2JzxYJ1ZHplIGJpem5lc3UgUGHFhHN0d2EgZm9ybWF0dS4KCldyYXogeiB6
ZXNwb8WCZW0gemFwZXduaWFteSB3c3BhcmNpZSwga3TDs3JlIHd5a3JhY3phIGRhbGVrbyBwb3ph
IHNhbW8gcHJ6eWdvdG93YW5pZSByb3psaWN6ZcWEIGkgcHJvY2Vzb3dhbmllIGRva3VtZW50YWNq
aS4KClJlZHVrdWplbXkgZG8gbWluaW11bSBjemFzIGkgxZtyb2RraSwgamFraWUgbmFzaSBLbGll
bmNpIHByemV6bmFjemFqxIUgbmEgb2JzxYJ1Z8SZIGZpbmFuc293by1rc2nEmWdvd8SFIGkga2Fk
cm93by1wxYJhY293xIUuIAoKWiByYWNqaSBtb2plZ28gZG/Fm3dpYWRjemVuaWEgcHJ6eSB3c3DD
s8WCcHJhY3kgeiBmaXJtYW1pIG8gdGFraW0gcm9kemFqdSBkemlhxYJhbG5vxZtjaSwgY2hjaWHF
gmFieW0gcHJ6ZWRzdGF3acSHIGtpbGthIHdhcnRvxZtjaW93eWNoIGkgc3ByYXdkem9ueWNoIHJv
endpxIV6YcWELgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIG8gb2JzxYJ1ZHplIFBhxYRzdHdh
IGZpcm15PwoKUG96ZHJhd2lhbQpNYWdkYWxlbmEgS2/FgmFkY3p5awoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
