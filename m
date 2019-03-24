Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABD1C4360F
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A998222C4
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9VjJT5+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="W7tHdhv0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A998222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lsu+/RqwzXlwG8j921LmyrGaLFY00Mow5j54TaoB+Ss=; b=e9VjJT5+qxOjHh
	dp24J0ja7KI1d7lMuIUFR/UQREKlwf6i+RUqzRYjDmi4+frga658CxeJhozh0tu94YuFnj1KDz895
	kxsfXV1DBsD700TWPyKZaKGrQ1aLE6HuEYiH8UsDjYwhSPhMJR+CxKwaC7Vo/IWgE4KilUlqYkQiD
	dbsK6HNwJ4yRHQCetkZgdxr2UE02hSDWQdxkhMgaSXSFyIlVcr3RaPTCWXJ3I9nG+WVwMhtsT/XTM
	Li5+OWFN3NGbQBJ1AmwgIS+OMGrQOeQiO1wUIYL//nTUcX7y0lkvTNowbNl0NLEAbpmE+e8PQ0DR0
	1fTpND56W+PqaVGNj9gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h84pg-0004xb-66; Sun, 24 Mar 2019 15:14:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h84pd-0004x6-JO; Sun, 24 Mar 2019 15:14:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id p10so7333673wrq.1;
 Sun, 24 Mar 2019 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tPPs4cqO/p0eCsszsL77g72f9HhvkgctqQ1mO/ZcfF8=;
 b=W7tHdhv0K3oYuREw9pn1mtJLg8Ya/LFJBpCRVOHU0OTTxdEUfxsKf29c0p4e+rp1zp
 rbJHK2BLm/QV7j8l37sqlf/vwloX7eshyNWH27dqKrhaAexqTIJ1uDOnOGo9zkf0m7wo
 805X1YxUF++0xdUtOLtbMszZYGBdPqYQYoEYLYeVWfLSnpWdLx1L5ORQm4EWHXwpBhKe
 rQMkBYZknlS14PBStt2FzLbUO8YU8DMXNARxufZnzfb4p9nWp0s11aklt4XHuRF8cmxT
 g6mr4787BOFrG8ZCX1bGatRIf9HjJsoPGkp4hyjowsJtjzKGhL/VnXzH7o/+Q6sggj9K
 XKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tPPs4cqO/p0eCsszsL77g72f9HhvkgctqQ1mO/ZcfF8=;
 b=s5cHN00TrX3PHyh8/7WXwLTUZW5ukW/M5uww4fFKNVGAMfh6swLEJIchIuvgi3s8Am
 JUTj/Mz4X72lxeJmLUMORQjY6wThRlwS12X5Vgc3OM2HZd0BX1+EaMJkbEG/x7+d3Q+P
 so4eHoK9H3UJbxiPCc8C0BLCsFEo8EqJcjW8im038BpyTlNEavwOu3+QWJUM08F3kYC0
 wdQBEr/WsZGq8I59Wi8bSq2l7fOL3YZmP2/Bdeo/ABrpB0Rn7UCEfqU6VIl56a4gVLhj
 RPNJ8bFX/OAn7MFos3nJLWXoj81V6I1f/59n6Teie6iquO5/2NAwFfrhWFpJ7D0tK/vA
 7FhQ==
X-Gm-Message-State: APjAAAX8Y8ixzN1zsMPxLrq8WTim/7+tbHA2eBVNPze/MAKCzk0szbxw
 5CuA2bh12cf5Slnqk4PWIOsleiTp
X-Google-Smtp-Source: APXvYqyIvJ1yldHZZfQLdrnadIfO3HzyeP+m636eMNcPVgg6y+YXhTA3F1Oe45APmhRFipVpPGM1EQ==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr11834366wrj.8.1553440479699;
 Sun, 24 Mar 2019 08:14:39 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r16sm376889wrx.37.2019.03.24.08.14.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 08:14:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, mjourdan@baylibre.com
Subject: [PATCH v2 0/2] clk: meson8b: add the video decoder clocks
Date: Sun, 24 Mar 2019 16:14:21 +0100
Message-Id: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_081441_636127_720FDD30 
X-CRM114-Status: GOOD (  10.92  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the video decoder clocks for Meson8, Meson8b and Meson8m2.

The clock tree on Meson8 differs from the one one Meson8b and Meson8m2.
Details can be found in patch #2.

There are some checkpatch warnings in patch #2:
  WARNING: please, no space before tabs
I decided to still send the patch because we have the same inconsistency
with all other clk_hw_onecell_data table entries. Please let me know if
I should come up with a follow-up patch to clean them all up.

Testing:
I have not tested this with Maxime's video decoder driver yet.
However, I manually enabled and set various frequencies for the HCODEC
clock and verified that clkmsr reports the correct rate.

Dependencies:
This is meant to be applied on top of my other series from [0]:
  clk: meson8b: add the VPU clock tree

Changes since v1 at [1]:
- collected Neil's and Maxime's Reviewed-by (thank you!)


[0] https://patchwork.kernel.org/cover/10860401/
[1] https://patchwork.kernel.org/cover/10860513/


Martin Blumenstingl (2):
  dt-bindings: clock: meson8b: export the video decoder clocks
  clk: meson: meson8b: add the video decoder clock trees

 drivers/clk/meson/meson8b.c              | 312 +++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |  17 +-
 include/dt-bindings/clock/meson8b-clkc.h |   4 +
 3 files changed, 332 insertions(+), 1 deletion(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
