Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C64C4707B
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Jan 2024 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8/r3jp6sozVRECr5lWVU5uq5EAfO/yKdm2HhS38nPg=; b=TDEfsgonKoZSaa
	bBBIbFzYw0e9WPOax6VTIkhs8HRaYuH2o4NR4kn9A75Apdy+6jne3f3Ku9uUJSiSwx+eyjy0wqEpC
	+AJCQcpE/mZ6Pf38V4ZtG56D+v324LVcZjTb7GF9rpTXewC4+0VWop4IRHAzg3D5TTXQtJUE9p0yd
	FAZqjiPltHLqK6xbus6oYKAuUcErbD6He0qNZl1H3LdpoPWT5xJg5LDXwiPW4ayNMtL24cCzkRuRE
	wgZoznjmwXyB2TFsk24N7w7EUf2rWS5US9j5UmzDR7Te+cOZt2UIGe/YStGwxtVU1T5vrr9XfrR6F
	LYNMdxJe4b8c4+TSruyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOmmM-005qsU-1r;
	Sat, 13 Jan 2024 22:47:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOmmJ-005qrd-32
	for linux-amlogic@lists.infradead.org;
	Sat, 13 Jan 2024 22:47:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so9143355a12.2
        for <linux-amlogic@lists.infradead.org>; Sat, 13 Jan 2024 14:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1705186017; x=1705790817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY9iwm5mIi1yu3RP8RXkfD0AElUziXIbkBosoDfpThM=;
        b=dAfJlV21xePusYJuB/53y15qq4e1kcb/dIWfKFrMUF/489amSwT7DQxasariniUb5J
         zomc4Xe4I1dhhiPE4ujYPASxrO8AoWpt8p6jBa4iEhHS1qUrKZjXVN3enN37Hb2DeDId
         njNRN1NXDbeIDFxMHx/jODKXqtFJI7RzrvHuq7iCfjqy0b7leXfvzF/SAgqpQCR11NLb
         0Xa0w2/xc3V0pyl/ch5yOzuurhIek1yPkEJfiKOpQ9kNcUvaQywWcpHp5mSd0daqrxGM
         y4GZUYUI/0KoMrsM43lNRS922iiohR/HwOEUuM/x2j/zLas65KcHgqNBhr/IHqOUrY2y
         TCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705186017; x=1705790817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DY9iwm5mIi1yu3RP8RXkfD0AElUziXIbkBosoDfpThM=;
        b=QLNZHdRAAJBlVAfSaTU8xUlkhE+8FIA2Gcqh6fPsyxYExljhYoccecerBlCjqUdcbU
         /5gSrxt53tsV6T6Cbz4yJXYCp78nKtq4kpv3oJ9w4++7w5+er+woUtxvfcTiZI75VZpU
         6XoQsWiHUe84ik2Xr3xzwBLMXnIpxIDQnv8tutEaLexW05Rkd06vyIOGS571IEsduYMX
         fUYaoWG7C2T7uIPhOokKcLcrsxMnlal4aPiDmk7NdzWc2seon37s8ocNaPXR8b3VgSUR
         PKsB18wVLzJhiEGQKzmIRKBRPq/pOP7a8eKXFc5QuuPzt+InY/AWyphK2pExhqVGMJN5
         SIrQ==
X-Gm-Message-State: AOJu0Yyhu4dLw989iFhRfrL+O9f93DWuS++naV/DXbzYRYbKGUPlzxB1
	vKNTxcMZQvqaYjMr1zGiXIk=
X-Google-Smtp-Source: AGHT+IH62OCCDlaYXs/phJT6VVbys7so+fsQxIC6B1SCuu1YODV45kYu9d5gsD4El1bDlgTa3vn+8w==
X-Received: by 2002:a17:906:ae54:b0:a2d:559a:c72d with SMTP id lf20-20020a170906ae5400b00a2d559ac72dmr263432ejb.229.1705186017432;
        Sat, 13 Jan 2024 14:46:57 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-6fe7-c700-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:6fe7:c700::e63])
        by smtp.googlemail.com with ESMTPSA id g18-20020a170906595200b00a2d4e658132sm755409ejr.42.2024.01.13.14.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 14:46:57 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v2 1/3] regulator: pwm-regulator: Add validity checks in continuous .get_voltage
Date: Sat, 13 Jan 2024 23:46:26 +0100
Message-ID: <20240113224628.377993-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
References: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_144659_986595_55487BAA 
X-CRM114-Status: GOOD (  12.03  )
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

Q29udGludW91cyByZWd1bGF0b3JzIGNhbiBiZSBjb25maWd1cmVkIHRvIG9wZXJhdGUgb25seSBp
biBhIGNlcnRhaW4KZHV0eSBjeWNsZSByYW5nZSAoZm9yIGV4YW1wbGUgZnJvbSAwLi45MSUpLiBB
ZGQgYSBjaGVjayB0byBlcnJvciBvdXQgaWYKdGhlIGR1dHkgY3ljbGUgdHJhbnNsYXRlcyB0byBh
biB1bnN1cHBvcnRlZCAob3Igb3V0IG9mIHJhbmdlKSB2b2x0YWdlLgoKU3VnZ2VzdGVkLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpTaWduZWQt
b2ZmLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgotLS0KQ2hhbmdlcyBmcm9tIHYxIC0+IHYyOgotIHRoaXMgcGF0Y2ggaXMgbmV3LCB1
c2luZyBzdWdnZXN0aW9ucyBmcm9tIFV3ZQoKCiBkcml2ZXJzL3JlZ3VsYXRvci9wd20tcmVndWxh
dG9yLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcmVndWxhdG9yL3B3bS1yZWd1bGF0b3IuYyBiL2RyaXZlcnMvcmVndWxhdG9y
L3B3bS1yZWd1bGF0b3IuYwppbmRleCA2OThjNDIwZTA4NjkuLjIyNmNhNGM2MjY3MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvcHdtLXJlZ3VsYXRvci5jCisrKyBiL2RyaXZlcnMvcmVn
dWxhdG9yL3B3bS1yZWd1bGF0b3IuYwpAQCAtMTU4LDYgKzE1OCw5IEBAIHN0YXRpYyBpbnQgcHdt
X3JlZ3VsYXRvcl9nZXRfdm9sdGFnZShzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldikKIAlwd21f
Z2V0X3N0YXRlKGRydmRhdGEtPnB3bSwgJnBzdGF0ZSk7CiAKIAl2b2x0YWdlID0gcHdtX2dldF9y
ZWxhdGl2ZV9kdXR5X2N5Y2xlKCZwc3RhdGUsIGR1dHlfdW5pdCk7CisJaWYgKHZvbHRhZ2UgPCBt
aW4obWF4X3VWX2R1dHksIG1pbl91Vl9kdXR5KSB8fAorCSAgICB2b2x0YWdlID4gbWF4KG1heF91
Vl9kdXR5LCBtaW5fdVZfZHV0eSkpCisJCXJldHVybiAtRU5PVFJFQ09WRVJBQkxFOwogCiAJLyoK
IAkgKiBUaGUgZHV0eWN5Y2xlIGZvciBtaW5fdVYgbWlnaHQgYmUgZ3JlYXRlciB0aGFuIHRoZSBv
bmUgZm9yIG1heF91Vi4KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
