Return-Path: <SRS0=/Mmf=OD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A59BC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3838360F8F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3838360F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JF4eNjFOlL9aB6v08CHrsV6NXJI5/BucDv1jW6e/ijQ=; b=l4NGMyZX65WALR
	IBwKxqXZRmTXB1CwvmSlLruWnJ5GUTtL6hIEq1eY+dJG7tsvlfDTblNvHDfL4UBnA704VX/bDe7ee
	vG8VowlO5IU+Q1VbyfvUMi89G8+f/fy+DtRRW+I3NDOSO3Azd1UGTglMGsLA/i0bh+o6MYD+zr2Hu
	pY9RY3iA66nIt8+VEjDQBqGOY8+FoHev5PY25+501p/yAoSR2kuE9EX4fYZes5z86aeNWETWmCZN/
	T0E/DkCpxZTw3jBOJUPjtYrOQGuR1uIQ75If/UR83V9YhqIjevoOHdYt9gLtPSm33zk11HXKwdizX
	RHZ6kapVEpC++c5ycPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPglH-000aKW-PV; Mon, 13 Sep 2021 07:52:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPgl1-000aFI-JL
 for linux-amlogic@lists.infradead.org; Mon, 13 Sep 2021 07:52:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso732479wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Sep 2021 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cygGWb35mhwgdgwZFmfBqgzwCiy35oriwBT5rg97pAA=;
 b=l6tTu+J1gNVpjt0YJViPvIGVDUn95qrgSOmh4W1N7+QhW4URIcDvDJWy2mEYpQgOd9
 0mbo9KVsC8Xf7nahkNXqC7dMIsO5yCFYa21lJVSe0SZi9+R1fuPRV2756Uo3S/bfziqO
 RqYspYBo1cVHqFL9qKqUQQSr+fcXa4xZ9dfGCWVGF7DAZ+Tjm8bhJrWeR827nwrfKRE3
 wkha4LfSxt7VZxj5Q3JHpIq9xBytSXEVucVFRD2FDwV20n3AnJtjXVC9HXJDpzN6EIBv
 5NY2HwxRLk+GaQt4BXjxsB7Vt3f6nGmSFAK/WxxvZPvFh/XtDJgCj8SmHMzV3gGxH895
 Q2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cygGWb35mhwgdgwZFmfBqgzwCiy35oriwBT5rg97pAA=;
 b=KtobVSv6Ks1iIHfuI1OlIbvM5aHP0EghT+Fy/ziH7OXXGs/0Uo0hMVFKu4ZhEyhNEX
 ooL6QTTU1UKKPKmmkooJTq1/0aYNBP9+8cUCPqx0CIHeDNWtpBadkbeNXuosd0Sz3R6L
 o+BfyNvzO9ela7pruXaieClxVMo3n3XGwP3ehi/2T9tICS8FVrTw2i3sgs8lSAvP0Z7o
 4L6f5bA772Bu8ycOLzxj9hLph/9/tddFt+zwgyLfc/nrxClx5iiMyOrsYQZ6jjovQtLk
 0/s5pOQpAAgy8u5J930gm4z/XkhtAOtGgxDqkT4cBXJNnZC78uWfAKjatVs/x6gCsX7r
 WjOQ==
X-Gm-Message-State: AOAM532jfbxV3qVL8q0XOJfsNRnM10KOZtPKfhtbLOCAj6fCjUkpsW+H
 KToI6lS4v8ohn3rpa+WSzSI1eg==
X-Google-Smtp-Source: ABdhPJwKdlZlHEAetExFULHUEzt1uQWLZHnJMEz83ND/A7xfnHUhHR/XIKATjRnET3B9irrENuoMGA==
X-Received: by 2002:a05:600c:3656:: with SMTP id
 y22mr9945885wmq.58.1631519521600; 
 Mon, 13 Sep 2021 00:52:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:9ebe:26f1:5acc:c894])
 by smtp.gmail.com with ESMTPSA id z19sm7137511wma.0.2021.09.13.00.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 00:52:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: amlogic: add support for Radxa Zero
Date: Mon, 13 Sep 2021 09:52:00 +0200
Message-Id: <163151951546.828361.7102466420110294894.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909102154.22710-1-christianshewitt@gmail.com>
References: <20210909102154.22710-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_005203_668988_FA7910E0 
X-CRM114-Status: GOOD (  11.26  )
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

Hi,

On Thu, 9 Sep 2021 10:21:52 +0000, Christian Hewitt wrote:
> This adds support for the Radxa Zero SBC. The device-tree is loosely
> based upon existing support for SEI510 and U200 (also G12A boards)
> and has been developed with the 4/32 board configuration.
> 
> Changes since v2:
> - Add Rob's bindings ack
> - Drop interrupts from wifi node
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

[1/2] dt-bindings: arm: amlogic: add support for Radxa Zero
      https://git.kernel.org/amlogic/c/663aa3b3c8a26bf449944c9385e8d04512d84ba9
[2/2] arm64: dts: amlogic: add support for Radxa Zero
      https://git.kernel.org/amlogic/c/26d1400f7457cdca3f1f86a7cccb0167f96e2edf

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
