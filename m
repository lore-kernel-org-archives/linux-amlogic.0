Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBAFCD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ke6IYPaYE/zkiCOre/mX5fpsJtSLLFUxy44+1z53LLk=; b=WbqexhBbN1TquA
	eOxnmtUZ3LLNe/Kh529U9pJ7IE7t9FmnzF4sGmh6WOA2B6APowQdh0WMHQho64Wwb10czk+uBxBAz
	ww+UN3eJo6TL+4TVfBJ2yB2JbGGKU80kk2vW70+3r4jRCMbhCTFHIsjUC9efynKcQVGSuKcUTx1/0
	ecXQl8/U9J5qIJrvb/w2S1XcY4DbYoPyK/9TnJicZ6OCJaBtDaBh37M+un8J7L03kw8h+J6lVQ2Sp
	w3RWg0saJcwzrzzLtaARfsnXWSUV6zUoIdZETErabHmxVtmrggzrKEA2M3AkXAVuRT33e+ZMURZa8
	UbSG8dc63QRvscK092Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGG4-00000008bEL-3CGe;
	Sat, 30 May 2026 09:45:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFz-00000008bAk-0l0u
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:45:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c0a5354da1so2156445ad.0
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134326; x=1780739126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=Sq+dJChtAsCDFwj68rMJi5qoV1bOd9dxPo6j6fRy7Cb1qabINNl1+wiuodTEI8oKm8
         QxTvajf0ibmFrOasLWvA8oEHZEBzaQJx/QlJsrHqpvzrPMHjOUWXZCi+lZGDPvBIqQoy
         E0l/xzy6PMc9IUQADEUHQjZpcbN89iA8MR9CE/w3FoJZK77pestbSHRXjCCt5Ub5/FXa
         v5rKoX53lYykWuBk8YiRM9etkmY62Jjc6OO3SE1Y1UXaWE+bv6wkIQFDHi8lOVgwDK3/
         nNbMvPv0rf+5mQjevdXwokjeLWU2O9RHdgvVBJhOQZzGDBGcSRoOOVINC28fo2uZUztO
         3/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134326; x=1780739126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=HloO3pXf7FQebJ5ANlUciA0Zc8CwH2f4RhwP2dS/ASznub+COkdpJBiSfJC0QicN3f
         UfmZSGf15nZSjXMeA79kj3bYCZMHBAhq7RdL9zOZJqfpf/7EyFDB7SVBJP0QD6qkkhLN
         FK0NvcnuQjq6MTU69Jia/SeG5CKaxCR17bkmoeH71u0BVrLLUB3yVJuDQJnYlgfifZd6
         u09TU0JohpLMqQSSq0qhvyaieeoieB2AvqbgLnNJDuAE+Ps7VIkSyw2MhhTjuVg9eY3D
         GdAuG/+lWH4iiSaCxkUk4+fUNm+CE1h2tVGH3li4g3EZSi+POSsy0uKm3/MNrejzCA6l
         vcRg==
X-Forwarded-Encrypted: i=1; AFNElJ9uRo3YDR8rANcWZgdA2vtEdg3Ht9IMFsAPxNcuUiBe+nnMpjbg6RJqvEezUx1rZ9479URUW/oiY3qHMwmL@lists.infradead.org
X-Gm-Message-State: AOJu0YymGv2jYghUvIjTlUHPGcow6kgHppxpT0pPqRZFeO+P+aK/Y7Od
	DxnhQKBS19QSOUtKqyokyO3csBPUDctQbBI4BTjxnOeFFisHw4nAS5t0
X-Gm-Gg: Acq92OEeTAw5MolxBroir3OWROO0mi64cULfXmYPNJvr1pAIBh6QiovwmWE3tWWNuvM
	kNCI/dKEnzuaGNesFLdQ39QZBgSliCjHHReu5qnjaqeVzbwkghX6Qs2eFSlo4/OpixPMzsvptEM
	lEBEgJ904wRe6LVkN7ORII5UTw+WG77l8afjh7YjCTHrePJaaW7GuV5e3zBjZPJM2szUuqwbRvV
	O1OSBtfahwT2+fyt0eYUAFVBht3vSzaVQsZEu3vRRNJX6xw0k3rg5opo3juOXsCht3pTQVgptGj
	aXVQluhIO6a1Mj6+tqo2RcdkcV+tQjqcRhRXK4/7kawheMwYh3J10RTSdXQ80nxdriTYPIJo+NJ
	3qljAQUGtgy353ehocTLEK8vhZMaKIe/qLdVhcyz2RMu0OaiL2wjwktml0grnZdIHAWOJaNQ9AJ
	LzvXE0vXDMUiXy3B2bq+Gwa3XE6nhVkYg=
X-Received: by 2002:a17:902:c402:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2bf2048b983mr72327425ad.8.1780134326539;
        Sat, 30 May 2026 02:45:26 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:25 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 8/8] gpu: drm: meson: Fix DMA max segment size for DMABUF imports
Date: Sat, 30 May 2026 15:12:54 +0530
Message-ID: <20260530094326.11892-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024527_228715_38291BAE 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

V2hlbiB1c2luZyBoYXJkd2FyZS1hY2NlbGVyYXRlZCB2aWRlbyBkZWNvZGluZyB2aWEgdjRsMm0y
bS1jb3B5IHdpdGggbXB2IG9yCnNpbWlsYXIgcGxheWVycywgdGhlIHZpZGVvIGRlY29kZXIgZHJp
dmVyIChgbWVzb25fdmRlY2ApIGV4cG9ydHMgY29udGlndW91cwptZW1vcnkgYWxsb2NhdGlvbnMg
YXMgRE1BQlVGcy4gV2hlbiB0aGVzZSBidWZmZXJzIGFyZSBzdWJzZXF1ZW50bHkgaW1wb3J0ZWQK
YnkgdGhlIGRpc3BsYXkgY29udHJvbGxlciBkcml2ZXIgKGBtZXNvbi1kcm1gKSBmb3IgcmVuZGVy
aW5nIHZpYSB0aGUgR1BVIG9yCmNvbXBvc2l0b3IsIHRoZSBETUEgQVBJIHRocm93cyBjb25zdHJh
aW50IHZhbGlkYXRpb24gd2FybmluZ3MuCgotIENhbGwgZG1hX3NldF9tYXhfc2VnX3NpemUoZGV2
LCBVSU5UX01BWCkgdG8gYWxsb3cgbGFyZ2UKICBzY2F0dGVy4oCRZ2F0aGVyIHNlZ21lbnRzLgot
IEVuc3VyZXMgdGhlIERSTSBjb3JlIGFuZCBjYW52YXMgYWxsb2NhdGlvbnMgY2FuIGhhbmRsZQog
IGZ1bGwgc2l6ZWQgYnVmZmVycyB3aXRob3V0IGhpdHRpbmcgRE1B4oCRQVBJIHdhcm5pbmdzLgoK
VGhpcyBhbGlnbnMgdGhlIGRyaXZlciB3aXRoIGNvbW1vbiBETUEgc2V0dXAgcHJhY3RpY2VzIGFu
ZAphdm9pZHMgZmFpbHVyZXMgb24gcGxhdGZvcm1zIHdpdGggc3RyaWN0IHNlZ21lbnQgbGltaXRz
LgoKQ2M6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPgpTaWduZWQtb2Zm
LWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2Rydi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwppbmRleCA0OWZmOWYxZjE2ZDMuLjg1NzBh
ZGQ4YjgzMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwpAQCAtMjQ3LDYgKzI0Nyw4IEBA
IHN0YXRpYyBpbnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9v
bCBoYXNfY29tcG9uZW50cykKIAkJZ290byBmcmVlX2RybTsKIAl9CiAKKwlkbWFfc2V0X21heF9z
ZWdfc2l6ZShkZXYsIFVJTlRfTUFYKTsKKwogCXJldCA9IG1lc29uX2NhbnZhc19hbGxvYyhwcml2
LT5jYW52YXMsICZwcml2LT5jYW52YXNfaWRfb3NkMSk7CiAJaWYgKHJldCkKIAkJZ290byBmcmVl
X2RybTsKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
