Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EB3C0218A
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jan 2025 22:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfcACEuovtGTRvvM+nqoukYTPlVuNp/rFeRafy7bVw0=; b=1WYkM41q+4TIc5
	7/WKYsjzU1NXve7enlMUWEyk3b3cq/qJFg2u1NHjYCx0TvHY7HoN3ACC7fk0wlNt5HzsWpg0UMmLI
	VqEwEioPw7EJyI76ba/O1lb3RJ0ioTvbJwqLTJoeGrvlSdDBnQPxquNMofZKlwAJuxRtEJ5vyZVBw
	04/ju3+zWI1FGiVvIScbjXdWT4gzgXNPZ9Mwn6cc5tWgysm1qXoZxkFZ22kwoxWrXgvytMlgCZas9
	0+q/n+5zageCsdA3NZ5ufxYbiI2S8AIh8YD9jMChHVtYKS6OdbWj5bQ5mcPOZY2MSaMiAh8m8Yrgf
	JsfNUk3SqUohSS61UxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu7q-00000005wn7-0hqr;
	Tue, 28 Jan 2025 22:32:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu7n-00000005wkB-3muT
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jan 2025 22:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738103523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FT+LB9XyHtC4Gj89X2CISx5zHalQ981h59ZAU2H883M=;
	b=HnHGO2i5WCYQQwE0bD2iqbJGQ/MOP5blzngdikTIbKVzIUCgi8B5Aja5t1hkhwb3/uouTJ
	ZsNE9IhM6Ax8ZypZXBDrMRyS1nw3fZDrPKVclwSZyA/f5epIrHefJWnbA2AvdwRlcPhLRj
	I3xNc5HTU44drrRNcHA4kimtu0tv6uI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-329-M2RzTAHnMa-s-Qvyv4CCZQ-1; Tue,
 28 Jan 2025 17:32:00 -0500
X-MC-Unique: M2RzTAHnMa-s-Qvyv4CCZQ-1
X-Mimecast-MFC-AGG-ID: M2RzTAHnMa-s-Qvyv4CCZQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEC54180034D;
	Tue, 28 Jan 2025 22:31:53 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.231])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D4F2818008DC;
	Tue, 28 Jan 2025 22:31:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 28 Jan 2025 17:29:31 -0500
Subject: [PATCH 07/14] drm/rockchip: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0
Message-Id: <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738103410; l=1654;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ajXPI9xB0Rs31Rc4x9qTz/uAYXcdrRjutTTRm1keGG4=;
 b=LDffY/YSoJthJibzS51SC42ZXvZrbp2ayc7zabHlWIb3613ZhwERUpoDhV+XXcJIzmp40r+tI
 M92TihMbvZQAPKQMCFEl20B8k7s+n0MjBVXZT6Ras5dWx8LX3W0QmuA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K0z3qdxjaxnthTjkNntlL0voMVG5FlM7IbqF2KmYGtA_1738103514
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_143204_034468_38C64566 
X-CRM114-Status: GOOD (  10.73  )
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

UmVwbGFjZSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UgKyBkZXZtX2lvcmVtYXBfcmVzb3VyY2UKd2l0
aCBqdXN0IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpCgpVc2VkIENvY2NpbmVsbGUg
dG8gZG8gdGhpcyBjaGFuZ2UuIFNtUGwgcGF0Y2g6CkBydWxlXzFACmlkZW50aWZpZXIgcmVzOwpl
eHByZXNzaW9uIGlvcmVtYXBfcmVzOwppZGVudGlmaWVyIHBkZXY7CkBACi1zdHJ1Y3QgcmVzb3Vy
Y2UgKnJlczsKLi4uCi1yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwuLi4pOwotaW9y
ZW1hcF9yZXMgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoLi4uKTsKK2lvcmVtYXBfcmVzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsMCk7CgpDYzogU2FuZHkgSHVhbmcgPGhq
Y0Byb2NrLWNoaXBzLmNvbT4KQ2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+CkNj
OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+ClNpZ25lZC1vZmYtYnk6IEFudXNo
YSBTcml2YXRzYSA8YXNyaXZhdHNAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2Nr
Y2hpcF9kcm1fdm9wLmMKaW5kZXggNTc3NDdmMWNmZjI2ZTQ0NGVmMzU2OTk4M2Q2YTdmNzkyMmYw
M2ZmNy4uNGM2MzlmN2M4Njg5MDdmYzM1Y2UyMmYyZWY3ZTI4MWFkODVjMmQ5ZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCkBAIC0yMTg3LDcgKzIxODcs
NiBAQCBzdGF0aWMgaW50IHZvcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCWNvbnN0IHN0cnVjdCB2b3BfZGF0YSAqdm9wX2RhdGE7
CiAJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkYXRhOwogCXN0cnVjdCB2b3AgKnZvcDsK
LQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAlpbnQgcmV0LCBpcnE7CiAKIAl2b3BfZGF0YSA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwpAQCAtMjIwNyw4ICsyMjA2LDcgQEAgc3RhdGlj
IGludCB2b3BfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwg
dm9pZCAqZGF0YSkKIAogCXZvcF93aW5faW5pdCh2b3ApOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKLQl2b3AtPnJlZ3MgPSBkZXZtX2lv
cmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOworCXZvcC0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKHZvcC0+cmVncykpCiAJCXJldHVy
biBQVFJfRVJSKHZvcC0+cmVncyk7CiAJdm9wLT5sZW4gPSByZXNvdXJjZV9zaXplKHJlcyk7Cgot
LSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
