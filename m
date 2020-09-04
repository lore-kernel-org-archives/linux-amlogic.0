Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6D3C43461
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:15:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BEC20796
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vtxe4Vj3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MLOUcWu0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90BEC20796
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U9KxuuTGM3HAy4YpVC5KOKq1WTNHqTY+pMThh7xnuR0=; b=Vtxe4Vj3v+c61n/uoXu0AXQvrW
	qG0qbntHyZpSCsl9a3LNO5NGnq2VgnhUS9I0C1PmHYW/FHuUmNpKEPbxlsljnu3KS14XJVDWZJyHX
	hQb+5NEJmHpNO11nPy3jkRfMmVKl8eIGEbpDxOKwsTx35W3RnchCwGijqD2aJTfWemdl/+Tnf89ol
	ZBy19iAlRsaIJeUG9IPr1retPrXzET/F67GSTOWcxG7CtgYS2srewPjhKYNUQRmbbHt6VJRsjF/7H
	kM43K9PY9R9I2/C1Em+KeyIia4ZmF61AZXZG1/Gl9YkhuPP3wTRO2WfH+cnBvZp9vq41Q8PaRBOpL
	A6Eg6YbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEMs-0007Uw-9J; Fri, 04 Sep 2020 16:15:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEMq-0007U8-H0
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 16:15:13 +0000
Received: by mail-wr1-x442.google.com with SMTP id w5so7297084wrp.8
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VW8/Gqfl2ygRzhelgm8VgMzXeTrqKEKDiPdSn34tSCE=;
 b=MLOUcWu0MPsrbS2FTQkXUWJ2ueuR/hWyD6JTigcMy8+S7yczFEVDN4sVtXn4Fsmwl5
 QvAIme6XsbyHzM7wfGCpy8xb27TH3PuyZiXVw2Hv6xxjufFaygz433/G1YOUO6xU6pN3
 cUGLJ0Qtyrn2A+li6Z6jyDTLgTEofO5402uUDxU9Pyo3MmAFCWkXhCXbYLOtq+bwbuM6
 7xwxi2TEpadbbP8rn4jr2k+OxTaaKXrf/hO12yEu1rS2eSv7IgymLVUyJgc9/UbuN6ug
 dHNCCfBH168X3KEKAl9zmTol76MXCB3AGAeH41yqsUYnR/cdx6WpEOewjEX7BPm5JJf8
 +WQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VW8/Gqfl2ygRzhelgm8VgMzXeTrqKEKDiPdSn34tSCE=;
 b=qlH1qOS0mQYKu2dAyF9Yr4XIWAn+yRDMNv2qgDoEmO2Fiss2urZF2gGCjBt/L+afyM
 /oPMZvox3LOgk+hYIsaqwzBy/BMhW3F7SjDqys2hTVthL2LNL8UYYyyI2S8g+HRSlb5t
 MJaVsNyIJZ1QwnV0QL4zaEZAexj3iCNbNjYM0gu2Wuqv7Csyrb/EI4uGyS/eaShMnCIU
 Y3MZbzDJd6M/0Q9nvvoYnw3xSIPhUMhvUHzLw/gYlU54UaAtfcwQW3oghZV3XUG9aaH7
 2KNs0Uswmx7BnNbIoy5l1GCbbYMTthFskhlqyLqVwh4P0TmiufBHmyrR5FQjYOaskP0s
 g0yw==
X-Gm-Message-State: AOAM533sbuwCpA8sN+iTPaEi3UBVsQbwbfReosdNFlM3Zs0QkiF35f1M
 jkppyPGGz0fLM/Rk6xZm6Aja5g==
X-Google-Smtp-Source: ABdhPJzBStwPYgSPHPXMrwc0ijPLvHWYZmHpf/4cpLNfKiWOt8MMJHmIYPnwpmV6MkYuzVeqkYlQFw==
X-Received: by 2002:adf:fc43:: with SMTP id e3mr8030854wrs.28.1599236111470;
 Fri, 04 Sep 2020 09:15:11 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d18sm12238160wrm.10.2020.09.04.09.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:15:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH 0/2] drm: panel: add support for TDO tl070wsh30 panel
Date: Fri,  4 Sep 2020 18:15:02 +0200
Message-Id: <20200904161504.23915-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_121512_593070_EDD7596E 
X-CRM114-Status: GOOD (  10.32  )
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
bGxlci4KCk5laWwgQXJtc3Ryb25nICgyKToKICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6
IGFkZCBURE8gdGwwNzB3c2gzMCBEU0kgcGFuZWwgYmluZGluZ3MKICBkcm06IHBhbmVsOiBhZGQg
VERPIHRsMDcwd3NoMzAgcGFuZWwgZHJpdmVyCgogLi4uL2Rpc3BsYXkvcGFuZWwvdGRvLHRsMDcw
d3NoMzAueWFtbCAgICAgICAgIHwgIDU4ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29u
ZmlnICAgICAgICAgICAgICAgICB8ICAxMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZp
bGUgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRk
by10bDA3MHdzaDMwLmMgIHwgMjYzICsrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2Vk
LCAzMzMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Rkbyx0bDA3MHdzaDMwLnlhbWwKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdGRvLXRsMDcwd3NoMzAu
YwoKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
