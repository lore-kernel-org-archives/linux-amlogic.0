Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335A606A31E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p9eOuyQx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=peQV7KXt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I/RhELtgEjXxQlbhKSom16/YIfWcy/WGC7/aMznLo5Q=; b=p9eOuyQxWBmduTmd2w/7t2JBpC
	Cad/lgeQ+hUDz39F0SJfqQRlXpHQ0LC2Jb23AXlUmwmv3eTqMuCadkuVFIqgj94c/Cjeg7EY+KkTe
	ZvICHAnBoGnEczuQ7yX2Ds74ak59FHUOYK8kOo3LGIqFOsJ96gZnh9yHd0jKT0E8gr+clO2rtPHnY
	6LQvw2Plpm+y1KolO6u2zAKrqqbDVmpb29ObptxVdx8b/t9Zao4d8asG00K+2fiBazs+zpftgypnT
	HO3IBPC8wXdOj7Nqyx3aXNx07geUE/ESI18ObkJnC0JULVTB16JhJ3iqLMVELFnc0cn+Vcg1zVy3n
	v08IW6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKlz-00000002bHV-122j;
	Mon, 26 Oct 2026 13:29:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKlv-00000002bFW-2hXN
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 13:29:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so11329455e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021393; x=1793626193; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=peQV7KXtlP/nx8XIa//dWyB58bWPPHlq56OuEOPUUMQhP0zvuUg4dhcAF1qLplocS2
         KKS1+zVyDPjyRF6Wc1yEaDws01EwvkztrM+Z7jtltO0EzB78kgwbO+X9aVZvvx1oE20T
         qxNOwU8F3xjnhy9EkUTocEkNqt4SIA0X5gNT6j6Vq1W7X+UJ6EEKHLLDKfWUREHFSCEx
         6XT0yEPbLakcD+RDjo2DP6CKlpv+1YZ213gAwh67NsiiSqehdep2508CPja67Zm9PNvo
         MdMxVqUShnp1GAD0T1XSNILTqZTd5o3fRLMjowngbAj3eCveYRcTjdIKP6mhaKyXPu0e
         BaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021393; x=1793626193;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=t0isHxURxHO0Vn9ORtMSi9yd8LArDwDd5rUsjG+aPVcVHdRYtQB11gtexFwPLlEjYb
         8FqywOksF+JacsXB5qrUt2K26F7MKd76qtQVhXHnU7W75zUerCIsFImzL10AakxceMdl
         /bLjGRNbcGp1cJ42qntoJZEniB/Y0boM03paWMq5WyOwM9dlnD1yEYdIyDyW8XXYuKFo
         G4GXwX9jrSCMNcFhRKyF8eYvP+TBajmLKY9g04bW8om8KaZRuqMk48bukAhdbzRMkEE2
         TXbc104Vt5iAqAYdMH4IPihv9SctHOKoZLM/Be29cYqcRStjrwwyaHPQIqYIQDICQE2+
         b/jw==
X-Gm-Message-State: AFq9FYLOkkyiNkj3rNLzu7LbSDCclaQz6aoulSqeo6ClWxMbU75LedmN
	/lq/vgUf5zG8tWBAJpGkppytwnWj3SdpLG9E8l9BixoNLMU1oH9FKi/VTm8KkaBgKws=
X-Gm-Gg: AYBFou1KQjluU0dDriSRQFDoYXHZlrrwj8+QZntkOZ2kyUaTMWL2U4uVdtALz9kFWbj
	i1XOQcXihucYXrPFytA8hJO/TiBEbalmoKL4qiWFHKq/VvmMtM2Ii4enb5+St2/IFNrEgOqOk4v
	GIxZ8+LqEqKYyENktNutZ1zQdCY7iRrFipRgl1MARW2k2BPleT6ys+br+BclH5BwrTDj0ZJjbft
	e/cyunqoFgXQ8yyfNawIUbMLqjfW7VfaChm8qXOI+gM9NI8ULwo3A8NVzAlOz4wnL/UC9gBIYGz
	4q69yh7KCFrnADuGpYa1VWC17yFmDu5hcrgWga6iYaCiUBwlfJG2f5/6FoP7KU5cZfWHx7iXt2r
	/KdwlMjhVs5JX5ii0SKrqBqYZdG6KveOYo9mT+Q8EaESSGjd3hm6WXPrMaG3Gk6XICmghT3QDsI
	9DowUcGnZavFSveb7MnhNA1Am70S97J/qo4HItS8wvKmSaJycM0moR0lxjcAaoGMNBAeNRQ7nSi
	jFHqxZFAB3DcqWOSkJZydsTSA0oiW6K4LBDuOgHIZuYhXLqVOcEqOGDE4YtYbjMZhsvAhE2+Id5
	exVQ8IXZDzk3dSFgmUhA1VLWqZR8nYQKA7EYQDgaJ3l+04awcSwDdzTsk2GNkTBJ2r+qeuuW
X-Received: by 2002:a05:600c:8b63:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4a35ae7027emr137803465e9.4.1793021393144;
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Fix rate rounding for Meson read-only dividers
Date: Mon, 26 Oct 2026 14:29:43 +0100
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3YTW6KJvorxUNoprgo0WyAkh
 He3yGEO3+WflTJUkOleraSYJcvQF5hTRf7l+hYsoZjs2V5NGU8pjwrXsf9+WNF2LrEOHGSWAOV
 4A+pLbWMDQyWSFFGW/8HjeThPzRt+3Ku0bT81nJl3ggAAAA==
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
X-CRM114-CacheID: sfid-20261026_062955_985863_D5CCFD36 
X-CRM114-Status: UNSURE (   7.24  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first patch
adds a missing /4 entry to the GXL and G12A HDMI divider tables so that
all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (2):
      clk: meson: add the missing HDMI divider /4 alias
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
