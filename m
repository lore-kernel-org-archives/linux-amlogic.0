Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C655C0015E
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y/ZGd2i1Z2S4m3wH+PQGysCwCjA+1paRO6zs6cgE6+s=; b=j/h0+rJU4dCvPw
	sn3iJqNieFQCGuBoMas+qDNZhiKE9DaasXXsSkXZERwXeBnvUotEywIVBoSOTwg07AoqsZUodorWY
	b1LR/DwQzb/Nka/VirnZkffhj++wBnS1SzHqOXZ0ECrlpGLYLmHD4E4eC9bNH07h71qu1RiiGSkG4
	Urfgktve3PasOqFNuMqUFCAfiD/pC516NN3lcpZZD7XhS0uGcTAPxt+jWdJzQOQt43UUNZh4lKtpX
	z+2CSx7y1UV7jNRaKUZn4jG2XAVNmta7lo64J3+grZqIZ5G2j6b7E6kNr0QX+D2owPbLpsJxVPgTN
	uI0zbMzzmFx4kSDM+UYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYs-0087qZ-2d;
	Sun, 25 Jun 2023 14:17:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYn-0087mk-2C;
	Sun, 25 Jun 2023 14:17:52 +0000
Received: from sobremesa.fritz.box (unknown [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66B026607117;
	Sun, 25 Jun 2023 15:17:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687702661;
	bh=DxqtcNgHx6hoDKk2XdG/IolUBA1mvNJ/4G4qGWj7gtg=;
	h=From:To:Cc:Subject:Date:From;
	b=bfXlEusYSiypBVOTQo73/JrfKbD5abbFJeLoRPCtK0pol+LLvfQ3MEwmH93H5QY3v
	 EXBnDEyxZtL8WRfWXXiF84jXhGM4rRxlntNAGYfC2Exdg1JESIsyw1Mv2vBdJoWum0
	 etn4CCy+ZPbs4uaJOoywFr7BCIuzp6iM2M5Jv0IFV2zopK972nG0cd+9WiNZDGzEEM
	 /z/3dpzQYfRDpUkIJbNhd7gpF6QOadpHlv4nZxC+XXFRbHLyySNtnDlUYS7dJ1szNe
	 DHuK2V9NzPpXAOTPAlssqofbbPpj9kTjlCpEcwarBKtM/I+MqY3M298tjIw2BmJ/MK
	 JQkcSJm3gxxbA==
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
Subject: [PATCH v3 0/3] Add additional YUV420 bus format check for dw-meson's bridge enable
Date: Sun, 25 Jun 2023 15:17:14 +0100
Message-Id: <cover.1687702042.git.adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071749_847671_20200270 
X-CRM114-Status: GOOD (  11.35  )
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

VGhpcyBpcyBhIGJlbGF0ZWQgZm9sbG93LXVwIG9uCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC8yMDIyMDUxNTIwNDQxMi4yNzMzODAzLTEtYWRyaWFuLmxhcnVtYmVAY29sbGFib3Jh
LmNvbQoKQ29tbWl0IGU2N2Y2MDM3YWUxYmUzNGIyYjY4ICgiZHJtL21lc29uOiBzcGxpdCBvdXQg
ZW5jb2RlciBmcm9tIG1lc29uX2R3X2hkbWkiKQpicm9rZSA0SyBkaXNwbGF5IG1vZGVzIGZvciBt
ZSwgYW5kIEkgZGlzY292ZXJlZCBpdCB3YXMgYmVjYXVzZSB0aGUgcmlnaHQKcGl4ZWwgY2xvY2sg
d2Fzbid0IGJlaW5nIGNob3NlbiBpbiBkd19oZG1pX3BoeV9pbml0LiBJIG1pc2ludGVycHJldGVk
IHRoZQpyZWFzb24gYXMgYSBwcm9ibGVtIGluIGZpZ3VyaW5nIG91dCB3aGV0aGVyIHdlIHdhbnQg
dG8gZW5mb3JjZSBZVVY0MjAgbW9kZSwKYnV0IGl0IHR1cm5lZCBvdXQgdG8gYmUgYSBtaXNtYXRj
aCBiZXR3ZWVuIHdoYXQgZHctbWVzb24gY29kZSBpcyBkb2luZyBhbmQKdGhlIHdheSB0aGUgYnVz
IGZvcm1hdCBpcyBiZWluZyBwaWNrZWQgYnkgdGhlIGR3LWhkbWkgYnVzIG91dHB1dCBmb3JtYXQg
ZHJtCmhlbHBlci4KCkkgZml4ZWQgaXQgYnkgYnJpbmdpbmcgYmFjayBkdy1oZG1pIGJ1cyBmb3Jt
YXQgY2hlY2sgaW4gZHctbWVzb24uCgpUaGUgc2Vjb25kIHBhdGNoIG1ha2VzIHN1cmUgWVVWNDIw
IGJ1cyBmb3JtYXQgaXMgdGhlIG9ubHkgb25lIGJlaW5nCnJldHVybmVkIGJ5IGR3LWhkbWkncyBv
dXRwdXQgZm9ybWF0IGJyaWRnZSBmdW5jdGlvbiB3aGVuIHRoYXQncyB0aGUgb25seQpkcm0gbW9k
ZSBhbGxvd2VkLgoKQ2hhbmdlbG9nOgoKdjM6CiAgICAgICAgLSBDaGFuZ2UgY29tbWl0IG1lc3Nh
Z2UgZm9yIGFsbCB0aHJlZSBjb21taXRzIHRvIGFjY3VyYXRlbHkKICAgICAgICByZWZsZWN0IHRo
ZSBtb2RpZmllZCBmaWxlcycgc3Vic3lzdGVtLgogICAgICAgIC0gQWRkIHYxJ3MgQWNrZWQtYnkg
dGFncyBmcm9tIHN1YnN5c3RlbSBtYWludGFpbmVyCnYyOgogICAgICAgIC0gQWRkIGNvbW1pdCBt
ZXNzYWdlIHRvIHBhdGNoIG51bWJlciAzIGluIHRoZSBzZXJpZXMKCkFkcmnDoW4gTGFydW1iZSAo
Myk6CiAgZHJtL2JyaWRnZTogZHctaGRtaTogY2hhbmdlIFlVVjQyMCBzZWxlY3Rpb24gbG9naWMg
YXQgY2xvY2sgc2V0dXAKICBkcm0vYnJpZGdlOiBkdy1oZG1pOiB0cnVseSBlbmZvcmNlIDQyMC1v
bmx5IGZvcm1hdHMgd2hlbiBkcm0gbW9kZQogICAgZGVtYW5kcyBpdAogIGRybS9icmlkZ2U6IGR3
LWhkbWk6IHJlbW92ZSBkZWFkIGNvZGUgYW5kIGZpeCBpbmRlbnRhdGlvbgoKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMzUgKysrKysrKysrLS0tLS0tLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgIHwgIDQgKy0tCiBp
bmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8ICAyICsrCiAzIGZpbGVz
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKLS0gCjIuNDAuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
