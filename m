Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B822EC2BA2B
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:53:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A590206B8
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S8TvYTsx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUNF53ep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A590206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4PALUHJmUoLIn9yZSSBUeiXVxqSn/cYxBLDH1V4hVBs=; b=S8T
	vYTsx8RjQgWZkBNVNe6d07Zl/3HG1rHOgoKXtwh+FRzPMPa4WilxC9KEmNTmPuhlN8QU8x/YbpFvh
	ibeSCgbGXrGCTuFxTREqm3Wa0a14BcNKnchyZNqoK0+cPkfNflqRydDfbnLeK2nIM5+KT6UFDMqnt
	i8pg0RPiK7t9cXep3yRvbCDE3Gzu1ByGt15a5Q/Xn33FJ+L4O58FO4ZjcLH1aXo8Njr2N0Ht0R5WB
	cCJTDqIdGl5KADOwtdUaLuRSw8xod/AzuGEpmo5FV459MsB+R6XnJOCs5LEkrp1wJ4FE+szsuvlbF
	A88hs/xUWf+o3bO2Gn/ZGWhNq/LKS2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2tg-0000lb-Up; Sun, 19 Apr 2020 05:53:40 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2tV-0000a0-0V; Sun, 19 Apr 2020 05:53:30 +0000
Received: by mail-lf1-x142.google.com with SMTP id w145so5219333lff.3;
 Sat, 18 Apr 2020 22:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1qrRdfAfZTNG8C2xZODPVLiP1lsHDHNtbAuMSlM5XWs=;
 b=kUNF53epSMt9B8o64l0Q9iBjt6Sdx5q1Y4jifHIiotiq9kw49rYLkGnyR7cnEF2EJM
 l1wKyyN8e93Sl3Bf9IjqsTFh6vYCDFsSZ/jVY/n5TYNxn8ccDZyQMlgxlVN6UKKM7sMZ
 tojuZIFdK3+plJitSDgcGUaB48HdnEbMEMSCv9m0CayAKVMRdYSdM77UFJq5724WYQx/
 mb2UZI5fs8jdxmYyK3e8ALtiZ8vw0JL72AmNYgeDhepigNlO/N5rHDLRFM2uqIiU/b2a
 E2fzlcSywc8eRowTkw+coLBPAPsPuwFtXzXiPEsLKcWG31fXphbg4FyEP6JwxZCXbuIi
 LHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1qrRdfAfZTNG8C2xZODPVLiP1lsHDHNtbAuMSlM5XWs=;
 b=SuMeg3hB+kxJrKiMJK521lr2L1QJIvfclFjvu+zAQH7BijPBFKoiwFH/9b4LOXaEXC
 24y3EvvKdoY7pyFJ5s9bWr6c81QO+Pj1CLxPWjNXf9Iz8mIcUmWNdfAhOJeXXKAAOHEi
 vm0MzYcnjWupE80thLzV0anpaU6du1fVl+D9Exfx6/afTZXTDBWJsYsdeuDw6FSuR22s
 WH0fzN8ZHnVCGZRvEtnDvVK9fTVLKYSa/Ug2a97OdYKfSr5k5akbIT56zGIZSff2zZhL
 7/ui1r3+z+GV9ngdEvf4xEJlDBRy8dkkc36nYWJ0d/RfZKbgDRWNe1mnUWU4EtlBQpDR
 2cAg==
X-Gm-Message-State: AGi0PubxyIWEpCnmdKcykD5RPmPqM9/b0chQkvUdE2leXGsDZiyw7qt9
 t1gbSkkMxU98htF5OCZUPhw=
X-Google-Smtp-Source: APiQypJC5Bac5Q6fvsZfuKKznBhjkUaBzG+YWW1BYq0fxHBBjVZMQ2V4BovjT+WZs5Ex1F2va6ByjA==
X-Received: by 2002:ac2:5f92:: with SMTP id r18mr6916190lfe.154.1587275606868; 
 Sat, 18 Apr 2020 22:53:26 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h7sm3366247ljg.37.2020.04.18.22.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:53:26 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: meson: add GT-King and GT-King Pro devices
Date: Sun, 19 Apr 2020 05:53:18 +0000
Message-Id: <20200419055322.16138-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_225329_076007_AE98A325 
X-CRM114-Status: GOOD (  10.68  )
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

This series adds support for the Beelink GT-King and GT-King Pro devices
which are based on the Amlogic W400 reference design. The series depends
on the common W400 and new audio dtsi created in [1]. It supersedes a
previous attempt to upstream support [2] which was refused due to the
duplication of dts content.

[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=273479
[2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=249421

Christian Hewitt (4):
  dt-bindings: arm: amlogic: add support for the Beelink GT-King
  arm64: dts: meson-g12b-gtking: add initial device-tree
  dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro
  arm64: dts: meson-g12b-gtking-pro: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |  2 +
 arch/arm64/boot/dts/amlogic/Makefile          |  2 +
 .../dts/amlogic/meson-g12b-gtking-pro.dts     | 39 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-gtking.dts    | 16 ++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
