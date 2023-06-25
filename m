Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCF1C001DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jthh/rDnkLZclogJCgCqNnMszlCxvZ9vEp28UJbku1Y=; b=Z3jBwRj+5qYV+e
	0QCXhrgeWPGWMmm1PH5btCuGCQzIVtXQirXzQK7Fgq35f4t/AmLNdEHhaLd92i29OryCjt4srTMjx
	2aOsBPl6hvhTEeJTCSK1voOVSwi73u+WX6w7ni/quTnci0nnwdq/xDadr9jZ1XXgr2TRC2fW9lsZP
	MIJhILT8VuRS/qHycvRzc53zFB0jQ1Th2pP9QuzOLnqHj/O3K4DK8eXIJ8t3yuCr/kDUwfAqfBzhU
	iONrpAGQkSYKCIWMMzaNZJz642oSMlaWTO1auVLVW7GcekTgYUmGejfyqNqpeEVPU5xvaJdfDrprp
	rvFglRvNeSd/YLuCb+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYq-0087p6-1j;
	Sun, 25 Jun 2023 14:17:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYn-0087mp-13;
	Sun, 25 Jun 2023 14:17:50 +0000
Received: from sobremesa.fritz.box (unknown [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 37B576607143;
	Sun, 25 Jun 2023 15:17:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687702663;
	bh=dFpupq7O24/dJi0HaCEYyiNgtin8JPm9F0yIqnWaVk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0+OzzxSGvVgVt8sVefh7H4+EXSXyTwwKrVbWw6zGU3Q28JXabTCiCl9Ly2PzBAxo
	 /gopWwltD2vCBojMYpWUdn5BxO6uxetDwmWJP+wWEbh3+K/zU304y9nJ8wrc1CppjY
	 EWhaqa3d6eWhrZdJVzl2wh34LhOPBNheTdlX96/R0AsxAnos/d4GyFkaCgtAIg378h
	 WtCgiX7Vpd2JtXjGALxIWrSPi2hJ20AkN33HurUiN2uXwib6B4tHKdR/eHfae+zsKN
	 TInsAdk+Xv3JE2gnLR/3nQYMQSpDq4GiRwwPHk+B9CHLLIiRrtoRh0N/R8fFq/oGuL
	 X7QGK7C869L4A==
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
Subject: [PATCH v3 3/3] drm/bridge: dw-hdmi: remove dead code and fix indentation
Date: Sun, 25 Jun 2023 15:17:17 +0100
Message-Id: <ca42985814e9be33b7f8e3a33cea9e18505299e3.1687702042.git.adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071749_496759_0CAA869D 
X-CRM114-Status: UNSURE (   9.28  )
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

VGhlIGhkbWlfZGF0YW1hcCBlbnVtIGlzIG5vIGxvbmdlciBpbiB1c2UuIEFsc28gcmVpbmRlbnQg
ZW5hYmxlX2F1ZGlvJ3MKY2FsbCBwYXJhbXMuCgpTaWduZWQtb2ZmLWJ5OiBBZHJpw6FuIExhcnVt
YmUgPGFkcmlhbi5sYXJ1bWJlQGNvbGxhYm9yYS5jb20+CkFja2VkLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYyB8IDIyICsrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggM2E3ODgzMTZlMmU1Li42OWMwZTgwYjg1
MjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC00OSwy
MCArNDksNiBAQAogCiAjZGVmaW5lIEhETUkxNF9NQVhfVE1EU0NMSwkzNDAwMDAwMDAKIAotZW51
bSBoZG1pX2RhdGFtYXAgewotCVJHQjQ0NF84QiA9IDB4MDEsCi0JUkdCNDQ0XzEwQiA9IDB4MDMs
Ci0JUkdCNDQ0XzEyQiA9IDB4MDUsCi0JUkdCNDQ0XzE2QiA9IDB4MDcsCi0JWUNiQ3I0NDRfOEIg
PSAweDA5LAotCVlDYkNyNDQ0XzEwQiA9IDB4MEIsCi0JWUNiQ3I0NDRfMTJCID0gMHgwRCwKLQlZ
Q2JDcjQ0NF8xNkIgPSAweDBGLAotCVlDYkNyNDIyXzhCID0gMHgxNiwKLQlZQ2JDcjQyMl8xMEIg
PSAweDE0LAotCVlDYkNyNDIyXzEyQiA9IDB4MTIsCi19OwotCiBzdGF0aWMgY29uc3QgdTE2IGNz
Y19jb2VmZl9kZWZhdWx0WzNdWzRdID0gewogCXsgMHgyMDAwLCAweDAwMDAsIDB4MDAwMCwgMHgw
MDAwIH0sCiAJeyAweDAwMDAsIDB4MjAwMCwgMHgwMDAwLCAweDAwMDAgfSwKQEAgLTg1NiwxMCAr
ODQyLDEwIEBAIHN0YXRpYyB2b2lkIGR3X2hkbWlfZ3BfYXVkaW9fZW5hYmxlKHN0cnVjdCBkd19o
ZG1pICpoZG1pKQogCiAJaWYgKHBkYXRhLT5lbmFibGVfYXVkaW8pCiAJCXBkYXRhLT5lbmFibGVf
YXVkaW8oaGRtaSwKLQkJCQkJICAgIGhkbWktPmNoYW5uZWxzLAotCQkJCQkgICAgaGRtaS0+c2Ft
cGxlX3dpZHRoLAotCQkJCQkgICAgaGRtaS0+c2FtcGxlX3JhdGUsCi0JCQkJCSAgICBoZG1pLT5z
YW1wbGVfbm9uX3BjbSk7CisJCQkJICAgIGhkbWktPmNoYW5uZWxzLAorCQkJCSAgICBoZG1pLT5z
YW1wbGVfd2lkdGgsCisJCQkJICAgIGhkbWktPnNhbXBsZV9yYXRlLAorCQkJCSAgICBoZG1pLT5z
YW1wbGVfbm9uX3BjbSk7CiB9CiAKIHN0YXRpYyB2b2lkIGR3X2hkbWlfZ3BfYXVkaW9fZGlzYWJs
ZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKLS0gCjIuNDAuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
