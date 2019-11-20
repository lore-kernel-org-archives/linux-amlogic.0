Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72A6C432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F63E20885
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IuKzxjAE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPgwtvv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F63E20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iDZWiPM9Ptp4pAyeOHe4HLzSLHbUo77PbLGlZPg+6pI=; b=IuKzxjAENycfJ9
	fzLqqIYfSRCwzzHBogmX9YbUgtcH3OcdgzXC5GRDZ0VXoa/BowlDg7i5LtP6dqKU/j/k5Q/gUYGpU
	R3qQitOsbrWSaxRvIESPyA/16azCjZJ4RpvwO/DLbjkqkYzL4PE3Q4tKNy3vL1PzcWRvv6hVMmmFL
	bTy+TlfvmJzay/XfJAZnH1t7LFVqmzTgqpLUM3F2AJwV3GvpB1tzzn1YgPEBEehe/uHc8Ahpgs+ln
	2JHAJWEamJ7/RWqlAgei0VXpkHm1jrpD3EO5ui6DOlDrKyowFDrro6G6zrtZjxC3mAtEcvwOTUqfz
	LwDEePZhBTIMZkXFSTCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXTAS-0006SW-Iz; Wed, 20 Nov 2019 16:49:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXTAQ-0006Rt-1W
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 16:49:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id u18so320474wmc.3
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 08:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lk1zyGMsDHTg1lLGm754qh2ipt6n2G94FJ0WmHXyXYM=;
 b=iPgwtvv2SpFygoRABL8Pw1rYE4Y7SIPTKkBzMnY5fDaB9Jua2eQ16TroUZJZYLI8Tk
 fC4QzwNns/0JrUnCUYDlEHREB0Zs0VyI/p8md+iwNQYhz79TJF4u4EAZ2U90CgbEzvX+
 YY9/e+s+vPl9MdGCr5VEM04Fu8oAm9YRYeoeyNpuehiKvN0688BRuAY2+AqL96/xwIYQ
 yITdub99UzhWxmqZLGDvFUTox9Ta6kstdjO6LUN6b/91rgXW8uGhPfgvkC1JrYRHO7PB
 RAFwRlJs6QyhskI3CPGCB+zKSAllWAJgDlEgls1uNgATZy6HPm+XXz8LCMchq1Aj8Ugq
 QoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lk1zyGMsDHTg1lLGm754qh2ipt6n2G94FJ0WmHXyXYM=;
 b=QNeFtO5UITpod99HgFIPFkKrD+uyK0mtgDMEvJ1ilN+b9uvzLzU8mJXIFA5dde7Gyu
 8KtBtkK8ClbDaQpZzuScmxkyjZB3gnZWa9RET53Hoj4vmLsaGoyYT0SbPVjQV/RNQPzC
 HNQ3vXOesGjmIN6Dk3Gs5t+R3mWQ7uDR3G6T/YG4pok60WnWdZjIDWzEJlfucjodTg82
 Fe7vV9+NIhIS9aeWbzgkMW78WLC7tYBKfZoE+7IPUyqH/1giqo0RlMpoO8/1Lim8Wb8x
 69MpfKy10Gb2RMJXNuvfevcBl1pLYzBaYU9M5gqw/DRU2tmDYuhi5DEscpNdIJgwOLC8
 Wc7w==
X-Gm-Message-State: APjAAAVHhV1E8oGDJaJoAfqqdmE8+Jnv30YxynhPieXtMqiP0SmgMm0c
 JbEZVURsKroLWd6vtyC/wxeOJ9FOVN8/ng==
X-Google-Smtp-Source: APXvYqwdWZ8dJu3rQ57JYZjMfh2/kRiJv4aryj3MZdKqbGp+AhOBv6znaltzrsd2S5/6Qy1mMi8IRQ==
X-Received: by 2002:a05:600c:506:: with SMTP id
 i6mr4500291wmc.153.1574268559719; 
 Wed, 20 Nov 2019 08:49:19 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id l4sm7128421wml.33.2019.11.20.08.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:49:18 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] add support for videostrong KII Pro
Date: Wed, 20 Nov 2019 19:49:14 +0300
Message-Id: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_084922_087745_9AB82920 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgVmlkZW9zdHJvbmcgS0lJIFBybyB0
diBib3ggd2hpY2ggaXMgYmFzZWQgb24gdGhlIGd4YmItcDIwMSByZWZlcmVuY2UgZGVzaWduLgpQ
YXRjaCAxIGFuZCA0IGFsc28gYWRkcyBzdXBwb3J0IGZvciB0aGUgQkNNNDMzNUEwIHRoYXQgY29t
ZXMgd2l0aCB0aGlzIGRldmljZQoKRGV2aWNlIHNwZWNpZmljYXRpb25zOgogICAgU29DIOKAkyAg
QW1sb2dpYyBTOTA1IHF1YWQgY29yZSBBUk0gQ29ydGV4LUE1MyBAIHVwIHRvIDIuMEdIeiB3aXRo
ICBwZW50YS1jb3JlIE1hbGktNDUwTVAgR1BVIEAgNzUwIE1IegogICAgU3lzdGVtIE1lbW9yeSDi
gJMgMkdCIEREUjMKICAgIFN0b3JhZ2Ug4oCTIDE2R0IgZU1NQyBmbGFzaCArIG1pY3JvIFNEIGNh
cmQgc2xvdCB1cCB0byAzMkdCCiAgICBWaWRlbyBPdXRwdXQg4oCTIEhETUkgMi4wIHVwIHRvIDRL
IEAgNjBIeiwgYW5kIDMuNW1tIEFWIChjb21wb3NpdGUgdmlkZW8pIGphY2sKICAgIEF1ZGlvIOKA
kyBIRE1JLCBBViAoc3RlcmVvIGF1ZGlvKSwgb3B0aWNhbCBTL1BESUYKICAgIFZpZGVvIENvZGVj
cyDigJMgMTAtYml0IEguMjY1IHVwIHRvIDRLNjAsIE1QRUcvVkMtMS9BVlMrL0guMjY1IHVwIHRv
IDRLMzAKICAgIFR1bmVyIOKAkyBDb21ibyBEVkItVC9UMiBhbmQgRFZCLVMvUzIgd2l0aCB0d28g
Y29ubmVjdG9ycwogICAgQ29ubmVjdGl2aXR5IOKAkyAxMC8xMDBNIEV0aGVybmV0LCA4MDIuMTEg
Yi9nL24vYWMgV2ktRmksIGFuZCBCbHVldG9vdGggNC4wIChBbXBhayBBUDYzMzUpCiAgICBVU0Ig
4oCTIDR4IFVTQiAyLjAgaG9zdCBwb3J0cwogICAgTWlzYyDigJMgUG93ZXIgYnV0dG9uIGFuZCBM
RUQsIElSIHJlY2VpdmVyCiAgICBQb3dlciBTdXBwbHkg4oCTICBEQyAxMlYvMUEKICAgIERpbWVu
c2lvbnMg4oCTIDEzMCB4IDEyMCB4IDMyIG1tCiAgICBXZWlnaHQg4oCTIDE4Ny41MCBncmFtcwoK
Q2hhbmdlcyBzaW5jZSBSRkMgdjE6Ci0gYWRkIGNvbW1pdCBkZXNjcmlwdGlvbiB0byB0aGUgY292
ZXIgbGV0dGVyCi0gdXBkYXRlIGJsdWV0b290aCBiaW5kaW5ncwotIHVzZSBsb3dlcmNhc2UgbmFt
ZSBmb3IgdGhlIGR0cyBmaWxlbmFtZSx2ZW5kb3IgcHJlZml4IGFuZCBkZXZpY2UgY29tcGF0aWJs
ZQotIGFkZCBjb3B5cmlnaHRzIHRvIHRoZSBuZXcgZmlsZXMKLSBpbmNsdWRlICJtZXNvbi1neGJi
LXAyMHguZHRzaSIgaW5zdGVhZCBvZiAibWVzb24tZ3hiYi1wMjAxLmR0cyIKCkNoYW5nZXMgc2lu
Y2UgUkZDIHYyOgotIEZpeCBzdHlsaW5nIGlzc3VlcwoKCk1vaGFtbWFkIFJhc2ltICgyKToKICBk
dC1iaW5kaW5nczogQWRkIHZlbmRvciBwcmVmaXggZm9yIFZpZGVvc3Ryb25nIFRlY2hub2xvZ3kK
ICBhcm02NDogZHRzOiBtZXNvbi1neGJiOiBhZGQgc3VwcG9ydCBmb3IgVmlkZW9zdHJvbmcgS0lJ
IFBybwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICB8ICAy
ICsrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUgICAgICAgICAgfCAgMSAr
CiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLWtpaS1wcm8uZHRzICAgfCAzNCArKysr
KysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi1raWkt
cHJvLmR0cwoKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
