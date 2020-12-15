Return-Path: <SRS0=n1R+=FT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6C5C4361B
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 12:32:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA359224D2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 12:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA359224D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWqYzWs/uXVunJ93HK9McS47Y5hJ/txfT0bqz7pm9Kk=; b=duOWFV5/Y61azdhsXcaZBCV2NE
	qqiahnfOPxtk0VoDwfRnlGcJuJZ73Yt9Bfrnc4AqOz0R7+yBtSmpxJKIoDA6NfeGhfjpEpdYK6sMn
	+RPLSxgeGZWfSz/MCBlA5ETOg1vJT/aiaGIOUDJP5JDfoouSN0xH3nWjNUjqWkVKOdf6wPDnnvpWZ
	7HDlrfwEjGbnH0gKFdsKdwQjWaKm0fMvlR9aL+u4E2JEqukCZS0V5KSe+p75dot9wQtXxHCO3u0Za
	EDHkQuWg1LemjcNnUJuhR29/924ragPhWdZknZVOC2SCeFPlT7hsHs5XkMICPggpuWBy9aIYGSaqP
	xpLoytXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp9V9-00056U-Ue; Tue, 15 Dec 2020 12:32:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp9V7-000555-EG
 for linux-amlogic@lists.infradead.org; Tue, 15 Dec 2020 12:32:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id i9so19687872wrc.4
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Dec 2020 04:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+OR7lXHQ+vBxZnd/FEq2j4oj0f/p1g8GrMx8D1l9GCE=;
 b=iSE716U2kuwBM4Fm7CZcoFO65a1ULnmWaX3a+ixSvXc9tQIE6+LUcSQuAyxo4b1SaU
 8quaBZNEsyIpAWxX1ZttEyM0nGJ+kx8DNIkgB4D1oBDGSAiI6QJULuGjg7xk+5Gqv2ag
 YX6DMg+2sYCNQ6ZaByvIe3engYdBJ+y7LgpKaMYqjNYWKrsJaBSeJVKCahbQNeNCPZ9c
 OByndnpD1lS96mXYp+Az3oYyXdy9/IpKNG/0obyHR03ZLD1IibEjkGaf6/Ev5D02aTOy
 Ls/fknMuzbvhyERBXa5/A+hFTFIAh3rni1GmTYOQKuxFBW4zr5n7tCQA81hdJk8Wrcuw
 jpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+OR7lXHQ+vBxZnd/FEq2j4oj0f/p1g8GrMx8D1l9GCE=;
 b=dHEVtfQYk+PoxkylpW+ZymtabXsQyb7clPD1n9GooOV0qcUzfMb0I4k08+mOeOJirj
 Efs5WHrghvA5RpPFuMg03vT51hum+BJUhVkW3zZYurvCz5JBzcznMhA01BVHQGdqj1DM
 EzL/p1AxvfCV0TM+9wVIMzJGOXuG3XUauaVYDiax1fr94Fr5YgLIPClQsuom7BFzymVv
 67zl5+r5TlMqKwzfC+CNupo1Wsa9/JJA4W2qtNGhoKfGQT2A8GVMqCxtB4uc3u+Xec7F
 EQSeoTCWh69gLDTQ9k+jlC7k6Ol65Ps7eeugIqn8RNz+1fmkpqDi0IyL/5+NUNI+oAMn
 4LhA==
X-Gm-Message-State: AOAM532CnlFut0GF/paWwaSTzA6WTe4oqHxtupoY7mjq5fpFiRkr00mW
 XmndLssXK7PZdNlCxc3u7Bc=
X-Google-Smtp-Source: ABdhPJz2N2a055YhLJ9D3cC54JMUFPecmV07gs63erQL20WyQX4+4VPDKaxXT3fVndfnCpHMV4KGgA==
X-Received: by 2002:adf:8185:: with SMTP id 5mr2498444wra.44.1608035538511;
 Tue, 15 Dec 2020 04:32:18 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id n3sm38488406wrw.61.2020.12.15.04.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 04:32:17 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 0/3] board: amlogic: add WeTek Core2 support
Date: Tue, 15 Dec 2020 12:32:11 +0000
Message-Id: <20201215123214.18661-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_073221_519602_1143EF45 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the WeTek Core2 box which is based on the
Amlogic S912 (GXM) SoC. Patches are based on u-boot-amlogic-next branch
in the custodians tree.

Christian Hewitt (3):
  ARM: dts: import WeTek Core2 DTs from Linux 5.10
  boards: amlogic: add WeTek Core2 support
  boards: amlogic: update documentation for WeTek Core2

 arch/arm/dts/Makefile                         |   1 +
 arch/arm/dts/meson-gx-p23x-q20x.dtsi          | 324 ++++++++++++++++++
 .../arm/dts/meson-gxm-wetek-core2-u-boot.dtsi |   7 +
 arch/arm/dts/meson-gxm-wetek-core2.dts        |  87 +++++
 configs/wetek-core2_defconfig                 |  70 ++++
 doc/board/amlogic/index.rst                   |   3 +-
 doc/board/amlogic/wetek-core2.rst             |  90 +++++
 7 files changed, 581 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/meson-gx-p23x-q20x.dtsi
 create mode 100644 arch/arm/dts/meson-gxm-wetek-core2-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxm-wetek-core2.dts
 create mode 100644 configs/wetek-core2_defconfig
 create mode 100644 doc/board/amlogic/wetek-core2.rst

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
