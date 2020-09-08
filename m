Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BC7C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F1720C09
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QzlJVFjF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IlKLM/V4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44F1720C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0h84HE+RhG5Rea6CrDimu1da6W0NCmvEdWQDLo0MfDk=; b=QzlJVFjF9SPs5IPGOx5REGfbN0
	C8320msWDKw7jbDBL0sYRlYZA8jvkAzzAvEt7khA0Q3sXJ1W9X+2hIbWYcGsr7lwuwNS0/ldhB7at
	ybzIDjfRgQHHQ/ZLOLSZv5c2XrCDyn/mXwGlYXjnAfr1nb3Vgflomr/UFzXyv3N2MTh/5IcDNLjBI
	/uZL6x7J5at1TFaLt2Xp/Exhvz0LUsyOQeeKvQKRXwXnAzNen7SsKjZkfN1Pg+BVgzrrqAvZXoHUq
	Cx0mS0HVvl3D6UEWvWJ68+NblK9aTgySpxVQCMkqgx6Y43GW8hMDDjj+Opj1BIGjkHoOCMZy7Ppz9
	tujxsyVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFYSV-0007L6-5m; Tue, 08 Sep 2020 07:54:31 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFYSS-0007K1-89
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 07:54:29 +0000
Received: by mail-wm1-x342.google.com with SMTP id l9so16152289wme.3
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 00:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXyuP55k/txQU8Qavag22Z7+e0rUydKfwB7MhziBkWA=;
 b=IlKLM/V4WVAAF5C6UBwIZKBIE1WSziNp6P465eu0YCqj+PNnmuZbxxVhsmyBd6cNUj
 59ZYQBae1qOET3I8/xl5AGZZfHhN2Ej3aRPCrK4Yx8hvozgLjAfKMOpm6sDYPkx390zA
 fIw0Qco5ymgedDcLO2EXv7D5DI6mkaucPTDs2/EBwprlcv5SieAKUg/MKBnCwIILiz5P
 DejpAcCYm3bCdcqLqz9+gJ+WZUGigRshU/TchCBG2i7ZBQZke93uo/ECMY8bPaqYNZDZ
 p5hXe8xG/2dj6g99vR8C3pphhOUjcA8MsJc2SQ3GYSUYYdwAN3mFNqvBCqe76a8lPEGN
 z0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXyuP55k/txQU8Qavag22Z7+e0rUydKfwB7MhziBkWA=;
 b=olHZEXq1MnblfiVSkqMsPffwa8vNDj8+hjl8QkQ57C8ciL6sEd9bk4Jigq5il2um9m
 3D3i5Tlid4x2W7yjeNjWR7AwbxQOaL6+GY4QgtBqEp8NEs0T9jqdFHXQjwdj6mmmUhHO
 2StOF4yy+JQRMnWdnC+9YbF5INXGjOWtRKf7lBa+GjRla+mSVHB3gkmlPqK0a3vqM2I5
 STkH8D7WkoKfjaXThzGL4eYbtGJE9g9zgrBxED2cvFIuDZ6mUamF4fId+A4Ibu71IeLs
 TZQz+JzTbWpfXk6jDdOQbnS8RsQK3k75Ze6tVB5/9v8LngIm0OYHBKWuhg0xqdTPOxYx
 Y5uQ==
X-Gm-Message-State: AOAM530onGFlFighALdY5i1oa2HMSkARyyXX/M+g9F8F8S5DZ2a0N0Dr
 6ouC1bWyzka5+QeBmY217w4tLhpLz/Is0KbT
X-Google-Smtp-Source: ABdhPJwDh1eoKWZjAIC9Lu2S/bF0Q1t8OpRqNst9tAsHP3ivthW9uML4FgowbJDYclYeWq08p24mYA==
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr3009443wmj.36.1599551666927;
 Tue, 08 Sep 2020 00:54:26 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH v3 0/4] drm: panel: add support for TDO tl070wsh30 panel
Date: Tue,  8 Sep 2020 09:54:17 +0200
Message-Id: <20200908075421.17344-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_035428_658424_F3FEBB3A 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBhZGRzIHN1cHBvcnQgYmluZGluZ3MgYW5kIHN1cHBvcnQgZm9yIHRoZSBURE8gVEwwNzBX
U0gzMCBURlQtTENEIHBhbmVsCm1vZHVsZSBzaGlwcGVkIHdpdGggdGhlIEFtbG9naWMgUzQwMCBE
ZXZlbG9wbWVudCBLaXQuClRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlvbiBhbmQg
dXNlcyAyNCBiaXQgUkdCIHBlciBwaXhlbC4KSXQgcHJvdmlkZXMgYSBNSVBJIERTSSBpbnRlcmZh
Y2UgdG8gdGhlIGhvc3QsIGEgYnVpbHQtaW4gTEVEIGJhY2tsaWdodAphbmQgdG91Y2ggY29udHJv
bGxlci4KCkNoYW5nZXMgc2luY2UgdjIgYXQgWzJdOgotIGFkZGVkIHJlc2V0IGdwaW8gdG8gcGFu
ZWwtc2ltcGxlLWRzaSBiaW5kaW5ncwotIG1vdmVkIGJpbmRpbmdzIHRvIHBhbmVsLXNpbXBsZQot
IHJlLW9yZGVyZWQgcHJlcGFyZS91bnByZXBhcmUKLSBhZGRlZCBiYWNrIHJlZnJlc2ggcHJpbnQK
LSBtb3ZlZCByZWd1bGF0b3IvcmVzZXQgaGFuZGxpbmcgaW4gcHJlcGFyZS91bnByZXBhcmUKLSBh
bGlnbmVkIHJlbW92ZS9zaHV0ZG93biB3aXRoIHBhbmVsLXNpbXBsZQotIGFkZGVkIHNlbnRpbmVs
IGNvbW1lbnQgaW50byBkdCBtYXRjaCB0YWJsZQoKQ2hhbmdlcyBzaW5jZSB2MSBhdCBbMV06Ci0g
YWRkZWQgbWlzc2luZyB2ZW5kb3ItcHJlZml4ZXMgcGF0Y2gKLSByZW1vdmVkIHZyZWZyZXNoCi0g
Zml4ZWQgd2FybmluZyBvbiBhZGRfcGFuZWwgcmV0dXJuCi0gcmVtb3ZlZCBEUk0gbG9nZ2luZwoK
WzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODEzNzYvI3JldjEK
WzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODEzNzYvI3JldjIK
Ck5laWwgQXJtc3Ryb25nICg0KToKICBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBBZGQg
U2hhbmdoYWkgVG9wIERpc3BsYXkKICAgIE9wdG9sZWxlY3Ryb25pY3MgdmVuZG9yIHByZWZpeAog
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbC1zaW1wbGUtZHNpOiBhZGQgb3B0aW9uYWwgcmVz
ZXQgZ3BpbwogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbC1zaW1wbGUtZHNpOiBhZGQgVERP
IFRMMDcwV1NIMzAgRFNJIHBhbmVsCiAgICBiaW5kaW5ncwogIGRybTogcGFuZWw6IGFkZCBURE8g
dGwwNzB3c2gzMCBwYW5lbCBkcml2ZXIKCiAuLi4vZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUt
ZHNpLnlhbWwgICAgICAgfCAgIDMgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXBy
ZWZpeGVzLnlhbWwgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAg
ICAgICAgICAgICB8ICAxMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRkby10bDA3MHdz
aDMwLmMgIHwgMjUwICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAyNjcgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10ZG8tdGwwNzB3c2gzMC5jCgotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
