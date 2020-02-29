Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1056C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 15:48:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C243924699
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 15:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JSCESPjR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVoOoG6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C243924699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3wCKbpeaeKoBuivlsR3HbeCP2zIawc31XFA/J/r4dlM=; b=JSCESPjRz97PrS214ZQmqnxdnL
	EdNSCEFDEUMbLAfQ6nXp1QpgONYpKHdyLnG57O2DK9XedrRTjcPEF9MOrDxjhT80+YdyW/hqsTnwY
	3RKwR1VYcRYnmMGl3h6+oa1xGTOiHJhMIGj5m3/+61WIOvM/BIZar75TYkLIRuw2q02JD6ji/NlrW
	riVa5xlxICYoJg8o+MEQH1gg4w3Y38iQVzmehRKhiqpH3qyTqxNuI7Mym030J+oJDDMXuH73ktO1M
	Y2gZQGKDv8/MOfIX90kOG336e3QE4zsosIW9iVuThU7lZ7BlSea8gG5G0UWQyJ4XIcwPkbsM69hGG
	jBTVFGqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j84M1-0007sX-MI; Sat, 29 Feb 2020 15:48:37 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j84LJ-0007Cw-6y; Sat, 29 Feb 2020 15:47:54 +0000
Received: by mail-lj1-x241.google.com with SMTP id e3so6724080lja.10;
 Sat, 29 Feb 2020 07:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Tog/pAf06KNFgFu4FcTsoNuZ3R7bNzFtAnXDa+lS9fg=;
 b=LVoOoG6uWTa9YlH/w4GM/bE5Kjz2b8mLGUPHYceGJv3sM0etpnkzqD0lONdWxzEnxt
 T2dCzb4sWBEOXYJ3fGcT/P5QXViZBWiIAxiNAs/0a2pxRbinIvd/V+crPtE9+n9hAOTT
 StOj+YPzEBovfKhbHFh+v8k3ygDwzkmbCs2vEpNv0pTeJoqiMzpKy5AS7QZYTOqF5T5Y
 8YCS02/3WMUOAy8nmMNF0UXBLiCwGxTUCZM4necc1oKvjtqLhneF4MDGodpoj+9VKIjb
 QdJwFBIcWJKfPFw5y6czjEq5agbB+myxnHqlcBHdS8HF+1hi5Oyqn0N20Gs9Zxtl4Mvp
 Cl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Tog/pAf06KNFgFu4FcTsoNuZ3R7bNzFtAnXDa+lS9fg=;
 b=I0sFzYS9LDg41mQyXHFTHqIpuJkfOnotC/WKX6+sTIlniTscZoXk7W3tqyFAKAXLPZ
 JB53zZja/40N0TR0rEOKggp25Y5zPEqeyNH8U0Intnn0X1ba81i0ImO11OzwOnZt/9DA
 NTE4ak5hFom+9e5PecH55MkLwDvVlWXa46Va1STOq3G2U2PXA/HjnMUXeilTQWz82hST
 Ww9B2xgFUbWTcJh78gyaBg/NZvFrPGPM/d2MG2n30uKxH/DpKzuOBIVMDVRdDuLzYGg5
 s/6jDQ/b7qN34ATzZzFe0QGf12Q2cN8fj0cl+i/XtHfYtEZIFsVc9Pjw9/i7UeTs9rpp
 Jd0Q==
X-Gm-Message-State: ANhLgQ2e/DnJZdsg4yoZRBzanOX6antSN0e6CSJzh+FsoctH3lfoKm+p
 4p8ELwCcz9OPKndmNdkH2xY=
X-Google-Smtp-Source: ADFU+vsSMc/FZvJlefaWuLD76s3Qnh3X+NY/DbOsLYF4tZ6d+m9sR0EafudhEaum6TLLYqQbv8SSyQ==
X-Received: by 2002:a2e:3504:: with SMTP id z4mr6292186ljz.273.1582991267806; 
 Sat, 29 Feb 2020 07:47:47 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id g20sm7294786lfb.33.2020.02.29.07.47.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 07:47:47 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the Tanix TX5
 Max
Date: Sat, 29 Feb 2020 19:46:53 +0400
Message-Id: <1582991214-85209-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582991214-85209-1-git-send-email-christianshewitt@gmail.com>
References: <1582991214-85209-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_074753_261628_9B1028FD 
X-CRM114-Status: GOOD (  11.37  )
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

The Oranth (Tanix) TX5 Max is based on the Amlogic U200 reference
board with an S905X2 chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index f74aba4..4003206 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -136,6 +136,7 @@ properties:
               - amediatech,x96-max
               - amlogic,u200
               - seirobotics,sei510
+              - oranth,tx5-max
           - const: amlogic,g12a
 
       - description: Boards with the Amlogic Meson G12B A311D SoC
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
