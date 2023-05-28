Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5400C7EE29
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HspftS5eV21qIvaC+0xmtFxHNgijfF5gXnAP2DrZ2FE=; b=jjzJ/5sM1hLlAD
	d95egqU8LhgKSPdw1e2/iHJf5GsspouzMCNEITRfWmjXXER7IMww13t5aywvRlkyeBf0TAFezSpL+
	GyIpagwqT3tNXErzj1DRDgzCfnZvs/cWNbhrZWzEC77FD39jM3URS+qG6nZHuqMuDeKfkOL0hQbfW
	JcDf2WRaNmHkslTdIsSVucIYmyptH0pIMYQz8LzbEI/NZaA0BcawEiiRJ5gBacipxNTSTSZXnhYsx
	jQLyKCcM9X1cddPBb4BaY5utB+fJpHEDNRIfIYNLF0DFZO4/jeskXEiJrIHxE3KSnAQyC1+bJEhUg
	a/alFxrIFh1f0SGh0Uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3GwR-007krt-2X;
	Sun, 28 May 2023 14:00:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3GwO-007kqG-2D
	for linux-amlogic@lists.infradead.org;
	Sun, 28 May 2023 14:00:14 +0000
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D87966029DE;
	Sun, 28 May 2023 15:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685282409;
	bh=5MUkRAo0JJuz6TjBOxCjVdLdxM6h3ukGhssysW3rVp0=;
	h=From:To:Cc:Subject:Date:From;
	b=J8350Oiraz1ZWlBHEpqpDsT2V/vXneKTOyG2ebNn5P2MiY0cdBu2DfcP7aBWOanFJ
	 jGoS6Kd3VBW68/m+kmQ4zd+wulNnh5hY8WyBlBZQ4WnlnALynswPwYxqu4ajNq0Cqp
	 Hk0CqJSqrPMdTu6NSempzQIvnQVkB/lAQFdT6OmVGjrF9K0kavl/VAYH2OJFjVDkEr
	 iEYypBv3ma5LIdBXIPjo2pIH9pA7fZ19nJLqCsFUL1olSJvhqpj8wn+TXoM4IOzGgl
	 Gfw/HabNzS+iATjqh+5PnF2oDNJZe00UqXXyCWbJRp9Y+vjItQM3oFkK1n1JxNETqM
	 Wy3mSkxNLMxyw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	rfoss@kernel.org,
	andrzej.hajda@intel.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH 0/3] Add additional YUV420 bus format check for dw-meson's bridge enable
Date: Sun, 28 May 2023 14:59:58 +0100
Message-Id: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_070012_948178_783C80DA 
X-CRM114-Status: UNSURE (   8.76  )
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

VGhpcyBpcyBhIGJlbGF0ZWQgZm9sbG93LXVwIG9uCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC8yMDIyMDUxNTIwNDQxMi4yNzMzODAzLTEtYWRyaWFuLmxhcnVtYmVAY29sbGFib3Jh
LmNvbS8KCkNvbW1pdCBlNjdmNjAzN2FlMWJlMzRiMmI2OCAoImRybS9tZXNvbjogc3BsaXQgb3V0
IGVuY29kZXIgZnJvbSBtZXNvbl9kd19oZG1pIikKYnJva2UgNEsgZGlzcGxheSBtb2RlcyBmb3Ig
bWUsIGFuZCBJIGRpc2NvdmVyZWQgaXQgd2FzIGJlY2F1c2UgdGhlIHJpZ2h0IHBpeGVsCmNsb2Nr
IHdhc24ndCBiZWluZyBjaG9zZW4gaW4gZHdfaGRtaV9waHlfaW5pdC4gSSBtaXNpbnRlcnByZXRl
ZCB0aGUgcmVhc29uIGFzIGEKcHJvYmxlbSBpbiBmaWd1cmluZyBvdXQgd2hldGhlciB3ZSB3YW50
IHRvIGVuZm9yY2UgWVVWNDIwIG1vZGUsIGJ1dCBpdCB0dXJuZWQKb3V0IHRvIGJlIGEgbWlzbWF0
Y2ggYmV0d2VlbiB3aGF0IGR3LW1lc29uIGNvZGUgaXMgZG9pbmcgYW5kIHRoZSB3YXkgdGhlIGJ1
cwpmb3JtYXQgaXMgYmVpbmcgcGlja2VkIGJ5IHRoZSBkdy1oZG1pIGJ1cyBvdXRwdXQgZm9ybWF0
IGRybSBoZWxwZXIuCgpJIGZpeGVkIGl0IGJ5IGJyaW5naW5nIGJhY2sgZHctaGRtaSBidXMgZm9y
bWF0IGNoZWNrIGluIGR3LW1lc29uLgoKVGhlIHNlY29uZCBwYXRjaCBtYWtlcyBzdXJlIFlVVjQy
MCBidXMgZm9ybWF0IGlzIHRoZSBvbmx5IG9uZSBiZWluZyByZXR1cm5lZCBieQpkdy1oZG1pJ3Mg
b3V0cHV0IGZvcm1hdCBicmlkZ2UgZnVuY3Rpb24gd2hlbiB0aGF0J3MgdGhlIG9ubHkgZHJtIG1v
ZGUgYWxsb3dlZC4KCkFkcmnDoW4gTGFydW1iZSAoMyk6CiAgZHJtL21lc29uOiBkdy1oZG1pOiBj
aGFuZ2UgWVVWNDIwIHNlbGVjdGlvbiBsb2dpYyBhdCBjbG9jayBzZXR1cAogIGR3LWhkbWk6IHRy
dWx5IGVuZm9yY2UgNDIwLW9ubHkgZm9ybWF0cyB3aGVuIGRybSBtb2RlIGRlbWFuZHMgaXQKICBk
dy1oZG1pOiByZW1vdmUgZGVhZCBjb2RlIGFuZCBmaXggaW5kZW50YXRpb24KCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDM1ICsrKysrKysrKy0tLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jICAgICB8ICA0ICstLQog
aW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgfCAgMiArKwogMyBmaWxl
cyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCi0tIAoyLjQwLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
