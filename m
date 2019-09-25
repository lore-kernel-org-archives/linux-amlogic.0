Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C29BC43630
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:35:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5011F21E6F
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kurZkKz8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5aGc5i7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5011F21E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=htHriGr6sPnuDoJEtLM0Nq1KBNUTopP71LnwZA+7oAM=; b=kurZkKz8M144nu
	xc1T9R9OU9uYDAHWMAfBg2fsprJsZ+3/o0vkB3ayudW85cJLS8JGdjBD6J3VqUQ4HTvlmVtyTwXF6
	MGxupmB5w559f4Ebg+uwgtkZrvwuJNQbGN/L5BqAtgJrVW68BxCuuXv2MkXC+4BNskSR+Ey2DL1j0
	M/rkRdTwDOsCcM+DEBqm55b9DhZwx6yTN+1v7VoZpTVfSyrVueY6FqVXCtqDha4HEST4HgoUfY6L+
	1/2Yz0EbKZVR8d5c6zvVq0D3Ni5476PNxBSDgPq8CfD4NtOtxLnPC5ZgeV/jBGujhVwRXrS35ut4R
	OtRrtE8Jq7zaNFHhTrQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDEwh-0000XD-7h; Wed, 25 Sep 2019 21:35:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDEwb-0000Vq-2M; Wed, 25 Sep 2019 21:35:33 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B52A421D80;
 Wed, 25 Sep 2019 21:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569447328;
 bh=6giJGc/llVkN+NRE9PVhNvjJj8GYEZQg8PvTR+MJpMQ=;
 h=From:To:Cc:Subject:Date:From;
 b=P5aGc5i7ZejW7VXXRnbSIVEMlXEzLY3uMIw7UAhbX99CaCEH9JjV5UA9+o3dT+9aU
 ph3PiNg9F1LvXTNmOLk0o2h8w1FlT5qept7AtZeI9SGfYVzPlNqAUAJp7/GVIgg0MB
 TcyVM7BN9fNolB9e7C6nZ9XwywuDyfhjzVIrzTUI=
From: Kevin Hilman <khilman@kernel.org>
To: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/2] soc: amlogic: ee-pwrc: cleanup init state
Date: Wed, 25 Sep 2019 14:35:26 -0700
Message-Id: <20190925213528.21515-1-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_143532_634388_5088AB84 
X-CRM114-Status: UNSURE (   6.46  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Kevin Hilman <khilman@baylibre.com>

Cleanup the PM domain init state and ensure that the driver state
matches the HW state for all domains.

Tested on meson-g12a-sei510 and meson-sm1-sei610 and verified that fb
console still working (VPU power domain.)

Changes since v1:
- always call 'on' 

Kevin Hilman (2):
  soc: amlogic: ee-pwrc: rename get_power
  soc: amlogic: ee-pwrc: ensure driver state maches HW state

 drivers/soc/amlogic/meson-ee-pwrc.c | 57 +++++++++++------------------
 1 file changed, 22 insertions(+), 35 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
