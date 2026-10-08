Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CEFCA600B
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2SIW3FvJ3vB9mnGWQIVAsYApPAYJMleDLTgkRjUdXkQ=; b=pJk7uKepthKiJR
	J3ugtLRqJ88DHipRMkzljY5oWdc0hbwDCh0hSMLaNE6HGaX1/p2REpVjWjCMxkainXkVBVgBiHZGi
	CYZSk4xA1Jn++o6OA4v9NG1ERSlJBIc8OntgGA3ETd3nGOqGAc3mjq9b5agNoPGRawpIQNdJb4JMA
	LXpMYr2RWTB2RCw4yiNE/yU9tOpFSSmA3HaiIJIAx5A0tqX5I1wvMV7qDRYOEUItcbtq/2JIcoLSb
	vXWkjjKfrh4Yf9w3CZJJ2MA0pKCjIgwcL1Ul9kDkizCNoiVQuC4MB11OPJLqCQzWglcKGkPypxFlS
	57Xz6delcvWmU6uMp3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEp6P-00000004X9J-39OQ;
	Thu, 08 Oct 2026 14:28:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEp6N-00000004X7z-3bDd;
	Thu, 08 Oct 2026 14:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6FFF601F9;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 915ABC2BCC7;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791469686;
	bh=XXv4CjnLsE/u9Me7mkTlw60K2Njx2d7DLdS4d2h8YEk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SgT3jURzsYNCGAipz7JemHk4tf1QzJCY8PchqTU8nTKDtWI0K2+Y2wQXJ8CPIlw3C
	 GJ5RYU6ICWKk25lvkJ9crI3rrKA+VRQwGHVH4Ak+MjUWqoZAqjzOrXfhibPh5lT02c
	 kiEyNFxtRcGwwuY42O4ZYvCMht8pAyvlmJ5GPaYDlNMkQ2HD0WJ86yg+olrMRQoqM7
	 ShnoAypMG+3aex4EnV6qq4WrpEjoleBAKBJ21xk0Y45nuGVJz0sw3uQY7T1rahFX8j
	 Dn41CAg3hDtf4Cs2KSsDJTm4fJLCUyLlkwU9Brq2oBD39BzjW7A2tUq9iHEdjOTCK1
	 ih4H+uTqQemIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDBCCA600B;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH v2 0/3] mmc: meson-gx: honour the busy timeout for R1b
 commands
Date: Thu, 08 Oct 2026 14:27:58 +0000
Message-Id: <20261008-meson-gx-busy-timeout-v2-0-8bde1adfb5b4@iav.lv>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG6ox2oC/3WNyw6CMBBFf4XM2jF9KIIr/8OwgDLAJEJNWxoI4
 d+tJC5dnpPcczfw5Jg83LMNHEX2bKcE6pSBGeqpJ+Q2MSihcinEFUfydsJ+wWb2KwYeyc4Bb1S
 Q7lrTaNKQtm9HHS9H91klHtgH69bjJsqv/RWLP8UoUWJbqk6bvDAXUT64judXhGrf9w+yu03Zt
 wAAAA==
To: Ulf Hansson <ulfh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=XXv4CjnLsE/u9Me7mkTlw60K2Njx2d7DLdS4d2h8YEk=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnHVxTvt9+wJ/f5porj+RKPPrsVFjXvZSw+YBL0w/Ok2
 u03ycrxHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAi72YzMswt51abeH67T/N7
 lS+/trDK+h1azJ63cMY85zDTuhLXcy8Y/vCWJSkUnQ/PN7U1vM5492uc+/oiaX++W1wr4xO/b79
 mxgYA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

For a command without data the driver programs a fixed 1024 ms into the
CMD_CFG timeout field and does not tell the core how long the controller
can wait for busy. Erase and cache flush then fail with -110 on eMMC.

Tested on ODROID-N2+ (S922X), 256 GB eMMC, btrfs root with discard=async,
Armbian builds in docker as load. Without the patches (7.3-rc6): 262
errors in 3 h and 68 in 2.5 h in two runs; the first came 4 and 43 min
into the build. With the patches (7.3-rc6): 0 in 2.4 h. On 7.1 with the
previous eMMC module a synthetic test (20 GiB write + fstrim) gave 48
errors without the patches, 0 and 0 with them.

The timeout is rounded up to a power of two: the field holds powers of
two only, and the timeout is a lower bound. MMC_CAP_WAIT_WHILE_BUSY is
not set: I have not checked that the controller waits for busy on every
R1b command, HS400 switches included.

---
Changes in v2:
- Split into three patches, as Neil asked: name the limit of the
  timeout field, program the R1b timeout from cmd->busy_timeout, report
  max_busy_timeout.
- Link to v1: https://lore.kernel.org/r/20261008-meson-gx-busy-timeout-v1-1-d92f3c68c409@iav.lv

---
Igor Velkov (3):
      mmc: meson-gx: name the limit of the CMD_CFG timeout field
      mmc: meson-gx: honour the busy timeout for R1b commands
      mmc: meson-gx: report the longest busy wait the controller can do

 drivers/mmc/host/meson-gx-mmc.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)
---
base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
change-id: 20261005-meson-gx-busy-timeout-7e8e3fdcb3e3

Best regards,
-- 
Igor Velkov <iav@iav.lv>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
