Return-Path: <SRS0=sB5v=YZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FBAC47E49
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Nov 2019 14:31:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A4520862
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Nov 2019 14:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvD2p3i5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peZ5yz7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A4520862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YRxlYo68uiGd04/MW58Kpx+EEvxpn0Q8zKEkE1NTbBc=; b=JvD2p3i5dWDrfO
	/2U2NLH99nccgEWheYy9oGSW4UffIfbFgpM9xgo4mks1P+IOq/ktjwoEQDYJCnC27OKKIHvrUn+VD
	JeuTfCG4u1vcOGbQ/MS9WIP7Z0BOMBbz/PYoo0z+eDXi7zyZjYU6aNdEkPyctmbKOsLDioA5Qd8C2
	gYmrrqgPYzABnpFZDivMzqHY2qflNYFwCgOkQ1XLxOmhrwUEEKB+1DbLN8Hl+trUnnxJ/e+8261ex
	Yn2G5mum/nCsXTVuhqy8qp/K57ex39idfWj8icaya1f6yi6xsupGDgZy5l0F+6Ye9a5t5uq9UjNt/
	DEnNmACoe3Sci1FcrIuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQXxo-0005dc-3Y; Fri, 01 Nov 2019 14:31:44 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQXxf-0005Vd-0N; Fri, 01 Nov 2019 14:31:36 +0000
Received: by mail-pl1-x642.google.com with SMTP id y8so4473932plk.0;
 Fri, 01 Nov 2019 07:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v3P4Nfs/f4DDEDkuO0DhQZmxaSsoKdeeybFv9GrZiS4=;
 b=peZ5yz7PiZB4AB4GxNEZuAgdW42izQMegYV24QXx31rtLrdiAEmo3PKGBiDAyxU8GU
 y0PVxetYpy59ZsuVdgQN5Mh820MTD2qXnJJLnhc0S65tnWGCTW5xFK+eUBdktKkxy3k2
 LR6j7t48WN4qop8gvzYwHxtregpdk7wQv12e6GdGetnXACZeIr7erMxdAqBNIn2LWKEX
 ZiSOCua9wRU6k7V/m5+6pSTcO8KbJkICDQf+ukH2Ixpj+5mWe1iuI2Ww8zYe203sdVQr
 nvsbV+hB/tqKmn8tcUc9Fw/by9bTswdO0VfRg+RmDb3S9HxyBX6n1P7ne9mR1AMI7N6n
 +ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v3P4Nfs/f4DDEDkuO0DhQZmxaSsoKdeeybFv9GrZiS4=;
 b=SurXUDFX/zPr6pQxApqwWBa00+ZxnafwDoW1DecUB/11dBJGfOh87HTg41nr210dkI
 clN6daUub/AOWie+uZwTtg+Pfx23RQpZtPnlIqTGcEKyMS+3Q/j6RyRSFghPFFg33ucy
 y8bxZLgcYOriG2SJ71R2FXMS7cBjbM5OWayBBKFpkFcD8WCjiU964NyIiiAniTGilWqI
 XV5jqBvgsz9n7XaD6DUsqAADZG0jrjrlic9Xl6CsZxwNYsW8kc/tn44bLeOqwp3gZBNc
 Ko1dkUG1+eTgy2tAn/aqnHM/nVIjE0ZJKmzrcEEG3Ryk86bqUpXRKMdKmqIkSOR+uuXX
 2iNA==
X-Gm-Message-State: APjAAAViv+Q8oZYEtQG75EzoLJzWxbTwyiitbScqrasELa85W1xUdowD
 totrU8OTb1JegBgo6Pu/2y4=
X-Google-Smtp-Source: APXvYqzIVaFOzABdHtSgRBIuKde8kZfF/0r+n7Ump6Oam46JfLfhx8fI8VNRZlg+DUBpC+SngGmivw==
X-Received: by 2002:a17:902:7885:: with SMTP id
 q5mr12444241pll.317.1572618694114; 
 Fri, 01 Nov 2019 07:31:34 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.165])
 by smtp.gmail.com with ESMTPSA id x9sm9273061pje.27.2019.11.01.07.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 07:31:33 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
Date: Fri,  1 Nov 2019 14:31:25 +0000
Message-Id: <20191101143126.2549-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_073135_073728_4E863F8D 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Some how this patch got lost, so resend this again.

[0] https://patchwork.kernel.org/patch/11136545/

This patch enable DVFS on GXBB Odroid C2.

DVFS has been tested by running the arm64 cpuburn
[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
PM-QA testing
[2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]

Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM

Patch based on my next-20191031 for 5.5.x kernel.
Hope this is not late entry.

Best Regards
-Anand

Anand Moon (1):
  arm64: dts: meson: odroid-c2: Enable SCPI DVFS for cpu

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
