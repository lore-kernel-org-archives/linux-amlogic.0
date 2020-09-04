Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A57C43461
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:17:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABD620772
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:17:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MOlKUP2G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xgy+KKMD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ABD620772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQ+nf6SfZLkeIiC0tBglC3F047LYAWIrNGSHW5hKmsk=; b=MOlKUP2GzqmcXx+MUP5HkJKZjV
	DT496iEBWyS6MRnzG64LZLLdmSHVQtN4243ybG1gpVBPiyfLRzxccsPLlrTrPTaWJhhl5tUvfyZ05
	STUEJwxgUu+L7p/e5A3W1VbxmNAnvnBh/VxyH9TAbtu98aAoE04L3J/iWI2UxCpXu5b5rvPq8lC69
	pGuFSB/4TUr0+qSd37Ek8cLIBJm/fGGwSJEzIRK82S/l7gwCziXz/hwLtsHz+TbFbEXQKdSTkfr2n
	RBLb+y9VMNBK4l99iQ9bPWEAKRQbg9zF489/HW6b2Dgij1t+wRLAtNKnB04P5akAABLxVIa3DpXB3
	AZqFwUDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEOb-0007wR-VN; Fri, 04 Sep 2020 16:17:01 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEOZ-0007ul-3A
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 16:16:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id q9so6586646wmj.2
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPWs6+bNAsvF0rvAc3yDkiD79Fr0V6X4UpT2H9wqL9w=;
 b=xgy+KKMDnP4LzZO277QHztaVVgeFGRl3sKUILKgGRrZjCjl89UcGfnFoy3wn7Vkxzt
 iBVZCpmo6ZUg7glwQWntAZR2d9hPheP2FgEFuydJWgJWH9lYU4bJSjtsDMnKBSkmYqVL
 nfcssm98lx1gOQvthmT/BVWijb5bCkLsUuCsd8VIFF+0ks+0PnMv3lg6hsbQ/BjqdtbK
 eTHl+ylsRdOfekswV62egkDZhUuGm0Isb9FYFfifnk1jbrgjIm48jLu7HxiqMDLxf5I2
 YnBEv9dkScmIlKD+b9OcBbQZKxY6yl5hxhLdz1+Ksh2IJjdksrXT66gcYowGXS7Miwm/
 0WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPWs6+bNAsvF0rvAc3yDkiD79Fr0V6X4UpT2H9wqL9w=;
 b=R9A7HZj2q0bl9HpaN9t1jjKhwpQyRUAOediyQ4+JbYYizjleGNY+ogTyGUHiJxeKm6
 ppZf1kevlqWFoju4lGFT2HWKw7bA5qDI459GIKDBB9ZLKPGL5BQPNyntJcKYdnSULrSR
 puWY/g66RIty/HL/o5AR37RcGC0MMY1gilHqivX7DrmdF/3TnxHUMQtgqXEHWYeTOPfN
 o8yKcIBtnlP7hfgUreEiXMkn/+3PPnBn/j0YLV56DfMcQz6WjOiF1UU+iMS1EYWdgmzD
 5D3cAZDvJYjr/cskXshoe2PGvDbYuWKOGec38aAGNIcQhYIfaTHGQqU8lzj/0QCDbgfz
 wwGw==
X-Gm-Message-State: AOAM530efSWgPql6YGEZZLYpecIoCxI68QKpL+Nz7M7Dn4FzDRphb1sE
 jyRTWvXOsqTlNaryLs+8ffIP6Q==
X-Google-Smtp-Source: ABdhPJxJJhv200sa3/9Yy1JmL6wXEhyHnokhFvwWfgI1eFsruxnXRWfB3rloRZs45tch1S4Vid+8Ng==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr8182405wmg.164.1599236218033; 
 Fri, 04 Sep 2020 09:16:58 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d3sm5129543wrr.84.2020.09.04.09.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:16:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH RESEND 0/2] soc: amlogic: add support for the Meson AXG Power
 Controller
Date: Fri,  4 Sep 2020 18:16:52 +0200
Message-Id: <20200904161654.24141-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_121659_140969_2FB0C642 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the bindings and support for the Power Controller found in the
Amlogic AXG SoCs.

The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
but with less VPU memory domains to enable and a supplementary Audio
memory power domain.

Neil Armstrong (2):
  dt-bindings: power: amlogic,meson-ee-pwrc: add Amlogic AXG power
    controller bindings
  soc: amlogic: meson-ee-pwrc: add support for the Meson AXG SoCs

 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 23 ++++++++++++++--
 drivers/soc/amlogic/meson-ee-pwrc.c           | 26 +++++++++++++++++++
 include/dt-bindings/power/meson-axg-power.h   | 14 ++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/power/meson-axg-power.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
