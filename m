Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FF0606A32F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LDUD2PVn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fX7yqF49
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RJb+5O1V89ItM5hny49bNHg/C50eU5aMq/kaX0eZh+8=; b=LDUD2PVnbGdYKcdYgbbZVl+lDH
	Q5g1X9zkMF2hyZSDo6dPMhpxUi//kDpZFcDW13duwBmZXckycmzAVvaeFQ6jeGMUsR1nP4ZH10NhX
	Q3S1rwlnbLV/YiQLgSx01s971GOhaA575yrtBx+uuopFC/8yqI51pd5WJmtrd2LaHjZ0BEEejXEqQ
	DQgUUEvZtleVfSTpZ+WWV/YQ5/ACHHzw2XEyB+pkgzCQBNxv9Bq0t5tlcjONcAAP0d8a/CSoI6vk8
	mJBwb7+GvjPcXYg3bxMkOvliW1v46Ff+ObqbuFNqijGs+a0/H9U1wFZ/U06AjWdoaCI99qe0pyIFi
	51bLkPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeM-00000009FSa-1ajo;
	Thu, 29 Oct 2026 12:54:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeI-00000009FQ0-2wLM
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 12:54:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1856529f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278467; x=1793883267; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=fX7yqF497BR6Bhdgoo6r04RxiUgBlvAFBRAdn6PuS2JmRKQiuE7enS4nEL3C47/y0A
         8iJyZCBhLx8XHJOOWYxnySyGuVSQAZYKLX3lmTzCEkKyvUlco1rgiV0c870ARa52ktqX
         MW+D1i6z5QWbHmMWfd0p/lud6MR1OEpmk+jsQDiIHPogoXnhGx2jHrlnp50UXBEG/Q+O
         GAaEfLaiZ6yO7gRIqsMBOCKYT8BFqD6agtbumksVVXKMxXauMlmRWXbTGNhCoGWkkLO0
         xPRyaw4vERONz6skeXq+whsMtK70DP7On7Pm7UbG6DKHt2GtrUYmZue5SV53BRuwvZS8
         9djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278467; x=1793883267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=OKr196wD5Xp6zgTIxdzgcYLxA6Cz1QLornpxztjyDD3SJNSG5vReCEtIB3Vzwi6zkT
         WxYtrmLcmDFeN+BnVN453VDPrL2i4nsVlkIgXRUxsB9shZnSrIxn7JNzl11F0fvyNThA
         By+P+jQaTHg+Rt597MRspglHRSSVEdqNkbEG9Kk/GKCcRixXhqdvQxlNfJx5POyhDjl2
         REWLrJH45AT2MqNQgS38qegm/4pSky90sKvCckDAVjLj45fe8HGIqxpNU2YoWDsLuC+F
         ACGSL/JK7ZwORu+o4lhQH1paF7vmz/LOWVP9Y5a/UlSAtcWVhUXJ466+bORxo0FGCfIQ
         2YBg==
X-Gm-Message-State: AFq9FYJ/j0gBLCPVSU783sB236i+1qW/eiqNBN33KZTupYb0TDSzaN5Z
	WwPGcsX1jRlVt2ysX22NFhf/wBAED3/kINdYtojLSwqQl6uMZFZkST6HHSPIgkSUvy4=
X-Gm-Gg: AYBFou26Hx7a0L1C9vEwGdYupUiKvrY+7GNn4J2G/+2JCyBAlNcU1Aj1/aZeVpy1Ixa
	I4wEDR9bFWGuvF1Ro0dmCtiVvO778A9caIFMevxDErXPvsXY4ESY2kOMp1HD0X2QDlgHSXDNN2A
	dUB+h93KecoA4P8eQc/oxj7m3bdFnAqSxoN7DLRM2Cb79zLDSgZYE9ZeP87KRj85sLToioZmv87
	hSCej982w4aOHOIK791GBl96m9EkrwJabMu5soA83wJ5xgW+HjYN7NIDyjQUsrJkmI4t2dxLc5N
	IAwgY7GsRxLBCtmED4KIJoYSz1q5MsaOrOIhUTO1KinOI3vqRWrCA4fcb49Jgs3onp67pMfhwRk
	20Oe8EXUXWI5B/4CunKPwD8d7117BQ+rBwdJ4gkWLoHFMnQWQXLTLbZglZl+aEyD+inpwlzVF+N
	sQ404hMRVBQxGImEPxSjGQFFG8PdyMuv62lEKqYprTZgzp9QfdGnlIqZXVnBoXFPpb4Q5UyyfSV
	wEqcvS6AOhisQXhgsRZSA6hceuWer59rmeUlAIf+lOgBRZUhcvrpyOzPNfwLmzxZryG/ZCgQXzL
	QVX2S+RnG8f/ZkH8URy+ED5MZWBt3eWHksSFgXCbltiQxm2FKiEGwWZMHXuEerWaqZkUrUosC0o
	x8U/n/2MBlFExOFA0MjDacc6bficyKrwGMg843Pt5NXZakV037UxSsWOYF1xpSVa5P6w=
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-48e679a4fbdmr2549385f8f.3.1793278466836;
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Date: Thu, 29 Oct 2026 13:54:18 +0100
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dgwtkYgr72FYtGUKo2DJFBoJ4
 e4WvICLv3jJz/t/FQGZMIhbtgrGSIH8O4E6ZcJ2+t0iUJNYqFyVMgXmMUyMegDbv4CxHfQI7KG
 hSA0yuAqxuBTKGZQiSUZGR59j4FH/OMzmiXbarXujozB5Xo4HUe69v8eihBzsVcnS5M5Uhb4bv
 fRkGM/WD6Letu0LaX4K6uEAAAA=
X-Change-ID: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_055430_763898_78D79F80 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first two
patches add a missing /4 entry to the GXL and G12A HDMI divider tables so
that all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Split the HDMI divider table fix per SoC and add Fixes tags (Jerome)
- Add a Fixes tag to the clk-regmap patch (Jerome)
- Add Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: add the missing HDMI divider /4 alias
      clk: meson: g12a: add the missing HDMI divider /4 alias
      clk: meson: regmap: use the current divisor for read-only clocks

 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 drivers/clk/meson/g12a.c       |  3 ++-
 drivers/clk/meson/gxbb.c       |  3 ++-
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
