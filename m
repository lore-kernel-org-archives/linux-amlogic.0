Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8BDC5AC67
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MPtRk4g6pYP5OMbE70EP03kBssQrUQ3zXAD6PDuBvKE=; b=k7ePq2AA7JyohH
	OeewOqP+wQ/tjZEijjxsdHGn03TnGRLvryzDk4eNRMlm08KyKuFiskDgkK0Sa8IReUNOnoak0fGeW
	Umjv6DduXRb+ESYzNOBSmZGHJm+C1jiHO8sdH+pBdcs9riwSCwOcygg7idHgZ/0B5svo71i70XibC
	kJYwzp4hG9ms++7ptZ04bdvdGZYa3AYD0Hdl71J2BKD3xfmISrWVeefrWl6Xf1kD6nemugYMfOVtO
	44m1b4zTFF62sUZMn1//aFRpqecMwd9+RGyqqg8cRMvncfY+DtXPqnrKmVKuSw8VjWA8TcKc8TKxG
	GU2rLIDVs/Nkkt7UavuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5A-0000000HQNI-23BQ;
	Thu, 13 Aug 2026 05:34:24 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO57-0000000HQMS-36mU
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:23 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-39266382df6so1690566a91.3
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 22:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599261; x=1787204061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lh941E03WqQoOdzW0XPuu5W0k5Y6sQxubyIZa23gmJo=;
        b=F8G+RXF+QK6hQSzMU0C/IUpNgWBhWCwbSa0GgvGHr9AyhzoThnr0nUOOf9XuYHsJnG
         QOQA3s8htMK4HBew1UCnCKaFibM8kXRFvDvtyZdO+yxed0DH5MzeU6JwY2pgRuWI1MKK
         0JxUyvqLmM3RCe9igC9Eqacom1j4N32KMt1ir+7movDPwlJA3i7l/FyT8U2EPFlIh+KE
         BBITKyxtqMCqFGMjCEyhwmzRtBlCueR87FfvGkurIoTFxGkVBIWgEKgH6c3b2B+qdYkF
         zf+TmMtk4BmGc25Gzh5TucwnomxuJjNnJGyiNtqb/rTgoodRGlUL3ugf1TTIBsJe+NNy
         A/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599261; x=1787204061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lh941E03WqQoOdzW0XPuu5W0k5Y6sQxubyIZa23gmJo=;
        b=Izn397MOWiuYNLpkYIaRT5pxBO1ljjM7rx3XbI2OtlGAiQr5hfbhzHk5vyZbti8pT/
         CfTFdY2Y5d0umLivbi6m0UeuSyt6EV7GuedW0+K8blZULpZvqwX/voXmanwdm8DukWxx
         lWvfHAj8ajKNTmS637oz3szKVVvgH0DaXfEkyCASbHzMJ8fqay8tNTgxPMupbTQ1hoEt
         nfKp/bx0ZdRKujmL+oqg+/uI5GvUnUXe/NjyO7Oe4uZn33B3bossm0+106LQ74QVJMgN
         hOXXWemRVApCqBQxp8MLj9wTI+Ss/ttpKGGS65ztGOeztSmYTcITcFEnFNiwcQO1dXCY
         oZnA==
X-Forwarded-Encrypted: i=1; AHgh+RpXuMup31wlnZzTyBXbQfQzfEQbDpZBPJTnCBvRu5EEkQc2AUq3VpL8oa01Cp1joHhiDilA2K0FDXKm54VF@lists.infradead.org
X-Gm-Message-State: AOJu0YzqWnAJ57/IojM2r3rwxmnW1a8/Dl7sR9kyA1Op8LZ+aiYkm0gC
	hxp42q/uCmA/m7DIMgQV7mpmekMnAmQaRIQq8GlmRRfLAAoS1T13Bnhg
X-Gm-Gg: AR+sD10N4RZUfQOpQL+Iiz/HG3735wBs8MorCJmknIBlBBCj7f5xB1gk49f4MUmJZjC
	oRx4VYFtjkGY6UFdk/UdbiZXR+EIrSs3kBo6EUa681XnW6pAeWsFRfNOCEyv57/xZ8nfPe2yZcU
	IKowd8zoX3/zWIs2VU0FjZQKXJ4SruUxHwu2yejVz1rI1U6YMnfJHF7ZUm77mKx+08Evt0OuubD
	ezhBp5hqHtEzlqoIiJdOi+sq4O7vGvP8feitRBLArx+52lS/A3kNRinyDQRliUw5rh18sd56fuI
	H8HB4H/KybsYt1CWmITgk9YtZzCCURyg/TJPQb9BEzAOExzh6axvyGKqCgpYPiVTgNAAKqGs3tw
	gnUVw53vW7zxSyDiquF6Z0uDNqC/PZePGsG9rVm79A+GOQ+3kYxQJJuaXeSZAqghuNZgXzIkqdr
	5MgGMaE7jxjOf/Fk/FjcDV5mrkyH7ROelb9hIMf9O4qPNruKKk8RZOfFsiHJ+xj3RQXchDohXOp
	C328XGDBWFjWSJHEJddtFst72p0/DB5NM79S3RFs+JKAbcRE4Tppfc0nqPTlKjvX5/5qkppllTg
	Gh6tQ7VxVuTGNNw=
X-Received: by 2002:a17:90a:d647:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3931e04a995mr4154302a91.8.1786599260750;
        Wed, 12 Aug 2026 22:34:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] mmc: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 12:34:01 +0700
Message-ID: <20260813053404.21553-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223421_802610_A62125D0 
X-CRM114-Status: UNSURE (   7.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling for optional IRQ lookups in several
MMC drivers.

I noticed that mmc: litex_mmc handles the return value from
platform_get_irq_optional() correctly, distinguishing the case where an
optional IRQ is not available from other errors. This series follows the
same approach in the affected drivers.

Changes in v2:
 - Use parse_fail for proper cleanup on IRQ lookup errors.
 - Initialize cd_irq to -ENXIO.

Best regards,
Phuc

bui duc phuc (3):
  mmc: meson-gx: Handle errors from optional IRQ lookup
  mmc: davinci: Handle errors from optional IRQ lookup
  mmc: davinci: Handle optional IRQ return value correctly

 drivers/mmc/host/davinci_mmc.c  | 6 +++++-
 drivers/mmc/host/meson-gx-mmc.c | 9 +++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
