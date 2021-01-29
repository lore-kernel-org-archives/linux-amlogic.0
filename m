Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303DAC433DB
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D382F64DFD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D382F64DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzYeQ7meK3Q5fzDHkQ1o4wPgVbHsO8kA9SmQFVA97Ac=; b=XJ3u7X11d7SpBBC+H3c1cAMceR
	cUR0UhXpCxgRay+T6dChXRvahh7zb/2MOc4K09VB8rCruDfubqLcYPEPrLAov+nHoeKOqok7NPJnu
	hCpsJM8QqrMnMxv0QxsjhBc8aVz2n6RMcpmB6TkZYNcrpFkHErb7sz9A6u35lKdsumNy+azwFCsRh
	UU+oV+ptgQRv2PI3GZFL9Tti+UdYfYJUoUejTYQLWM7PmFdyBdbbtYX+beSJSxEPA75YRYCv9QEal
	6igbozOOGjNTSjPwaGPk/WFhEF0lN4d3OsHzJwSE7F2Pt14omjoNnvwaYVP1RoqGyj/RJ1F8h2w1Y
	dho1juPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Ndg-0005mq-SZ; Fri, 29 Jan 2021 06:52:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5NdJ-0005ez-31; Fri, 29 Jan 2021 06:51:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id g10so7739107wrx.1;
 Thu, 28 Jan 2021 22:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QAsVvG9i6Xg0y3Z1EJ3mhfNvPnvT0DDgRmi3UPHJgto=;
 b=MXnFGHNfVsgv75DveAyf8zkaosI3iTjms/W3mLKet/J9DZhvbGw+EsdLRtJDRhZbrs
 KYQPOGLTUVX5ZoUQrQu7cKF4onc8O4oN33CQxJypuoIs+Iyw8NlxiQ6M/QFhXSsRbynJ
 DaQpSMeNf1ouV0YC/VFw/FNWjwUYBGVe7spUV6t1HTuLTtm4Z4cAUPkfc0M1MozFzYj/
 PpOvTkfA/NnSnwEMdpa9o55aK6TgHLpWEvAp0qiJFeWmXZsSSnmguazxEkWM9rm7Tkzr
 0JfPlciNOAWrJYL6+fHNOE3FFNfBunY69CVv7dPVcaiS5K00gX8MnOkB01BlBn38efd5
 iWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QAsVvG9i6Xg0y3Z1EJ3mhfNvPnvT0DDgRmi3UPHJgto=;
 b=H46luyD0BHVsp3PAWtXPh3uMv8Pyaj0xwoS+o6WwTvsgnbB+SZMZJYXYDaKyYjHu6Q
 ZKKulsv5BQed0NlGIP0VNbV2b7RoM4whowt9I8OlD8eZTmf5u5QflKGT90xdtQL/cJfQ
 XSpa5DAZpk7Lhqs0LEp3xDey2uqwoawDCC89n7PoeNkypgT2clUpLRMbZEHrzd1I3g51
 EgJDQGdF5J6ye2H02JjWRSBFYOY73zxTdhjXd6VQ8ImQ1GdEcetnhyE9Y8/R0V6a+ylJ
 MKqxPV+3m/BHrUrNHPv91t9NP4WRNjzyE5jBYRugR5LqW3iG6c4oIGNC914SYbGGdwVX
 xASw==
X-Gm-Message-State: AOAM530w/diGoWxqQbDC3f25TrB1s4PtHmuo0QxISo9dKiC6PubdKtkw
 r7Vay8fuyJMOd7K2U8mZ2fQ=
X-Google-Smtp-Source: ABdhPJyRGogyKK9SoDnWoLHIbG1ZpyS8Yl8plcqXAyP9cQ9WyEmmoy6qB9HqWGDtJuH5rra37OHr+g==
X-Received: by 2002:adf:fb85:: with SMTP id a5mr2737803wrr.331.1611903111777; 
 Thu, 28 Jan 2021 22:51:51 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b7sm11501236wrs.50.2021.01.28.22.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 22:51:51 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: arm: amlogic: add ODROID-HC4 bindings
Date: Fri, 29 Jan 2021 06:51:36 +0000
Message-Id: <20210129065137.5473-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129065137.5473-1-christianshewitt@gmail.com>
References: <20210129065137.5473-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_015153_282263_322EDCCF 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board bindings for the ODROID-HC4 device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b21ba8ba23dd..5f6769bf45bd 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -165,6 +165,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-c4
+              - hardkernel,odroid-hc4
               - khadas,vim3l
               - seirobotics,sei610
           - const: amlogic,sm1
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
