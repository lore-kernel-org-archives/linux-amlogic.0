Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2081C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 11:10:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8564F21707
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 11:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="irTdILEk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QmBXtZsc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8564F21707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXE1aE6M6spBMxw9A5q+O2H5CetrHMuEuBBvCgnmozo=; b=irTdILEkZgjInsqQn2hTtJUl6g
	cO081BhN2Ybtemws2oL/tNwtCXDpXgVMHfUwUmhvCDdCvcbDVPN1ZGRZN4Dwhhd0rP7fYsWW6WLyc
	RC9nABJAD0miDXYp/DLN14Jw6xXiYvQQI7LpIwdpRt26KQpXN1srqj7eEfoWgyIEa5ppHSFXc1MTe
	J3aB7kI6yUi+o6VqnUE/Ll0haufbKljQefFjYiY+Rj2aMYwgXB8sy1ooV86iWdEy155rU7LT8XH+M
	0qeSHPRYz1v3rHmM0EO7s4w88u0x0fRsbcAJQE/ozvGmifz8r9Wi0vAFQntn47vUSKrqwg8/RFXxy
	dEd6rTzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFF2g-0004Lu-Kh; Mon, 07 Sep 2020 11:10:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFF2d-0004LJ-Jn
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 11:10:32 +0000
Received: by mail-wr1-x441.google.com with SMTP id g4so15381649wrs.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyfLckJhiZ5sjHjg6KN13DoyRvqbjPb2/1GNLHUTQ18=;
 b=QmBXtZscSFhFSWmsqbWRggCLAvMzSVGeAB6uNwTdM11fep54tfrxptBj+Rd04GjKwU
 ZO/seRoLaVJDlrcn5Y6Q0GrKitqT9URFvyE7524RsQd0UKxWpDkp5+3VoKjiIB03A7kN
 7KaO/TzW3UYcLcuzYXkfNpJnYtgbkKkfMJaq2ZGjOvKxpsb8egJGHVNPLx/+YZ7D7HIL
 X/prO/CU2BMymmOCgs45XbqHNZlv10+915vQvZBs5+UG6V2+a6HZ/qTz0X/nGD7UNIn8
 wJApzbh0qn5frSxnTrjUygmG6ePUI1fgFhcZ7gy0KmuLbmJ8Kiy1rQVx+IG4GypJQfeZ
 LOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyfLckJhiZ5sjHjg6KN13DoyRvqbjPb2/1GNLHUTQ18=;
 b=iV3VqSCviHmfhrreYHa4GDVzlQSJ7TfjaLhijkUj7etqOw34I+zSTKZReo0AfOlgG/
 djaczzqaUSIoFXpVljPaFn+l7Frcb0u/T1iTEkfCyF0cyhHb8e5VTIfWIWRYFfZwKl//
 dQ1ho6102SvAtDRXbOw87hat0iVIYCvsnGGPRH6yHjx2jdVZb9VQjZCJVdtjSm7FPpgE
 xUg+QnTmY7O7VJQtHnPN9JMwicXt1TJwt737jQ2PwC5Q7DqcYzIQ7i0wkXcuqtcuJnSu
 EMEk9BQLn0QTPYie3H6h7WnRxQK5tiOcocJOkBvaoqodNhL+NTrOb6qwvQIKY/kMa2KU
 GDug==
X-Gm-Message-State: AOAM532xoOQ657+2Ps9EIz8HzXSB5JYwR/pTGgpXnt66/V69J+t6xYgv
 XfX8BV8Fq1AcKh57MJkapRD4dw==
X-Google-Smtp-Source: ABdhPJydVdSsCLGHaYXiDQPPFXJqDlI3Gq8+/+6752E5DlDac2zDdha6cnWoGI5J0cNDYNsz91bj7A==
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr20751383wrc.123.1599477030165; 
 Mon, 07 Sep 2020 04:10:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u13sm19922111wrm.77.2020.09.07.04.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 04:10:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH 0/3] drm: panel: add support for TDO tl070wsh30 panel
Date: Mon,  7 Sep 2020 13:10:24 +0200
Message-Id: <20200907111027.21933-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_071031_758689_2310C0BF 
X-CRM114-Status: GOOD (  10.99  )
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
bGxlci4KCkNoYW5nZXMgc2luY2UgdjEgYXQgWzFdOgotIGFkZGVkIG1pc3NpbmcgdmVuZG9yLXBy
ZWZpeGVzIHBhdGNoCi0gcmVtb3ZlZCB2cmVmcmVzaAotIGZpeGVkIHdhcm5pbmcgb24gYWRkX3Bh
bmVsIHJldHVybgotIHJlbW92ZWQgRFJNIGxvZ2dpbmcKClsxXSBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzgxMzc2LyNyZXYxCgpOZWlsIEFybXN0cm9uZyAoMyk6CiAg
ZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogQWRkIFNoYW5naGFpIFRvcCBEaXNwbGF5CiAg
ICBPcHRvbGVsZWN0cm9uaWNzIHZlbmRvciBwcmVmaXgKICBkdC1iaW5kaW5nczogZGlzcGxheTog
cGFuZWw6IGFkZCBURE8gdGwwNzB3c2gzMCBEU0kgcGFuZWwgYmluZGluZ3MKICBkcm06IHBhbmVs
OiBhZGQgVERPIHRsMDcwd3NoMzAgcGFuZWwgZHJpdmVyCgogLi4uL2Rpc3BsYXkvcGFuZWwvdGRv
LHRsMDcwd3NoMzAueWFtbCAgICAgICAgIHwgIDU4ICsrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
S2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMTEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL01h
a2VmaWxlICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10ZG8tdGwwNzB3c2gzMC5jICB8IDI1NiArKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hh
bmdlZCwgMzI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC90ZG8sdGwwNzB3c2gzMC55YW1sCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRkby10bDA3MHdz
aDMwLmMKCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
