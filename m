Return-Path: <SRS0=8tFv=4V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D97C3F2D1
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 10:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8546F2072D
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 10:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9WJ2T3j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p5N/NFyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8546F2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNvf5RspJ4jzvX+ODiMmDyT4n+dfW5m+3CqyrMacLEc=; b=R9WJ2T3jFdh10V
	qULuSTJUQk+iBFCTHHkVV8IGOlBKkeTbniertcjcL++uZosChr4xyTfxGPS8hw6SoBGQw4aNiOCxN
	F0auK2RlpF/gxGH2KkAlCgrCTCjTLJV5+tjjHsO8qo26epjHjxoK0dHcVY9GIMgzk8PLM1uO3A5sD
	ctkIzhCtjN3k6rjc/ncmYil7yEgcwTBSmlBRNltPjl3LtbvOM54eg+yR4/YXo5Zi+0E/+znqH53hg
	PIMWaVEsJfahr+NmIDbFqp43oqfRfHPAIvFKQmx6kFgWILj+wqN+vu1y4U+LVrw/ZdnT7tVBfDx65
	L6KOiVigV8N1VNTuwD4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9RSZ-00070X-H0; Wed, 04 Mar 2020 10:41:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9RSW-0006zS-UZ
 for linux-amlogic@lists.infradead.org; Wed, 04 Mar 2020 10:41:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id r17so1745515wrj.7
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2020 02:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tlZFtTmligcUGV2ilGv6/Rl0JPmMhZmteeBqaEsq6sg=;
 b=p5N/NFyAuT8ukGGq70FLD7EFyzryrkzlSFGA0gCXfZFxRI8hmOfyqv+c0JPYRinVno
 dz8FZYsj9MLsdY9duoUA8YcA57relbWXeZqDOfcpFC9E9WrKALLhb1YqtDVkAkOPm+HH
 b7F10S1+LdUuN/riOdvhrf24aTAN9k6pHqqx6LxNrIcARf3cBWWkXNbfHTfyE77gyMbS
 rDXZf5n2/1yHQydhOv/LdgTKcEXvCXAPMk6cPoCRKIqn008fhy+K9XjrWGHNEgFj2IVQ
 BzyiT+1yUoQMgUY/G5xZJZIBkoFRi3JrVlzV1vARxcxSjZh8DoP3aplkTIc1Iftgw7tu
 Lhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tlZFtTmligcUGV2ilGv6/Rl0JPmMhZmteeBqaEsq6sg=;
 b=OcJDVgf8JX57OYoFAKacNbONZB6To6H22H4z4feFs5jnK+kE1Q79ez7CuhBLQTePjb
 JndWbQLVPsIwPqeP3mvX8s62uKE8RmJmHU/EkY80eelALtUQsM0/VFxgBbtxGtam77O7
 IgP/IYYX8XBLkLLvwz8c/t4pYJ/CySW8JHmIVkq/vO0xXDo8vlwMdhNMrpvO+kuXLhIV
 uFinHWOknc5e2xDQje92HFLyxQ6+7DTQQomTkYnFvbgipfMIeKMz+2bmLaOtD5lgkK2/
 7c1ZconDbsP03bpn97KX2OlsPz4PIERtezmzckcP8BpeBz4qLVCJUD1D0qvF5vlOKQyR
 9PsA==
X-Gm-Message-State: ANhLgQ37WIT2UX6ewCPOg+uCt1yvUboq1qd0AM3jHsezW7xDABbVlPRs
 I0EglzsUQPYDl4/MGMoS3NPHTA==
X-Google-Smtp-Source: ADFU+vs3gnEE2UIP5b+mmLx2vKVo2Uouk57cGecRqzNjEhKymPdorJNJJ26O032WTJZcTMZagGHwXw==
X-Received: by 2002:adf:fa07:: with SMTP id m7mr3439222wrr.384.1583318459144; 
 Wed, 04 Mar 2020 02:40:59 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:40:58 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de, heiko@sntech.de, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep color
Date: Wed,  4 Mar 2020 11:40:42 +0100
Message-Id: <20200304104052.17196-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304104052.17196-1-narmstrong@baylibre.com>
References: <20200304104052.17196-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_024100_980939_0A5C749D 
X-CRM114-Status: GOOD (  10.01  )
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

RnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKQ29uZmlndXJlIHRoZSBjb3Jy
ZWN0IG10bWRzY2xvY2sgZm9yIGRlZXAgY29sb3JzIHRvIHByZXBhcmUgc3VwcG9ydApmb3IgMTAs
IDEyICYgMTZiaXQgb3V0cHV0LgoKU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNA
a3dpYm9vLnNlPgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+ClJldmlld2VkLWJ5OiBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5za3JhYmVjQHNp
b2wubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMKaW5kZXggOWJhZDE5NGNmZDBhLi4xMGY5OGM5ZWU3N2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0xODE0LDEzICsxODE0LDMyIEBAIHN0YXRpYyB2
b2lkIGhkbWlfYXZfY29tcG9zZXIoc3RydWN0IGR3X2hkbWkgKmhkbWksCiAJaW50IGhibGFuaywg
dmJsYW5rLCBoX2RlX2hzLCB2X2RlX3ZzLCBoc3luY19sZW4sIHZzeW5jX2xlbjsKIAl1bnNpZ25l
ZCBpbnQgdmRpc3BsYXksIGhkaXNwbGF5OwogCi0Jdm1vZGUtPm10bWRzY2xvY2sgPSB2bW9kZS0+
bXBpeGVsY2xvY2sgPSBtb2RlLT5jbG9jayAqIDEwMDA7CisJdm1vZGUtPm1waXhlbGNsb2NrID0g
bW9kZS0+Y2xvY2sgKiAxMDAwOwogCiAJZGV2X2RiZyhoZG1pLT5kZXYsICJmaW5hbCBwaXhjbGsg
PSAlZFxuIiwgdm1vZGUtPm1waXhlbGNsb2NrKTsKIAorCXZtb2RlLT5tdG1kc2Nsb2NrID0gdm1v
ZGUtPm1waXhlbGNsb2NrOworCisJaWYgKCFoZG1pX2J1c19mbXRfaXNfeXV2NDIyKGhkbWktPmhk
bWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpKSB7CisJCXN3aXRjaCAoaGRtaV9idXNfZm10X2Nv
bG9yX2RlcHRoKAorCQkJCWhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpKSB7CisJ
CWNhc2UgMTY6CisJCQl2bW9kZS0+bXRtZHNjbG9jayA9IHZtb2RlLT5tcGl4ZWxjbG9jayAqIDI7
CisJCQlicmVhazsKKwkJY2FzZSAxMjoKKwkJCXZtb2RlLT5tdG1kc2Nsb2NrID0gdm1vZGUtPm1w
aXhlbGNsb2NrICogMyAvIDI7CisJCQlicmVhazsKKwkJY2FzZSAxMDoKKwkJCXZtb2RlLT5tdG1k
c2Nsb2NrID0gdm1vZGUtPm1waXhlbGNsb2NrICogNSAvIDQ7CisJCQlicmVhazsKKwkJfQorCX0K
KwogCWlmIChoZG1pX2J1c19mbXRfaXNfeXV2NDIwKGhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1
c19mb3JtYXQpKQogCQl2bW9kZS0+bXRtZHNjbG9jayAvPSAyOwogCisJZGV2X2RiZyhoZG1pLT5k
ZXYsICJmaW5hbCB0bWRzY2xvY2sgPSAlZFxuIiwgdm1vZGUtPm10bWRzY2xvY2spOworCiAJLyog
U2V0IHVwIEhETUlfRkNfSU5WSURDT05GICovCiAJaW52X3ZhbCA9IChoZG1pLT5oZG1pX2RhdGEu
aGRjcF9lbmFibGUgfHwKIAkJICAgKGR3X2hkbWlfc3VwcG9ydF9zY2RjKGhkbWkpICYmCi0tIAoy
LjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
