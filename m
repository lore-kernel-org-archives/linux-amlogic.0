Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77AC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 02:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHTdmRusQDCvYckIYRjBzs8BLxIBPWvhhfwZVSX+DX8=; b=SdElG6O1qEYXuO
	Zloq94Igv1bN5Cz8/Z3ohSjt/LN+Wur6bOoRxiy0pTGygA6ZZPlV1z8tMgyEfpYU/Dtf/7f6NVgAk
	nY9wYBSaOWElfChfRETGbHpFDdcbpsFEi5IhsMyl1Fd5k1L02WyXMc4Bp0HJINUeg959fK5Z5oW1z
	ZM8k+/ONeaGANGD24HZmIcxJ769BDKcdQwsyh4tJjDIhdhOOeK88KKywWdGDS3LeVt9TyEGg9ks0q
	bIdl5F3TY0hr2tWd8lsi/NsurCRD5N1ofqHrF8GrGR9qnu2onmiT7kX5H2zUfzxIz9aqs7iBmq5kE
	hJCoTUAzPtClqg7Yxzxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TOR-000rsq-18; Wed, 12 Jan 2022 02:29:43 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TMJ-000qVh-LR; Wed, 12 Jan 2022 02:27:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id o6so3972440edc.4;
 Tue, 11 Jan 2022 18:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TdcRcebw4SvOthXu2rFCYk88sYFR3tnI4UNhHT/FyYo=;
 b=SlIlVzuYDKFVsnBzR+BtVz21bXoXn33JJFVd46+S5Cem2t7Zw7+Esg2e60lLF87V4o
 7G8XXMVqJmhmCWZ6rA9Lc9gu7TdeYuNprtFTLCL+rYmhPkKxZDYPW7AFktYFAC5tzAi2
 8GE0YzgQ6k5pO7MxeV9qQzckyFuZQ3g9f5PA1UcWHG0SxJqO8HXJrKbHh8D90AMC2PBF
 GGZgI0r6/8u2jknBi0/2okvLygcOzQgdBDuu6/auy/oViGtF+sTVHf/lJKQGB0/1fjnn
 3G3jQr8hlpj4QZBfAf2YtxnVm3+DMQa4/aXAWtvGZDrAGilYkxmFtvL9PxralCvjl9P4
 tHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TdcRcebw4SvOthXu2rFCYk88sYFR3tnI4UNhHT/FyYo=;
 b=jc+mz0Gph8ho9/Ye9TRfj+RrR7Z4j/L+xfwin1bC523Hlw/G8tRKCh6eWS7taxM3fZ
 mcVcoUZDldkAROipvBedckA65JSn9CJ+zj+wtU/h3SmKAZOYVA3RPY29K0YE06Efa3mn
 rKRaQmYlcBVeQYR+IS3klsyti/keI/t4KDLdWcqhKOPu8DLJTeiVQ3KoRgIT0x2YGjsB
 b4wkjzfoqFtm0NVrVY+l4rAhrqQdkEqCR92n76VhZxnBX6jlJ9Juvc79VTfwhPn8+nSD
 nqDQcc9RWtJsvanx8XJ/xkAhmjHcqnDF8aiwFcqBxy3ar3GfCRFkW/iiutpumj8gdXAG
 lWDA==
X-Gm-Message-State: AOAM5336jWnuHeFkJdJKd16WOic9X1PerHhIInnyEl3tzOUykcwbb8mf
 0AJ2x1Yzk8laWxlYyKezJoc=
X-Google-Smtp-Source: ABdhPJwHd2wCly/wHSIXwpSJqlTKVldumK4kGG3oxJA3rDOrnwI7Ax7usG1lWfxPT4cWwHu9z5HgUQ==
X-Received: by 2002:a17:906:81c8:: with SMTP id
 e8mr5764659ejx.600.1641954449829; 
 Tue, 11 Jan 2022 18:27:29 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id ky10sm4041772ejc.151.2022.01.11.18.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:27:29 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3 5/9] dt-bindings: arm: amlogic: add A95XF3-AIR bindings
Date: Wed, 12 Jan 2022 02:27:09 +0000
Message-Id: <20220112022713.25962-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112022713.25962-1-christianshewitt@gmail.com>
References: <20220112022713.25962-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182731_746178_4D3BBAA8 
X-CRM114-Status: GOOD (  11.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add board bindings for the CYX A95XF3-AIR set-top box which ships
with model variants distinguished by Ethernet configuration: models
using external Gigabit PHY have a -gbit suffix, while models using
an internal 10/100 PHY have no suffix.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b5b995941d3b..2027ce81a834 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -173,6 +173,8 @@ properties:
               - amediatech,x96-air
               - amediatech,x96-air-gbit
               - bananapi,bpi-m5
+              - cyx,a95xf3-air
+              - cyx,a95xf3-air-gbit
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
               - khadas,vim3l
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
