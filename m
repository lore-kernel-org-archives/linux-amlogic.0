Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAF2C2D0E3
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0BE218AC
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBJanibi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d5I5Am+i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0BE218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MnSth9FA0SRjhiMDnN8/j7l8TWDTfkx20PdGbj6sB4=; b=XBJanibitaMiQL12NJEprFB3/L
	ZD8a4duZHkj6g73BY2nhUe0CKAo+ymbqxLcCgBuEfwFouyTBf0zwsQv0bA4ljcdk+XEQ4dyKAQdCJ
	wFs1s+10ogmTNUnudg62J7vA8+MsarZlbwPDJlsk52WUsceUrz/bc3SvS25WQARf0P1IIR62SCa1V
	uNax45aKIScGaRALAc5FFUOp2707otM/vat4o7gDPB8tvEu9fGV05SjKT0liCN8nzIK1ewOyMw2QZ
	O7YeNuc2391s8FY0Voe+JkbwVXbAdTQKZpeflhFAYzcKdf0T9gKVv8gnWrlB/wj9PC2gmUcxVgTFS
	THeh1x6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI9vf-00073W-UX; Tue, 15 Sep 2020 12:19:24 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI9vc-00072C-5g
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:19:21 +0000
Received: by mail-wm1-x344.google.com with SMTP id a9so3246812wmm.2
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7j+GFEPl0J4mVX0J38jo856GeX7L/pIGsyfYoimqNU=;
 b=d5I5Am+iX/ZTlLBaMLVhIOLDVSNJtj0O2dwF8Ftj0bg09cKrSTyi9V8g45XOxGznvn
 vAwfpzCkmcX+e1qI3igNUjzoFxbWxUYP7C4mcWoPmPepGPyX3vZDdWrB3x6LIKL1NZyP
 Z4tS+WrUE+6Don7+EdPT8qRc+DL5uaYKhCpYyJ8BBeJSJTC4GhNop2Ca4EhuXoLw+Mkt
 H6L5xg53j4yjOdnP4iS1uQi/yt/yG7gfuHgM1wWAW3JqNrGcuKzy0vZEihmq4HTfTI8g
 qqpataXcDG82Cb05rb1emLdp8ao1EYm7pWbgIGGdC4AT8MEEXW4c4hjEnEO7u9ZsVQ1M
 DtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7j+GFEPl0J4mVX0J38jo856GeX7L/pIGsyfYoimqNU=;
 b=JbD3TqPrTnRhlsTclK81TRQm+1OSUv40KoqHb+EofgbvmSf2Ne5FbXulRXM3mwwfnb
 4in2E9hidMoU8/h8gvr9VA7LThvnajdXCxM7ziQaMpMa+FjaQMHPxy5/jsJH31PoUE7K
 otFoz/OYZA1r/nKtDyByOcdqHbsjjV/HlyPubLs4VywAiks/D5T8904MkBzrpWWxEnEv
 +KzngnU4PwBTjIkhFifykqBpr1I5/5HFzIVR6NKaAo+MJN1mmruegpou0Py8WQJBFbuB
 vC8GUn+ndA02RtGAQpskjmNLaXwzkb4P3cO0YtRgHsQO31YbA2TRfYCfp38Auodjmw9s
 2Qyg==
X-Gm-Message-State: AOAM533EjOEYRGZp3htqE8G0I/1aksdXCISYZy2CRS+aQu7k7bIh8xn6
 HEcXbSfRE9Dg/o6RcwJRmpxARst6qBQgM1vd
X-Google-Smtp-Source: ABdhPJx+fzoFxjgYAof+zD34bBVjkkA+EoKo8hnXGiQSj5VtzW/TKrSu3SuFbMpSSfocHxWxCJTiHg==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr4330660wmj.17.1600172356440; 
 Tue, 15 Sep 2020 05:19:16 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH v4 0/4] drm: panel: add support for TDO tl070wsh30 panel
Date: Tue, 15 Sep 2020 14:19:08 +0200
Message-Id: <20200915121912.4347-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_081920_383383_2105E9AF 
X-CRM114-Status: GOOD (  11.13  )
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
bGxlci4KCkNoYW5nZXMgc2luY2UgdjMgYXQgWzNdOgotIHJlb3JkZXJlZCB0ZG8gdmVuZG9yIHBy
ZWZpeAoKQ2hhbmdlcyBzaW5jZSB2MiBhdCBbMl06Ci0gYWRkZWQgcmVzZXQgZ3BpbyB0byBwYW5l
bC1zaW1wbGUtZHNpIGJpbmRpbmdzCi0gbW92ZWQgYmluZGluZ3MgdG8gcGFuZWwtc2ltcGxlCi0g
cmUtb3JkZXJlZCBwcmVwYXJlL3VucHJlcGFyZQotIGFkZGVkIGJhY2sgcmVmcmVzaCBwcmludAot
IG1vdmVkIHJlZ3VsYXRvci9yZXNldCBoYW5kbGluZyBpbiBwcmVwYXJlL3VucHJlcGFyZQotIGFs
aWduZWQgcmVtb3ZlL3NodXRkb3duIHdpdGggcGFuZWwtc2ltcGxlCi0gYWRkZWQgc2VudGluZWwg
Y29tbWVudCBpbnRvIGR0IG1hdGNoIHRhYmxlCgpDaGFuZ2VzIHNpbmNlIHYxIGF0IFsxXToKLSBh
ZGRlZCBtaXNzaW5nIHZlbmRvci1wcmVmaXhlcyBwYXRjaAotIHJlbW92ZWQgdnJlZnJlc2gKLSBm
aXhlZCB3YXJuaW5nIG9uIGFkZF9wYW5lbCByZXR1cm4KLSByZW1vdmVkIERSTSBsb2dnaW5nCgpb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTM3Ni8jcmV2MQpb
Ml0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTM3Ni8jcmV2Mgpb
M10gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTM3Ni8jcmV2MwoK
TmVpbCBBcm1zdHJvbmcgKDQpOgogIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCBT
aGFuZ2hhaSBUb3AgRGlzcGxheQogICAgT3B0b2xlbGVjdHJvbmljcyB2ZW5kb3IgcHJlZml4CiAg
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsLXNpbXBsZS1kc2k6IGFkZCBvcHRpb25hbCByZXNl
dCBncGlvCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsLXNpbXBsZS1kc2k6IGFkZCBURE8g
VEwwNzBXU0gzMCBEU0kgcGFuZWwKICAgIGJpbmRpbmdzCiAgZHJtOiBwYW5lbDogYWRkIFRETyB0
bDA3MHdzaDMwIHBhbmVsIGRyaXZlcgoKIC4uLi9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1k
c2kueWFtbCAgICAgICB8ICAgMyArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJl
Zml4ZXMueWFtbCAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25maWcgICAgICAg
ICAgICAgICAgIHwgIDExICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdGRvLXRsMDcwd3No
MzAuYyAgfCAyNTAgKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDI2NyBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXRkby10bDA3MHdzaDMwLmMKCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
