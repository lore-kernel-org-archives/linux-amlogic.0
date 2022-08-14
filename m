Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6B3C25B06
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Aug 2022 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oqgtW/GCRSjxoBfgRXPM34RMxAkJsEeLESxJUk1li5M=; b=y2T2afXhhn3KD+
	W4PE2S/0RAHx/EGf0M1ynor+k1/+Q2hsm6uzhWCwLrGUVHhkeeQrO6j5AV6pNSI5qWGX/oHOLOLxK
	9OHX37LZ5oezYNfyLu9rzcSlB5to9QiUEtPMfz7rrBO/zo00K1f19H1Ye9MEzjaSLn93/2i6h2/ah
	mRlTV/XoRNbXEYsQ1hep6d77Zr5w8y0LjpaYBT+JQyuhBJCIFIx2as2Ls57s+4FsSUhv6S9qaDJhJ
	DfpfQyNYtEUTg2YXsjokxt9u6bv2lj7m2iN3LwhMlhMFqNwywNJ6TRi4bcN4piRZm0mSUZpIzD2rW
	f+NHm9mhOm3CRTjmnROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNL75-009EzT-U1; Sun, 14 Aug 2022 21:25:39 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNL72-009Ey9-NN; Sun, 14 Aug 2022 21:25:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y3so7495440eda.6;
        Sun, 14 Aug 2022 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=Qe5DWC0r7rxYJhIfXceDeB8WPgaRF9tvqMILk+vpu0/C7UVQ4yMexOoyvKmOytyyJh
         n2EqCZLZhM5cJMhiLA8KIc+uWmJjlTQ4U05VuGBJuRdPcLUkxohdEzHPQPl0buauL3FQ
         IYpanbKgaHIpDVgpnH2PuaTgexmRLRFw9aNGwL7fXqy5j0IlBCo0+QvVbplkStzs1PZo
         ilDFlW6KoBmmdpk8DDRE5gl/a7/AlGGRNwt+/jmC9r+p5JG1OWGUWf84p9Jf/IO7+zMD
         tkWHe+X/Et2rnlzJgxv4c/CEZoqapq9lZKMK5J/PeVZfHrAURMUJNR9CN/s3UUggGef7
         U6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=DrRflfTYfoYmz3gn2bh0BTE83dLx1uAjCGoYgqZayThNsnWJoSGvR8nz6c1NQI/mor
         f2ANfMIV1+rdQHuhNo2LfZVXF71hrBRwFM4iUwRP/9QlK5ODzafQJy3dTnwKTkPb4R0B
         a3vitE5ZsrViUgig3iOGx7UHZ/ADZwvQaUlZ91qG22XvZaP5SmP1qr6Dp4C1VWZTzaLH
         QoLbAwg41RwqKnM7O8l8W6zxSsUjJwCu7SvZ4rUUTuTEkXK5nt3UmyokNoGppiXdbb1D
         OU1A1/k/4Go5bFrMmvY6jKa88e4EJp1z3NHHeDPHrqnoOyZE6i3SDWXnkl9d5+8HrmzP
         Ef5g==
X-Gm-Message-State: ACgBeo3C8zchjh2h4V+YwfFwthhN1KWWv0Ruo00ul1zKJtZCUDv7JyHF
	MvGj31tHcs+ulCDST5M8XEs=
X-Google-Smtp-Source: AA6agR5yCvVRH21XQkQPF1Wfk2uvfyUNgSVB2S64Y12RTxJ0Qdq+0H838y2Ax7VnyAyrPfaKKoxjHw==
X-Received: by 2002:a05:6402:26c5:b0:43e:2f1b:31c2 with SMTP id x5-20020a05640226c500b0043e2f1b31c2mr11769063edd.424.1660512334996;
        Sun, 14 Aug 2022 14:25:34 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id o10-20020a056402038a00b0043a7134b381sm5357856edv.11.2022.08.14.14.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:25:34 -0700 (PDT)
Message-ID: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
Date: Sun, 14 Aug 2022 23:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESEND] clk: meson: pll: copy retry workaround from vendor
 driver
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_142536_919125_52AB2CD5 
X-CRM114-Status: UNSURE (   8.96  )
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

On a S905X4-based system this call fails randomly.
The vendor driver has a retry mechanism and on my system
the second attempt is successful always.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/meson/clk-pll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 9e55617bc..daa025b6d 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 
 static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
 {
-	meson_clk_pll_init(hw);
+	int retries = 10;
 
-	if (meson_clk_pll_wait_lock(hw))
-		return -EIO;
+	do {
+		meson_clk_pll_init(hw);
+		if (!meson_clk_pll_wait_lock(hw))
+			return 0;
+		pr_info("Retry enabling PCIe PLL clock\n");
+	} while (--retries);
 
-	return 0;
+	return -EIO;
 }
 
 static int meson_clk_pll_enable(struct clk_hw *hw)
-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
