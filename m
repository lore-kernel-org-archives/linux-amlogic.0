Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB2BC433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C6A2067D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFzKFsWV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg/p6Gay"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C6A2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CT3nCt5cGat3sOKiGJFd7m/PPsBAx01olqHAYvaL1bE=; b=sFzKFsWVPt1hN2p9dvabx6vfWC
	0DwkG7NlC2E++lfVkJ8Vfi4XLCbcPcoOsrJglzgZs6R/e+qKkV0Uv1KATCk1+YDnxLiXViCav9M0U
	LV60TogIR2gxq3oH4V+3OFksRA/KipGXppkiYio2gQcLYQcn4YEUwjZz1lOQZqmkYZD7AmdyfkDbl
	rhSDcemIMgzIEEUpoo5PMuogmJV/IcO3LlAmGCmLsj2h82HpDpSzYzZOmPUSYhejsBHs+yIeJewRt
	+QZdZT6x+ey5xH2dO0CpJHWuuwI0N7D1LrXmNgaAMWvR2159S0wOyr464zS0PZmRzNMUPK0nmoYwZ
	B3UzPoAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaVUc-0003dn-Jv; Mon, 18 May 2020 02:27:02 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaVTR-0002J5-GO; Mon, 18 May 2020 02:25:50 +0000
Received: by mail-lf1-x142.google.com with SMTP id h26so6647969lfg.6;
 Sun, 17 May 2020 19:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JIjdRX9A90RloyzWddQMSNfv9XohduT/lwJH2Xd4NPE=;
 b=hg/p6GayJFU+ZVAwJYdVWfyBACACu4dR7Hi4P+BWc9bzx7eXm8Ef5zA3AMtPFZweeE
 9PJ03qZ8pcJ3Goyx6bDhaS0qjSO5vzhdM+LJDEmV3uRVYuVKUYTCDmJTa2dEPn+XMf+Q
 Blncly+LimtWzaO9H8zge7bUYAXoVvBLgwq5iZV64EUY21FB03yuwmg77nn6mCVm3Fzy
 vMsAdhzKphnLPvhpShDpajPjQJXYzl9pxiwZ1al73/Iw3grDXFDvuINc6SDRPydd3qrM
 ZMxfFZ2zmVbIjDoa7URpJbckZ4jGWVsC6Rp60FMWloICMEoHRHClv/wgbUq/Hvsq7oUc
 2FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JIjdRX9A90RloyzWddQMSNfv9XohduT/lwJH2Xd4NPE=;
 b=Sys3qe/gwjpElK6hjOpZSlFZi76c854diM/tseuhPjwojJATwcta5nL2YuXDofEyP7
 ea1a78/4kzQt8oze0rtmPBPXuhaNnVMn7XMaT9LM/NmM3evjh0u3kJyqebYCLs+VjK2/
 jkyKtT6U1DIHdOrqkZE/FUJf58SBkMP/u68Cyew1yyBUn0dI++jZsGACN0CQ/oluWNrP
 Ql+CtH0d8iWrep9L+FS5YvTmFbBhI1pBcKy7RdgE0P1FOass7ILsIZzD/GHvgz/+GFh6
 FhJhlD287ulChg6fMK+rQOsJdQi2QoKyc8LTu+XQwHkl5Sg6c6wByhhjbeSBwNq3cHDH
 vjpg==
X-Gm-Message-State: AOAM532UoIbe6mEdBqmGBH+O6WqU9te8bTtFg8zNsGQ7yu3/55z9MBLI
 ysJvGU2tNzZjWJcjamsk1VE=
X-Google-Smtp-Source: ABdhPJxas+MEYizfzoXy8rTxcFyX8DDflGkqsjaLHe97SIOwVyVAqTtXEHKVJvYMbEAv0FEk756ljg==
X-Received: by 2002:a19:6141:: with SMTP id m1mr10214988lfk.7.1589768747784;
 Sun, 17 May 2020 19:25:47 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m13sm5997306lfk.12.2020.05.17.19.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 19:25:47 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King Pro
Date: Mon, 18 May 2020 02:25:30 +0000
Message-Id: <20200518022531.14739-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518022531.14739-1-christianshewitt@gmail.com>
References: <20200518022531.14739-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_192549_561069_214377AD 
X-CRM114-Status: GOOD (  10.57  )
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

From: chewitt <christianshewitt@gmail.com>

The Shenzen AZW (Beelink) GT-King Pro is based on the Amlogic W400 reference
board with an S922X chip.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 25e118b8a97b..46cb6359f530 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -152,6 +152,7 @@ properties:
         items:
           - enum:
               - azw,gtking
+              - azw,gtking-pro
               - hardkernel,odroid-n2
               - khadas,vim3
               - ugoos,am6
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
