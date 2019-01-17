Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EB0C43444
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:55:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5420120652
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="clC5qpez";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZsMi8eVm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5420120652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HyjJ+gGAzsb3exKfk9kt3Sce/F5RPGiSuqzJIdOH0KY=; b=clC5qpezLHePBiEMw+GNx6V2LM
	8MNpjVew3ivm/weE1wuUUXXj4VZ6m5qC3bJY9wOa936yvMlas8eF8AmtQOho0jI/EzRebR2+/1gA/
	m1CdrkodOo0HjOrQYsyUwgHjxWVLEwPVvVvHfFItV+KA+SK4q5T7bqQHx0xX/p0JCKxmU1EJ6SnQT
	C9teM0CuMw5c9vlY5JTXgoj4AckNKYvD8ZY+ERCNDhvXpbCiN+wYbXRJ9YeVbTN2+udrWDsQ45Vqm
	C84aoFQOYS4InyfNTbtw/XB+91TZ2mcl2VO4hd9zYvNPW9qAINz7auoK/UK++KtZabIi0N1IEHIHL
	7vJgxPrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkAx7-000446-DW; Thu, 17 Jan 2019 16:55:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkAwG-00023A-Hy
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 16:54:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so1809681wmd.2
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G6qRpn5S966nXnLaFTqmom3s0zt1yyX1JZ9+R2qhF3s=;
 b=ZsMi8eVmRGd4IWVBPniDrEC7YdNqZLV0NYZSr9mBYO6P7SwP4JnFSZP40bQnr3LNjv
 qp5mK0/2bkTXUYsbWsHBM1jhjsLIAyadx9LR1PROcwYFH/15/6zJdF1uTDJWt9RjIJbs
 P9329vyBke1U09hUibrv8TFkxPOa9MJFkzMOpREa3UJc8WC+XXi7i24diVOwgG9bFHz8
 sV4FzY3ejSL5zmTlMXqbbvtfWzAeuaw/ShTXPygNIe9tiARM3c+iMIbaTvRp+q1EdTP7
 bxE018wj9PWzfavYvT76dqoBfDOL+Dstt7t7J9Ny+hD9KcGqrXn2OfEjv5O0n3iscrW7
 OA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G6qRpn5S966nXnLaFTqmom3s0zt1yyX1JZ9+R2qhF3s=;
 b=JOUVZazWkUm/bluut1TFwbyMzS+YN/x81h7d4qhL1WLcyX7A2c5EPH8OByHXJMqFfl
 V6rDoX19f4QCcvp3a8ECDndZ4b7WWcbTwm1QBQEsPnVPxZZERItELoJJ1AgxuRdTPsgA
 Qyq7lcu7LuP2ILvyIhuDbYD2r/oGoYDu47Ra79zEW52z1AnEUFFsTjlvhjt4A01WJNeh
 gQOr8NQp7BK2bdaQWX0jiaiJBaEjDfCxMe66HRFpFUrXNdZ7R1LuTC7y5kpM2s9R+eLF
 CgOun0iTWTP1MB9Pbg3eJI5ES3Shl+LNHH740qQOpVjsR6l6VRZWEchF8dxXOh56K151
 mwpg==
X-Gm-Message-State: AJcUukeQnuvZhA4vxKBbcEiEYrorulUftOgNaoJsBK4qn2Yk4tHFmsEG
 E9PgMVxWUwJYysMtPNVHF+iqEA==
X-Google-Smtp-Source: ALg8bN6qTZ9AA5J1u/MzzOt4IZ/Gr4gZIYrLCp/2l3abY71IkSvX7wWxwwXRKtDYUij85Y1K+sMo/A==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr12737066wmh.118.1547744081818; 
 Thu, 17 Jan 2019 08:54:41 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.thefacebook.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b12sm65309630wrt.17.2019.01.17.08.54.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 17 Jan 2019 08:54:41 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: Add vendor prefix for "GlobalTop
 Technology, Inc."
Date: Thu, 17 Jan 2019 17:54:31 +0100
Message-Id: <1547744074-28308-2-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_085444_750069_99B653FC 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add globaltop vendor definition.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---

v2: Alphabetical order

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..d80a70343b36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -150,6 +150,7 @@ geniatech	Geniatech, Inc.
 giantec	Giantec Semiconductor, Inc.
 giantplus	Giantplus Technology Co., Ltd.
 globalscale	Globalscale Technologies, Inc.
+globaltop	GlobalTop Technology, Inc.
 gmt	Global Mixed-mode Technology, Inc.
 goodix	Shenzhen Huiding Technology Co., Ltd.
 google	Google, Inc.
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
