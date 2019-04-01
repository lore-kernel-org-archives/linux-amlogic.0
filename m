Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD2EC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 18:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3FDB2133D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 18:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gtSjU7Xr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="i4D/tL5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3FDB2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mIN3jGNsLSkRymL9pdB6S99TGB52SCaIpNmUR52umV8=; b=gtSjU7XrZ7pb2V
	WpT9d0hOnYEWYMpqclVQ8EmYnTQ42NNR6ZOG7OIi3JdNPvbAQ0N0Y1Gr1SNEq1gFkPu8u6ecU9uca
	skb4P/V650MuNYPTeBM0rLRTnMI9CGg+WCBzNMj5ClSVfSOSgjnzHIBMo1EelLwezO7PzUBUrj2jE
	rraQLdm8baBKPdF5yLtngBapDDmanMzMXQzoQlVqrIsnzBKV9+D8BTBRmfPqcei0GCeKfxzTjLKlc
	4FoMGHSKymS/K+J/+6CQZDcaavnq1WWPnGqoOgs3rPUdFDNW8F6efbeDwebs96udS4gBPJ6rGVHSa
	66yZXFhoZjMlYmyANZdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB1Vs-0006OX-5W; Mon, 01 Apr 2019 18:18:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB1Vp-0006NN-Gx; Mon, 01 Apr 2019 18:18:26 +0000
Received: by mail-wm1-x341.google.com with SMTP id w15so463247wmc.3;
 Mon, 01 Apr 2019 11:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPxzK2GdQ1iSLqc2nRqiVfQ9IIOMGO3nhp42wptShFQ=;
 b=i4D/tL5qroUQxRDoja6/T38ZQ1eDE7oy5qis+7kJKFxr4ZujVhvqPJp6g3UcwYbnTA
 +/h2aLwUZwZ43PbklZtHbprlxJ/0QXFWJbOvb0FuRwnFjqwUd8pMaGyfOVSRW/MF6pXY
 6/CqjElAgiSaLImCCbIUFuce3ZoD3hLN1wm3cpQalH12Qblt4EQQxm4+zszSXX9Efs2M
 ZIb1SIH6+zpNUn/c7MFzgxWk0BHsi14PKqcnr/FW8OYXDSdcBa+9yLwHt/lt6EEYmylr
 PNn5qz5tAOJ1YzUABqPuHsH/phEAX3Ah/h/0swLt1AfOdQXcqchitnGsWVo2AilDGGdK
 piDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPxzK2GdQ1iSLqc2nRqiVfQ9IIOMGO3nhp42wptShFQ=;
 b=O+kudY9vyKVB8DRjLOqJ5Izj6cDB3yYbWZFfZIH5OXfWDe5E6eOoa0TS5N0Pxw193o
 +t5bwNPMRpTLK36PGN51jgtBukSsHwva40mOsb3e0S59KobzZmSn6JMoDfbQVDJkygF8
 DFD7S6qTktILClSXfgEZTV2L1+VgNRMXkVpqFmjn/p4Z3wbrT3gIHl3OfXTRMMqqDbV9
 zEXNoze1RP2G1m8NNMO51Neswsh1yzVJgEWPENshzA2GJ6JVCl88eNk3o2+6hIZF/wI2
 S/Kypgk5V7qD4/beyewSnDdcqhkBG1lZ1etjCncfHVTcfy0F+yqBjPH7oRjaoUBNbfBj
 R9cg==
X-Gm-Message-State: APjAAAXi3ngASkGQQMbo2FC+pugpm1BWI9vNqkXpTnjU4ZfWMuOzzdXh
 LtPBh6HF8sR1cNCXghGX2Hk=
X-Google-Smtp-Source: APXvYqzNpLiCRlP9dIEVJY3JYj1J3Z6w+JiM/GBgMYHtJwzZY9q++xRU2EdJh5eK6ExuZsg+TcvnFA==
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr621786wmj.113.1554142703730; 
 Mon, 01 Apr 2019 11:18:23 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73A0800C9C8A7BE25478D36.dip0.t-ipconnect.de.
 [2003:dc:d73a:800:c9c8:a7be:2547:8d36])
 by smtp.googlemail.com with ESMTPSA id h10sm18131127wrs.27.2019.04.01.11.18.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 11:18:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] pwm: meson: two small bug-fixes
Date: Mon,  1 Apr 2019 20:18:15 +0200
Message-Id: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_111825_566226_0612E6D2 
X-CRM114-Status: GOOD (  11.06  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: bichao.zheng@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgYXBwbGllcyBvbiB0b3Agb2YgbXkgb3RoZXIgZml4ICJwd206IG1lc29uOiBm
aXggc2NoZWR1bGluZwp3aGlsZSBhdG9taWMgaXNzdWUiIGZyb20gWzBdCgpUaGUgZmlyc3QgcGF0
Y2ggZml4ZXMgYW4gaXNzdWUgd2hlcmUgdGhlIG1heGltdW0gcG9zc2libGUgcHJlLWRpdmlkZXIK
KDEyOCkgY291bGQgbm90IGJlIHVzZWQgYmVjYXVzZSB0aGVyZSB3YXMgYW4gb2ZmLWJ5LW9uZSBl
cnJvciBpbiB0aGUKY29kZS4gSSBkaXNjb3ZlcmVkIHRoaXMgd2hpbGUgdGVzdGluZyB3aXRoIHRo
ZSBsb25nZXN0IHN1cHBvcnRlZCBwZXJpb2QKKDM0OTUxNDQwN25zKSB3aGVuIHJ1bm5pbmcgZnJv
bSBYVEFMLiBUaGlzIGlzIHZlcmlmaWVkIHRvIHdvcmsgb24gbXkKTWVzb244YiBPZHJvaWQtQzEg
Ym9hcmQgdXNpbmcgInB3bV9iIiBvbiBHUElPWF8xMS4KClRoZSBzZWNvbmQgcGF0Y2ggd2FzIHN1
Z2dlc3RlZCBieSBVd2UgS2xlaW5lLUvDtm5pZyBidXQgd2FzIGFjdHVhbGx5CmltcGxlbWVudGVk
IG11Y2ggZWFybGllciAoYmFjayBpbiBtaWQgMjAxOCkgYnkgQmljaGFvIFpoZW5nIGZyb20KQW1s
b2dpYy4gVGhpcyBwYXRjaCBmaXhlcyBjaGFuZ2luZyB0aGUgZHV0eSBjeWNsZSBieSByZWx5aW5n
IG9uIHRoZQpoYXJkd2FyZSB0byByZS1zdGFydCB0aGUgUFdNIG91dHB1dCAoaW5zdGVhZCBvZiBh
ZGRpbmcgYW4gYXJ0aWZpY2lhbAoiY29uc3RhbnQgTE9XIiBvZiBhYm91dCAyMG1zIC0gYXMgbWVh
c3VyZWQgYnkgQmljaGFvIFpoZW5nIHdoZW4Kc3RvcHBpbmcgYW5kIHJlLXN0YXJ0aW5nIHRoZSBQ
V00gb3V0cHV0IGZyb20gd2l0aGluIHRoZSBkcml2ZXIpLiBJCnRlc3RlZCB0aGlzIGZpeCBvbiBt
eSBNZXNvbjhiIE9kcm9pZC1DMSBib2FyZCB3aGljaCB1c2VzIGEgUFdNIGRyaXZlbgpDUFUgcmVn
dWxhdG9yIChEVkZTIHdpdGggYWxsIHN1cHBvcnRlZCBPUFBzIGlzIHN0aWxsIHdvcmtpbmcgZmlu
ZSBmb3IKbWUsIGFsdGhvdWdoIEkgY291bGRuJ3Qgb2JzZXJ2ZSBhbnkgaXNzdWVzIGJlZm9yZSB0
aGlzIHBhdGNoKS4KCkkgYWxzbyBoYXZlIHNvbWUgY29kZS1pbXByb3ZlbWVudHMgcXVldWVkIHdo
aWNoIEknbGwgc2VuZCBpbiB0aGUgbmV4dApkYXlzLCBzZWUgWzFdCgoKWzBdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTA4ODA0MTkvClsxXSBodHRwczovL2dpdGh1Yi5jb20v
eGRhcmtsaWdodC9saW51eC9jb21taXRzL21lc29uLXB3bS1mb3ItNS4yLXYxCgoKQmljaGFvIFpo
ZW5nICgxKToKICBwd206IG1lc29uOiBkb24ndCBkaXNhYmxlIHB3bSB3aGVuIHNldHRpbmcgZHV0
eSByZXBlYXRlZGx5CgpNYXJ0aW4gQmx1bWVuc3RpbmdsICgxKToKICBwd206IG1lc29uOiBjb25z
aWRlciAxMjggYSB2YWxpZCBwcmUtZGl2aWRlcgoKIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwg
OSArKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
