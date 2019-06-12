Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189E6C31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8D520B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j340gkUW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PV/Myi90"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8D520B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEhT0tBojk+DboGjVK6x7Uk+4rMYpwZH0w9rAXDMqr0=; b=j340gkUWij59z9
	n/iJ5YngwA2AboKDRGqYFYpulFmX3t0mLgqvv9rqM6ZLH7QTQSflJ0AE6onKMj5kVWzj5GuMeeSmh
	Xp+fJ7RaXWbctgNqV/c2xyBbl9g4f9KxGzeUOqdLE9YXYX02VK7ZGE969NFl9kbTjki5qmuKVfgxR
	P6fuj4WsSToYA+RUv88sZX/vWcJy8H2zc7juzZWHD2oakuRz41v7VdDrspnRbqXWqHLkykpnxfid7
	LKbM00XKdF4oLDPybPNve8umPMdidvcWfaqDahWQF3fBd1stHFhoF6uyllzNvUlpwgpbGORHFRpkQ
	0FrzoM16SkU1YN5Wk9fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9Q6-00077X-Jv; Wed, 12 Jun 2019 20:00:30 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9PE-0005GE-7g; Wed, 12 Jun 2019 19:59:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id p13so8125433wru.10;
 Wed, 12 Jun 2019 12:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObC610o5hWHINu0uTU3Hl+oLxvUvo9xNqJSdPceiF2s=;
 b=PV/Myi90oQwUTv4MltNi3KCGMwomtwtY01yXOejDgDqhUB5Q2M/JwPLZN2xZopb6Lk
 XxuGNpC58jARbYUyu/JPaQpJgHW6l3NCECEzHBd56a+m23TqtFzbWFpPb2c3gtJ6s/g0
 M97J9Tb9p+OMt5NBMXVQlboMuNSmeCrg+9SeBABw87oyZZictQLdfyZvleUDl00Ve1o/
 FOrGNyN8ZKM6bWhda7VR75zR2eH7rigUAWnDS7Y6VPLjUZYa1Rc2lt2O17CSYbUo9G5j
 7iDEANSmpkZ4rFYxcIcgkKRu/VADET92ufk6D2iCY5gFDDRiEy6Dm+Etg5XTaBdF9o0h
 EGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObC610o5hWHINu0uTU3Hl+oLxvUvo9xNqJSdPceiF2s=;
 b=dB0HPryqJ+UbhOn5H5KVr/pdvhPeSPkIttQptx9l4lILsyJIdG6xv9YbTRfbBMPPUD
 z+vL0tYQMvOQspuXp1//IN0XLkUkXtI/Nm9BhCbhSgmDEVb5XrEK6Ku0QQOWW0GARyUZ
 lVEzA5MpcNUw/1uRJr6qOmIZu4M7g5lzpoJtejGJKwGSFj23+iGRxvQxIEAKsThneHri
 p5ys0AyaEduTkb8loMAB96or5NasbIjomHXlEoXkoQ3i/3tJmIeQ4rH8TTAG2F0aRS8b
 rxvf1nTrwTgb4NHld+UFMff6S1yQuakzqgoStebz2XtKqaXL5wnXYxWUxz1wA7Nub4ju
 v7tw==
X-Gm-Message-State: APjAAAWPdbvgfKFL7HZ2SxjWL/vk/LhJnWb5W/C8hSUHiRjsQDncDriI
 WGVpsxHhyTVBL3WhFqHjJizAVUpi
X-Google-Smtp-Source: APXvYqz0QFlGb11jXCoLBy5+7zRsUxelrr5LALZaZMvlKNJXCARUiloBFYpkdMQQg2ZBXsJ0hdCGmA==
X-Received: by 2002:a5d:52cc:: with SMTP id r12mr16900316wrv.132.1560369572747; 
 Wed, 12 Jun 2019 12:59:32 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f10sm1026745wrg.24.2019.06.12.12.59.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 12:59:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v3 02/14] pwm: meson: use devm_clk_get_optional() to get the
 input clock
Date: Wed, 12 Jun 2019 21:58:59 +0200
Message-Id: <20190612195911.4442-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
References: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_125936_274393_2A5CC95A 
X-CRM114-Status: GOOD (  13.73  )
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
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

U2ltcGxpZnkgdGhlIGNvZGUgd2hpY2ggZmV0Y2hlcyB0aGUgaW5wdXQgY2xvY2sgZm9yIGEgUFdN
IGNoYW5uZWwgYnkKdXNpbmcgZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCkuClRoaXMgY29tZXMgd2l0
aCBhIHNtYWxsIGZ1bmN0aW9uYWwgY2hhbmdlOiBwcmV2aW91c2x5IGFsbCBlcnJvcnMgZXhjZXB0
CkVQUk9CRV9ERUZFUiB3ZXJlIGlnbm9yZWQuIE5vdyBhbGwgb3RoZXIgZXJyb3JzIGFyZSBhbHNv
IHRyZWF0ZWQgYXMKZXJyb3JzLiBJZiBubyBpbnB1dCBjbG9jayBpcyBwcmVzZW50IGRldm1fY2xr
X2dldF9vcHRpb25hbCgpIHdpbGwgcmV0dXJuCk5VTEwgaW5zdGVhZCBvZiBhbiBlcnJvciB3aGlj
aCBtYXRjaGVzIHRoZSBiZWhhdmlvciBvZiB0aGUgb2xkIGNvZGUuCgpSZXZpZXdlZC1ieTogTmVp
bCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDExICsrKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXggM2Zi
YmM0MTI4Y2U4Li4zNWIzOGM3MjAxYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNv
bi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC00NzQsMTQgKzQ3NCw5IEBAIHN0
YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IG1lc29uX3B3bSAqbWVzb24s
CiAKIAkJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiY2xraW4ldSIsIGkpOwogCi0JCWNo
YW5uZWwtPmNsa19wYXJlbnQgPSBkZXZtX2Nsa19nZXQoZGV2LCBuYW1lKTsKLQkJaWYgKElTX0VS
UihjaGFubmVsLT5jbGtfcGFyZW50KSkgewotCQkJZXJyID0gUFRSX0VSUihjaGFubmVsLT5jbGtf
cGFyZW50KTsKLQkJCWlmIChlcnIgPT0gLUVQUk9CRV9ERUZFUikKLQkJCQlyZXR1cm4gZXJyOwot
Ci0JCQljaGFubmVsLT5jbGtfcGFyZW50ID0gTlVMTDsKLQkJfQorCQljaGFubmVsLT5jbGtfcGFy
ZW50ID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKGRldiwgbmFtZSk7CisJCWlmIChJU19FUlIoY2hh
bm5lbC0+Y2xrX3BhcmVudCkpCisJCQlyZXR1cm4gUFRSX0VSUihjaGFubmVsLT5jbGtfcGFyZW50
KTsKIAl9CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
