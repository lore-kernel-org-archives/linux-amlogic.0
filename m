Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55248EB64DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRl4Jo+pi1LtqsQW00gyaps4TF+cKovym1KWUxnB5as=; b=DVGX+E58VQFOEm
	M1a2meet9nnYA76a/XMXUcRySQbpzRnOcSbiuDU76hooc2m3BXAboRe4boNAlc03M0as93yvJA7CR
	a6vsU/MzWhKDixYUQco2aIDn9cjQu4/qoh3W4h3S2dDR35Oxy8b6Kl147Xdeyc4FCvO7BatI0unBa
	mnsZlga/ZEyE6kPtiQ29fvXAv5mzRrydVBAEzobHO8SbB0ggSVLw0uwIg99DY+hdWg92GnGquVXyk
	sf+qP5agd6fPr3JVDnk9UNKGv8ktFtRVJxfxAx4MovL0kCIiFRx/imJoLf11S2Nny6uT7wqAgh36b
	9+nSps1NEZU9SfllwK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYs-0087qP-1M;
	Sun, 25 Jun 2023 14:17:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYn-0087mn-2H;
	Sun, 25 Jun 2023 14:17:51 +0000
Received: from sobremesa.fritz.box (unknown [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 99EA76607134;
	Sun, 25 Jun 2023 15:17:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687702662;
	bh=hy/yPAn2uSB4ki0Kb6pM9nocxr+HExnkKdS5jKFuPcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGZrClUaLXMLHLNUlXTRCZS7MdYYm5CKkv4TIIOa/WeEtz8nwbRNvxDJwQcnkpmUr
	 1yQ+gEvrHl6IkZLAgAII0u3MVIzTnE6HWQmD+QV5hmcw/Lw/VR08ihjAhwl1dL4Cvj
	 MeEXNDx6D+hyur1/ehh+B5tgHkX/0dXYZFZo3h0I92dMKAc905CZCS8EOJFdRbgtza
	 ZqpsYyuXUzEjP/gRABmGT7LsmpI0oQSfdfHqRDLi1P8vl27z6Yc49SBerwgiEj96ys
	 48FhO6kzXj7ng2eGYDTifOg+y92+lW5JM/vKZe4VKXpn5VIJfU5ybsp334N28DbBzp
	 i1/K2EGTjvyNA==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] drm/bridge: dw-hdmi: truly enforce 420-only formats when drm mode demands it
Date: Sun, 25 Jun 2023 15:17:16 +0100
Message-Id: <6e6a217c180584a67ed7992c785764ba54af9151.1687702042.git.adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071749_868287_FC49F27B 
X-CRM114-Status: UNSURE (   9.98  )
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

VGhlIGN1cnJlbnQgb3V0cHV0IGJ1cyBmb3JtYXQgc2VsZWN0aW9uIGxvZ2ljIGlzIGVuZm9yY2lu
ZyBZVVY0MjAgZXZlbgp3aGVuIHRoZSBkcm0gbW9kZSBhbGxvd3MgZm9yIG90aGVyIGJ1cyBmb3Jt
YXRzIGFzIHdlbGwuCkZpeCBpdCBieSBhZGRpbmcgY2hlY2sgZm9yIDQyMC1vbmx5IGRybSBtb2Rl
cy4KClNpZ25lZC1vZmYtYnk6IEFkcmnDoW4gTGFydW1iZSA8YWRyaWFuLmxhcnVtYmVAY29sbGFi
b3JhLmNvbT4KQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNyAr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggZTZhNDU2Yjcy
NjEwLi4zYTc4ODMxNmUyZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jCkBAIC0yNzEwLDkgKzI3MTAsMTAgQEAgc3RhdGljIHUzMiAqZHdfaGRtaV9icmlkZ2Vf
YXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkJ
LyogRGVmYXVsdCA4Yml0IGZhbGxiYWNrICovCiAJCW91dHB1dF9mbXRzW2krK10gPSBNRURJQV9C
VVNfRk1UX1VZWVZZWThfMF81WDI0OwogCi0JCSpudW1fb3V0cHV0X2ZtdHMgPSBpOwotCi0JCXJl
dHVybiBvdXRwdXRfZm10czsKKwkJaWYgKGRybV9tb2RlX2lzXzQyMF9vbmx5KGluZm8sIG1vZGUp
KSB7CisJCQkqbnVtX291dHB1dF9mbXRzID0gaTsKKwkJCXJldHVybiBvdXRwdXRfZm10czsKKwkJ
fQogCX0KIAogCS8qCi0tIAoyLjQwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
